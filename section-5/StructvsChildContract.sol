// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
// Solution with child contract
contract Wallet {
    PaymentReceived public payment;
    function payContract() public payable {
        payment = new PaymentReceived(msg.sender, msg.value);
    }
}
contract PaymentReceived {
    address public from;
    uint public amount;
    constructor(address _from, uint _amount) {
        from = _from;
        amount = _amount;
    }
}
// Solution with struct
contract Wallet2 {
    struct PaymentReceivedStruct {
        address from;
        uint amount;
    }
    PaymentReceivedStruct public payment;
    function payContract() public payable {
        payment = PaymentReceivedStruct(msg.sender, msg.value);
        // is it possible to use in this form to...
        payment.from = msg.sender;
        payment.amount = msg.value;
    }
}