// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract FunctionIntro{

    
    function add(uint x, uint y) external pure returns (uint){
        //external 外部可读取函数
        //pure 纯函数, 不能够读和写链上变量
        return x + y;

    }

    function sub(uint x, uint y) external pure returns (uint){
        return x - y;
    }
}
