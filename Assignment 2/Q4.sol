// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleCounter {
    // State variable to store the count
    uint256 private count;

    // Constructor to initialize the count (optional)
    constructor() {
        count = 0;
    }

    // To increment the count
    function increment() public {
        count += 1;
    }

    // To get the current count
    function getCount() public view returns (uint256) {
        return count;
    }
}
