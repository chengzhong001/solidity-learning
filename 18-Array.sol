// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Array {
    uint256[] public nums = [1, 2, 3];
    uint256[3] public numsFixed = [4, 5, 6];

    function examples() external {
        nums.push(4); // [1,2,3,4]
        uint256 x = nums[1]; // x = 2
        x += 1; // x = 3
        nums[2] = 777; // [1,2,777,4]
        delete nums[1]; // [1,0,777,4]
        nums.pop(); // [1,0,777]
        // uint = nums.length;

        uint256[] memory a = new uint256[](5);
        // 在内存创建一个5长度的数据a,只能创建定长数组
        a[1] = 10;

    }

    function returnArray() external view returns (uint[] memory){
        return nums;
    }
}
