pragma solidity 0.5.12;
pragma experimental ABIEncoderV2;

contract HelloWorld{

    struct Person {
      string name;
      uint age;
      uint height;
      bool senior;
    }

    // mapping (address => Person) private people;

    Person[] public people;

    function createPerson(string memory name, uint age, uint height) private {
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

       people.push(newPerson);
    }



    function getPerson(uint index) public view returns(Person memory)    {
         return people[]

}

    
    //function insertPerson(Person memory newPerson) private {
      //  address creator = msg.sender;
     //   people[creator] = newPerson;
    //}
   // function getPerson() public view returns(string memory name, uint age, uint height, bool senior){
   //     address creator = msg.sender;
   //     return (people[creator].name, people[creator].age, people[creator].height, people[creator].senior);
   // }

}
