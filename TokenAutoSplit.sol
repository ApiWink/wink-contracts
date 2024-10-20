// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TokenAutoSplit {

    function autoSplitPayment(address token, uint256 amount, address mainRecipient, address secondaryRecipient) external payable {
        require(amount > 0, "Amount must be greater than zero");
        require(mainRecipient != address(0), "Main recipient cannot be the zero address");
        require(secondaryRecipient != address(0), "Secondary recipient cannot be the zero address");

        require(IERC20(token).approve(address(this), amount * 100), "Token approval failed");
       
        uint256 mainShare = (amount * 90) / 100;
        uint256 secondaryShare = amount - mainShare;

        require(IERC20(token).transferFrom(msg.sender, mainRecipient, mainShare), "Transfer to main recipient failed");
        require(IERC20(token).transferFrom(msg.sender, secondaryRecipient, secondaryShare), "Transfer to secondary recipient failed");
    }

}