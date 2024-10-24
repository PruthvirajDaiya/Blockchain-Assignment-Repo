// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleLedger {
    struct Transaction {
        uint256 amount;
        address from;
        address to;
        uint256 timestamp;
    }

    // Array to store transactions
    Transaction[] public transactions;

    // Event to emit transaction details
    event TransactionRecorded(uint256 index, uint256 amount, address from, address to, uint256 timestamp);

    // Function to record a transaction
    function recordTransaction(uint256 amount, address to) public {
        transactions.push(Transaction({
            amount: amount,
            from: msg.sender,
            to: to,
            timestamp: block.timestamp
        }));

        emit TransactionRecorded(transactions.length - 1, amount, msg.sender, to, block.timestamp);
    }

    // Function to retrieve transaction details
    function getTransaction(uint256 index) public view returns (uint256 amount, address from, address to, uint256 timestamp) {
        require(index < transactions.length, "Transaction does not exist");

        Transaction memory tx = transactions[index];
        return (tx.amount, tx.from, tx.to, tx.timestamp);
    }
}
