// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract GasGolf {
    uint256 public total;

    // 1.nums use calldata 50908gas
    // 2.load state variables to memory 49163gas
    // 3.condition short circuit 48952gas
    // 4.loop increments(i+=1 -> ++i) 48226gas
    // 5.cache array length 48191gas
    // load array element to memory 48029gas
    function sumIfEventAndLessThan99(uint256[] calldata nums) external {
        uint256 _total = total;
        uint256 len = nums.length;
        for (uint256 i = 0; i < len; ++i) {
            uint256 num = nums[i];
            if (num % 2 == 0 && num < 99) {
                _total += num;
            }
        }
        total = _total;
    }
}
