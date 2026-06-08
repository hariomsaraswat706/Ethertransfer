// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; 

contract Ethertransfer  {

address public owner ;



constructor () {
    owner = msg.sender ;
}
    

    function Transfer(address payable _to , uint _amount ) public payable  {
require(_amount > 0 ,"you can not Send Zero Ether" );
require(_to != address(0) , " you can not transfer ether to zero address");
require(address(this).balance >= _amount , " insufficient Balance " );
_to.transfer(_amount) ;

    }


    function CheckBalance() public view returns (uint ) {
       return  address(this).balance  ; 
    }

    function withdraw (uint  _amount ) public {
        require(owner == msg.sender , " Only owner can call this function");
        require(address(this).balance >=  _amount , " insfficient Balance ");
        payable(msg.sender).transfer(_amount ) ; 
    }

}