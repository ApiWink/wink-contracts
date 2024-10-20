// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract FundsTransfer {
    using SafeERC20 for IERC20;

    function fundsTransfer(address _recipient, uint256 _amount, address _tokenAddress) external returns (bool) {
        IERC20 token = IERC20(_tokenAddress);

        require(token.balanceOf(msg.sender) >= _amount, "Insufficient balance");

        token.safeTransferFrom(msg.sender, _recipient, _amount);

        return true;
    } 
}