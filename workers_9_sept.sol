pragma solidity 0.5.12;
pragma experimental ABIEncoderV2;

contract people {
 function createPerson(string memory name, uint age, uint height) public payable ;
 function deletePerson(string memory name) public;
  //hier moet ik de worker via address deleten niet naam
 }



contract createWorkers {

   // struct Boss {
    //    string bossName;
    //     }

    mapping(uint=> uint) public salary;
    //bonus delete only by boss
    mapping(address=> Boss) public bossOfWorker;


    people instance = people(0xDCA0B27B934c36D36747C61b416c034104d3ccfe);

   // function createBoss (address _address, string bossName) {
      //  var Boss = bossW

    }


    function createWorker (string memory name, uint age, uint height, uint salaryWorker /*,address*/) public payable {
        // external moet in combinatie met calldata
        // https://www.youtube.com/watch?v=MPBOnChpi0c&list=PLbbtODcOYIoE0D6fschNU4rqtGFRpk3ea&index=13
        // call createPerson in Helloworld contract
        //Forward any Ether to HelloWorld

        require(age <= 75);
        instance.createPerson.value(msg.value)(name,age,height);

        salary[salaryWorker];


         //bonus delete only by boss

         //address creator = msg.sender;
         // msg.sender
       //  boss[msg.sender] = address;
         // boss.push
    }

    function fireWorker (string memory name) public {

        //bonus delete only by boss
       // require()
        // assert(worker != Boss)


         //hier moet ik de worker via address deleten niet naam
        instance.deletePerson(name);

    }




}
