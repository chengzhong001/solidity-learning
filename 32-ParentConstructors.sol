// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract S {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract T {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// 第一种
contract U is S("s"), T("t") {

}

// 第二种
contract V is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {}
}

// 混合构造
contract W is S("s"), T {
    constructor(string memory _text) T(_text) {}
}

// 按照继承的顺序运行
// 1.S
// 2.T
// 3.V0
contract V0 is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {}
}
