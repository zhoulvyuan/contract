// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import {Script} from "forge-std/Script.sol";
import {FundMeExtendFormGithub} from "../src/FundMeExtendFormGithub.sol";

contract DeployFundContractFromGitHub is Script{

    function run() external returns(FundMeExtendFormGithub) {
        vm.startBroadcast();
        FundMeExtendFormGithub fundTradeExtend = new FundMeExtendFormGithub();
        vm.stopBroadcast();
        return fundTradeExtend;
    }
}