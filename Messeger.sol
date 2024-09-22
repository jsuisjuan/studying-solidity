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
    public {
        require (msg.sender == owner, "you are not allowed to send message");
        message = _messageToBeStorage;
        changeCounter++;
    }
    function getMyAddress() 
    public view returns(address) {
        return msg.sender;
    }
}