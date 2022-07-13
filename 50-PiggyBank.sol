// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract PiggyBank {
    address public owner = msg.sender;

    event Despoit(uint256 amount);
    event Withdraw(uint256 amount);

    receive() external payable {
        emit Despoit(msg.value);
    }

    function withdraw() external {
        require(msg.sender == owner, "not owner");
        emit Withdraw(address(this).balance);
        selfdestruct(payable(msg.sender));
    }
}
