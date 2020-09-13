import "./people.sol";
pragma solidity 0.5.12;
pragma experimental ABIEncoderV2;

//contract HelloWorld /* workers is HelloWorld*/ {
 // function createPerson(string calldata name, uint age, uint height) external payable;
  //function deletePerson(string memory name) public;

//}
//contract  workers is HelloWorld {
    //}


contract createWorkers is HelloWorld {


    mapping(address=> uint) private salary;

   // HelloWorld instance = HelloWorld(0x86BC11dc845C51ddB8AFaA251d158a967873fe62);

                                  // struct Boss {  string bossName; }
                                   //bonus delete only by boss  mapping(address=> Boss) public bossOfWorker;

                                  // function createBoss (address _address, string bossName) {
                                   //  var Boss = bossW


     function createWorker (string memory name, uint age, uint height, uint salaryWorker) public  {


      require(age <= 75);

      createPerson(name,age,height);


      salary[msg.sender] = salaryWorker;

            }

      function fireWorker (string memory name) public {

      // instance.deletePerson(name);


        //    instance.deletePeople([creator.name]);
      //  instance.deletePerson(address);
        //delete people.name;

        //bonus delete only by boss
       // require()
        // assert(worker != Boss)


         //hier moet ik de worker via address deleten niet naam

    }

}
