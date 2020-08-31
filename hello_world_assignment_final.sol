pragma solidity 0.5.12;
pragma experimental ABIEncoderV2;

contract HelloWorld{

    struct Person {
      string name;
      uint age;
      uint height;
      bool senior;
      address creator;
    }

    // mapping (address => Person) private people;

    Person[] public people;

    function createPerson(string memory name, uint age, uint height) public {

        address creator = msg.sender;
        //This creates a person
        Person memory newPerson;
        newPerson.name = name;
        newPerson.age = age;
        newPerson.height = height;
        newPerson.creator = creator;

        if(age >= 65){
           newPerson.senior = true;
           }
        else{
           newPerson.senior = false;
       }

       people.push(newPerson);
    }


    function getPerson(uint index) public view returns(Person memory)    {
         return people[index];
        }
}
