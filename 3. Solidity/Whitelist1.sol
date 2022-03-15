// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.12;

contract Whitelist {
    event Authorized(address _authorizedAdress);

    mapping (address => bool) whitelist;

    struct Person {
        string name;
        uint age;
    }

    Person[] public persons;

    function addPerson(string memory _name, uint _age) public {
        Person memory person = Person(_name, _age);
    }

    function add(string memory _name, uint _age) public {
        persons.push(Person(_name, _age));
    }

    function remove() public {
        persons.pop();
    }
}