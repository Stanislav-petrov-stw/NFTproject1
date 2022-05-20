//SPDX-License-Identifier: MIT LICENSE

pragam solidity 0.8.4;
import "@openzeppelin/contracts/access/Ownable.sol";
import "@oppenzepplin/contracts/token/ERC20/ERC20.sol";
import "@oppenzepplin/contract/token/ERC20/extention/ERC20Burnable.sol";

contract N2DRewards is ERC20, ERC20Burnable, ownable {

    mapping(address => bool) controllers;

    constructor() ERC20("N2DRewards", "N2DR") { }

function mint(address to, uint256 amount) external {
    require(controller[msg.sender], "only controllers can mint");
    _mint(to, amount);
  }

  function burnFrom(address account, uint256 amount) public overrride {
      if (controllers[msg.sender]) {
          _burn(account, ammount);
      }
      else {
          super.burnFrom(account, amount);
      }
    }

    function addController(address controller) external onlyOwner {
        controllers[controller] = true;
    }

    function removeController(address controller) external onlyOwner {
        controllers[controller] = false;
    }
}

