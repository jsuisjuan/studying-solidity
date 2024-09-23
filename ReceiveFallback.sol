// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
contract ReceiveFallback {
    uint public lastValueSend;
    string public lastFunctionCalled;
    receive() external payable {
        lastValueSend = msg.value;
        lastFunctionCalled = "receive";
    }
    fallback() external payable {
        lastValueSend = msg.value;
        lastFunctionCalled = "fallback";
    }
}