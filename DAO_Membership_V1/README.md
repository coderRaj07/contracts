The goal is to create a membership system for a community that's hassle-free and secure,
we will go with the following set of rules for the DAO membership:


1. As soon as the smart contract is deployed, the DAO gets created with 1 member in it, the owner of the smart contract.
2. Aspiring members must apply for DAO entry using the smart contract.
3. Entry requires approval from a minimum of 30% of current DAO members.
4. Only current members can access DAO information like member count and membership status.


The smart contract must contain the following public functions:

Input:
applyForEntry() public: 
This function is accessible only to the non-members of the DAO. Using this function they can send the request to join at max only once. This function is not accessible to the people who have been previously DAO members.

approveEntry(address applicant) public: 
This function is accessible only to the members of the DAO. Using this function, members can approve the applicants for the membership. As soon as 30% or more people approve the entry, the applicant becomes the member of the DAO. The address in the argument of this function should strictly correspond to someone who is eligible for the membership of DAO, has applied for the entry, but is not the member yet.

 

Output:
isMember(address participant) public returns (bool): 
This function is only accessible to the members of DAO. Using this function, a member can check by passing in the arguments wheather a user corresponding to the address is a member of DAO or not. If the address corresponds to a member, then the function returns true, else will return false.

totalMembers() public returns (uint):
This function is only accessible to the members of DAO. Using this function, a member can check the total number of current members in the DAO.
