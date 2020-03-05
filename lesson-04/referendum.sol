pragma solidity ^0.5.16;

contract Referendum {
    
    struct Participant{
        bool voted;
        uint weight;
        uint voteIndex;
    }
    
    struct Suggestion{
        bytes8 statement;
        uint voteCount;
    }
    
    event ParticipantVoted(address indexed _voter);
    
    Suggestion[] public suggestions;
    
    mapping(address => Participant) participants;
    
    address public cro;
    
    constructor(bytes8[] memory suggestionStatements) public {
        cro = msg.sender;
        
        for(uint i = 0 ; i < suggestionStatements.length; i++){
            suggestions.push(Suggestion({
                statement : suggestionStatements[i],
                voteCount : 0
            }));
        }
    }
    
    modifier onlyCRO(){
        require(msg.sender == cro, "Only CRO can call this function");
        _;
    }
    
    function addParticipant(address _account) public onlyCRO {
        require(participants[_account].voted == false, "Participant has already voted");
        require(participants[_account].weight == 0, "Participant is already been registered");
        participants[_account].weight = 1;
    }
    
    function participantWillVote(uint _suggestion_index) public {
        require(participants[msg.sender].weight != 0,"Participant is not registered. Please register through CRO");
        require(participants[msg.sender].voted == false, "You cannot vote more than once");
        require(_suggestion_index < suggestions.length,"No such suggestion exists");
        
        suggestions[_suggestion_index].voteCount = suggestions[_suggestion_index].voteCount + participants[msg.sender].weight;
        participants[msg.sender].voted = true;
        
        emit ParticipantVoted(msg.sender);
    }
    
    function winningSuggestion() public view returns(uint,uint) {
        
        uint winningSuggestionVoteCount = 0;
        uint winningSuggestionIndex = 0;
        
        for(uint i = 0 ; i < suggestions.length ; i++){
            if(suggestions[i].voteCount > winningSuggestionVoteCount){
                winningSuggestionVoteCount = suggestions[i].voteCount;
                winningSuggestionIndex = i;
            }
        }
        return (winningSuggestionVoteCount,winningSuggestionIndex);
    }
}