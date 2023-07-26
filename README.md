# DegenGamingToken

DegenGamingToken is an ERC-20 token contract designed for the Degen Gaming platform on the Avalanche network. This contract is based on OpenZeppelin's ERC20Burnable contract and includes additional functionality to enable token minting, transfers, burning, item redemption in the in-game store, and checking token balances.

## snowtrace Transactions
![Screenshot 2023-07-26 204605](https://github.com/Kartheek2024/EthereumIntermediateproject4/assets/128969620/13d1b602-818b-45aa-8c79-d413d2fd5e79)


## Features

- Minting new tokens to reward players (only the contract owner can mint tokens).
- Transferring tokens between addresses.
- Burning tokens to reduce the total supply (token holders can burn their own tokens).
- Item redemption: Players can redeem tokens for items in the in-game store using the `redeemItem` function.
- Checking token balance: Players can check their token balance at any time using the `checkBalance` function.

## Getting Started
To use this contract, you need to have a Solidity development environment set up. Follow these steps to get started:

1. Clone the repository: `git clone 
2. Install dependencies: `npm install`
3. Compile the contract: `npx hardhat compile`
4. Deploy the contract: `npx hardhat run scripts/deploy.js --network fuji`
5. Interact with the contract using the provided functions.

