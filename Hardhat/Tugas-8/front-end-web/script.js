import { ethers } from "https://cdnjs.cloudflare.com/ajax/libs/ethers/6.7.0/ethers.min.js";
import {abi, contractAddress } from "./constant.js";

const ConnectButton = document.getElementById("connectMetamask");
const storeButton = document.getElementById("store");
const storeInput = document.getElementById("inputStore");
const retrieveButton = document.getElementById("retrieve");
const outputFavNumber = document.getElementById("fav-num");

const connect = async () => {
    if (typeof window.ethereum !== "undefined") {
        await window.ethereum.request({ method: "eth_requestAccounts"});
        ConnectButton.innerHTML = "Connected";
        console.log("test");
    } else {
        alert("Please install metamask");;
    }
};

ConnectButton.onclick = connect;

const retrieve = async () => {
    if (typeof window.ethereum !== "undefined") {
        const provider = new ethers.BrowserProvider(window.ethereum);
        const signer = await provider.getSigner();
        const contract = new ethers.Contract(contractAddress, abi, signer);
        try{
            const currValue =await contract.retrieve();
            outputFavNumber.innerHTML = currValue.toString();
        } catch (err) {
            console.error(err);
        }
    }
};
retrieveButton.onclick = retrieve;

const store = async () => {
    const ethAmount = storeInput.value;
    if (typeof window.ethereum !== "undefined") {
        const provider = new ethers.BrowserProvider(window.ethereum);
        const signer = await provider.getSigner();
        const contract = new ethers.Contract(contractAddress, abi, signer);
        try {
            const transactionRepose = await contract.store(ethAmount);
            await transactionRepose.wait(1);
            console.log("Done");
        } catch (err) {
            console.error(err);
        }
    }
};
storeButton.onclick = store;