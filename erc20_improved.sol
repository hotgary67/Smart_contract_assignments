import "/Ownable.sol";
pragma solidity 0.5.12;
pragma experimental ABIEncoderV2;



contract ERC20 is Ownable  {

    mapping (address => uint256) private _balances;

    uint256 private _totalSupply;
    string private _name;
    string private _symbol;
    uint8 private _decimals;
    uint256 private _cap;

    constructor (string memory name, string memory symbol) public {
        _name = name;
        _symbol = symbol;
        _decimals = 18;
        _cap = 100;
        //cap werkt nog niet
    }

    function name() public view returns (string memory) {
       return _name;

    }


    function symbol() public view returns (string memory) {
       return _symbol;
    }



    function decimals() public view returns (uint8) {
        return _decimals;

    }


    function totalSupply() public view returns (uint256) {

        return _totalSupply;
    }


    function balanceOf(address account) public view returns (uint256) {

        return _balances[account];

    }


       function mint(address account, uint256 amount) public onlyOwner {


         require(amount > 0 , "Amount to transfer must be greater than 0");
         require(_totalSupply <=_cap, "Cannot mint coins, supply cap reached. Try to mint less coins");

         _balances[account] += amount;
         _totalSupply += amount;

           assert((_totalSupply + amount ) <= _cap);
           assert(
            keccak256(
                abi.encodePacked(
                    msg.sender

                )
            )
            ==
            keccak256(
                abi.encodePacked(
                    owner
                )
            )
        );


    }


    function transfer(address recipient, uint256 amount) public returns (bool) {


              // require (_balances[owner] >= 0);
              // require (msg.value > 0);

        require (_balances[msg.sender] >= amount, "Your balance is to low");
        require(recipient != address(0));
        uint balanceSenderBeforeTransfer = _balances[msg.sender];
        uint balanceRecipientBeforeTransfer = _balances[recipient];

            // address payable recipient = address (uint160(recipient));
            // recipient.transfer(amount);

        _balances[msg.sender] -= amount;
        _balances[recipient] += amount;

        assert((balanceSenderBeforeTransfer - amount) == _balances[msg.sender] );
        assert((balanceRecipientBeforeTransfer + amount) == _balances[recipient]);


    }
}
