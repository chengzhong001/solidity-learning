// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Structs {
    struct Car {
        string model;
        uint256 year;
        address owner;
    }

    Car public car;
    Car[] public cars;
    mapping(address => Car[]) carsByOwner;

    function examples() external {
        Car memory toyota = Car("Toyota", 1990, msg.sender);
        Car memory lanbo = Car({model: "lanbo", year: 1980, owner: msg.sender});
        Car memory tesla;
        tesla.model = "Tesla";
        tesla.year = 2010;
        tesla.owner = msg.sender;
        cars.push(toyota);
        cars.push(lanbo);
        cars.push(tesla);

        cars.push(Car("Ferrari", 2020, msg.sender));

        // 想要修改结构体中的值，需要
        Car storage _car = cars[0];
        _car.year = 2021;

        delete _car.owner; // 恢复默认值

        delete cars[1]; // 当前位置结构体所有元素恢复到默认元素
    }
}
