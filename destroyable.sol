pragma solidity 0.5.12;

contract Destroyable{
    address public owner;
    address payable ownerPayable = address(uint160(owner));

    modifier onlyOwner(){
        require(msg.sender == owner);
        _; //Continue execution
    }

    constructor() public{
        owner = msg.sender;

    }

    function close() public onlyOwner { //onlyOwner is custom modifier

        selfdestruct(ownerPayable);  // `owner` is the owners address
}

}
