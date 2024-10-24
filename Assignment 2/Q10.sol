// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MessageStorage {
    // State variable to store the message
    string private message;

    // Event to log when the message is updated
    event MessageUpdated(string newMessage);

    // Function to set a new message
    function setMessage(string calldata newMessage) external {
        message = newMessage;
        emit MessageUpdated(newMessage);
    }

    // Function to retrieve the current message
    function getMessage() external view returns (string memory) {
        return message;
    }
}
