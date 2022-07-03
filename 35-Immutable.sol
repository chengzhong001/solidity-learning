// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Immutable {
    // immuable 能节约gas费
    address public immutable owner = msg.sender;
    address public immutable owner2;

    constructor() {
        owner2 = msg.sender;
    }

    uint256 public x;

    function foo() external {
        require(msg.sender == owner);
        x += 1;
    }
}
