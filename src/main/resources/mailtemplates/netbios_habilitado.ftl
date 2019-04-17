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
responsabilidade com o servico NetBIOS (137/udp) habilitado. Este
servico pode ser abusado para fazer parte de ataques distribuidos de
negacao de servico, consumindo recursos da sua rede e impactando
terceiros, alem de poder revelar informacoes sensiveis armazenadas
neste equipamento.

Gostariamos de solicitar que:

 * o servico NetBIOS seja acessivel apenas `a sua rede local, ou que
 desabilite o servico no equipamento, caso ele nao esteja em uso.

Uma descricao do problema e possiveis solucoes podem ser encontradas no
final deste documento.

Se voce nao for a pessoa correta para corrigir o problema destes
servidores com o servico NetBIOS habilitado, por favor repasse essa
mensagem para alguem de sua organizacao que possa faze-lo.

O indicador no campo 'Resultados do Teste' indica o tipo de problema
testado e significa:

 * netbios: status/pacotes/bytes, onde status e' "open", e
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


* O que e' o servico NetBIOS (137/udp)?

  O servico NetBIOS e' utilizado tipicamente por sistemas Microsoft
  Windows, ou sistemas Unix atraves do Samba, para compartilhamento de
  arquivos e impressoras.

  Por se tratar de um servico geralmente utilizado apenas dentro de
  redes locais e com sistemas anteriores ao Microsoft Windows 2000, e'
  muito provavel que nao exista necessidade do servico NetBIOS estar
  exposto `a Internet.

  Caso esteja acessivel a toda a Internet via UDP, esse servico pode
  ser explorado para ataques DDoS que usem amplificacao. Isto ocorre
  porque o atacante envia uma requisicao forjando o IP da vitima e o
  servidor com NetBIOS retorna uma resposta muito maior que a
  requisicao.

* Por que devo me preocupar com isso?

  O NetBIOS pode ser abusado para causar danos a terceiros, envolvendo
  sua rede em ataques a outras organizacoes e implicando em um consumo
  de banda maior. Alem dessas implicacoes, esse servico pode revelar
  informacoes sensiveis sobre sua rede e seus dados armazenados.

  Informacoes adicionais sobre como evitar que sua rede seja abusada
  para ataques DDoS podem ser encontradas aqui:

    https://www.cert.br/docs/whitepapers/ddos/

* Como faco para corrigir o problema?

  Em sistemas Microsoft Windows desabilite o recurso chamado NetBIOS
  sobre TCP/IP (ou NetBIOS over TCP/IP) se ele for desnecessario aos
  usuarios da rede. Caso nao seja possivel desabilitar esse recurso
  sugerimos que limite o acesso a este servico apenas para usuarios de
  sua rede.

  Em servidores Unix reconfigure o Samba incluindo a linha abaixo no
  arquivo de configuracao:

  disable netbios = yes

  Se o Samba for desnecessario nesse equipamento recomendamos que o
  desabilite.

* Onde posso obter informacoes adicionais sobre o abuso do protocolo
  NetBIOS para ataques DDoS?

  - UDP-Based Amplification Attacks
    https://www.us-cert.gov/ncas/alerts/TA14-017A

  - Openly accessible NetBIOS name services
    https://www.bsi.bund.de/EN/Topics/IT-Crisis-Management/CERT-Bund/CERT-Reports/HOWTOs/Open-NetBIOS-Nameservices/open-NetBIOS-nameservices_node.html

* Como o CERT.br sabe que este e' um servidor NetBIOS vulneravel?

  O CERT.br esta' recebendo notificacoes com listas de servidores
  NetBIOS que possivelmente estao sendo abusados e utilizados em
  ataques distribuidos de negacao de servicos (DDoS). O CERT.br esta'
  notificando os responsaveis pelos servidores brasileiros presentes
  nestas listas.

* Como posso ter certeza que resolvi o problema?

  Voce pode verificar seu servidor atraves do seguinte comando:
  (preferencialmente execute-o a partir da Internet, ou seja, fora de
  uma rede interna que tenha permissao de acesso ao servidor).

  A partir de sistemas Microsoft Windows:
  $ nbtstat -A IP_SERVIDOR

  A partir de sistemas Unix com Samba:
  $ nmblookup -A IP_SERVIDOR

  Onde IP_SERVIDOR e' o IP do servidor NetBIOS a ser testado.

  Se o teste for realizado a partir de um sistema Unix, recomendamos
  que antes de executar o comando acima certifique-se que voce tem a
  ferramenta nmblookup instalada em seu computador.

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