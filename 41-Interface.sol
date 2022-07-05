// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// contract Counter {
//     uint256 public count;

//     function inc() external {
//         count += 1;
//     }

//     function dec() external {
//         count -= 1;
//     }
// }

interface ICounter {
    function count() external view returns (uint256);

    function inc() external;
}

contract CallInterface {
    uint256 public count;

    function examples(address _counter) external {
        ICounter(_counter).inc();
        count = ICounter(_counter).count();
    }
}
