pragma solidity 0.4.25;

contract Aposta {
	
    string public nomeAposta;
    string public vencedorAposta;
    address apostador1;
    address apostador2;
    address mediador;
    
    modifier somenteMediador() {
        require(msg.sender==mediador, "Somente mediador pode realizar essa operação");
        _;
    }
	
    modifier somenteApostador1() {
        require(msg.sender==apostador1, "Somente apostador_1 pode realizar essa operação");
        _;
    }
    
    modifier somenteApostador2() {
        require(msg.sender==apostador2, "Somente apostador_2 pode realizar essa operação");
        _;
    }
    
     constructor() public {
        mediador = msg.sender;
    }
    
    function definirNomeDaAposta(string qualNomeDaAposta) public somenteMediador {
        nomeAposta = qualNomeDaAposta;
    }
    
    function definirApostador1(address qualApostador2) public somenteMediador {
    	apostador2 = qualApostador2;
    }
    
    function definirApostador2(address qualApostador2) public somenteMediador {
    	apostador2 = qualApostador2;
    }
    
    function definirVencedor(string _vencedorAposta) public somenteMediador {
        vencedorAposta = _vencedorAposta;
    }

}
