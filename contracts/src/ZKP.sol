pragma solidity 0.8.13;

contract ZKP {

    uint256 _number;

    constructor () {}

    function storeNumber(uint256 number) public {
        _updateNumber(number);
    }

    function _updateNumber(uint256 _newNumber) internal {
        _number = _newNumber;
    }

    function retrieveNumber() public view returns(uint256) {
        return _number;
    }
}
