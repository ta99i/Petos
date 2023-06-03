// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
    abcdefghijklmnopqrstuvwxyz
    ABCDEFGHIJKLMNOPQQRSTUVWXYZ
 */
library String {
    function isString(string memory input) public pure returns (bool) {
        bytes memory inputs = bytes(input);
        for (uint i = 1; i < inputs.length; i++) {
            if (
                !(inputs[i] == 0x20) && // space
                !(inputs[i] >= 0x41 && inputs[i] <= 0x5A) && //A-Z
                !(inputs[i] >= 0x61 && inputs[i] <= 0x7A) //a-z
            ) return false;
        }
        return true;
    }
}
