// scripts/deploy.js
const { ethers } = require("hardhat");

async function main() {
    const [deployer] = await ethers.getSigners();
  
    console.log("Deploying contracts with the account:", deployer.address);
  
    const FruitContract = await ethers.getContractFactory("FruitContract");
    const myContract = await FruitContract.deploy();
  
    console.log("MyContract deployed to:", myContract.address);
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });
  