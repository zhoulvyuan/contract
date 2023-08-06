// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

//基金产品
struct Fund {
    string fundName;
    string fundCode;
    uint64 netVal;
}

//客户
struct Cust {
    string name;
    string certCode;
}

//客户持仓
struct HoldShr {
    string fundCode;
    string certCode;
    uint64 shrNum;
}

