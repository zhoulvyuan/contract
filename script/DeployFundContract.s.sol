// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import {Script} from "forge-std/Script.sol";
import {FundTradeExtend} from "../src/FundTradeExtend.sol";

contract DeployFundContract is Script{

    function run() external returns(FundTradeExtend) {
        vm.startBroadcast();
        FundTradeExtend fundTradeExtend = new FundTradeExtend();
        vm.stopBroadcast();
        return fundTradeExtend;
    }
}
