require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: "0.8.21", // 根据你的合约版本调整
  networks: {
    localhost: {
      url: "http://127.0.0.1:8545", // Ganache 本地节点地址
      chainId: 1337,                // Ganache 默认的链 ID
      accounts: [
        "0xb6d576e580350a059c4e3ab853f9109e21e2d1fa89d38567a6ff3bc792942b4f" // 替换为你的私钥
      ]
    }
  }
};
