// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "./Hex.sol";

contract Husky {
    using Strings for uint256;
    uint8 public constant COLORS = 27;
    string public constant PET = "Dog";
    string public constant DOG_BREED = "Husky";

    function generateNFT(
        string[] memory param
    ) public pure returns (string memory) {
        bytes memory svg = abi.encodePacked(
            '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 23 31" shape-rendering="crispEdges">',
            '<path stroke= "',
            param[0],
            '" d="M4 0h2M19 0h2M3 1h1M6 1h1M18 1h1M21 1h1M3 2h1M6 2h1M18 2h1M21 2h1M3 3h1M7 3h1M17 3h1M21 3h1M3 4h1M7 4h1M17 4h1M21 4h1M3 5h1M7 5h1M17 5h1M21 5h1M2 6h1M7 6h11M22 6h1M2 7h1M6 7h1M18 7h1M22 7h1M2 8h1M5 8h1M19 8h1M22 8h1M1 9h1M4 9h1M20 9h1M23 9h1M1 10h1M3 10h1M21 10h1M23 10h1M2 11h1M22 11h1M2 12h1M22 12h1M1 13h1M8 13h1M16 13h1M23 13h1M1 14h1M7 14h1M9 14h1M15 14h1M17 14h1M23 14h1M1 15h1M8 15h1M16 15h1M23 15h1M1 16h1M23 16h1M0 17h1M24 17h1M0 18h1M24 18h1M0 19h1M24 19h1M0 20h1M24 20h1M0 21h1M11 21h1M13 21h1M24 21h1M1 22h1M8 22h3M14 22h3M23 22h1M2 23h1M8 23h2M15 23h2M22 23h1M3 24h1M8 24h2M15 24h2M21 24h1M4 25h1M9 25h1M15 25h1M20 25h1M5 26h1M9 26h1M15 26h1M19 26h1M6 27h1M10 27h1M14 27h1M18 27h1M7 28h1M11 28h3M17 28h1M8 29h1M16 29h1M9 30h7" />',
            '<path stroke= "',
            param[1],
            '" d="M7 7h11M6 8h6M13 8h6M5 9h4M10 9h2M13 9h2M16 9h4M4 10h5M11 10h1M13 10h1M16 10h5M3 11h5M17 11h5M3 12h4M18 12h4M2 13h4M19 13h4M2 14h4M19 14h4M2 15h3M20 15h3M2 16h2M21 16h2M1 17h1M23 17h1" />',
            '<path stroke= "',
            param[2],
            '" d="M9 9h1M15 9h1M9 10h2M14 10h2M8 11h3M14 11h3M7 12h4M14 12h4M6 13h1M10 13h1M14 13h1M18 13h1M6 14h1M10 14h1M14 14h1M18 14h1M5 15h2M10 15h1M14 15h1M18 15h2M4 16h6M15 16h6M2 17h9M14 17h9M1 18h9M15 18h9M1 19h10M14 19h10M1 20h11M13 20h11M1 21h10M14 21h10M2 22h6M17 22h6M3 23h5M17 23h5M4 24h4M17 24h4M5 25h4M16 25h4M6 26h3M16 26h3M7 27h3M15 27h3M8 28h3M14 28h3M9 29h7" />',
            '<path stroke= "',
            param[3],
            '" d="M4 1h2M4 2h1M4 3h1M4 4h1M3 6h1M3 7h1M2 9h1M2 10h1" />',
            '<path stroke= "',
            param[4],
            '" d="M19 1h2M20 2h1M20 3h1M20 4h1M21 6h1M21 7h1M22 9h1M22 10h1" />',
            '<path stroke= "',
            param[5],
            '" d="M5 2h1M5 3h1M5 4h1M4 5h2M4 6h2M4 7h1M3 8h1" />',
            '<path stroke= "',
            param[6],
            '" d="M19 2h1M19 3h1M19 4h1M19 5h2M19 6h2M20 7h1M21 8h1" />',
            '<path stroke= "',
            param[7],
            '" d="M6 3h1M6 4h1M6 5h1M6 6h1M5 7h1M4 8h1M3 9h1" />',
            '<path stroke= "',
            param[8],
            '" d="M18 3h1M18 4h1M18 5h1M18 6h1M19 7h1M20 8h1M21 9h1" />',
            '<path stroke= "',
            param[9],
            '" d="M12 8h1M12 9h1M12 10h1" />',
            '<path stroke= "',
            param[10],
            '" d="M11 11h1M11 12h1M11 13h1" />',
            '<path stroke= "',
            param[11],
            '" d="M12 11h1M12 12h1M12 13h1" />',
            '<path stroke= "',
            param[12],
            '" d="M13 11h1M13 12h1M13 13h1" />',
            '<path stroke= "',
            param[13],
            '" d="M11 14h1M11 15h1" />',
            '<path stroke= "',
            param[14],
            '" d="M12 14h1M12 15h1" />',
            '<path stroke= "',
            param[15],
            '" d="M13 14h1M13 15h1" />',
            '<path stroke= "',
            param[16],
            '" d="M10 16h1" />',
            '<path stroke= "',
            param[17],
            '" d="M11 16h3" />',
            '<path stroke= "',
            param[18],
            '" d="M14 16h1" />',
            '<path stroke= "',
            param[19],
            '" d="M7 13h1M9 13h1M7 15h1M9 15h1" />',
            '<path stroke= "',
            param[20],
            '" d="M15 13h1M17 13h1M15 15h1M17 15h1" />',
            '<path stroke= "',
            param[21],
            '" d="M8 14h1" />',
            '<path stroke= "',
            param[22],
            '" d="M16 14h1" />',
            '<path stroke= "',
            param[23],
            '" d="M11 17h3M10 18h5M11 19h3M12 20h1" />',
            '<path stroke= "',
            param[24],
            '" d="M12 21h1M11 22h3M12 23h1" />',
            '<path stroke= "',
            param[25],
            '" d="M12 24h1" />',
            '<path stroke= "',
            param[26],
            '" d="M10 23h2M13 23h2M10 24h2M13 24h2M10 25h5M10 26h5M11 27h3" />',
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
            DOG_BREED,
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
