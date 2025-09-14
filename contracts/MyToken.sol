// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title MyToken
 * @dev A standard ERC20 token contract.
 * Upon deployment, it mints an initial supply of 1,000 tokens to the deployer.
 */
contract MyToken is ERC20 {
    /**
     * @dev Sets the name and symbol for the token, and mints initial supply.
     * @param name The name of the token.
     * @param symbol The symbol of the token.
     */
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        // Mint 1,000 tokens to the address that deployed the contract.
        // The number of decimals is 18 by default in OpenZeppelin's ERC20.
        _mint(msg.sender, 1000 * (10**decimals()));
    }
}
