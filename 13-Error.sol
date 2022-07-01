// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Error {
    function testRequire(uint256 i) public pure {
        // 不满足条件报错
        require(i <= 10, "i>10");
    }

    function testRevert(uint256 i) public pure {
        if (i > 1) {
            if (i > 2) {
                if (i > 10) {
                    // 抛出报错 相当于raise
                    revert("i > 10");
                }
            }
        }
    }

    function testAssert() public view {
        // 不包含报错信息
        assert(num == 123);
    }

    uint256 public num = 123;

    function foo(uint256 i) public {
        num += 1;
        require(i < 10); // 当i大于等于10的时候，报错，交易回滚num增加
    }

    error MyError(address caller, uint256 i);

    function testCustomError(uint256 i) public view {
        // require(i < 10, "very long error message will consume more gas");
        if (i > 10) {
            revert MyError(msg.sender, i);
        }
    }
}
