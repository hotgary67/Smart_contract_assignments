pragma solidity 0.5.12;
pragma experimental ABIEncoderV2;

contract HelloWorld /* workers is HelloWorld*/ {
  function createPerson(string calldata name, uint age, uint height) external payable;
  function deletePerson(string memory name) public;

}

contract createWorkers {


    mapping(uint=> uint) private salary;

    HelloWorld instance = HelloWorld(0x205cDDaebA7D490797b5a738E2a3A56aa1126BD8);

                                  // struct Boss {  string bossName; }
                                   //bonus delete only by boss  mapping(address=> Boss) public bossOfWorker;

                                  // function createBoss (address _address, string bossName) {
                                   //  var Boss = bossW



     function createWorker (string calldata name, uint age, uint height, uint salaryWorker) external payable  {


        require(age <= 75);

        instance.createPerson.value(msg.value)(name,age,height);

        salary[salaryWorker];

            }

      function fireWorker (string memory name) public {

       instance.deletePerson(name);
        //    instance.deletePeople([creator.name]);
      //  instance.deletePerson(address);
        //delete people.name;

        //bonus delete only by boss
       // require()
        // assert(worker != Boss)


         //hier moet ik de worker via address deleten niet naam


    }

}
