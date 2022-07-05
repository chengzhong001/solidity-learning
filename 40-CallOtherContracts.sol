// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract CallTestContract {
    function setX(address _test, uint256 _x) external {
        TestContract(_test).setX(_x);
    }

    // function setX1(TestContract _test, uint256 _x) external {
    //     _test.setX(_x);
    // }

    function get(address _test) external view returns (uint256) {
        return TestContract(_test).getX();
    }

    function setXandEther(address _test, uint256 _x) external payable {
        TestContract(_test).setXReceiveEther{value: msg.value}(_x);
    }

    function getXandValue(address _test) external view returns(uint, uint){
        return TestContract(_test).getXandValue();
    }
}

contract TestContract {
    uint256 public x;
    uint256 public value = 123;

    function setX(uint256 _x) external {
        x = _x;
    }

    function getX() external view returns (uint256) {
        return x;
    }

    function setXReceiveEther(uint256 _x) external payable {
        x = _x;
        value = msg.value;
    }

    function getXandValue() external view returns (uint256, uint256) {
        return (x, value);
    }
}
