// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

interface Pets {
    function generateTokenURI(
        uint256 tokenId,
        string[] memory param,
        string memory name,
        string memory sex,
        uint256 birthday
    ) external pure returns (string memory);
}

contract Petos is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter public nftMinted;
    address payable public _donationWallet;
    uint public _pOwner;
    uint public _prix;
    mapping(address => bool) public _pets;

    constructor(
        address payable donationWallet,
        uint pOwner,
        uint prix
    ) ERC721("Petos", "PTS") {
        _donationWallet = donationWallet;
        _pOwner = pOwner;
        _prix = prix;
    }

    function withdraw() public payable {
        uint256 forOwner = address(this).balance / _pOwner;
        (bool s, ) = payable(owner()).call{value: forOwner}("");
        require(s);
        (bool t, ) = _donationWallet.call{value: address(this).balance}("");
        require(t);
    }

    function setDonation(address payable donationWallet) public onlyOwner {
        require(donationWallet != address(0), "Address cannot be zero");
        _donationWallet = donationWallet;
    }

    function setPrix(uint newPrix) public onlyOwner {
        _prix = newPrix;
    }

    function addPets(address pet) external onlyOwner {
        _pets[pet] = true;
    }

    function deletePets(address pet) external onlyOwner {
        _pets[pet] = false;
    }

    function mint(
        address pet,
        string[] memory param,
        string memory name,
        string memory sex,
        uint256 birthday
    ) external payable {
        require(_pets[pet] == true, "This Pet not in System");
        require(msg.value >= _prix, "No Enough Money");
        uint256 newItemId = nftMinted.current();
        _safeMint(msg.sender, newItemId);
        _setTokenURI(
            newItemId,
            Pets(pet).generateTokenURI(newItemId, param, name, sex, birthday)
        );
        nftMinted.increment();
    }
}
