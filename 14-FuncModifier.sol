// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// basic, input sandwich
contract FunctionModifier {
    bool public paused;
    uint256 public count;

    function setPause(bool _paused) external {
        paused = _paused;
    }

    modifier whenNotPaused() {
        require(!paused, "paused");
        _; // 使用函数的代码在此位置执行
    }

    function inc() external whenNotPaused {
        // require(!paused, "paused");
        count += 1;
    }

    function dec() external whenNotPaused {
        // require(!paused, "paused");
        count += 1;
    }

    modifier cap(uint256 _x) {
        require(_x < 10, "x >= 100");
        _;
    }

    function incBy(uint256 _x) external whenNotPaused cap(_x) {
        // require(_x < 10, "x >= 100");
        count += 1;
    }

    modifier sandwich() {
        count += 10;
        _;
        count *= 2;
    }

    function foo() external sandwich {
        count += 1;
    }
}
