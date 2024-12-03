// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenVending is ERC20, Ownable {
    uint256 public itemCost = 1; // Default cost for an item
    mapping(address => uint256[]) public userItems; // Mapping of user to their item IDs

    struct Item {
        uint256 id;
        string name;
    }

    Item[] public items;

    constructor(address initialOwner) ERC20("DegenVending", "DGNV") Ownable(initialOwner) {}

    // Mint tokens to a specified address
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Redeem an item by burning tokens
    function redeemItem() public {
        require(balanceOf(msg.sender) >= itemCost, "Not enough tokens.");
        require(items.length > 0, "No items available for redemption."); // Ensure items exist

        // Pick a random item
        uint256 randomIndex = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % items.length;
        Item memory selectedItem = items[randomIndex];

        // Burn tokens for the item
        _burn(msg.sender, itemCost);

        // Add the item to the user's collection
        userItems[msg.sender].push(selectedItem.id);
    }

    // Add a new item to the vending machine (only owner can add items)
    function addItem(string memory _name) public onlyOwner {
        items.push(Item(items.length, _name));
    }

    // Get the list of item names owned by the caller (No extra inputs required)
    function getUserItems() public view returns (string[] memory) {
        uint256[] memory itemIds = userItems[msg.sender];
        string[] memory ownedItemNames = new string[](itemIds.length);

        for (uint256 i = 0; i < itemIds.length; i++) {
            ownedItemNames[i] = items[itemIds[i]].name;
        }

        return ownedItemNames;
    }
}
