pragma solidity 0.4.25;

contract UsoDeImagem {
	
    string public nomeAposta;
    address apostador1;
    address apostador2;
    address mediador;
	
    modifier somenteApostadores() {
        require(msg.sender==apostador1, msg.sender==apostador2, "Somente apostadores podem realizar essa operação");
        _;
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
	
    function definirMediador(address qualMediador) public somenteApostadores  {
        require(qualMediador != address(0), "Endereço de mediador invalido");
        mediador = qualMediador;
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
