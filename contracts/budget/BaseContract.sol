// SPDX-License-Identifier: ZWJ
pragma solidity ^0.8.21;

contract BaseContract {

    // 用于存储合约收益的地址
    address holdAddress;

    event Log(address indexed _from, uint256 _value, string _info);

    constructor() {
        holdAddress = msg.sender;
    }

    function _holdAddress() internal view returns (address) {
        return holdAddress;
    }

    // 用于接收以太币
    receive() external payable {
        // 接收到以太币时执行的操作
    }

    // 用于处理没有匹配的函数调用
    fallback() external payable {
        // 可以记录日志，或者进行其他操作
        emit Log(msg.sender, msg.value, "fallback ");
    }

}