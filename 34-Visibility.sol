// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
private: 只在合约内部可见
internal: 在合约内部和继承的合约中可见
public: 在合约内容和外部都可以看到
external: 仅在合约外部调用的时候可见，内部无法可见

可修饰状态变量和函数
*/

/*
contract A
func pri() private
func inter() internal
func pub() public
func ext() external

contract B is A
inter()
pub()

contract C
pub()
ext()

*/

contract VisibilityBase {
    uint256 private x = 0;
    uint256 internal y = 1;
    uint256 public z = 2;

    function privateFunc() private pure returns (uint256) {}

    function internalFunc() internal pure returns (uint256) {}

    function publicFunc() public pure returns (uint256) {}

    function externalFunc() external pure returns (uint256) {}

    function examples() external view {
        x + y + z;
        privateFunc();
        internalFunc();
        publicFunc();
        // externalFunc();  只能外部访问
        this.externalFunc();  // 先到外部再访问
    }
}


contract VisibilityChild is VisibilityBase{
    function examples2() external view{
        y + z;
        internalFunc();
        publicFunc();
    }

}

// contract VisibilityOther{
//     function examples() public  {
//         VisibilityBase.publicFunc();
//     }
// }