pragma solidity 0.5.16;

import "./Context.sol";
import "./Token.sol";
import "./Approvable.sol";
import "./Vault.sol";
import "./Burnable.sol";
import "./Metadata.sol";
import "./Market.sol";
import "./Ownable.sol";
import "./SafeMath.sol";
import "./Mintable.sol";

contract MyToken is Context, Token, Metadata, Ownable, Approvable, Vault, Mintable, Burnable, Market  {
    using SafeMath for uint256;

    constructor() public {
        _name = "Phoenix Club";
        _symbol = "PHX";
        _decimals = 18;
        _totalSupply = 1000000000000000000000000000;

        _balances[_vaultAddress()] = _totalSupply;

        uint256 ownerSupply = _totalSupply.div(10);
        _transfer(_vaultAddress(), _msgSender(), ownerSupply);
    }
}