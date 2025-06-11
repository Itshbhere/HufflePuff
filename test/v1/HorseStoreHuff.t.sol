// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Base_TestV1, HorseStore} from "./Base_TestV1.t.sol";
import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";

contract HorseStoreHuff is Base_TestV1 {
    string public constant Horse_Store_Huff_Location = "HorseStoreV1/HorseStore";

    function setUp() public override {
        horseStore = HorseStore(HuffDeployer.config().deploy(Horse_Store_Huff_Location));
    }
}
