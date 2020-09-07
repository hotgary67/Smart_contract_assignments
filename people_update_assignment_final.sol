pragma solidity 0.5.12;
pragma experimental ABIEncoderV2;

contract HelloWorld{

    struct Person {
      uint id;
      string name;
      uint age;
      uint height;
      bool senior;
    }

    event PersonUpdated(string oldname, uint oldAge, uint oldheight, bool oldSenior, string updatedName, uint age, uint height, bool Senior);

    address public owner;

    constructor() public{
      owner = msg.sender;

    }

    mapping (address => Person) public people;


    function createPerson(string memory name, uint age, uint height) public {
        //This creates a person
        Person memory newPerson;
        newPerson.name = name;
        newPerson.age = age;
        newPerson.height = height;

        if(age >= 65){
           newPerson.senior = true;
       }
       else{
           newPerson.senior = false;
       }

        insertPerson(newPerson);
    }
    function insertPerson(Person memory newPerson) private {
        address creator = msg.sender;
        people[creator] = newPerson;
    }
    function getPerson() public view returns(string memory name, uint age, uint height, bool senior){
        address creator = msg.sender;
        return (people[creator].name, people[creator].age, people[creator].height, people[creator].senior);
    }


    // UPDATE FUNCTIE WERKT ALLEEN NIET OP SPECIFIEKE USERS!!!! DAT MOET IK NOG INTEGREREN
    function updatePerson  (string memory name, uint age, uint height) public  {

        require(msg.sender == owner);
    // address creator = msg.sender;

      string memory oldName = people[msg.sender].name;
      uint oldAge = people[msg.sender].age;
      uint oldHeight = people[msg.sender].height;
      bool oldSenior = people[msg.sender].senior;
      Person memory updatedPerson;
      updatedPerson.name = name;
      updatedPerson.age = age;
      updatedPerson.height = height;

      insertPerson(updatedPerson);

      assert(keccak256(abi.encodePacked(people[msg.sender].name, people[msg.sender].age, people[msg.sender].height, people[msg.sender].senior)) == keccak256(abi.encodePacked(updatedPerson.name, updatedPerson.age, updatedPerson.height, updatedPerson.senior)));



      emit PersonUpdated(oldName, oldAge, oldHeight, oldSenior,  updatedPerson.name, updatedPerson.age, updatedPerson.height, updatedPerson.senior);
      }



}
