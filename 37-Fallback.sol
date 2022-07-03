// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
        Ether is sent to contract
                   |
            is msg.data empty?  是否调用了数据
                /      \
            Yes         No
    receive() exists?    fallback()
          /   \
        Yes    No
    receive()   fallback()                 
*/

contract Fallback {
    event Log(string func, address sender, uint256 value, bytes data);

    // 只需要定义一个fallback
    fallback() external payable {
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    // 必须加payable, receive 不接收任何数据的
    receive() external payable {
        emit Log("recive", msg.sender, msg.value, "");
    }
}
