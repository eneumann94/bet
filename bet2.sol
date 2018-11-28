pragma solidity 0.4.25;

contract Aposta {
	
    string public nome;
    string public vencedor;
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
    
    function definirNomeDaAposta(string _nome) public somenteMediador {
        nome = _nome;
    }
    
    function definirApostador1(address _apostador1) public somenteMediador {
    	apostador1 = _apostador1;
    }
    
    function definirApostador2(address _apostador2) public somenteMediador {
    	apostador2 = _apostador2;
    }
    
    function depositar() public payable {
        
    }
    
    function definirVencedor(string _vencedor) public somenteMediador {
        vencedor = _vencedor;
    }
    
    function pagar() public payable {
        if (vencedor == "apostador1") {
            apostador1.transfer(msg.value * 90 / 100);
            mediador.transfer(msg.value * 90 / 100);
        } else {
            apostador2.transfer(msg.value * 90 / 100);
            mediador.transfer(msg.value * 90 / 100);
        }
    }
}
