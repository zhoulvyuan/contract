// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import {Test, console} from "forge-std/Test.sol";
import "../src/FundMeExtendFormGithub.sol";

contract FundMeExtendFormGithubTest is Test{

    FundMeExtendFormGithub fundMe;

    function setUp() external {
        fundMe = new FundMeExtendFormGithub();
        fundMe.modifyMixGas(7e18);
    }

    function testDemo() public {
        assertEq(fundMe.GET_MIX_GAS(), 7e18);
    }

    function setMyArray() external {
        for (uint256 i = 1 ; i <= 100; i++) {
            fundMe.addMyArray(i);
        }
    }

    function testMyArray() public {
        console.log(fundMe.getMyArraySize());
        assertEq(fundMe.getMyArraySize(), 1);
    }

}
