// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NameStorage {
    // State variable to store the user's name
    string private userName;

    // To set the user's name
    function setName(string memory _name) public {
        userName = _name;
    }

    // To retrieve the user's name
    function getName() public view returns (string memory) {
        return userName;
    }
}
