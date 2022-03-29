// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.7 <0.9.0;

contract Shop {
    struct Item {
        uint price;
        uint units;
    }

    mapping(string => Item) items;

    // external est moins cher
    function addItem(string memory _name, uint _price, uint _units) external {
        items[_name] = Item(_price, _units);
        items[_name] = Item({price : _price, units : _units});
       
    }

    function setItem(string memory _name, uint _price, uint _units) external {
        items[_name].price = _price;
        items[_name].units = _units;
    }

    function getItem(string memory _name) public view returns(uint, uint) {
        return (items[_name].price, items[_name].units);
    }

    /* function getItem(string memory _name) public view returns() Item) {
        return items[_name];
    }*/


}