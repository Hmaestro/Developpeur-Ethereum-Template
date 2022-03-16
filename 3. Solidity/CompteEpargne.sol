// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.7 <0.9.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract CompteEpargne is Ownable {

 //   address admin;
    uint balance;
    uint firstTransctaionTime;
    mapping(uint => uint) depots;
    uint numeroDeDepot;

//    constructor(address owner) {
//        admin = owner;
//    }
s
/*modifier onlyOwner() {
    require(msg.sender == admin);
    _;
}*/

    modifier after3Months() {
        require(firstTransctaionTime > 0 && block.timestamp > firstTransctaionTime + 20, //12 * 1 weeks
                unicode"Attendre 3 mois après la première transaction");
        _;
    }

    function transferFundsToAdminAccount() public after3Months onlyOwner {
        address _admin = msg.sender;
        //(bool sent, ) = payable(_admin).call{value: balance}("");
        (bool sent, ) = payable(_admin).call{value: address(this).balance}("");
        require(sent, "Failed to send Ether");
        balance = 0;
    }

    function addValue() public payable {
        uint _value = msg.value;
        require(_value > 0, "Envoyer une valeur > 0");
        
        if (firstTransctaionTime == 0) {
            firstTransctaionTime = block.timestamp;
        }
        
        //balance += _value;
        depots[numeroDeDepot] = _value;
        numeroDeDepot++;
    }

    function getDepotByNumero(uint _numeroDeDepot) public view returns(uint) {
        return depots[_numeroDeDepot];
    }

}