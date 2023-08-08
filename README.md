## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

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
5.使用cast send调用链上的合约
cast send 0x26F9cB5311D13285F0A478ac093DC4041Fe5F02F "test()" --rpc-url http://127.0.0.1:7545 --private-key 0xa87d7c03883c40cd02b1912a48fc39a649620901b08bf4191a0ee0b437b3c2fa
```