// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CryptoCoinEscrow {
    address public payer;
    address public payee;
    address public arbiter;
    uint256 public amount;

    constructor(address _payee, address _arbiter) payable {
        payer = msg.sender;
        payee = _payee;
        arbiter = _arbiter;
        amount = msg.value;
    }

    function releaseFunds() public {
        require(msg.sender == arbiter, "Only arbiter can release funds");
        payable(payee).transfer(amount);
    }

    function refundFunds() public {
        require(msg.sender == arbiter, "Only arbiter can refund funds");
        payable(payer).transfer(amount);
    }
}

