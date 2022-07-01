// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Constants {
    // 常量可以节约gas费
    // 21442 gas
    address public constant MY_ADDRESS =
        0xE1562b7183f646F59DEE0b3E2569CaE33a86c509;

    uint256 public constant MY_UINT = 123;
}

contract Var {
    // 23553 gas
    address public MY_ADDRESS = 0x9826b84441F3624114CF28d3Cb3e681F0E9170FB;
}
