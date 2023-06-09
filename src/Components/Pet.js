import { useEffect, useState } from "react";
import Accordion from "react-bootstrap/Accordion";
import Modal from "react-bootstrap/Modal";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";

import { mint } from "./Interact";
import "../Styles/LeftNavbar.css";

export const Pet = (props) => {
  const [color, setColor] = useState(props.cat.Colors);
  const [show, setShow] = useState(false);
  const [menu, setMenu] = useState(null);
  const [nftSvg, setNftSvg] = useState(null);
  const [toggle, setToggle] = useState(false);
  const [sex, setSex] = useState("Male");
  let counter = 0;

  const handleToggle = () => {
    setToggle((curr) => !toggle);
  };
  useEffect(() => {
    setColor(props.cat.Colors);
    GenerateNFT();
    GenerateMenu();
  }, [props, color, toggle]);
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
    console.log(address, color, name, sex, bd);
    console.log(typeof sex);

    mint(address, color, name, sex, bd);
  }
  function GenerateMenu() {
    counter = 0;

    setMenu(
      <div className={toggle ? "menu" : "menu transform"}>
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
      <span
        className={
          toggle ? "toggle-navbar transform-173 active" : "toggle-navbar "
        }
        onClick={handleToggle}
      >
        <span className="span1"></span>
        <span className="span2"></span>
        <span className="span3"></span>
      </span>
      <div className="d-flex align-items-center flex-column svg-width">
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
              <input id="iName" className="w-75"></input>
            </div>
            <div className="">
              <h2>Birth Day :</h2>
              <input id="iBD" type="date" className="w-75"></input>
            </div>
            <div className="m-1">
              <h2>Sex :</h2>

              <Form.Select
                onChange={(e) => {
                  const selected = e.target.value;
                  setSex(selected);
                }}
                defaultValue="Male"
                className="w-75"
              >
                <option value="Male">Male</option>
                <option value="Female">Female</option>
              </Form.Select>
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
