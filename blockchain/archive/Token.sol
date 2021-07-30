pragma solidity 0.5.16;

contract Token {
    uint256 internal _totalSupply = 0;
    uint8 internal _decimals;
    string internal _symbol;
    string internal _name;

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
}
