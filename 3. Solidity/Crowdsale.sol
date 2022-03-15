// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.12;

import "./ERC20Token.sol";

contract Crowdsale {
    uint public rate = 200;

    ERC20Token public token;

     constructor(uint256 initialSupply) ERC20("ALYRA", "ALY") {
        _mint(msg.sender, initialSupply);
    }

    receive() {
        require(msg.value >= 0.1 ether);
        distribute(msg.value);
    }

    function distribute(uint256 amount) internal {
        uint256 tokenToSent = amount * 200;
        token.transfer(msg.sender, tokenToSent);
    }
}