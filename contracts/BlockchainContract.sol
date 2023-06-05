pragma solidity ^0.8.12;

contract BlockchainContract {

  uint itemCounter = 0;
  uint userCounter = 0;
  uint ticketCounter = 0;

  struct User {
    string id;
    string name;
    string username;
    string password;
  }

  struct Item {
    string id;
    string model;
    string brand;
    string category;
    string price;
  }

  struct Ticket {
    string id;
    string idUser;
    string amount;
    string idItem;
    string model;
    string brand;
    string category;
    string price;
  }

  constructor () {
    createUsers();
    createItems();
  }

  event LoopSeat ( 
    uint inst
  ); 

  mapping (uint => User) public users;
  mapping (uint => Item) public items;
  mapping (uint => Ticket) public tickets;

  // Create at the beginning
  function createUsers () private {
    createUser("01a5c7e2", "Yelitza", "yelitza2023", "HelloWorld2023");
    createUser("ec073f01", "Vicente", "vicente2023", "HelloWorld2023");
  }

  function createItems () private {
    createItem("0EE0FF36", "LC24F3", "SAMSUNG", "MONITOR", "4012");
    createItem("3A03F97F", "R242Y",  "ACER", "MONITOR", "2320");
    createItem("3765447A", "L24GQ",  "LG", "MONITOR", "4520");
    createItem("D2456EF7", "GW22Q",  "BENQ", "MONITOR", "2400");
    createItem("6D16282E", "22MK4",  "LG", "MONITOR", "3200");

    createItem("25223433", "5600G",  "RYZEN", "PROCESADOR", "2095");
    createItem("5A631EA9", "5700G",  "RYZEN", "PROCESADOR", "3085");
    createItem("2564B5BC", "5600X",  "RYZEN", "PROCESADOR", "2825");
    createItem("6E5B384D", "5800X",  "RYZEN", "PROCESADOR", "4025");
    createItem("7A480974", "11400",  "INTEL", "PROCESADOR", "3179");

    createItem("9949DA2F", "KF426",  "KINGSTON", "RAM", "709");
    createItem("574AF37C", "CMW16",  "CORSAIR", "RAM", "1279");
    createItem("DE93DED3", "AX4U3",  "XPG", "RAM", "1340");
    createItem("58EB95C9", "SA400",  "KINGSTON", "DISCO", "485");
    createItem("0481CCB4", "SU630",  "ADATA", "DISCO", "829");

    createItem("E01DCF2D", "WDS48",  "WESTERN DIGITAL", "DISCO", "499");
    createItem("B7AA8774", "WDS10",  "WESTERN DIGITAL", "DISCO", "929");
    createItem("3EA079A0", "SU800",  "ADATA", "DISCO", "541");
  }

  function createUser (string memory _id, string memory _name, string memory _email, string memory _password) public {
    users[userCounter] = User(_id, _name, _email, _password);
    userCounter++;
  }

  function createItem (string memory _id, string memory _model, string memory _brand, string memory _category, string memory _priceInPesos) public {
    items[itemCounter] = Item(_id,  _model, _brand, _category, _priceInPesos);
    itemCounter++;
  }

  function createTicket (string memory _id, string memory _idUser, string memory _amount, string memory _idItem, string memory _model, string memory _brand, string memory _category, string memory _price) public {
    tickets[ticketCounter] = Ticket(_id, _idUser, _amount, _idItem, _model, _brand, _category, _price );
    ticketCounter++;
  }

  function getItemById (string memory _idItem) public view returns (Item memory) {
    Item memory item = Item("", "", "", "", "");
    for (uint i = 0; i < itemCounter; i++) {
      bool compareIds = stringsEquals(_idItem, items[i].id);
      if (compareIds) { item = items[i]; }
    }
    return item;
  }

  function getTicketById (string memory _idTicket) public view returns (Ticket memory) {
    Ticket memory ticket = Ticket("", "", "", "", "", "", "", "");
    for (uint i = 0; i < ticketCounter; i++) {
      bool compareIds = stringsEquals(_idTicket, tickets[i].id);
      if (compareIds) { ticket = tickets[i]; }
    }
    return ticket;
  }

  function getUserShoppings (string memory _idUser) public view returns(string memory) {
    string memory idsArray = "";
    Ticket memory ticket = Ticket("", "", "", "", "", "", "", "");
    for (uint i = 0; i < ticketCounter; i++) {
      ticket = tickets[i];
      if (stringsEquals(ticket.idUser, _idUser)) { 
        idsArray = string.concat(idsArray, ticket.id); 
        idsArray = string.concat(idsArray, ","); 
      }
    }
    return idsArray;
  }


  function getItem (uint _position) public view returns (Item memory) {
    return items[_position];
  }

  function stringsEquals(string memory s1, string memory s2) private pure returns (bool) {
    return keccak256(abi.encodePacked(s2)) == keccak256(abi.encodePacked(s1));
  }

}

  // function signIn (string memory _username, string memory _password) public view returns (User memory) {
  //   User memory selectedUser = User("", "", "", "");
  //   for (uint i = 0; i < userCounter; i++) {
  //     bool compareUsernames = stringsEquals(_username, users[i].username);
  //     bool comparePasswords = stringsEquals(_password, users[i].password);
  //     if (compareUsernames && comparePasswords) { selectedUser = users[i]; }
  //   }
  //   return selectedUser;
  // }