// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    // State variable to store an integer
    uint256 private storedData;

    // To set the value of the integer
    function set(uint256 x) public {
        storedData = x;
    }

    // To get the value of the integer
    function get() public view returns (uint256) {
        return storedData;
    }
}
