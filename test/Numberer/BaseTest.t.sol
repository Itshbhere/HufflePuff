// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Numberer} from "../../src/Numberer/Numberer.sol";
import {INumberer} from "../../src/Numberer/INumberer.sol";
import {Test, console} from "forge-std/Test.sol";

abstract contract NumbererTest is Test {
    INumberer public numberer;

    function setUp() public virtual {
        numberer = INumberer(address(new Numberer()));
    }

    function testInitialNumber() public view {
        assertEq(numberer.getNumber(), 0);
    }

    function testSetNumber() public {
        uint256 testValue = 42;
        numberer.setNumber(testValue);
        assertEq(numberer.getNumber(), testValue);
    }

    function testIncrement() public {
        // Test increment from initial state (0)
        numberer.increment();
        assertEq(numberer.getNumber(), 1);

        // Test increment from non-zero value
        numberer.setNumber(10);
        numberer.increment();
        assertEq(numberer.getNumber(), 11);
    }

    function testReset() public {
        // Set a number then reset
        numberer.setNumber(100);
        numberer.reset();
        assertEq(numberer.getNumber(), 0);
    }

    function testMultipleOperations() public {
        // Test a sequence of operations
        numberer.setNumber(5);
        numberer.increment();
        assertEq(numberer.getNumber(), 6);

        numberer.increment();
        assertEq(numberer.getNumber(), 7);

        numberer.reset();
        assertEq(numberer.getNumber(), 0);

        numberer.increment();
        assertEq(numberer.getNumber(), 1);
    }

    function testFuzzSetNumber(uint256 _randomNumber) public {
        numberer.setNumber(_randomNumber);
        assertEq(numberer.getNumber(), _randomNumber);
    }

    function testFuzzIncrementFromAnyValue(uint256 _startValue) public {
        vm.assume(_startValue < type(uint256).max); // Prevent overflow

        numberer.setNumber(_startValue);
        numberer.increment();
        assertEq(numberer.getNumber(), _startValue + 1);
    }
}
