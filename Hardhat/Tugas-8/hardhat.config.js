require("@nomicfoundation/hardhat-toolbox");

const GANACHE_URL = "HTTP://127.0.0.1:7545";
const PRIVATE_KEY = "0x4747f48589a129972b771f971d35fbdb1d96f97af9478220d88492287435d4c2";

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.19",
  networks: {
    ganache: {
      url: GANACHE_URL,
      accounts: [PRIVATE_KEY]
    },
  }
};
