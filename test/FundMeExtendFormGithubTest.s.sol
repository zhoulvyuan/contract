// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import {Test, console} from "forge-std/Test.sol";
import "../src/FundMeExtendFormGithub.sol";

contract FundMeExtendFormGithubTest is Test{

    FundMeExtendFormGithub fundMe;

    function setUp() external {
        fundMe = new FundMeExtendFormGithub();
        fundMe.modifyMixGas(3e18);
    }

    function testDemo() public {
        assertEq(fundMe.GET_MIX_GAS(), 7e18);
    }

}
