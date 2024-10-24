// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OwnerAccess {
    // Address of the contract owner
    address public owner;

    // Event to emit when ownership is transferred
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    // Modifier to restrict access to only the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    // Constructor to set the deployer as the initial owner
    constructor() {
        owner = msg.sender;
    }

    // Function to transfer ownership to a new address (restricted to the current owner)
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner is the zero address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

    // Example function restricted to the owner
    function restrictedFunction() public onlyOwner {
        // Logic that only the owner can execute
    }
}
