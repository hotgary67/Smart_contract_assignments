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

    struct Boss {
          string name;
          string department;

        }


    mapping(address=> uint) private salary;
    mapping (address => Boss) private bosses;
  //  mapping (address =>)

   // HelloWorld instance = HelloWorld(0x86BC11dc845C51ddB8AFaA251d158a967873fe62);

                                  // struct Boss {  string bossName; }
                                   //bonus delete only by boss  mapping(address=> Boss) public bossOfWorker;

                                  // function createBoss (address _address, string bossName) {
                                   //  var Boss = bossW

     function createBoss (string memory name, string memory department) public {
        Boss memory newBoss;
        newBoss.name = name;
        newBoss.department = department;

        insertBoss(newBoss);

     }

     function insertBoss(Boss memory newBoss) private {
        address creator = msg.sender;
        bosses[creator] = newBoss;
    }

  function getBoss() public view returns(string memory name, string memory department){
        address creator = msg.sender;
        return (bosses[creator].name, bosses[creator].department);
    }


     function createWorker (string memory name, uint age, uint height, uint salaryWorker, string memory bossname) public {

      string memory bossname = bosses[msg.sender].name;
      //string memory boss = bosses[msg.sender].name;

      require(age <= 75);

      createPerson(name,age,height);
      salary[msg.sender] = salaryWorker;
      bosses[msg.sender].name = bossname;

            }

      function fireWorker (address creator) public onlyOwner{

      require (msg.sender == creator);


      deletePerson(creator);

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
