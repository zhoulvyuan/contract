// // SPDX-License-Identifier: ZWJ
pragma solidity ^0.8.21;

import { Tenant } from "./StorageStruct.sol";
import "./BaseContract.sol";

contract TenantManger is BaseContract {

    // 租户列表
    Tenant[] internal _tenants;

    // 人均价格
    uint64 constant SINGLE_PRICE = 0.001e18;

    // 注册
    function registTenant(string calldata name, string calldata code, uint32 staffCount) external returns(bool) {
        require(_validParam(msg.sender, name, code), "regist info is error");
        require(staffCount > 0, "staffCount must be greater than zero");
        _tenants.push(Tenant(msg.sender, name, code, staffCount, _calculatePrice(staffCount)));
        return true;
    }

    // 更新
    function modifyTenant(string calldata name, string calldata code, uint32 staffCount) external returns(bool) {
        require(_validParam(msg.sender, name, code), "regist info is error");
        for (uint256 i = 0; i < _tenants.length; i++) {
            if (_tenants[i].tenantId == msg.sender) {
                _tenants[i].staffCounts += staffCount;
                _tenants[i].fee = _calculatePrice(staffCount);
                return true;
            }
        }
        return false;
    }

    // 获取租户信息(仅租户自己)
    function getTenantInfo() external view returns(Tenant memory) {
        for (uint256 i = 0; i < _tenants.length; i++) {
            if (_tenants[i].tenantId == msg.sender) {
                return _tenants[i];
            }
        }
        return Tenant(address(0), "", "", 0, 0);
    }

    // 获取所有租户(仅合约持有人)
    function getTenants() external view returns(Tenant[] memory) {
        assert(_holdAddress() == msg.sender);
        return _tenants;
    }

    /**
    计算租户年租金，公式为： 租金 = 人均价格 * 员工数量
     */
    function _calculatePrice(uint32 staffCount) internal pure returns (uint64) {
        return SINGLE_PRICE * staffCount;
    }

    // 校验租户code是否重复
    function _validParam(address id, string calldata name, string calldata code) internal view returns (bool) {
        validateString(name);
        validateString(code);
        for (uint256 i = 0; i < _tenants.length; i++) {
            if (keccak256(abi.encodePacked(_tenants[i].code)) == keccak256(abi.encodePacked(code))) {
                return false;
            }
            if (id == _tenants[i].tenantId) {
                return false;
            }

        }
        return true;
    }

    function validateString(string calldata input) internal pure returns (bool) {
        // 将字符串转换为字节数组
        bytes memory inputBytes = bytes(input);
        // 如果字节数组的长度为0，则表示字符串为空
        require(inputBytes.length > 0, "Input string cannot be empty");
        return true;
    }
}

