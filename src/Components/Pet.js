import { useEffect, useState } from "react";
import Accordion from "react-bootstrap/Accordion";
import Modal from "react-bootstrap/Modal";
import Button from "react-bootstrap/Button";
import { mint } from "./Interact";
import "../Styles/LeftNavbar.css";

export const Pet = (props) => {
  const [color, setColor] = useState(props.cat.Colors);
  const [show, setShow] = useState(false);
  const [menu, setMenu] = useState(null);
  const [nftSvg, setNftSvg] = useState(null);
  let counter = 0;
  useEffect(() => {
    setColor(props.cat.Colors);
    GenerateNFT();
    GenerateMenu();
  }, [props, color]);
  const handleColorChange = (event) => {
    console.log(event.target.id);
    color[event.target.id] = event.target.value;
    setColor(color);
    GenerateMenu();
    GenerateNFT();
  };
  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);
  async function _mint() {
    const name = document.getElementById("iName").value;
    const bd = Date.parse(document.getElementById("iBD").value);
    const address = props.cat.Address;
    console.log(address, color, name, bd);

    mint(address, color, name, bd);
  }
  function GenerateMenu() {
    counter = 0;

    setMenu(
      <div className="menu">
        <Accordion defaultActiveKey={["0"]} alwaysOpen className="acc">
          {props.cat.Menu.map((a, i) => (
            <Accordion.Item eventKey={i} key={i}>
              <Accordion.Header>{a[0]}</Accordion.Header>
              <Accordion.Body>
                {a.slice(1).map((e) => (
                  <div>
                    <label className="lab">{e}</label>
                    <input
                      type="color"
                      className="inp"
                      onChange={handleColorChange}
                      value={color[counter]}
                      id={counter++}
                    />
                  </div>
                ))}
              </Accordion.Body>
            </Accordion.Item>
          ))}
        </Accordion>
      </div>
    );
  }
  function GenerateNFT() {
    counter = 0;

    setNftSvg(
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox={props.cat.viewBox}
        shapeRendering="crispEdges"
        width="500"
      >
        {props.cat.Paths.map((path, id) => (
          <path id={id} stroke={color[id]} d={path} />
        ))}
      </svg>
    );
  }
  return (
    <>
      <div className="d-flex align-items-center flex-column">
        {menu}

        {nftSvg}
        <Button className="ml-auto" onClick={handleShow}>
          Mint
        </Button>
      </div>

      <Modal show={show} onHide={handleClose}>
        <Modal.Header closeButton>
          <Modal.Title>Your NFT</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <div>
            <div className="d-flex flex-column align-items-center ">
              {nftSvg}
            </div>
            <div>
              <h2>Name : </h2>
              <input id="iName"></input>
            </div>
            <div>
              <h2>Birth Day :</h2>
              <input id="iBD" type="date"></input>
            </div>
          </div>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={handleClose}>
            Close
          </Button>
          <Button variant="primary" onClick={_mint}>
            Mint
          </Button>
        </Modal.Footer>
      </Modal>
    </>
  );
};
