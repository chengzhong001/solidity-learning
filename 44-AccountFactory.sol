// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Account {
    address public bank;
    address public owner;

    constructor(address _owner) payable {
        bank = msg.sender;
        owner = _owner;
    }
}

contract AccountFactory {
    Account[] public acconuts;

    function createAccount(address _owner) external payable {
        // 参数对应函数的构造函数
        Account acconut = new Account{value: 111}(_owner);
        acconuts.push(acconut);
    }
}
