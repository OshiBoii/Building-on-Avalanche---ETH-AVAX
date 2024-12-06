# DegenVending Smart Contract

## Features
- ERC20 token for in-game rewards and transactions.
- **Minting**: Only the owner can mint new tokens.
- **Item Redemption**: Players can redeem tokens for random items by burning tokens.
- **Item Management**: Only the owner can add new items to the in-game store.
- **Token Burning**: Players can burn their own tokens if no longer needed.
- **Balance Viewing**: Players can check their token balances at any time.
- **User Item Collection**: Players can view the items they have redeemed.

## Requirements
- Solidity `^0.8.20`
- OpenZeppelin Contracts (ERC20, Ownable)

## Installation
1. Clone this repository.
2. Deploy the contract using **Remix**, **Hardhat**, or any Ethereum-compatible development environment.
3. Import the following OpenZeppelin libraries:
   - `@openzeppelin/contracts/token/ERC20/ERC20.sol`
   - `@openzeppelin/contracts/access/Ownable.sol`

## Deployment
1. Deploy the contract to your preferred Ethereum-compatible network (Avalanche Fuji Testnet in this case).
2. Set the `initialOwner` address when deploying the contract. This address will be the contract owner and have permission to mint tokens and add items.

## Contract Functions

### `mint(address to, uint256 amount)`
- **Description**: Allows the owner to mint new tokens for a specified address.
- **Access Control**: Only the owner can call this function.

### `redeemItem()`
- **Description**: Allows a player to redeem a random item by burning tokens.
- **Access Control**: Public function accessible to all players.

### `addItem(string memory _name)`
- **Description**: Allows the owner to add new items to the vending machine.
- **Access Control**: Only the owner can call this function.

### `getUserItems()`
- **Description**: Allows players to view the items they have redeemed.
- **Access Control**: Public function accessible to all players.

### `burn(uint256 amount)`
- **Description**: Allows players to burn tokens they no longer need.
- **Access Control**: Public function accessible to all players.

## License
This project is licensed under the **MIT License**.

## Author
**Ywan Scazi Galura**  
202110347
