// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DegenGamingToken is ERC20{
    address public owner;

    mapping(uint256 => uint256) public itemPrices;

    event Redeem(address indexed from, uint256 indexed itemId, uint256 tokensSpent);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _;
    }

    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint256 _initialSupply
    ) ERC20(_name, _symbol) {
        _mint(msg.sender, _initialSupply * (10**uint256(_decimals)));
        owner = msg.sender;
    }

    function mint(address _to, uint256 _amount) public onlyOwner {
        require(_to != address(0), "Invalid address");
        _mint(_to, _amount);
    }

    function setItemPrice(uint256 itemId, uint256 priceInTokens) public onlyOwner {
        require(priceInTokens > 0, "Invalid item price");
        itemPrices[itemId] = priceInTokens;
    }

    function redeemItem(uint256 itemId) public {
        require(itemPrices[itemId] > 0, "Item not available in the store");
        uint256 priceInTokens = itemPrices[itemId];
        require(balanceOf(msg.sender) >= priceInTokens, "Insufficient balance");

        // Deduct the tokens from the player's balance
        _burn(msg.sender, priceInTokens);

        // Emit the redeem event
        emit Redeem(msg.sender, itemId, priceInTokens);
    }

    function burnTokens(uint256 _amount)  public {
        _burn(msg.sender, _amount);
    }

    function transfer(address _to, uint256 _amount) public override returns (bool) {
        require(_to != address(0), "Invalid address");
        require(_amount > 0, "Invalid amount");
        require(balanceOf(msg.sender) >= _amount, "Insufficient balance");

        _transfer(msg.sender, _to, _amount);
        return true;
    }

    function checkBalance(address _account) public view returns (uint256) {
        return balanceOf(_account);
    }
}
