// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "./FundTrade.sol";

contract FundTradeExtend is FundTrade {

    mapping(string => uint128) custHoldAmt;

    //计算客户资产
    function calCustAsset(string calldata certCode) public returns(uint128) {
        require(isContainCust(certCode), "ke hu bu cun zai");
        uint128 sumAmt = 0;
        for (uint256 i = 0; i < custHolds.length; i++) {
            if (stringEqual(custHolds[i].certCode, certCode)) {
                uint64 netVal = getFundNetVal(custHolds[i].fundCode);
                sumAmt += uint128(custHolds[i].shrNum) * uint128(netVal) / 1e8;
            }
        }
        if (sumAmt > 0) {
            custHoldAmt[certCode] = sumAmt;
        }
        return uint64(sumAmt);
    }

    //根据基金代码获取基金净值
    function getFundNetVal(string memory fundCode) private view returns(uint64) {
        require(isContainFund(fundCode), "ji jin bu cun zai");
        for (uint256 i =0 ; i< funds.length; i++) {
            if (stringEqual(funds[i].fundCode, fundCode)) {
                return funds[i].netVal;
            }
        }
        return uint64(0e8);
    }

    function test() public pure returns(string memory) {
        return "ce shi cheng gong";
    }
}