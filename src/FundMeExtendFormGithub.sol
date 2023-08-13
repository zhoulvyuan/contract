// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@fundme/contracts/src/exampleContracts/FunWithStorage.sol";

contract FundMeExtendFormGithub is FunWithStorage{

    uint256 MIX_GAS = 2e18;

    function test() public pure returns(string memory) {
        return "ce shi cheng gong";
    }

    function modifyMixGas(uint256 mixGas) public {
        MIX_GAS = mixGas;
    }

    function GET_MIX_GAS() public view returns(uint256) {
        return MIX_GAS;
    }
}
