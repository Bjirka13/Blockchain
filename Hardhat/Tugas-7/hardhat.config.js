require("@nomicfoundation/hardhat-toolbox");

const GANACHE_URL = "HTTP://127.0.0.1:7545";
const PRIVATE_KEY = "0x76cec729873dcb223566f8704449da83c379be98eee9046a6aa101631c3b3d4b";

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.28",
  networks: {
    ganache: {
      url: GANACHE_URL,
      accounts: [PRIVATE_KEY]
    },
  },
};
