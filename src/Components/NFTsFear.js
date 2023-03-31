import { useEffect, useState } from "react";
import { FreeCards, NFTCards } from "./Cards";
import { getLastNFTID, getNFT } from "./Interact";
export const NFTsFear = () => {
  const [getIt, setGetIt] = useState(false);
  const [cards, setCards] = useState([]);
  useEffect(() => {
    const fetchData = async () => {
      try {
        const value = await getLastNFTID();
        let NFTS = [];
        let intvalue = parseInt(value, 16);
        while (intvalue > 0) {
          const nft = await getNFT(intvalue);
          NFTS.push(nft);
          intvalue--;
        }

        setGetIt(true);
        setCards(NFTS);
      } catch (error) {
        console.log(error);
      }
    };
    fetchData();
  }, []);
  return (
    <>
      <div className="text-center">
        <h1 className="m-5 ">All Minted NFT</h1>
        {getIt && <NFTCards cards={cards} />}
        {!getIt && <FreeCards />}
      </div>
    </>
  );
};
