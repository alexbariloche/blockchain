pragma solidity >=0.4.21 <0.6.0;

contract Election {
	
	struct Candidate {
		uint id;
		string name;
		uint voteCount;
	}

	mapping (address => bool) public voters;
	mapping (uint => Candidate) public candidates;

	uint public candidatesCount;

	function addCandidate (string memory _name) private {
		candidatesCount++;
		candidates[candidatesCount] = Candidate( candidatesCount, _name, 0);
	}

	function vote (uint _candidateId) public {
		require(!voters[msg.sender]);
		require(_candidateId > 0 && _candidateId <= candidatesCount);

		voters[msg.sender] = true;
		candidates[_candidateId].voteCount++;
	}

	constructor() public {
		addCandidate("Candidate 1");
		addCandidate("Candidate 2");
	}
}
