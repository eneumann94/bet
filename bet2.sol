pragma solidity 0.4.25;

contract Aposta {
	
    string public nomeAposta;
    uint public valorAposta;
    address apostador1;
    address apostador2;
    address mediador;
	
    modifier somenteApostador1() {
        require(msg.sender==apostador1, "Somente apostador_1 pode realizar essa operação");
        _;
    }
    
    modifier somenteApostador2() {
        require(msg.sender==apostador2, "Somente apostador_1 pode realizar essa operação");
        _;
    }
    
    modifier somenteMediador() {
        require(msg.sender==mediador, "Somente mediador pode realizar essa operação");
        _;
    }

    constructor() public {
        nomeAposta = "BocaXRiver";
        valorAposta = 100;
        vencedorAposta = apostador1;
        apostador1 = msg.sender;
    }
	
    function definirNomeDaAposta(string qualNomeDaAposta) public somenteApostador1 {
        nomeAposta = qualNomeDaAposta;
    }
    
    function definirValorDaAposta(uint qualValorDaAposta) public somenteApostador1 {
        valorAposta = qualValorDaAposta;
    }
    
    while (qualMediador1 >< qualMediador2) {
        function definirMediador1(address qualMediador1) public somenteApostador1  {
            require(qualMediador1 != address(0), "Endereço de mediador invalido");
            mediador = qualMediador1;
        function definirMediador2(address qualMediador1) public somenteApostador2  {
            require(qualMediador2 != address(0), "Endereço de mediador invalido");
            mediador = qualMediador2;
    }
    
    while (valorAposta < pagamento1 + pagamento2) {
        function efetuarPagamento1(uint pagamento1) public somenteApostador1 {
            require(pagamento1);
        }
        function efetuarPagamento2 (uint pagamento2) public somenteApostador2 {
            require(pagamento2);
        }
    }
    
    function definirVencedorDaAposta(string qualVencedorDaAposta) public somenteMediador {
        vencedorAposta = qualVencedorDaAposta;
    }
	
    function receberPremio() public payable {
        if (vencedorAposta = apostador1) {
            apostador1.transfer((msg.value * 90) / 100)
            mediador.transfer((msg.value * 10) / 100)
        } else {
            apostador2.transfer((msg.value * 90) / 100)
            mediador.transfer((msg.value * 10) / 100)
        }
}
