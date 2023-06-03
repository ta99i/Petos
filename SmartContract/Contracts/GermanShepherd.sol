// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "./Hex.sol";

contract GermanShepherd {
    using Strings for uint256;
    uint8 public constant COLORS = 25;
    string public constant PET = "Dog";
    string public constant DOG_BREED = "German Shepherd";

    function generateNFT(
        string[] memory param
    ) public pure returns (string memory) {
        bytes memory svg = abi.encodePacked(
            '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 23 31" shape-rendering="crispEdges">',
            '<path stroke= "',
            param[0],
            '" d="M2 0h2M19 0h2M1 1h1M4 1h1M18 1h1M21 1h1M1 2h1M5 2h1M17 2h1M21 2h1M1 3h1M6 3h1M16 3h1M21 3h1M1 4h1M6 4h1M16 4h1M21 4h1M0 5h1M7 5h1M15 5h1M22 5h1M0 6h1M7 6h1M15 6h1M22 6h1M0 7h1M8 7h1M14 7h1M22 7h1M0 8h1M8 8h1M14 8h1M22 8h1M0 9h1M8 9h7M22 9h1M0 10h1M7 10h1M15 10h1M22 10h1M0 11h1M5 11h2M16 11h2M22 11h1M0 12h1M5 12h1M17 12h1M22 12h1M1 13h1M4 13h1M18 13h1M21 13h1M1 14h3M19 14h3M1 15h1M21 15h1M1 16h1M7 16h1M15 16h1M21 16h1M1 17h1M6 17h1M8 17h1M14 17h1M16 17h1M21 17h1M1 18h1M7 18h1M15 18h1M21 18h1M1 19h1M21 19h1M2 20h1M20 20h1M2 21h1M20 21h1M2 22h1M20 22h1M2 23h1M20 23h1M3 24h1M19 24h1M4 25h1M18 25h1M5 26h1M17 26h1M6 27h1M16 27h1M7 28h1M15 28h1M8 29h1M14 29h1M9 30h5" />',
            '<path stroke= "',
            param[1],
            '" d="M8 10h7M7 11h1M15 11h1M6 12h1M16 12h1M7 14h1M15 14h1M2 15h1M6 15h1M16 15h1M20 15h1M2 16h1M5 16h1M17 16h1M20 16h1M2 17h1M20 17h1M2 18h2M19 18h2M3 19h2M18 19h2M3 20h2M18 20h2M3 21h3M17 21h3M4 22h2M17 22h2M4 23h2M17 23h2M4 24h2M17 24h2M5 25h1M17 25h1" />',
            '<path stroke= "',
            param[2],
            '" d="M8 11h2M11 11h1M13 11h2M7 12h1M15 12h1M5 13h4M14 13h4M4 14h3M8 14h2M13 14h2M16 14h3M3 15h3M7 15h4M12 15h4M17 15h3M3 16h2M9 16h5M18 16h2M3 17h3M9 17h1M13 17h1M17 17h3M4 18h2M9 18h1M13 18h1M17 18h2M2 19h1M5 19h3M15 19h3M20 19h1M5 20h3M15 20h3M6 21h1M16 21h1M3 22h1M6 22h1M16 22h1M19 22h1M3 23h1M6 23h1M16 23h1M19 23h1M6 24h1M16 24h1" />',
            '<path stroke= "',
            param[3],
            '" d="M8 19h1M10 19h3M14 19h1M8 20h1M10 20h3M14 20h1M7 21h4M12 21h4M7 22h3M13 22h3M7 23h3M13 23h3M7 24h3M13 24h3M6 25h3M14 25h3M6 26h3M14 26h3M7 27h3M13 27h3M8 28h2M13 28h2" />',
            '<path stroke= "',
            param[4],
            '" d="M10 11h1M12 11h1M8 12h2M13 12h2M9 13h2M12 13h2M10 14h1M12 14h1" />',
            '<path stroke= "',
            param[5],
            '" d="M10 12h3M11 13h1" />',
            '<path stroke= "',
            param[6],
            '" d="M11 14h1M11 15h1" />',
            '<path stroke= "',
            param[7],
            '" d="M2 1h2M2 2h1M4 2h1M2 3h1M5 3h1M2 4h1M5 4h1M1 5h1M6 5h1M1 6h1M6 6h1M1 7h1M7 7h1M1 8h1M7 8h1M1 9h1M7 9h1M1 10h1M6 10h1M1 11h1M1 12h1M4 12h1M2 13h2" />',
            '<path stroke= "',
            param[8],
            '" d="M19 1h2M18 2h1M20 2h1M17 3h1M20 3h1M17 4h1M20 4h1M16 5h1M21 5h1M16 6h1M21 6h1M15 7h1M21 7h1M15 8h1M21 8h1M15 9h1M21 9h1M16 10h1M21 10h1M21 11h1M18 12h1M21 12h1M19 13h2" />',
            '<path stroke= "',
            param[9],
            '" d="M3 2h1M3 3h2M4 4h1M2 5h1M5 5h1M2 6h1M5 6h1M2 7h1M6 7h1M2 8h1M6 8h1M2 9h1M6 9h1M2 10h1M2 11h1M2 12h1" />',
            '<path stroke= "',
            param[10],
            '" d="M19 2h1M18 3h2M18 4h1M17 5h1M20 5h1M17 6h1M20 6h1M16 7h1M20 7h1M16 8h1M20 8h1M16 9h1M20 9h1M20 10h1M20 11h1M20 12h1" />',
            '<path stroke= "',
            param[11],
            '" d="M3 4h1M3 5h2M3 6h2M3 7h3M3 8h3M3 9h3M3 10h3M3 11h2M3 12h1" />',
            '<path stroke= "',
            param[12],
            '" d="M19 4h1M18 5h2M18 6h2M17 7h3M17 8h3M17 9h3M17 10h3M18 11h2M19 12h1" />',
            '<path stroke= "',
            param[13],
            '" d="M6 16h1M8 16h1M6 18h1M8 18h1" />',
            '<path stroke= "',
            param[14],
            '" d="M14 16h1M16 16h1M14 18h1M16 18h1" />',
            '<path stroke= "',
            param[15],
            '" d="M7 17h1" />',
            '<path stroke= "',
            param[16],
            '" d="M15 17h1" />',
            '<path stroke= "',
            param[17],
            '" d="M11 21h1M10 22h3M10 23h1M12 23h1" />',
            '<path stroke= "',
            param[18],
            '" d="M11 23h1M10 24h3" />',
            '<path stroke= "',
            param[19],
            '" d="M9 25h1M11 25h1M13 25h1M10 28h1M12 28h1M9 29h5" />',
            '<path stroke= "',
            param[20],
            '" d="M10 25h1M12 25h1M9 26h5M10 27h3M11 28h1" />',
            '<path stroke= "',
            param[21],
            '" d="M10 17h1M12 17h1M10 18h1M12 18h1" />',
            '<path stroke= "',
            param[22],
            '" d="M11 17h1M11 18h1" />',
            '<path stroke= "',
            param[23],
            '" d="M9 19h1M13 19h1" />',
            '<path stroke= "',
            param[24],
            '" d="M9 20h1M13 20h1" />',
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
        require(param.length == COLORS, "Colors more or less then 25");
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
