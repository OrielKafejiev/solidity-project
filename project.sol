pragma solidity 0.4.24;

contract owned{
    address owner;
    constructor() public payable{
        owner=msg.sender;
    }
    modifier OnlyOwner{
        require(owner==msg.sender);
        _;
    }
    modifier OnlyNotOwner{
        require(owner!=msg.sender);
        _;
    }
}
contract DDNS is owned{
    uint256 length=0;
    struct ownerOftheHost{
       address functionCaller;
       uint256 value;
    }
    struct Domain{
        address domainowner;
        uint256 lastBuy;
        string domainName;
        string domainIp;
    }
    ownerOftheHost public ownerofthehost;
    Domain public domain;
    mapping(string=>string) domains;
    mapping(string=>address)ownerofthedomain;
    modifier Thedomainisowned{
        require(domain.lastBuy+1 years>=now);
        _;
    }
    modifier AtLeast1{
        require(msg.value>=1 ether);
        _;
    }
    function RegisterDomain(string name,string IP)public payable AtLeast1{
        
        uint i=0;
        bytes memory string_rep = bytes(name);

        while (i<string_rep.length)
        {
            if (string_rep[i]>>7==0)
                i+=1;
            else if (string_rep[i]>>5==0x6)
                i+=2;
            else if (string_rep[i]>>4==0xE)
                i+=3;
            else if (string_rep[i]>>3==0x1E)
                i+=4;
            else
                i+=1;

            length++;
        }
       require(length>=5);
        ownerofthehost.functionCaller=msg.sender;
        ownerofthehost.value=msg.value;
        domains[name]=IP;
        domain.lastBuy=now;
        domain.domainowner=msg.sender;
        domain.domainName=name;
        domain.domainIp=IP;
        ownerofthedomain[name]=msg.sender;
        
    }
   function ExtendRegistrartion(string Name,string newIP)public payable{
       require(msg.sender==ownerofthedomain[Name]);
       domains[Name]=newIP;
       domain.domainIp=newIP;
   } 
   function TransferOwnership()
    
    
}