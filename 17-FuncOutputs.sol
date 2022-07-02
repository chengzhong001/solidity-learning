// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FunctionOutputs {
    //public 合约中的其他函数也能调用
    function returnMany() public pure returns (uint256, bool) {
        return (1, true);
    }

    function name() public pure returns (uint256 x, bool b) {
        return (1, true);
    }

    function assigned() public pure returns (uint256 x, bool b) {
        x = 1;
        b = true;
    }

    function destructingAssigments() public pure {
        (uint256 x, bool b) = returnMany();
        (, bool _b) = returnMany();
        x = 2;
        b = false;
        _b = false;
    }
}
