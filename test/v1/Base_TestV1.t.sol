// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {HorseStore} from "../../src/HorseStoreV1/HorseStore.sol";
import {IHorseStore} from "../../src/HorseStoreV1/IHorseStore.sol";
import {Test, console} from "forge-std/Test.sol";

abstract contract Base_TestV1 is Test {
    IHorseStore public horseStore;

    function setUp() public virtual {
        horseStore = IHorseStore(address(new HorseStore()));
    }

    function testReadValue() public {
        uint256 initialValue = horseStore.readNumberOfHorses();
        assertEq(initialValue, 0);

        uint256 test1value = 69;
        horseStore.updateHorseNumber(test1value);
        initialValue = horseStore.readNumberOfHorses();
        assertEq(initialValue, 69);
    }

    function testWriteValue(uint256 test2value) public {
        horseStore.updateHorseNumber(test2value);
        uint256 initialValue = horseStore.readNumberOfHorses();
        assertEq(initialValue, test2value);
    }
}
