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

Os IPs presentes no log abaixo sao de servidores sob sua
responsabilidade com o servico LDAP (389/udp) habilitado. Este servico
pode ser abusado para fazer parte de ataques distribuidos de negacao
de servico, consumindo recursos da sua rede e impactando terceiros,
alem de poder revelar informacoes sensiveis armazenadas neste
equipamento.

Gostariamos de solicitar que:

 * o servico LDAP seja acessivel apenas `a sua rede local, ou que
 desabilite o servico no equipamento, caso ele nao esteja em uso.

Uma descricao do problema e possiveis solucoes podem ser encontradas no
final deste documento.

Se voce nao for a pessoa correta para corrigir o problema destes
servidores com o servico LDAP habilitado, por favor repasse essa
mensagem para alguem de sua organizacao que possa faze-lo.

O indicador no campo 'Resultados do Teste' indica o tipo de problema
testado e significa:

 * ldap: status/pacotes/bytes, onde status e' "open", e
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


* O que e' o servico LDAP (389/udp)?

  O servico LDAP (Lightweight Directory Access Protocol) permite
  manter e compartilhar informacoes de maneira organizada e normalmente
  e' utilizado para gerenciar informacoes da rede local, como usuarios,
  contatos, permissoes de acesso a servicos e sistemas, dispositivos e
  outros.

  Por se tratar de um servico geralmente utilizado apenas dentro de
  redes locais, e' muito provavel que nao exista necessidade do
  servico LDAP estar exposto `a Internet.

  Caso esteja acessivel a toda a Internet via UDP, esse servico pode
  ser explorado para ataques DDoS que usem amplificacao. Isto ocorre
  porque o atacante envia uma requisicao forjando o IP da vitima e o
  servidor com LDAP retorna uma resposta muito maior que a
  requisicao.

* Por que devo me preocupar com isso?

  O LDAP pode ser abusado para causar danos a terceiros, envolvendo
  sua rede em ataques a outras organizacoes e implicando em um consumo
  de banda maior. Alem dessas implicacoes, esse servico pode revelar
  informacoes sensiveis sobre sua rede e seus dados armazenados.

  Informacoes adicionais sobre como evitar que sua rede seja abusada
  para ataques DDoS podem ser encontradas aqui:

    https://www.cert.br/docs/whitepapers/ddos/

* Como faco para corrigir o problema?

  Configure o servico LDAP de forma que ele seja acessivel somente
  aos dispositivos de sua rede, que utilizem esse servico, ou que ele
  seja acessivel apenas via TCP. Caso o servico LDAP seja
  desnecessario nesse servidor, recomendamos que ele seja desativado.

* Onde posso obter informacoes adicionais sobre o abuso do protocolo
  LDAP para ataques DDoS?

  - UDP-Based Amplification Attacks
    https://www.us-cert.gov/ncas/alerts/TA14-017A

  - Openly accessible LDAP servers
    https://www.bsi.bund.de/EN/Topics/IT-Crisis-Management/CERT-Bund/CERT-Reports/HOWTOs/Open-LDAP-Server/open-LDAP-server_node.html

* Como o CERT.br sabe que este e' um servidor LDAP vulneravel?

  O CERT.br esta' recebendo notificacoes com listas de servidores
  LDAP que possivelmente estao sendo abusados e utilizados em
  ataques distribuidos de negacao de servicos (DDoS). O CERT.br esta'
  notificando os responsaveis pelos servidores brasileiros presentes
  nestas listas.

* Como posso ter certeza que resolvi o problema?

  Voce pode verificar seu servidor atraves do seguinte comando:
  (preferencialmente execute-o a partir da Internet, ou seja, fora de
  uma rede interna que tenha permissao de acesso ao servidor).

    $ ldapsearch -x -h IP_SERVIDOR -s base

  Onde IP_SERVIDOR e' o IP do servidor LDAP a ser testado.

  Recomendamos que utilize um sistema Unix para realizar o teste. Antes
  de executar o comando acima certifique-se que voce tem a ferramenta
  ldapsearch (geralmente parte do pacote ldap-utils) instalada em seu
  computador.

* Onde aprender mais sobre configuracao segura de sistemas?

  - Praticas de Seguranca para Administradores de Redes Internet
    https://www.cert.br/docs/seg-adm-redes/

* Por que estou recebendo essa mensagem?

  Voce esta' recebendo esse email por estar listado em
  https://registro.br/ como contato desta rede ou dominio.

  Se voce for contato de varias redes diferentes e' possivel que voce
  receba mais de um email, com conteudos diferentes. Por favor nao
  apague outras copias que vier a receber.

* O que e' o CERT.br?

  O CERT.br -- Centro de Estudos, Resposta e Tratamento de Incidentes
  de Seguranca no Brasil -- e' o Grupo de Resposta a Incidentes de
  Seguranca para a Internet brasileira, mantido pelo NIC.br do Comite
  Gestor da Internet no Brasil. E' o grupo responsavel por tratar
  incidentes de seguranca em computadores, envolvendo redes conectadas
  `a Internet brasileira.

</pre>
</body>
</html>

</pre>
</body>
</html>