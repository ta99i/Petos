import { ethers } from "ethers";
import { Alchemy, Network } from "alchemy-sdk";
const contractAddress = "0xb955470e29592095D56BDf09eC2e4C20Cc7c8875"; // Replace with contract address
const contractABI = require("../Contracts/Petos.sol/Petos.json");
const settings = {
  apiKey: process.env.REACT_APP_ALCHEMY_KEY, // Replace with your Alchemy API Key.
  network: Network.ETH_SEPOLIA, // Replace with your network.
};
export const getLastNFTID = async () => {
  const provider = new ethers.providers.JsonRpcProvider(
    "https://eth-sepolia.g.alchemy.com/v2/y_6OriVD-v63ZIDC0ryljOlWO_4ve9sr"
  );
  const contract = await new ethers.Contract(
    contractAddress,
    contractABI.abi,
    provider
  );
  const reqNFT = await contract.nftMinted();
  return reqNFT;
};
export const getNFT = async (id) => {
  const provider = new ethers.providers.JsonRpcProvider(
    "https://eth-sepolia.g.alchemy.com/v2/y_6OriVD-v63ZIDC0ryljOlWO_4ve9sr"
  );
  const contract = await new ethers.Contract(
    contractAddress,
    contractABI.abi,
    provider
  );
  const reqNFT = await contract.tokenURI(id);
  const decode64 = atob(reqNFT.slice(29));
  const obj = JSON.parse(decode64);
  var NFT = {};
  NFT.img = obj.image;
  NFT.title = obj.name;
  NFT.name = obj.attributes[0].value;
  NFT.breed = obj.attributes[1].value;
  NFT.birthday = new Date(parseInt(1680134400000)).toISOString().slice(0, 10);

  return NFT;
};
const alchemy = new Alchemy(settings);
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
