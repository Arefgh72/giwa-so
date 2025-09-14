// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

/**
 * @title MyNFT
 * @dev A standard ERC721 Non-Fungible Token contract.
 * The owner of the contract can mint new NFTs.
 */
contract MyNFT is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    /**
     * @dev Sets the name and symbol for the NFT collection.
     * The deployer is set as the initial owner.
     * @param name The name of the NFT collection.
     * @param symbol The symbol for the NFT collection.
     */
    constructor(string memory name, string memory symbol) 
        ERC721(name, symbol)
        Ownable(msg.sender) // Sets the deployer as the owner
    {}

    /**
     * @dev Mints a new NFT and assigns it to `to` address.
     * Can only be called by the owner of the contract.
     * @param to The address to mint the new NFT to.
     */
    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }
}
