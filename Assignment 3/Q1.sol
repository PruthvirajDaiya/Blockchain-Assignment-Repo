// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleLottery {
    address public manager;
    address[] public players;

    constructor() {
        manager = msg.sender;
    }

    function enter() public payable {
        require(msg.value == 0.00 ether, "Entry fee is exactly 0.00 ETH");

        players.push(msg.sender);
    }

    function pickWinner() public restricted {
        require(players.length > 0, "No players to pick from");

        uint index = random() % players.length;
        address winner = players[index];
        payable(winner).transfer(address(this).balance);

        // Reset the players array
        delete players;
    }

    function random() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players)));
    }

    modifier restricted() {
        require(msg.sender == manager, "Only manager can call this");
        _;
    }

    function getPlayers() public view returns (address[] memory) {
        return players;
    }
}
