// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./DataStore1.sol";

contract DataStore2 is DataStore1{
    DataStore1[] public dataStore1Array;
    function createDataStorage1Contract() public {
        DataStore1 dataStore1 = new DataStore1();
        dataStore1Array.push(dataStore1);
    }

    function readData(uint256 _dataStore1Index) public view returns (uint256) {
        return dataStore1Array[_dataStore1Index].doSomething();
    }

    function doSomething() public override pure returns (uint256){
    }
    
}
