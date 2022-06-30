// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract GlobalVariables{
    function globalVars() external view returns(address, uint, uint){
        // view 只读方法，可以读取全局变量和局部变量
        address  sender = msg.sender; // 读取账户内容，调用函数的地址
        uint timestamp = block.timestamp; // 区块的时间戳
        uint blockNum = block.number ; //区块的编号
        return (sender, timestamp, blockNum);
    }
}