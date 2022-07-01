// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ValueType {
    bool public b = true;
    uint256 public u = 123;
    int256 public i = -123;

    // uint = uint256 0 to 2^256 - 1
    // uint8 0 to 2^8 - 1
    // uint16 0 to 2^16 - 1

    // int = int256 -2^255 to 2^255 - 1
    // int8 -2^7 to 2^7 - 1
    // int16 -2^15 to 2^15 - 1

    int256 public minInt = type(int256).min;
    int256 public maxInt = type(int256).max;

    address public addr = 0xb55Ff9cf0A29E861Eac0be3DAB8112Ad5ec578bC;

    bytes32 public b32 =
        0xb55Ff9cf0A29E861Eac0be3DAB8112Ad5ec578bC111111111111111111111111;
}
