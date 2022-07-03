// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Payable {
    // 地址标记payable能发送以太坊主币
    address payable public owner;

    // 函数标记payable能接收以太坊主币的传入
    constructor() {
        owner = payable(msg.sender);
    }

    function deposit() external payable {}

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
