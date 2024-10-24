// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventLogging {
    // Define an event for logging an action
    event ActionLogged(address indexed user, string action, uint256 value);

    // State variable to store a value
    uint256 public storedValue;

    // Function to set a new value and log an event
    function setValue(uint256 newValue) public {
        storedValue = newValue;
        emit ActionLogged(msg.sender, "Value Set", newValue);
    }

    // Function to increment the stored value and log an event
    function incrementValue(uint256 increment) public {
        storedValue += increment;
        emit ActionLogged(msg.sender, "Value Incremented", increment);
    }
}
