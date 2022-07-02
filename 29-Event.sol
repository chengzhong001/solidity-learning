// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Event {
    // 体现在交易记录log里面
    event Log(string message, uint256 val);
    event IndexedLog(address indexed sender, uint256 val);

    // indexed 标记过的变量可以在链上查询, 有indexed标记的最多只能有三个

    function examples() external {
        emit Log("foo", 1234); // 写入方法
        emit IndexedLog(msg.sender, 789);
    }

    event Message(address indexed _from, address indexed _to, string name);

    function sendMessage(address _to, string calldata message) external {
        emit Message(msg.sender, _to, message);
    }
}
