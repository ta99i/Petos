// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "./Hex.sol";

contract Siamese {
    using Strings for uint256;
    uint8 public constant COLORS = 29;
    string public constant PET = "Cat";
    string public constant CAT_BREED = "Siamese";

    function generateNFT(
        string[] memory param
    ) public pure returns (string memory) {
        bytes memory svg = abi.encodePacked(
            '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 29 30" shape-rendering="crispEdges">',
            '<path stroke= "',
            param[0],
            '" d="M1 0h2M26 0h2M0 1h1M3 1h1M25 1h1M28 1h1M0 2h1M4 2h1M24 2h1M28 2h1M0 3h1M5 3h1M23 3h1M28 3h1M0 4h1M6 4h1M22 4h1M28 4h1M1 5h1M7 5h1M21 5h1M27 5h1M1 6h1M8 6h1M20 6h1M27 6h1M1 7h1M9 7h11M27 7h1M1 8h1M27 8h1M2 9h1M26 9h1M2 10h1M26 10h1M2 11h1M26 11h1M3 12h1M25 12h1M2 13h1M26 13h1M2 14h1M26 14h1M2 15h1M26 15h1M2 16h1M26 16h1M2 17h1M26 17h1M2 18h1M26 18h1M2 19h1M26 19h1M2 20h1M26 20h1M2 21h1M26 21h1M3 22h1M25 22h1M3 23h1M25 23h1M4 24h1M24 24h1M5 25h1M23 25h1M6 26h1M22 26h1M7 27h1M21 27h1M8 28h3M18 28h3M11 29h7" />',
            '<path stroke= "',
            param[1],
            '" d="M9 8h2M18 8h2M9 9h4M16 9h4M10 10h9M10 11h2M14 11h1M17 11h2M8 12h3M18 12h3M6 13h6M17 13h6M5 14h2M10 14h2M17 14h2M22 14h2M4 15h2M11 15h2M16 15h2M23 15h2M4 16h1M12 16h1M16 16h1M24 16h1M4 17h1M12 17h1M16 17h1M24 17h1M5 18h1M12 18h1M16 18h1M23 18h1M5 19h2M11 19h2M16 19h2M22 19h2M5 20h3M10 20h2M17 20h2M21 20h3M6 21h6M17 21h6M7 22h5M17 22h5M8 23h3M18 23h3M8 24h4M17 24h4M8 25h6M15 25h6M9 26h5M15 26h5M10 27h3M16 27h3" />',
            '<path stroke= "',
            param[2],
            '" d="M7 9h2M20 9h2M6 10h4M19 10h4M5 11h5M19 11h5M4 12h4M21 12h4M3 13h3M23 13h3M3 14h2M24 14h2M3 15h1M25 15h1M3 16h1M25 16h1M3 17h1M25 17h1M3 18h2M24 18h2M3 19h2M24 19h2M3 20h2M24 20h2M3 21h3M23 21h3M4 22h3M22 22h3M4 23h4M21 23h4M5 24h3M21 24h3M6 25h2M21 25h2M7 26h2M20 26h2M8 27h2M19 27h2" />',
            '<path stroke= "',
            param[3],
            '" d="M12 11h2M15 11h2M11 12h7M12 13h5M12 14h5M13 15h3M13 16h3M13 17h3M13 18h3M13 19h3M12 20h5M12 21h5M12 22h5" />',
            '<path stroke= "',
            param[4],
            '" d="M11 8h7M13 9h3" />',
            '<path stroke= "',
            param[5],
            '" d="M1 1h2M2 2h2M3 3h2M4 4h2M5 5h2M6 6h2M7 7h2M7 8h2" />',
            '<path stroke= "',
            param[6],
            '" d="M26 1h2M25 2h2M24 3h2M23 4h2M22 5h2M21 6h2M20 7h2M20 8h2" />',
            '<path stroke= "',
            param[7],
            '" d="M1 2h1M1 3h2M1 4h3M2 5h3M2 6h4M2 7h5M2 8h5M3 9h4M4 10h2" />',
            '<path stroke= "',
            param[8],
            '" d="M27 2h1M26 3h2M25 4h3M24 5h3M23 6h4M22 7h5M22 8h5M22 9h4M23 10h2" />',
            '<path stroke= "',
            param[9],
            '" d="M3 10h1M3 11h2" />',
            '<path stroke= "',
            param[10],
            '" d="M25 10h1M24 11h2" />',
            '<path stroke= "',
            param[11],
            '" d="M7 14h3M6 15h1M10 15h1M5 16h1M11 16h1M5 17h1M11 17h1M6 18h1M10 18h1M7 19h3" />',
            '<path stroke= "',
            param[12],
            '" d="M19 14h3M18 15h1M22 15h1M17 16h1M23 16h1M17 17h1M23 17h1M18 18h1M22 18h1M19 19h3" />',
            '<path stroke= "',
            param[13],
            '" d="M7 15h3M6 16h1M10 16h1" />',
            '<path stroke= "',
            param[14],
            '" d="M19 15h3M18 16h1M22 16h1" />',
            '<path stroke= "',
            param[15],
            '" d="M19 16h1M21 16h1M19 17h1M21 17h1" />',
            '<path stroke= "',
            param[16],
            '" d="M7 16h1M9 16h1M7 17h1M9 17h1" />',
            '<path stroke= "',
            param[17],
            '" d="M8 16h1M8 17h1" />',
            '<path stroke= "',
            param[18],
            '" d="M20 16h1M20 17h1" />',
            '<path stroke= "',
            param[19],
            '" d="M6 17h1M10 17h1M7 18h3" />',
            '<path stroke= "',
            param[20],
            '" d="M18 17h1M22 17h1M19 18h3" />',
            '<path stroke= "',
            param[21],
            '" d="M11 18h1M10 19h1M8 20h2" />',
            '<path stroke= "',
            param[22],
            '" d="M17 18h1M18 19h1M19 20h2" />',
            '<path stroke= "',
            param[23],
            '" d="M12 23h5M14 24h1M14 25h1M14 26h1" />',
            '<path stroke= "',
            param[24],
            '" d="M11 23h1M12 24h1" />',
            '<path stroke= "',
            param[25],
            '" d="M17 23h1M16 24h1" />',
            '<path stroke= "',
            param[26],
            '" d="M13 24h1M15 24h1" />',
            '<path stroke= "',
            param[27],
            '" d="M13 27h1M15 27h1M11 28h2M16 28h2" />',
            '<path stroke= "',
            param[28],
            '" d="M14 27h1M13 28h3" />',
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
        require(param.length == COLORS, "Colors more or less then 29");
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
