// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "./Hex.sol";

contract CornishRex {
    using Strings for uint256;
    uint8 public constant COLORS = 28;
    string public constant PET = "Cat";
    string public constant CAT_BREED = "Cornish Rex";

    function generateNFT(
        string[] memory param
    ) public pure returns (string memory) {
        bytes memory svg = abi.encodePacked(
            '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 31 32" shape-rendering="crispEdges" width="500">',
            '<path stroke= "',
            param[0],
            '" d="M1 2h2M28 2h2M0 3h1M3 3h2M26 3h2M30 3h1M0 4h1M5 4h1M25 4h1M30 4h1M0 5h1M6 5h1M24 5h1M30 5h1M0 6h1M7 6h1M23 6h1M30 6h1M0 7h1M8 7h1M22 7h1M30 7h1M0 8h1M9 8h1M21 8h1M30 8h1M1 9h1M10 9h1M20 9h1M29 9h1M1 10h1M11 10h9M29 10h1M1 11h1M29 11h1M1 12h1M29 12h1M1 13h1M29 13h1M2 14h1M28 14h1M2 15h1M28 15h1M2 16h1M28 16h1M3 17h1M27 17h1M3 18h1M27 18h1M4 19h1M26 19h1M5 20h1M25 20h1M5 21h1M25 21h1M5 22h1M25 22h1M5 23h1M25 23h1M6 24h1M24 24h1M6 25h1M24 25h1M7 26h1M23 26h1M8 27h2M21 27h2M10 28h1M20 28h1M11 29h1M19 29h1M12 30h2M17 30h2M14 31h3" />',
            '<path stroke= "',
            param[1],
            '" d="M10 12h2M13 12h2M16 12h2M19 12h2M9 13h3M13 13h2M16 13h2M19 13h3M11 14h1M13 14h2M16 14h2M19 14h1M10 15h2M13 15h2M16 15h2M19 15h2M5 16h1M8 16h4M13 16h2M16 16h2M19 16h4M25 16h1M4 17h4M11 17h9M23 17h4M4 18h3M12 18h7M24 18h3M5 19h2M13 19h5M24 19h2M6 20h2M13 20h5M23 20h2M6 21h3M12 21h7M22 21h3M7 22h8M16 22h8M8 23h6M17 23h6M9 24h5M17 24h5M12 25h2M17 25h2M11 26h3M17 26h3M11 27h3M17 27h3M11 28h4M16 28h4M12 29h2M17 29h2M14 30h3" />',
            '<path stroke= "',
            param[2],
            '" d="M1 3h2M28 3h2M3 4h2M26 4h2M5 5h1M25 5h1M6 6h1M24 6h1M7 7h1M23 7h1M8 8h1M22 8h1M9 9h1M21 9h1M9 10h2M20 10h2M9 11h13M9 12h1M21 12h1" />',
            '<path stroke= "',
            param[3],
            '" d="M1 4h2M1 5h4M1 6h5M1 7h6M1 8h7M2 9h7M2 10h6M2 11h6M2 12h5M2 13h4M3 14h3M3 15h2M3 16h2" />',
            '<path stroke= "',
            param[4],
            '" d="M28 4h2M26 5h4M25 6h5M24 7h6M23 8h7M22 9h7M23 10h6M23 11h6M24 12h5M25 13h4M25 14h3M26 15h2M26 16h2" />',
            '<path stroke= "',
            param[5],
            '" d="M8 10h1M8 11h1M7 12h2M6 13h3M6 14h1M5 15h1" />',
            '<path stroke= "',
            param[6],
            '" d="M22 10h1M22 11h1M22 12h2M22 13h3M24 14h1M25 15h1" />',
            '<path stroke= "',
            param[7],
            '" d="M12 12h1M12 13h1M12 14h1M12 15h1M12 16h1" />',
            '<path stroke= "',
            param[8],
            '" d="M15 12h1M15 13h1M15 14h1M15 15h1M15 16h1" />',
            '<path stroke= "',
            param[9],
            '" d="M18 12h1M18 13h1M18 14h1M18 15h1M18 16h1" />',
            '<path stroke= "',
            param[10],
            '" d="M7 14h3M6 15h2" />',
            '<path stroke= "',
            param[11],
            '" d="M10 14h1M8 15h2M6 16h2" />',
            '<path stroke= "',
            param[12],
            '" d="M21 14h3M23 15h2" />',
            '<path stroke= "',
            param[13],
            '" d="M20 14h1M21 15h2M23 16h2" />',
            '<path stroke= "',
            param[14],
            '" d="M8 17h3M7 18h1M11 18h1M7 19h1M12 19h1M8 20h1M12 20h1M9 21h3" />',
            '<path stroke= "',
            param[15],
            '" d="M20 17h3M19 18h1M23 18h1M18 19h1M23 19h1M18 20h1M22 20h1M19 21h3" />',
            '<path stroke= "',
            param[16],
            '" d="M8 18h3M8 19h1" />',
            '<path stroke= "',
            param[17],
            '" d="M20 18h3M22 19h1" />',
            '<path stroke= "',
            param[18],
            '" d="M9 19h1M11 19h1M9 20h2" />',
            '<path stroke= "',
            param[19],
            '" d="M19 19h1M21 19h1M20 20h2" />',
            '<path stroke= "',
            param[20],
            '" d="M10 19h1" />',
            '<path stroke= "',
            param[21],
            '" d="M20 19h1" />',
            '<path stroke= "',
            param[22],
            '" d="M11 20h1M19 20h1" />',
            '<path stroke= "',
            param[23],
            '" d="M6 22h1M6 23h2M7 24h2M7 25h5M8 26h3M10 27h1" />',
            '<path stroke= "',
            param[24],
            '" d="M24 22h1M23 23h2M22 24h2M19 25h5M20 26h3M20 27h1" />',
            '<path stroke= "',
            param[25],
            '" d="M15 22h1M14 23h3M14 24h3M14 25h3" />',
            '<path stroke= "',
            param[26],
            '" d="M14 27h1M16 27h1" />',
            '<path stroke= "',
            param[27],
            '" d="M14 26h3M15 27h1M15 28h1M14 29h3" />',
            "</svg>"
        );
        return
            string(
                abi.encodePacked(
                    "data:image/svg+xml;base64,",
                    Base64.encode(svg)
                )
            );
    }

    function generateTokenURI(
        uint256 tokenId,
        string[] memory param,
        string memory name,
        string memory sex,
        uint256 birthday
    ) external pure returns (string memory) {
        require(param.length == COLORS, "Colors more or less then 28");
        require(
            keccak256(bytes(sex)) == keccak256(bytes("Male")) ||
                keccak256(bytes(sex)) == keccak256(bytes("Female")),
            "The Sex require to be Male Or Female"
        );
        bool _hex = true;
        uint i;
        for (i = 0; i < COLORS; i++) {
            if (!Hex.isHex(param[i])) {
                _hex = false;
                break;
            }
        }
        require(
            _hex,
            string.concat("Parameter ", i.toString(), " not a HEX value")
        );
        bytes memory dataURI = abi.encodePacked(
            "{",
            '"name": "Petos #',
            tokenId.toString(),
            '",',
            '"description": "Petos is A community-driven collectibles project based 100 % on Blockchain , All nfts are created on smart contracts by users for their cats ,90 % of profits go to animal charities",',
            '"image": "',
            generateNFT(param),
            '",',
            '"attributes":',
            "[",
            "{",
            '"trait_type":"Name",',
            '"value":"',
            name,
            '"'
            "},",
            "{",
            '"trait_type":"Pet",',
            '"value":"',
            PET,
            '"'
            "},",
            "{",
            '"trait_type":"Breed",',
            '"value":"',
            CAT_BREED,
            '"'
            "},",
            "{",
            '"trait_type":"Sex",',
            '"value":"',
            sex,
            '"'
            "},",
            "{",
            '"display_type":"date",',
            '"trait_type":"birthday",',
            '"value":"',
            birthday.toString(),
            '"'
            "}",
            "]",
            "}"
        );
        return
            string(
                abi.encodePacked(
                    "data:application/json;base64,",
                    Base64.encode(dataURI)
                )
            );
    }
}
