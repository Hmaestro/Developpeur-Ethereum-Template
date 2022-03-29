// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract Random {

    uint private nonce = 0;

    function random(uint _modulus) public returns(uint) {
        nonce++;
        return uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, nonce))) % _modulus;
    }
}