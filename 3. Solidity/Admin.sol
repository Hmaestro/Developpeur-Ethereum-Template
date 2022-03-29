//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.12;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/access/Ownable.sol";
 
contract Admin is Ownable {
    mapping(address, bool) _whitelist;
    mapping(address, bool) _blacklist;

    event WhiteListed(address);
    event Blacklisted(address);


    function whitelist(address _address) public onlyOwner {
        _whitelist[_address] = true;
        emit WhiteListed(_address);
    }
    function Blacklist(address _address) public onlyOwner {
        _blacklist[_address] = true;
        emit Blacklisted(_address);
    }
    function isWhitelisted(_address) public view returns(bool) {
        return _whitelist[_address] == true;
    }
    function isBlacklisted(_address) public view returns(bool) {
        return _blacklist[_address] == true;
    }
}