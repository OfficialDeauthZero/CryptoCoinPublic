// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MintableCryptoCoin is ERC20, Ownable {
    constructor() ERC20("CryptoCoin", "CCO") {
        _mint(msg.sender, 1000 * 10**decimals()); // Initial supply
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
