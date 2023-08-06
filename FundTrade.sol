// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {Fund, Cust, HoldShr} from "./lib/CommonStruct.sol";

contract FundTrade {
    Fund[] funds;
    Cust[] custs;
    HoldShr[] custHolds;
    //客户总持仓
    mapping(string => uint128) custAsset;

// 上架基金产品
    function onlineFund(string memory fundName, string memory fundCode, uint64 netVal) public {
        require(!isContainFund(fundCode), "ji jin yi jing cun zai");
        funds.push(Fund(fundName, fundCode, netVal));
    }

//判断基金是否存在，范围类修饰符作用如下
// public 合约内部和外部都可以调用（默认）
// external 只有合约外部可以调用
// internal 只有合约内部可以调用
// private  只有合约内部可以调用，但是不能被继承
    function isContainFund(string memory fundCode) internal view returns(bool) {
        for (uint256 i = 0; i < funds.length; i++) {
            if (stringEqual(funds[i].fundCode, fundCode)) {
                return true;
            }
        }
        return false;
    }

//下架基金产品
    function updownFund(string memory fundCode) public {
        int256 index = findFundIndex(fundCode);
        require(index >= 0, "ji jin bu cun zai");
        delete funds[uint256(index)];
    }

//寻找基金产品索引
    function findFundIndex(string memory fundCode) internal view returns(int256) {
        for (uint256 i = 0; i < funds.length; i++) {
            if (stringEqual(funds[i].fundCode, fundCode)) {
                return int256(i);
            }
        }
        return -1;
    }

    function regist(string memory name, string memory certCode) public {
        require(!isContainCust(certCode), "ke hu yi jing cun zai");
        custs.push(Cust(name, certCode));
    }

    function isContainCust(string memory certCode) internal view returns(bool) {
        for (uint256 i = 0; i < custs.length; i++) {
            if (stringEqual(custs[i].certCode, certCode)) {
                return true;
            }
        }
        return false;
    }

//购买基金
    function buyFund(string memory certCode, string memory fundCode, uint64 shrNum) public {
        require(isContainCust(certCode), "ke hu bu cun zai");
        require(isContainFund(fundCode), "ji jin bu cun zai");
        bool isUpdate = false;
        for (uint256 i = 0; i < custHolds.length; i++) {
            if (stringEqual(custHolds[i].certCode, certCode) && stringEqual(custHolds[i].fundCode, fundCode)) {
                custHolds[i].shrNum += shrNum;
                isUpdate = true;
            }
        }
        if (!isUpdate) {
            custHolds.push(HoldShr(fundCode, certCode, shrNum));
        }
        updateCustAsset(certCode);
    }

//赎回基金
    function redemFund(string memory certCode, string memory fundCode, uint64 shrNum) public {
        require(isContainCust(certCode), "ke hu bu cun zai");
        require(isContainFund(fundCode), "ji jin bu cun zai");
        bool isUpdate = false;
        for (uint256 i = 0; i < custHolds.length; i++) {
            if (stringEqual(custHolds[i].certCode, certCode) && stringEqual(custHolds[i].fundCode, fundCode)) {
                custHolds[i].shrNum -= shrNum;
                isUpdate = true;
            }
        }
        require(!isUpdate, "bu cun zai chi cang fen e");
        updateCustAsset(certCode);
    }

//查看所有客户信息
    function queryCusts() public view returns (Cust[] memory) {
        return custs;
    }

//查看所有基金信息
    function queryFunds() public view returns (Fund[] memory) {
        return funds;
    }

    //查看所有客户资产
    function queryCustHolds() public view returns (HoldShr[] memory) {
        return custHolds;
    }

//查看所有客户名称
    function queryAllCustName() public view returns (string[] memory) {
        string[] memory allCustName = new string[](custs.length);
        for(uint256 i =0 ; i< custs.length;i++) {
            allCustName[i] = custs[i].name;
        }
        return allCustName;
    }

//查看所有基金名称
    function queryAllFundName() public view returns (string[] memory) {
        string[] memory allFundName = new string[](funds.length);
        for(uint256 i =0 ; i< funds.length;i++) {
            allFundName[i] = funds[i].fundName;
        }
        return allFundName;
    }

//更新客户持仓
    function updateCustAsset(string memory certCode) internal {
        uint64 sumShr = 0;
        bool isUpdate = false;
        for (uint256 i = 0; i < custHolds.length; i++) {
            if (stringEqual(custHolds[i].certCode, certCode)) {
                sumShr += custHolds[i].shrNum;
                isUpdate = true;
            }
        }
        if (isUpdate) {
            custAsset[certCode] = uint128(sumShr);
        }
    }

    //查询客户资产
    function queryCustAsset(string memory certCode) public view returns(uint128) {
        require(isContainCust(certCode), "ke hu bu cun zai");
        return custAsset[certCode];
    }

    function stringToBytes32(string memory str) public pure returns (bytes32) {
        // 确保 string 的长度不超过 32 字节
        require(bytes(str).length <= 32, "String too long");

        // 将 string 转换为 bytes32
        bytes32 result;
        assembly {
            result := mload(add(str, 32))
        }
        return result;
    }

    function bytes32ToString(bytes32 data) internal pure returns (string memory) {
        bytes memory bytesData = new bytes(32);
        assembly {
            mstore(add(bytesData, 32), data)
        }

        uint256 length = 0;
        while (length < 32 && bytesData[length] != 0) {
            length++;
        }

        bytes memory result = new bytes(length);
        for (uint256 i = 0; i < length; i++) {
            result[i] = bytesData[i];
        }

        return string(result);
    }

// pure：只做计算，不改变合约状态；  view:查看合约状态，不改变
    function stringEqual(string memory str1, string memory str2) internal pure returns (bool) {
        return stringToBytes32(str1) == stringToBytes32(str2);
    }

}
