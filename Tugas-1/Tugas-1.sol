pragma solidity ^0.8.0;

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataStore{

    struct Person{
        string nama;
        string alamat;
        string Tanggal_Lahir;
        bool jenis_kelamin; // True = Pria & False = Wanita
    }

    Person[] public person;

    function storeData(
        string memory _nama, string memory _alamat, string memory _Tanggal_Lahir,
         bool _jenis_kelamin) public {
        person.push(Person(_nama, _alamat, _Tanggal_Lahir, _jenis_kelamin));
    }

    function getPerson(uint index) public view returns (
        string memory, string memory, string memory, bool){
        Person memory p = person[index];
        return (p.nama, p.alamat, p.Tanggal_Lahir, p.jenis_kelamin);
    }
       
}