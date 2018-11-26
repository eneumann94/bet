pragma solidity 0.4.25;

contract Aposta {
	
    string public nomeAposta;
    string public descricaoAposta;
    uint public valorAposta;
    string public vencedorAposta;
    address apostador1;
    address apostador2;
    address mediador;
    
    modifier somenteApostador1() {
        require(msg.sender==apostador1, "Somente o Apostador1 pode realizar essa operação");
    }
    
    modifier somenteApostador2() {
        require(msg.sender==apostador2, "Somente o Apostador2 pode realizar essa operação");
    }
	
    modifier somenteMediador() {
        require(msg.sender==mediador, "Somente o mediador pode realizar essa operação");
    }
    
    constructor() public {
        nomeAposta = "Libertadores RiverxBoca";
        descricaoAposta = "Quem vai ganhar no jogo RiverXBoca na final da Libertadores";
        valorAposta = 100;
        vencedorAposta = apostador1;
        mediador = msg.sender;
    }
	
	function definirApostador1(address qualApostador1) public {
	    require(qualApostador1 != address(0), "Endereço de apostador invalido");
	}
	
	function definirApostador2(address qualApostador2) public {
	    require(qualApostador2 != address(0), "Endereço de apostador invalido");
	}
	
    function definirMediador1(address qualMediador1) public somenteApostador1  {
        require(qualMediador1 != address(0), "Endereço de mediador invalido");
        mediador = qualMediador1;
    }
    
    function definirMediador2(address qualMediador2) public somenteApostador2  {
        require(qualMediador2 != address(0), "Endereço de mediador invalido");
        mediador = qualMediador2;
    }
    
    if (qualMediador1 = qualMediador2) {
        mediador = qualMediador1
    } else {
        return "Escolha novamente o mediador"
    }
    
    function definirMediador2(address qualMediador1) public somenteApostador2  {
        require(qualMediador2 != address(0), "Endereço de mediador invalido");
        mediador = qualMediado2;
    }
	
    function definirNomeDaAposta(string qualNomeDaAposta) public somenteMediador  {
        nomeAposta = qualNomeDaAposta;
    }
    
    function definirDescricaoDaAposta(string qualDescricaoDaAposta) public somenteMediador  {
        descricaoAposta = qualDescricaoDaAposta;
    }

    function definirValorDaAposta(uint qualValorDaAposta) public somenteMediador  {
        valorAposta = qualValorDaAposta;
    }
    
    function pagarAposta(uint pagarValorAposta) public somenteApostadores {
        pagarAposta = valorAposta;
    }
    
    function definirVencedorDaAposta(string qualVencedorDaAposta) public somenteMediador  {
        vencedorAposta = qualVencedorDaAposta;
    }
	
    function receberPremio() public payable {
        require(msg.value >= 100 szabo, "Por favor pague o valor mínimo");
        if (mediador != address(0)) {
            mediador.transfer((msg.value * 10) / 100);
            vencedorAposta.transfer((msg.value * 90)/100);
        }
    }
}
