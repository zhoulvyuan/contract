require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: "0.8.21", // 根据你的合约版本调整
  networks: {
    localhost: {
      url: "http://127.0.0.1:8545", // Ganache 本地节点地址
      chainId: 5777,                // Ganache 默认的链 ID
      accounts: {
        mnemonic: "fix attend dose drink process hunt illness position marriage empty live bag" // Ganache 默认助记词
      }
    }
  }
};
