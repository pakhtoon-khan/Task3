// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract WrappedEMP is ERC20 {
    ERC20 public empToken;

    constructor(address _empTokenAddress) ERC20("Wrapped EMP", "WEMP") {
        empToken = ERC20(_empTokenAddress);
    }

    function wrap(uint256 amount) external {
        empToken.transferFrom(msg.sender, address(this), amount);
        _mint(msg.sender, amount);
    }

    function unwrap(uint256 amount) external {
        _burn(msg.sender, amount);
        empToken.transfer(msg.sender, amount);
    }
}