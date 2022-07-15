// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

interface IERC20 {
    // token 总量
    function totalSuppy() external view returns (uint256);

    // 某个账户的当前余额
    function balanceOf(address account) external view returns (uint256);

    // 当前调用者余额发送到另一个账户, 写入方法，回向链外汇报一个事件
    function transfer(address recipent, uint256 amount) external returns (bool);

    // 可以查询某一个账户对另一个账户批准额度有多少， 与approve一起使用
    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    // 批准，代表着把我账户中的数量批准给另一个账户
    function approve(address spender, uint256 amount) external returns (bool);

    // 向另一个合约存款的时候，另一个合约必须调用transferFrom才能把我们账户中的token拿到他的合约中，与approve联合使用
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 amount);
    event Apprival(
        address indexed owner,
        address indexed spender,
        uint256 amount
    );
}

contract ERC20 is IERC20 {
    uint256 public totalSuppy;
    mapping(address => uint256) public balanceOf;

    mapping(address => mapping(address => uint256)) public allowance;
    string public name = "Test";
    string public sysmbol = "TEST";
    uint8 public decimals = 18;

    function transfer(address recipient, uint256 amount)
        external
        returns (bool)
    {
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Apprival(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool) {
        allowance[sender][msg.sender] -= amount;
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }

    function mint(uint256 amount) external {
        balanceOf[msg.sender] += amount;
        totalSuppy += amount;
        emit Transfer(address(0), msg.sender, amount);
    }

    function burn(uint256 amount) external {
        balanceOf[msg.sender] -= amount;
        totalSuppy += amount;
        emit Transfer(msg.sender, address(0), amount);
    }
}
