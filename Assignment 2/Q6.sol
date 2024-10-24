// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BasicVoting {
    // Structure to represent a candidate
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    // Mapping from candidate ID to Candidate
    mapping(uint256 => Candidate) public candidates;

    // Mapping to track whether an address has voted
    mapping(address => bool) public hasVoted;

    // Number of candidates
    uint256 public candidatesCount;

    // Constructor to initialize the candidates
    constructor(string[] memory candidateNames) {
        for (uint256 i = 0; i < candidateNames.length; i++) {
            candidatesCount++;
            candidates[candidatesCount] = Candidate(candidateNames[i], 0);
        }
    }

    // Function to vote for a candidate by ID
    function vote(uint256 candidateId) public {
        require(!hasVoted[msg.sender], "You have already voted.");
        require(candidateId > 0 && candidateId <= candidatesCount, "Invalid candidate ID.");

        candidates[candidateId].voteCount++;
        hasVoted[msg.sender] = true;
    }

    // Function to get the vote count of a candidate
    function getVoteCount(uint256 candidateId) public view returns (uint256) {
        require(candidateId > 0 && candidateId <= candidatesCount, "Invalid candidate ID.");
        return candidates[candidateId].voteCount;
    }
}
