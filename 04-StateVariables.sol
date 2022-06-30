// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract StateVariables {

    // 状态变量
    uint256 public myUint = 123;

    function foo() external pure {
        uint256 noStateVariable = 456;
    }
}
