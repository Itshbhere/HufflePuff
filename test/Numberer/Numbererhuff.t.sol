// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {NumbererTest, INumberer} from "./BaseTest.t.sol";
import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";

contract NumbererHuff is NumbererTest {
    string public constant Numberer_Huff_Location = "Numberer/Numberer";

    function setUp() public override {
        numberer = INumberer(HuffDeployer.deploy(Numberer_Huff_Location));
    }
}
