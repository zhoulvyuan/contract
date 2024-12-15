// SPDX-License-Identifier: ZWJ
pragma solidity ^0.8.21;

//租户
struct Tenant {
    address tenantId;
    string code;
    string name;
    uint64 staffCounts; //职员数量
    uint64 fee;
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