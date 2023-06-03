require("dotenv").config();
const { API_URL, PRIVATE_KEY } = process.env;
module.exports = {
  solidity: {
    version: "0.8.17",
    settings: {
      optimizer: {
        enabled: true,
        runs: 1000,
      },
      viaIR: true,
    },
    networks: {
      goerli: {
        url: API_URL,
        accounts: [`0x${PRIVATE_KEY}`],
      },
    },
  },
};
