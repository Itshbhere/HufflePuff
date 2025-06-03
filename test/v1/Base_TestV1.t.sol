// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {HorseStore} from "../../src/HorseStoreV1/HorseStore.sol";
import {Test, console} from "forge-std/Test.sol";

abstract contract Base_TestV1 is Test {
    HorseStore public horseStore;

    function setUp() public virtual {
        horseStore = new HorseStore();
    }

    function testReadValue() public {
        uint256 initialValue = horseStore.readNumberOfHorses();
        assertEq(initialValue, 0);

        uint256 test1value = 69;
        horseStore.updateHorseNumber(test1value);
        initialValue = horseStore.readNumberOfHorses();
        assertEq(initialValue, 69);

        uint256 test2value = 777;
        horseStore.updateHorseNumber(test2value);
        initialValue = horseStore.readNumberOfHorses();
        assertNotEq(initialValue, 69);
    }
}
