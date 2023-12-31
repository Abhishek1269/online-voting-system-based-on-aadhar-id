// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
// We have to specify what version of compiler this code will compile with

contract Voting {
  
  mapping (bytes32 => uint8) public votesReceived;
  
  bytes32[] public candidateList;
  
  constructor(bytes32[] memory candidateNames) {
    candidateList = candidateNames;
  }
  function totalVotesFor(bytes32 candidate) public view returns (uint8) {
    require(validCandidate(candidate) == true,"adadad");
    return votesReceived[candidate];
  }
  function voteForCandidate(bytes32 candidate) public {
    if (validCandidate(candidate) == false) revert();
    votesReceived[candidate] += 1;
  }

  function validCandidate(bytes32 candidate) public view returns (bool) {
    for(uint i = 0; i < candidateList.length; i++) {
      if (candidateList[i] == candidate) {
        return true;
      }
    }
    return false;
  }
}