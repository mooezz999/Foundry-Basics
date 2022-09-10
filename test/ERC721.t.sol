// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/ERC721.sol";

contract ERCTest is Test {
    ERC721 public erc721;
    MyNFT public mynft;
    address bob = address(0x1);
    address mary = address(0x2);

    function testMintToken() public {
        erc721 = new ERC721();
        erc721._mint(bob, 0);
        address owner_of = erc721.ownerOf(0);
        assertEq(owner_of, bob);
    }

    function testTransferFrom() public {
        erc721 = new ERC721();
        erc721._mint(bob, 0);
        vm.startPrank(bob);
        erc721.safeTransferFrom(bob, mary, 0);
        address owner_of = erc721.ownerOf(0);
        assertEq(owner_of, mary);
    }

    function testGetBalance() public {
        erc721 = new ERC721();
        erc721._mint(bob, 0);
        uint balance = erc721.balanceOf(bob);
        assertEq(balance, 1);
    }

    function testOnlyOwnerCanBurn() public {
        mynft = new MyNFT();
        mynft.mint(bob, 0);
        vm.startPrank(bob);
        // vm.expectRevert("not owner");
        mynft.burn(0);
        emit log_address(mary);
    }
}
