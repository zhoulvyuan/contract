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
### solidity语法描述
#### 实现使用import引入远程插件
```shell
1.使用forge install libPath@version --no-commit从github上下载资源，并打包到当前项目的lib中；libPath为github上资源项目的跟路径，需要取出githu.com域名
2.在foundry.toml中重新定义远程插件路径，如：remappings = ["@fundme/contracts/=lib/foundry-fund-me-f23/"]
3.使用import关键字引入远程插件，如：import "@fundme/contracts/src/exampleContracts/FunWithStorage.sol";
```

### 项目搭建
#### 基本项目搭建
```shell
1.执行fore init --force，创建健项目
2.执行fore compile编译项目
3.执行anvil 启动本地网络/或者使用ganache
4.在script目录下编写部署脚本
5.使用cast call调用链上的合约
cast call 0x527420aD3F6B14B7B4a027263fd7FB5D35907Be2 "test()" --rpc-url http://127.0.0.1:7545
```
#### 添加单元测试
```shell
1.在项目的test目录下新建sol合同
2.合同需要继承forge-std/Test.sol
3.实现函数setUp，用于赋初始值，准备测试数据
4.实现函数testDemo，用于验证单元测试结果
5.使用forge test -vv 发起测试过程
6.使用forge test --match-math function_name --v 可以根据方法名称发起测试
```