// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.12;

contract Whitelist {
    event Authorized(address _authorizedAdress);

    mapping (address => bool) whitelist;

    function authorize(address _address) public {
        whitelist[_address] = true;
        emit Authorized(_address);
    }


}