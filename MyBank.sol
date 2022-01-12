// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
struct Manager{
        string name;
        uint age;
        address account;
}
contract MyBank{
        //นิยาม
        enum State {Open,Close}

        //ยอดเงินทั้งหมดที่คนฝากเข้ามาเก็บในธนาคาร
        uint _balance = 1000;
        Manager manager;//นิยามผู้จัดการ
        //เก็บสถานะการเปิดให้บริการ
        State public bankState = State.Open;

        constructor(string memory _name,uint _age){
                manager.name = _name;
                manager.age = _age;
                manager.account = msg.sender;
        }
        modifier isManager{
                require(msg.sender == manager.account,"Unauthorized , You can't Manager");
                _;
        }
        function getBalance() public view isManager returns (uint){
                require(bankState == State.Open,"Service Not Available , Bank Closed");
                return _balance;
        }

        function getManager() public view isManager returns (string memory){
                return manager.name;
        }
        
}
