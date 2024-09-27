// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
// 58. Solidity Mappings
contract ExampleMapping {
    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;
    mapping(uint => mapping(uint => bool)) public myUintOfUintMapping;
    function setMapping(uint _index) public {
        myMapping[_index] = true;
    }
    function setMyAddressMapping() public {
        myAddressMapping[msg.sender] = true;
    }
    function setUintUintMapping(uint _key1, uint _key2, bool _value) public {
        myUintOfUintMapping[_key1][_key2] = _value;
    }
}