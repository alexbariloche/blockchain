pragma solidity >=0.4.21 <0.6.0;

contract Checking {

	struct Persons {
		int id;
		string name;
	}

	struct Banks {
		int id;
		string name;
	}

	struct Accounts {
		int id;
		int bank_id;
		int owner_id;
		uint balance;
	}

	struct Checks {
		int id;
		int account_id;
		uint amount;
		bool paid;
	}

	mapping (int => Persons) public persons;
	mapping (int => Banks) public banks;
	mapping (int => Accounts) public accounts;
	mapping (int => Checks) public checks;

	int public personsCount = 0;
	int public banksCount = 0;
	int public accountsCount = 0;
	int public checksCount = 0;

	// adders

	function addPerson (string memory _name) public {
		personsCount++;
		persons[personsCount] = Persons( personsCount, _name);
	}

	function addBank (string memory _name) public {
		banksCount++;
		banks[banksCount] = Banks( banksCount, _name);
	}

	function addAccount (int _bank, int _owner) public {
		accountsCount++;
		accounts[accountsCount] = Accounts( accountsCount, _bank, _owner, 0);
	}

	function addCheck ( int _account, uint _amount) public {
		checksCount++;
		checks[checksCount] = Checks( checksCount, _account, _amount, false);
	}

	// modifiers

	function depositAccount ( int _account, uint _amount) public {
		accounts[ _account].balance += _amount;
	}

	function withdrawAccount ( int _account, uint _amount) public {
		if (accounts[ _account].balance >= _amount)
			accounts[ _account].balance -= _amount;
	}
	
	function payCheck ( int _check, int _account) public {
		if ( !checks[_check].paid && 
			 accounts[ checks[_check].account_id].balance >= checks[_check].amount ) 
		{
			accounts[ checks[_check].account_id].balance -= checks[_check].amount;
			accounts[ _account].balance += checks[_check].amount;
			checks[_check].paid = true;
		}
	}

	constructor() public {
		addPerson("Alex");
		addPerson("Fer");
		addBank("Rio");
		addBank("HSBC");
		addAccount(1, 1);
		depositAccount(1, 500);
		addAccount(2, 2);
		addCheck( 1, 200);
		addCheck( 2, 300);
	}
}
