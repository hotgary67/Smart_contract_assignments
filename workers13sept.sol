import "./people.sol";
pragma solidity 0.5.12;
pragma experimental ABIEncoderV2;


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


  function getBoss(address) public view returns (string memory name, string memory department){
        address creator = msg.sender;
        return (bosses[creator].name, bosses[creator].department);

    }


      function createWorker (string memory name, uint age, uint height, uint salaryWorker, address bossWoker) public  {

      address bossWorker = msg.sender;

      require(age <= 75);
      //When creating a worker, the persons age should not be allowed to be over 75.

      createPerson(name,age,height);
      salary[msg.sender] = salaryWorker;

             }

      function fireWorker (address worker) public onlyOwner{
      //Implement a fire function, which removes the worker from the contract.

      require (msg.sender == owner);
      // Make sure that a worker can only be fired by his/her boss
      require (worker != msg.sender );
      // A worker is not allowed to be his/her own boss

      deletePerson(worker);

    }

}
