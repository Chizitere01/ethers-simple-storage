//SPDX-License-Identifier: MIT

pragma solidity 0.8.7; // 0.8.12

contract SimpleStorage {
    // boolean, uint, int, address, bytes - types in solidity

    uint256 favoriteNumber; // This gets initialized to zero

    mapping(string => uint256) public nameToFavoriteNumber;
    struct People {
        uint256 favoriteNumber;
        string name;
    }
    //uint256[] public favoriteNumberList;
    People[] public people;

    // the 'virtual' keyword was added to the function below to make it overridable.
    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    //calldata, memory, storage
    function addperson(string memory _name, uint256 _favoriteNumber) public {
        People memory newPerson = People({
            favoriteNumber: _favoriteNumber,
            name: _name
        });
        people.push(newPerson);
        nameToFavoriteNumber[_name] = _favoriteNumber;
        // the codde above can also be written as [people.push(People(_favoriteNumber, _name))]
    }
}
