// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract IDNFT_v1 is ERC721EnumerableUpgradeable,OwnableUpgradeable {
  function initialize()public initializer{
		__ERC721_init_unchained("IDNFT", "IDNFT");
    __Ownable_init_unchained();
	}

  uint256 public tokenId;

  function claim() external {
    _mint(msg.sender, tokenId);
    tokenId++;
  }
}

contract IDNFT_v2 is ERC721EnumerableUpgradeable,OwnableUpgradeable {
  function initialize()public initializer{
		__ERC721_init_unchained("IDNFT", "IDNFT");
    __Ownable_init_unchained();
	}

  uint256 public tokenId;

  function claim() external {
    require(balanceOf(msg.sender) == 0);
    _mint(msg.sender, tokenId);
    tokenId++;
  }

  function burn(uint256 tokenId) external {
    require(msg.sender == ownerOf(tokenId));
    _burn(tokenId);
  }
}
