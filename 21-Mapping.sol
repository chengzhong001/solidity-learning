// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Mapping {
    mapping(address => uint256) public balances;
    mapping(address => mapping(address => bool)) public isFriend;

    function exampples() external {
        balances[msg.sender] = 123;
        // uint256 bal = balances[msg.sender];
        // uint256 bal2 = balances[address(1)]; //0
        balances[msg.sender] += 456;

        delete balances[msg.sender]; // 返回默认值0
        isFriend[msg.sender][address(this)] = true;
    }
}
