// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// storage  代表了状态变量
// memory   代表了局部变量
// calldata 只能用在参数中

contract DataLocations {
    struct MyStruct {
        uint256 foo;
        string text;
    }
    mapping(address => MyStruct) public MyStructs;

    function examples(uint256[] calldata y, string calldata s)
        external
        returns (MyStruct memory)
    {
        MyStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});

        _internal(y);
        // storage 修改链上的状态
        MyStruct storage myStruct = MyStructs[msg.sender];
        myStruct.text = "foo";

        // memory 函数结束就消失
        MyStruct memory readOnly = MyStructs[msg.sender];
        readOnly.foo = 456;

        return readOnly;
    }

    function _internal(uint256[] calldata y) private {
        uint256 x = y[0];
    }
}
