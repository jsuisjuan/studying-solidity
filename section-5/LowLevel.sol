// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
contract Sender {
    receive() external payable {}
    function withdrawTransfer(address payable _to) public {
        _to.transfer(10);
    }
    function withdrawSend(address payable _to) public {
        bool isSent = _to.send(10);
        require(isSent, "Sending the funds was unsuccessfull");
    }
}
contract ReceiveNoAction {
    receive() external payable {}
    function balance() public view returns(uint) {
        return address(this).balance;
    }
}
contract ReceiveAction {
    uint public balanceReceived;
    receive() external payable {
        balanceReceived += msg.value;
    } 
    function balance() public view returns(uint) {
        return address(this).balance;
    }
}

// Low Level Calls in Depth
contract ContractOne {
    mapping(address => uint) public addressBalance;
    function deposit() public payable {
        addressBalance[msg.sender] += msg.value;
    }
    receive() external payable {
        deposit();
    }
}
contract ContractTwo {
    receive() external payable {}
    function depositContractOne(address _contractOne) public {
        (bool success, ) = _contractOne.call{value: 10, gas: 10000}("");
        require(success);
    }
}