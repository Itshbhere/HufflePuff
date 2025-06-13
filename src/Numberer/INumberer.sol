// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface INumberer {
    function setNumber(uint256 _num) external;
    function getNumber() external view returns (uint256);
    function increment() external;
    function reset() external;
}
