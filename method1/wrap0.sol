// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract WrappedEMP is ERC20, Ownable {
    ERC20 public empToken; // Reference to the original EMP token

    constructor(address _empTokenAddress) ERC20("Wrapped EMP", "WEMP") {
        empToken = ERC20(_empTokenAddress);
    }

    // Wrap EMP tokens into WEMP
    function wrap(uint256 amount) external {
        require(amount > 0, "Amount must be greater than zero");
        // Transfer EMP tokens from the user to this contract
        empToken.transferFrom(msg.sender, address(this), amount);
        // Mint wrapped tokens to the user
        _mint(msg.sender, amount);
    }

    // Unwrap WEMP tokens back into EMP
    function unwrap(uint256 amount) external {
        require(amount > 0, "Amount must be greater than zero");
        // Burn the wrapped tokens
        _burn(msg.sender, amount);
        // Transfer the original EMP tokens back to the user
        empToken.transfer(msg.sender, amount);
    }
}