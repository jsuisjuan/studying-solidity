// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
contract Messeger {
    address public owner;
    string public message;
    uint8 public changeCounter;
    constructor() {
        owner = msg.sender;
    }
    function writeMessage(string calldata _messageToBeStorage) 
    public payable {
        if (msg.sender != owner) {
            require(msg.value >= 1 ether, "the number of ethers is insuficient");
        } else {
            payable(msg.sender).transfer(msg.value);
        }
        message = _messageToBeStorage;
        changeCounter++;
    }
    function getMyAddress()
    public view returns(address) {
        return msg.sender;
    }
}

/*
    - você tem que ser um exímio solucionador de problemas
    - arrumar o quarto;
    - continuar com o curso de solidity (fazer uns 3 capítulos pelo menos);
*/
