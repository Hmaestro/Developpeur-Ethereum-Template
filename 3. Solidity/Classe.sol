//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract Classe {
    bytes32 constant BIOLOGY = keccak256(abi.encodePacked("Biology"));
    bytes32 constant MATH = keccak256(abi.encodePacked("Math"));
    bytes32 constant FRANCAIS = keccak256(abi.encodePacked("Francais"));

    struct Student {
        uint noteBiology;
        uint noteMath;
        uint noteFr;
    }

    address public profBiology;
    address public profMath;
    address public profFr;

    constructor (address _profBiology, address _profMath, address _profFr) {
        profBiology = _profBiology;
        profMath = _profMath;
        profFr = _profFr;
    }

    mapping(address => Student) students;

    function getNote(address _studentAdress) public view returns (uint, uint, uint){
        return (students[_studentAdress].noteBiology, students[_studentAdress].noteMath, students[_studentAdress].noteFr);
    }

    function addNoteMath(address _studentAdress, uint _note) public {
        require(msg.sender == profMath, unicode"Vous n'êtes pas autorisés à ajouter des notes de Math :)");
        students[_studentAdress].noteMath = _note;
    }

    function addNoteBiology(address _studentAdress, uint _note) public {
        require(msg.sender == profBiology, unicode"Vous n'êtes pas autorisés à ajouter des notes de Biology :)");
        students[_studentAdress].noteBiology = _note;
    }

    function addNoteFr(address _studentAdress, uint _note) public {
        require(msg.sender == profFr, unicode"Vous n'êtes pas autorisés à ajouter des notes de Français :)");
        students[_studentAdress].noteFr = _note;
    }
    
}