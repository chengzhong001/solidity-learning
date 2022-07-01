// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ForAndWhileLoops {
    function loops() external pure {
        for (uint256 i = 0; i < 10; i++) {
            if (i == 3) {
                continue;
            }
            if (i == 5) {
                break;
            }
        }
        uint256 k = 0;
        while (k < 10) {
            k++;
        }
    }

    function sum(uint256 _n) external pure returns (uint256) {
        uint256 s;
        for (uint256 i = 1; i <= _n; i++) {
            s += i;
        }
        return s;
    }
}
