<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
          name="viewport">
    <meta content="ie=edge" http-equiv="X-UA-Compatible">
    <title>Document</title>
</head>
<body>
<pre>
Caro responsavel,

Os IPs presentes no log abaixo sao de equipamentos sob sua
responsabilidade com o servico Quote of the Day (17/udp) habilitado.
Este servico, tambem chamado de QOTD, pode ser abusado para fazer parte
de ataques distribuidos de negacao de servico, consumindo recursos da
sua rede e impactando terceiros.

Lembramos que os enderecos IP listados tambem podem ser dispositivos de
rede com o servico Quote of the Day habilitado, como roteadores
e CPEs (modem ou roteador de uso domestico instalado nos clientes).

Gostariamos de solicitar que:

 * o servico Quote of the Day (QOTD) seja desabilitado no equipamento.

Uma descricao do problema e possiveis solucoes podem ser encontradas no
final deste documento.

Se voce nao for a pessoa correta para corrigir o problema destes
equipamentos com o servico QOTD habilitado, por favor repasse essa
mensagem para alguem de sua organizacao que possa faze-lo.

O indicador no campo 'Resultados do Teste' indica o tipo de problema
testado e significa:

 * qotd: status/pacotes/bytes, onde status e' "open", e
   pacotes/bytes indicam o tamanho da resposta recebida, em
   pacotes/bytes;

====================================================================================
Endereco IP      | ASN    | Status | Data do Teste             | Resultados do Teste
====================================================================================
${tabelaVulnerabilidades}

Mais detalhes sobre o porque do envio desta mensagem, quem e' o
CERT.br e como resolver este problema estao listados abaixo.

Cordialmente,
--
CERT.br
<cert@cert.br>
https://www.cert.br/


* O que e' o servico QOTD (17/udp)?

  O servico QOTD (Quote of the Day Protocol) e' um servico que gera uma
  mensagem de texto e foi originalmente concebido para fins de teste e
  depuracao.

  Caso esteja acessivel a toda a Internet via UDP, esse servico pode
  ser explorado para ataques DDoS que usem amplificacao. Isto ocorre
  porque o atacante envia uma requisicao forjando o IP da vitima e o
  servidor com QOTD retorna uma resposta muito maior que a requisicao.

* Por que devo me preocupar com isso?

  O QOTD pode ser abusado para causar danos a terceiros, envolvendo sua
  rede em ataques a outras organizacoes, alem de implicar em um consumo
  de banda maior.

  Informacoes adicionais sobre como evitar que sua rede seja abusada
  para este e outros ataques DDoS podem ser econtradas aqui:

    https://www.cert.br/docs/whitepapers/ddos/

* Como faco para corrigir o problema em sistemas Windows?

  Desabilite o recurso chamado "simple tcp/ip services".

* Como faco para corrigir o problema em sistemas Unix?

  Desabilite o servico QOTD, tipicamente implementado via o daemon
  inetd.

* Como faco para corrigir o problema em outros sistemas ou
  dispositivos?

  Se o seu dispositivo nao se enquadra em nenhuma das categorias
  anteriores consulte o manual para saber como desativar o
  servico.

* Onde posso obter informacoes adicionais sobre o abuso do protocolo
  QOTD para ataques DDoS?

  - UDP-Based Amplification Attacks
    https://www.us-cert.gov/ncas/alerts/TA14-017A

* Como o CERT.br sabe que este e' um servidor QOTD vulneravel?

  O CERT.br esta' recebendo notificacoes com listas de servidores QOTD
  que possivelmente estao sendo abusados e utilizados em ataques
  distribuidos de negacao de servidos (DDoS).  O CERT.br esta'
  notificando os responsaveis pelos servidores brasileiros presentes
  nestas listas.

* Como posso ter certeza que resolvi o problema?

  Voce pode verificar seu servidor atraves dos seguintes comandos:
  (preferencialmente execute-os a partir da Internet, ou seja, fora de
  uma rede interna que tenha permissao de acesso ao servidor).

    $ echo | nc -w 1 -u SERVIDOR_QOTD 17

  Onde SERVIDOR_QOTD e' o IP do servidor QOTD a ser testado.

* Onde aprender mais sobre configuracao segura de sistemas?

  - Praticas de Seguranca para Administradores de Redes Internet
    https://www.cert.br/docs/seg-adm-redes/

* Por que estou recebendo essa mensagem?

  Voce esta' recebendo esse email por estar listado em
  https://registro.br/ como contato desta rede ou dominio.

  Se voce for contato de varias redes diferentes e' possivel que voce
  receba mais de um email, com conteudos diferentes.  Por favor nao
  apague outras copias que vier a receber.

* O que e' o CERT.br?

  O CERT.br -- Centro de Estudos, Resposta e Tratamento de Incidentes de
  Seguranca no Brasil -- e' o Grupo de Resposta a Incidentes de
  Seguranca para a Internet brasileira, mantido pelo NIC.br do Comite
  Gestor da Internet no Brasil.  E' o grupo responsavel por tratar
  incidentes de seguranca em computadores, envolvendo redes conectadas
  `a Internet brasileira.

</pre>
</body>
</html>

</pre>
</body>
</html>