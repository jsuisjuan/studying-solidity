// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
contract MappingStructExample {
    struct Transaction {
        uint amount;
        uint timestamp;
    }
    struct Balance {
        uint totalBalance;
        uint numDeposits;
        uint numWithdrawals;
        mapping(uint => Transaction) deposits;
        mapping(uint => Transaction) withdrawals;
    }
    mapping(address => Balance) public balances;
    function depositMoney() public payable {
        balances[msg.sender].totalBalance += msg.value;
        Transaction memory deposit = Transaction(msg.value, block.timestamp);
        balances[msg.sender].deposits[balances[msg.sender].numDeposits] = deposit;
        balances[msg.sender].numDeposits++;
    }
    function withdrawMoney(address payable _to, uint _amount) public {
        balances[msg.sender].totalBalance -= _amount;
        Transaction memory withdraw = Transaction(_amount, block.timestamp);
        balances[msg.sender].withdrawals[balances[msg.sender].numWithdrawals] = withdraw;
        balances[msg.sender].numWithdrawals++;
        _to.transfer(_amount);
    }
    function getDepositNum(address _from, uint _numDeposit) public view returns(Transaction memory) {
        return balances[_from].deposits[_numDeposit];
    }
}