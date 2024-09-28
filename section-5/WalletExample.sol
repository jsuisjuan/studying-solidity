// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
contract WalletExample {
    mapping(address => uint) balanceReceived;
    function sendMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    function withdrawAllMoney(address payable _to) public {
        uint balanceToSendOut = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0;
        _to.transfer(balanceToSendOut);
    }
}