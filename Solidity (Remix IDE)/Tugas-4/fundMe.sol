// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "./PriceConverter.sol";

contract FundMe {
    address[] public funders;
    using PriceConverter for uint256;
    mapping(address=>uint256) public addressToAmountFunded;
    uint256 minimumUsd = 50 * 1e18;

    address public owner;
    constructor(){
        owner = msg.sender;
    }

    function fund() public payable onlyOwner {
        require(msg.value >= 1e8, "Maaf Nilai yang Anda donasikan kurang");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender]=msg.value;
    }

    function withdraw() public {
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);

        // transfer
        // msg.sender = address;
        // payable(msg.sender) = payable address;
        payable(msg.sender).transfer(address(this).balance);

        // send
        bool sendSuccsess = payable(msg.sender).send(address(this).balance);
        require(sendSuccsess, "send Failed");

        //call
        (bool callSuccess, /*bytes memory dataReturned*/) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "call Failed");
    }

    modifier onlyOwner{
        require(msg.sender == owner, "Pengirim bukan owner");
        _;
    }
}