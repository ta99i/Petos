// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "./Hex.sol";

contract BlueRussian {
    using Strings for uint256;
    uint8 public constant COLORS = 27;
    string public constant PET = "Cat";
    string public constant CAT_BREED = "Blue Russian";

    function generateNFT(
        string[] memory param
    ) public pure returns (string memory) {
        bytes memory svg = abi.encodePacked(
            '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 31 26" shape-rendering="crispEdges" width="500">',
            '<path stroke="',
            param[0],
            '" d="M3 0h5M10 0h11M23 0h5M1 1h2M8 1h2M21 1h2M28 1h2M1 2h1M29 2h1M0 3h1M30 3h1M1 4h1M29 4h1M1 5h1M29 5h1M2 6h1M28 6h1M2 7h1M28 7h1M1 8h1M8 8h3M20 8h3M29 8h1M0 9h1M7 9h1M11 9h1M19 9h1M23 9h1M30 9h1M0 10h1M6 10h1M12 10h1M18 10h1M24 10h1M30 10h1M0 11h1M6 11h1M12 11h1M18 11h1M24 11h1M30 11h1M0 12h1M7 12h1M11 12h1M19 12h1M23 12h1M30 12h1M0 13h1M8 13h3M20 13h3M30 13h1M0 14h1M30 14h1M0 15h1M14 15h1M16 15h1M30 15h1M0 16h1M15 16h1M30 16h1M0 17h1M15 17h1M30 17h1M0 18h1M14 18h1M16 18h1M30 18h1M1 19h1M9 19h1M13 19h1M17 19h1M21 19h1M29 19h1M2 20h1M10 20h3M18 20h3M28 20h1M3 21h1M12 21h1M18 21h1M27 21h1M4 22h2M13 22h5M25 22h2M6 23h2M23 23h2M8 24h2M21 24h2M10 25h11" />',
            '<path stroke="',
            param[1],
            '" d="M10 2h11M7 3h17M6 4h19M5 5h21M4 6h23M3 7h4M11 7h9M24 7h4M2 8h4M12 8h7M25 8h4M1 9h4M13 9h5M26 9h4M1 10h4M13 10h2M16 10h2M26 10h4M1 11h4M13 11h1M17 11h1M26 11h4M2 12h4M13 12h1M17 12h1M25 12h4M3 13h4M12 13h2M17 13h2M24 13h4M5 14h3M11 14h3M17 14h3M23 14h3M7 15h5M19 15h5M8 16h2M21 16h2M8 17h1M22 17h1" />',
            '<path stroke="',
            param[2],
            '" d="M10 1h11" />',
            '<path stroke="',
            param[3],
            '" d="M3 2h4M2 3h4M2 4h3M2 5h2" />',
            '<path stroke="',
            param[4],
            '" d="M24 2h4M25 3h4M26 4h3M27 5h2" />',
            '<path stroke="',
            param[5],
            '" d="M3 1h3M2 2h1M1 3h1" />',
            '<path stroke="',
            param[6],
            '" d="M6 1h2M7 2h3M6 3h1M5 4h1M4 5h1M3 6h1" />',
            '<path stroke="',
            param[7],
            '" d="M25 1h3M28 2h1M29 3h1" />',
            '<path stroke="',
            param[8],
            '" d="M23 1h2M21 2h3M24 3h1M25 4h1M26 5h1M27 6h1" />',
            '<path stroke="',
            param[9],
            '" d="M7 7h4M6 8h2M11 8h1M5 9h2M12 9h1M5 10h1" />',
            '<path stroke="',
            param[10],
            '" d="M20 7h4M19 8h1M23 8h2M18 9h1M24 9h2M25 10h1" />',
            '<path stroke="',
            param[11],
            '" d="M8 9h3M7 10h1M11 10h1" />',
            '<path stroke="',
            param[12],
            '" d="M20 9h3M19 10h1M23 10h1" />',
            '<path stroke="',
            param[13],
            '" d="M8 10h1M10 10h1M7 11h1M10 11h2M8 12h3" />',
            '<path stroke="',
            param[14],
            '" d="M20 10h1M22 10h1M19 11h1M22 11h2M20 12h3" />',
            '<path stroke="',
            param[15],
            '" d="M9 10h1M9 11h1" />',
            '<path stroke="',
            param[16],
            '" d="M21 10h1M21 11h1" />',
            '<path stroke="',
            param[17],
            '" d="M8 11h1M20 11h1" />',
            '<path stroke="',
            param[18],
            '" d="M5 11h1M6 12h1M12 12h1M7 13h1M11 13h1M8 14h3" />',
            '<path stroke="',
            param[19],
            '" d="M25 11h1M18 12h1M24 12h1M19 13h1M23 13h1M20 14h3" />',
            '<path stroke="',
            param[20],
            '" d="M1 12h1M29 12h1M1 13h2M28 13h2M1 14h4M26 14h4M1 15h6M24 15h6M1 16h7M23 16h7M1 17h7M23 17h7M1 18h8M22 18h8M2 19h7M22 19h7M3 20h7M21 20h7M4 21h8M19 21h8M6 22h7M18 22h7M8 23h15M10 24h11" />',
            '<path stroke="',
            param[21],
            '" d="M15 10h1M14 11h3M14 12h3M14 13h3M14 14h3" />',
            '<path stroke="',
            param[22],
            '" d="M15 15h1" />',
            '<path stroke="',
            param[23],
            '" d="M12 15h2M10 16h5M9 17h6M9 18h5M10 19h3" />',
            '<path stroke="',
            param[24],
            '" d="M17 15h2M16 16h5M16 17h6M17 18h5M18 19h3" />',
            '<path stroke="',
            param[25],
            '" d="M15 18h1M14 19h1M16 19h1M13 20h1M17 20h1" />',
            '<path stroke="',
            param[26],
            '" d="M15 19h1M14 20h3M13 21h5"/>',
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
        require(param.length == COLORS, "Colors more or less then 27");
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
