// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DOLAToken is ERC20 {
    address public roiAddress; 
    address public collateralAddress; 

    constructor(address _roiAddress, address _collateralAddress) ERC20("DOLA", "DOLA") {
        roiAddress = _roiAddress;
        collateralAddress = _collateralAddress;
    }
    
    function mint(uint256 amount) external {
        _mint(msg.sender, amount);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

}