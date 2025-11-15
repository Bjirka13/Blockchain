//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract DataStore1 {

    uint256 favoriteNumber;

function storeData(uint256 _favoriteNumber) public virtual {
    favoriteNumber = _favoriteNumber;
 }
 
 function doSomething() public view virtual returns (uint256){
 }

}
