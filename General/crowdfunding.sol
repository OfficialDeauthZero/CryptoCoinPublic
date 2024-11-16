// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CryptoCoinCrowdfunding {
    address public owner;
    uint256 public goal;
    uint256 public deadline;
    mapping(address => uint256) public contributions;
    uint256 public totalContributions;

    constructor(uint256 _goal, uint256 _duration) {
        owner = msg.sender;
        goal = _goal;
        deadline = block.timestamp + _duration;
    }

    function contribute() public payable {
        require(block.timestamp < deadline, "Funding period is over");
        contributions[msg.sender] += msg.value;
        totalContributions += msg.value;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        require(totalContributions >= goal, "Goal not reached");
        payable(owner).transfer(address(this).balance);
    }

    function refund() public {
        require(block.timestamp > deadline, "Funding period not yet over");
        require(totalContributions < goal, "Goal reached, no refunds");
        uint256 amount = contributions[msg.sender];
        contributions[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}

