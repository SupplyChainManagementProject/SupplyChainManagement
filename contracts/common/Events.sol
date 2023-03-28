//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Events {
    event SupplierAdded(string name, address supplierAddress, string location);
    event ManufacturerAdded(string name, address manufacturerAddress, string location);
    event DistributerAdded(string name, address distributerAddress, string location);

    event RawMaterialCreated(
        string materialId,
        string materialName,
        string materialSource,
        address creator,
        uint origUnitPrice
    );
    event RawMaterialOrderCreated(
        string orderId,
        string orderDateTime,
        uint totalPrice,
        address manufacturer
    );

    event ProductCreated(
        string prodId,
        string productName,
        address _manufacturer,
        uint originalPrice
    );
    event ProductOrderCreated(
        string orderId,
        string orderDateTime,
        address _distributer,
        uint totalPrice
    );
}