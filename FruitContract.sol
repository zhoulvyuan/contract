
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract FruitContract {

    uint64 price = 1e10;
    uint64 num = 1;
    // 最高标价
    uint64 MAX_PRICE = 300e10;

    //  上架商品
    function onlineFruit(uint64 onlineNum) public {
        num += onlineNum;
    }

    //下架商品
    function updownFruit(uint64 updownNum) public {
        require(updownNum < num, "xia jia shui guo shu liang bu neng xiao yu ku cun shu liang");
        num -= updownNum;
    }

    //上调价格
    function upPrice(uint64 priceValue) public {
        require(priceValue + price < MAX_PRICE, "zui gao jia bu neng chao guo 300$");
        price += priceValue;
    }

    //下调价格
    function downPrice(uint64 priceValue) public {
        require(price - priceValue > 1, "jia ge bu neng di yu 1$");
        price -= priceValue;
    }

    //计算总资产
    function calAsset() public view returns (uint64) {
        return uint64(uint128(price) * num);
    }

    function viewNum() public view returns (uint64) {
        return num;
    }

    function viewPrice() public view returns (uint64) {
        return price;
    }

    function pay() payable public {}
}