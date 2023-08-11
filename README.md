## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/
foundry说明文档 https://learnblockchain.cn/docs/foundry/i18n/zh/index.html  
solidity说明文档 https://solidity-cn.readthedocs.io/zh/develop/  
解码工具 https://www.toolhelper.cn/EncodeDecode/ByteArrayEncodeDecode
## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
1.cast call contract_address调用合约的view和pure函数
发送交易
2.cast send contract_address "function_name(param_type1,param_type2) param1 param2 --rpc-url url --private-key key"
```



### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

```项目搭建
1.执行fore init --force，创建健项目
2.执行fore compile编译项目
3.执行anvil 启动本地网络/或者使用ganache
4.在script目录下编写部署脚本
5.使用cast call调用链上的合约
cast call 0x527420aD3F6B14B7B4a027263fd7FB5D35907Be2 "test()" --rpc-url http://127.0.0.1:7545
```