// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.12;

contract Choice {

    mapping(address=> uint) choices;

    function add(uint _myint) public {
        choices[msg.sender] = _myint;
    }

}