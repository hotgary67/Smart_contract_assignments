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
    mapping (address => Boss) public bosses;
    mapping (address => mapping (string =>Person)) public myWorkers;
    //https://www.youtube.com/watch?v=wJnXuCFVGFA hier nested mapping uitleg


  //  mapping (address =>)

   // HelloWorld instance = HelloWorld(0x86BC11dc845C51ddB8AFaA251d158a967873fe62);

                                  // struct Boss {  string bossName; }
                                   //bonus delete only by boss  mapping(address=> Boss) public bossOfWorker;

                                  // function createBoss (address _address, string bossName) {
                                   //  var Boss = bossW

     function createBoss (string memory name, string memory department) public {
        //require()
        //boss cannot be worker, op de een of andere manier hier in verwerken
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


     function createWorker (string memory name, uint age, uint height, uint salaryWorker) public {

      address Boss_that_creates_worker = msg.sender;
      require (msg.sender == Boss_that_creates_worker);
      require(age <= 75);

      createPerson(name,age,height);
     //createPerson.myWorkers[msg.sender](name,age,height);
    // myWorkers[msg.sender](name,age,height);

      salary[msg.sender] = salaryWorker;

     //  bosses[msg.sender].name = bossname;
     //   string memory bossname = bosses[msg.sender].name;
     //string memory boss = bosses[msg.sender].name;
     //  string memory bossOfWorker = bosses[msg.sender].name;
     //  Boss[msg.sender].name = bossOfWorker;


     }

      function fireWorker (address worker) public onlyOwner{

   //   address boss_Of_Worker = ;
    //  require (msg.sender == bossWorker);

      deletePerson(worker);



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
