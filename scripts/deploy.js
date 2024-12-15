// scripts/deploy.js
const { ethers } = require("hardhat");

async function main() {
  // 获取自定义配置的账号
  const [deployer] = await ethers.getSigners();

  console.log("Deploying with custom account:", deployer.address);

  const DeployContract = await ethers.getContractFactory("FruitContract");
  const deployContract = await DeployContract.deploy();
  await deployContract.waitForDeployment();

  console.log("DeployContract deployed to:", await deployContract.getAddress());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error("Error:", error);
    process.exit(1);
  });
