// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Numberer {
    uint256 private number;

    // 1. Set a number
    function setNumber(uint256 _num) external {
        number = _num;
    }

    // 2. Get the current number
    function getNumber() external view returns (uint256) {
        return number;
    }

    // 3. Increment the number by 1
    function increment() external {
        number += 1;
    }

    // 4. Reset the number to 0
    function reset() external {
        number = 0;
    }
}
