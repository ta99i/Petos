import { ethers } from "ethers";
import { Network, Alchemy } from "alchemy-sdk";
const contractAddress = "0xaD649B5C1Ba256B2d0836a86a39332de1016a532"; // Replace with contract address
const contractABI = require("../Contracts/Petos.sol/Petos.json");
const settings = {
  apiKey: process.env.REACT_APP_ALCHEMY_KEY, // Replace with your Alchemy API Key.
  network: Network.ETH_GOERLI, // Replace with your network.
};

const alchemy = new Alchemy(settings);
export const getNFTS = async () => {
  const reqNFTS = await alchemy.nft.getNftsForContract(contractAddress);
  const NFTS = [];
  for (var i = 0; i < reqNFTS.nfts.length; i++) {
    var nft = {};
    nft.img = reqNFTS.nfts[i].rawMetadata.image;
    nft.title = reqNFTS.nfts[i].title;
    nft.name = reqNFTS.nfts[i].rawMetadata.attributes[0].value;
    nft.breed = reqNFTS.nfts[i].rawMetadata.attributes[1].value;
    nft.birthday = new Date(
      parseInt(reqNFTS.nfts[i].rawMetadata.attributes[2].value)
    )
      .toISOString()
      .slice(0, 10);
    NFTS.push(nft);
  }

  return NFTS;
};
export const getNFTSForAccount = async (address) => {
  const reqNFTS = await alchemy.nft.getNftsForOwner(address.toString(), {
    contractAddresses: [contractAddress],
  });
  const NFTS = [];
  for (var i = 0; i < reqNFTS.ownedNfts.length; i++) {
    var nft = {};
    nft.tokenId = reqNFTS.ownedNfts[i].tokenId;
    nft.address = reqNFTS.ownedNfts[i].contract.address;
    nft.img = reqNFTS.ownedNfts[i].rawMetadata.image;
    nft.title = reqNFTS.ownedNfts[i].title;
    nft.name = reqNFTS.ownedNfts[i].rawMetadata.attributes[0].value;
    nft.breed = reqNFTS.ownedNfts[i].rawMetadata.attributes[1].value;
    nft.birthday = new Date(
      parseInt(reqNFTS.ownedNfts[i].rawMetadata.attributes[2].value)
    )
      .toISOString()
      .slice(0, 10);
    NFTS.push(nft);
  }

  return NFTS;
};
export const connect = async () => {
  const provider = new ethers.providers.Web3Provider(window.ethereum);
  await provider.send("eth_requestAccounts", []);
  getNFTS();
  return provider;
};
export const mint = async (address, colors, name, birthday) => {
  if (window.ethereum) {
    try {
      const provider = await connect();
      const contract = await new ethers.Contract(
        contractAddress,
        contractABI.abi,
        provider
      );
      const signer = provider.getSigner();
      const sContract = await contract.connect(signer);
      sContract.mint(address, colors, name, birthday, { value: 500 });
    } catch (e) {
      console.log(e.message);
    }
  } else {
    console.log("please install wallet");
  }
};
export const Transfer = async (address, tokenId) => {
  console.log(address + " " + tokenId);
  if (window.ethereum) {
    try {
      const provider = await connect();
      const contract = await new ethers.Contract(
        contractAddress,
        contractABI.abi,
        provider
      );
      const signer = provider.getSigner();
      const sContract = await contract.connect(signer);
      sContract.transferFrom(signer.getAddress(), address, tokenId);
    } catch (e) {
      console.log(e.message);
    }
  } else {
    console.log("please install metamask");
  }
};
