// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.7 <0.9.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract GuessUp is Ownable {

    string mot;
    string indice;
    mapping(address => bool) etatsJoueurs;
    address public gagnant;

   function setMot(string memory _mot) public onlyOwner {
       mot = _mot;
   }

   function setIndice(string memory _indice) public onlyOwner {
       indice = _indice;
   }

   function getIndice() public view returns(string memory) {
       return indice;
   }

   function proposerUnMot(string memory _mot) public returns(bool) {
       bytes memory motAChercher = bytes(mot);
       require(motAChercher.length > 0 , "Pas de mot a chercher !");
       address sender = msg.sender;
       bytes memory motProposeInBytes = bytes(_mot);
       require(motProposeInBytes.length > 0, "Le mot est vide");
       require(!etatsJoueurs[sender], "Tentative deja effectuee!");
       etatsJoueurs[sender] = true;
       if (keccak256(abi.encodePacked(_mot)) == keccak256(abi.encodePacked(mot))) {
           gagnant = sender;
           return true;
       }
       return false;
   } 
function test() public pure returns(bool) {
    return true;
}

}