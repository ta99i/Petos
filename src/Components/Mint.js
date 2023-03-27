import Pets from "../json/Pets.json";
import { useState } from "react";
import Button from "react-bootstrap/Button";
import { Pet } from "./Pet";
import "../Styles/Mint.css";

const Mint = () => {
  const [selectedPet, setSelectedPet] = useState(Pets.Cats.CornishRex);
  const cats = [Pets.Cats.CornishRex, Pets.Cats.BlueRussianDonwEars];
  const catsName = ["CornishRex", "Blue Russian Donw Ears"];
  function changePet(event) {
    setSelectedPet(cats[event.currentTarget.id]);
  }
  return (
    <div>
      <div className="d-flex justify-content-center">
        {catsName.map((cat, id) => (
          <Button className="m-1" id={id} onClick={changePet}>
            {cat}
          </Button>
        ))}
      </div>
      <Pet cat={selectedPet} className="d-flex justify-content-center" />
    </div>
  );
};
export default Mint;
