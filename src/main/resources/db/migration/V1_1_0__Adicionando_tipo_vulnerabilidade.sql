INSERT INTO tipo_vulnerabilidade(id,nome,modelo_mensagem) values(null,'Serviço LDAP habilitado',
'Caro responsavel,

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

O indicador no campo ''Resultados do Teste'' indica o tipo de problema
testado e significa:

 * ldap: status/pacotes/bytes, onde status e'' "open", e
   pacotes/bytes indicam o tamanho da resposta recebida, em
   pacotes/bytes;

====================================================================================
Endereco IP      | ASN    | Status | Data do Teste             | Resultados do Teste
====================================================================================

Mais detalhes sobre o porque do envio desta mensagem, quem e'' o
CERT.br e como resolver este problema estao listados abaixo.

Cordialmente,
--
CERT.br
<cert@cert.br>
https://www.cert.br/


* O que e'' o servico LDAP (389/udp)?

  O servico LDAP (Lightweight Directory Access Protocol) permite
  manter e compartilhar informacoes de maneira organizada e normalmente
  e'' utilizado para gerenciar informacoes da rede local, como usuarios,
  contatos, permissoes de acesso a servicos e sistemas, dispositivos e
  outros.

  Por se tratar de um servico geralmente utilizado apenas dentro de
  redes locais, e'' muito provavel que nao exista necessidade do
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

* Como o CERT.br sabe que este e'' um servidor LDAP vulneravel?

  O CERT.br esta'' recebendo notificacoes com listas de servidores
  LDAP que possivelmente estao sendo abusados e utilizados em
  ataques distribuidos de negacao de servicos (DDoS). O CERT.br esta''
  notificando os responsaveis pelos servidores brasileiros presentes
  nestas listas.

* Como posso ter certeza que resolvi o problema?

  Voce pode verificar seu servidor atraves do seguinte comando:
  (preferencialmente execute-o a partir da Internet, ou seja, fora de
  uma rede interna que tenha permissao de acesso ao servidor).

    $ ldapsearch -x -h IP_SERVIDOR -s base

  Onde IP_SERVIDOR e'' o IP do servidor LDAP a ser testado.

  Recomendamos que utilize um sistema Unix para realizar o teste. Antes
  de executar o comando acima certifique-se que voce tem a ferramenta
  ldapsearch (geralmente parte do pacote ldap-utils) instalada em seu
  computador.

* Onde aprender mais sobre configuracao segura de sistemas?

  - Praticas de Seguranca para Administradores de Redes Internet
    https://www.cert.br/docs/seg-adm-redes/

* Por que estou recebendo essa mensagem?

  Voce esta'' recebendo esse email por estar listado em
  https://registro.br/ como contato desta rede ou dominio.

  Se voce for contato de varias redes diferentes e'' possivel que voce
  receba mais de um email, com conteudos diferentes. Por favor nao
  apague outras copias que vier a receber.

* O que e'' o CERT.br?

  O CERT.br -- Centro de Estudos, Resposta e Tratamento de Incidentes
  de Seguranca no Brasil -- e'' o Grupo de Resposta a Incidentes de
  Seguranca para a Internet brasileira, mantido pelo NIC.br do Comite
  Gestor da Internet no Brasil. E'' o grupo responsavel por tratar
  incidentes de seguranca em computadores, envolvendo redes conectadas
  `a Internet brasileira.
');

/* Serviço NetBios Habilitado*/

INSERT INTO tipo_vulnerabilidade(id,nome,modelo_mensagem) values(null,'Serviço QOTD habilitado',
'Caro responsavel,

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

O indicador no campo ''Resultados do Teste'' indica o tipo de problema
testado e significa:

 * qotd: status/pacotes/bytes, onde status e'' "open", e
   pacotes/bytes indicam o tamanho da resposta recebida, em
   pacotes/bytes;

====================================================================================
Endereco IP      | ASN    | Status | Data do Teste             | Resultados do Teste
====================================================================================

Mais detalhes sobre o porque do envio desta mensagem, quem e'' o
CERT.br e como resolver este problema estao listados abaixo.

Cordialmente,
--
CERT.br
<cert@cert.br>
https://www.cert.br/


* O que e'' o servico QOTD (17/udp)?

  O servico QOTD (Quote of the Day Protocol) e'' um servico que gera uma
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

* Como o CERT.br sabe que este e'' um servidor QOTD vulneravel?

  O CERT.br esta'' recebendo notificacoes com listas de servidores QOTD
  que possivelmente estao sendo abusados e utilizados em ataques
  distribuidos de negacao de servidos (DDoS).  O CERT.br esta''
  notificando os responsaveis pelos servidores brasileiros presentes
  nestas listas.

* Como posso ter certeza que resolvi o problema?

  Voce pode verificar seu servidor atraves dos seguintes comandos:
  (preferencialmente execute-os a partir da Internet, ou seja, fora de
  uma rede interna que tenha permissao de acesso ao servidor).

    $ echo | nc -w 1 -u SERVIDOR_QOTD 17

  Onde SERVIDOR_QOTD e'' o IP do servidor QOTD a ser testado.

* Onde aprender mais sobre configuracao segura de sistemas?

  - Praticas de Seguranca para Administradores de Redes Internet
    https://www.cert.br/docs/seg-adm-redes/

* Por que estou recebendo essa mensagem?

  Voce esta'' recebendo esse email por estar listado em
  https://registro.br/ como contato desta rede ou dominio.

  Se voce for contato de varias redes diferentes e'' possivel que voce
  receba mais de um email, com conteudos diferentes.  Por favor nao
  apague outras copias que vier a receber.

* O que e'' o CERT.br?

  O CERT.br -- Centro de Estudos, Resposta e Tratamento de Incidentes de
  Seguranca no Brasil -- e'' o Grupo de Resposta a Incidentes de
  Seguranca para a Internet brasileira, mantido pelo NIC.br do Comite
  Gestor da Internet no Brasil.  E'' o grupo responsavel por tratar
  incidentes de seguranca em computadores, envolvendo redes conectadas
  `a Internet brasileira.
');

INSERT INTO tipo_vulnerabilidade(id,nome,modelo_mensagem) values(null,'Serviço CHARGEN habilitado',
'Caro responsavel,

Os IPs presentes no log abaixo sao de servidores sob sua
responsabilidade com o servico CHARGEN (19/udp) habilitado. Este
servico pode ser abusado para fazer parte de ataques distribuidos de
negacao de servico, consumindo recursos da sua rede e impactando
terceiros.

Lembramos que os enderecos IP listados tambem podem ser dispositivos
de rede com o servico CHARGEN habilitado, como roteadores e CPEs
(modem ou roteador de uso domestico instalado nos clientes).

Gostariamos de solicitar que:

 * o servico CHARGEN seja desabilitado no equipamento.

Uma descricao do problema e possiveis solucoes podem ser encontradas
no final deste documento;

Se voce nao for a pessoa correta para corrigir o problema destes
equipamentos com o servico de CHARGEN habilitado, por favor repasse
essa mensagem para alguem de sua organizacao que possa faze-lo.

O indicador no campo ''Resultados do Teste'' indica o tipo de problema
testado e significa:

 * chargen: status/pacotes/bytes, onde status e'' "open", e
   pacotes/bytes indicam o tamanho da resposta recebida, em
   pacotes/bytes;

====================================================================================
Endereco IP      | ASN    | Status | Data do Teste             | Resultados do Teste
====================================================================================

Mais detalhes sobre o porque do envio desta mensagem, quem e'' o
CERT.br e como resolver este problema estao listados abaixo.

Cordialmente,
--
CERT.br
<cert@cert.br>
https://www.cert.br/

* O que e'' o servico CHARGEN (19/udp)?

  O servico CHARGEN (Character Generator Protocol) e'' um servico que
  gera uma sequencia de caracteres ASCII e foi originalmente concebido
  para fins de teste e depuracao.

  Caso esteja acessivel a toda a Internet via UDP, esse servico pode
  ser explorado para ataques DDoS que usem amplificacao. Isto ocorre
  porque o atacante envia uma requisicao forjando o IP da vitima e o
  servidor com CHARGEN retorna uma resposta muito maior que a
  requisicao.

* Por que devo me preocupar com isso?

  O CHARGEN pode ser abusado para causar danos a terceiros, envolvendo
  sua rede em ataques a outras organizacoes, alem de implicar em um
  consumo de banda maior.

  Informacoes adicionais sobre como evitar que sua rede seja abusada
  para este e outros ataques DDoS podem ser econtradas aqui:

    https://www.cert.br/docs/whitepapers/ddos/

* Como faco para corrigir o problema em sistemas Windows?

  Desabilite o recurso chamado "simple tcp/ip services".

* Como faco para corrigir o problema em roteadores Cisco?

  Desabilite o recurso chamado "small services".

* Como faco para corrigir o problema em sistemas Unix?

  Desabilite o servico chargen, tipicamente implementado via o daemon
  inetd.

* Como faco para corrigir o problema em outros sistemas ou
  dispositivos?

  Se o seu dispositivo nao se enquadra em nenhuma das categorias
  anteriores consulte o manual para saber como desativar o
  servico.

* Onde posso obter informacoes adicionais sobre o abuso do protocolo
  CHARGEN para ataques DDoS?

  - UDP-Based Amplification Attacks
    https://www.us-cert.gov/ncas/alerts/TA14-017A

* Como o CERT.br sabe que este e'' um servidor CHARGEN vulneravel?

  O CERT.br esta'' recebendo notificacoes com listas de servidores CHARGEN
  que possivelmente estao sendo abusados e utilizados em ataques
  distribuidos de negacao de servidos (DDoS).  O CERT.br esta''
  notificando os responsaveis pelos servidores brasileiros presentes
  nestas listas.

* Como posso ter certeza que resolvi o problema?

  Voce pode verificar seu servidor atraves do seguinte comando:
  (preferencialmente execute-o a partir da Internet, ou seja, fora de
  uma rede interna que tenha permissao de acesso ao servidor).

    $ echo | nc -w 1 -u SERVIDOR_CHARGEN 19

  Onde SERVIDOR_CHARGEN e'' o IP do servidor CHARGEN a ser testado.

* Onde aprender mais sobre configuracao segura de sistemas?

  - Praticas de Seguranca para Administradores de Redes Internet
    https://www.cert.br/docs/seg-adm-redes/

* Por que estou recebendo essa mensagem?

  Voce esta'' recebendo esse email por estar listado em
  https://registro.br/ como contato desta rede ou dominio.

  Se voce for contato de varias redes diferentes e'' possivel que voce
  receba mais de um email, com conteudos diferentes.  Por favor nao
  apague outras copias que vier a receber.

* O que e'' o CERT.br?

  O CERT.br -- Centro de Estudos, Resposta e Tratamento de Incidentes de
  Seguranca no Brasil -- e'' o Grupo de Resposta a Incidentes de
  Seguranca para a Internet brasileira, mantido pelo NIC.br do Comite
  Gestor da Internet no Brasil.  E'' o grupo responsavel por tratar
  incidentes de seguranca em computadores, envolvendo redes conectadas
  `a Internet brasileira.');


INSERT INTO tipo_vulnerabilidade(id,nome,modelo_mensagem) values(null,'Serviço mDNS - Multicast DNS habilitado',
'Caro responsavel,

Os IPs presentes no log abaixo sao de servidores sob sua
responsabilidade com o servico mDNS - Multicast DNS (5353/udp)
habilitado. Este servico pode ser abusado para fazer parte de ataques
distribuidos de negacao de servico, consumindo recursos da sua rede e
impactando terceiros.

Lembramos que os enderecos IP listados tambem podem ser dispositivos
de rede com o servico mDNS habilitado, como roteadores, CPEs (modem ou
roteador de uso domestico instalado nos clientes), impressoras,
dispositivos para streaming de midia, entre outros.

Gostariamos de solicitar que:

 * o servico mDNS seja acessivel apenas `a sua rede local, ou
 que desabilite o servico no equipamento, caso nao esteja em uso.

Uma descricao do problema e possiveis solucoes podem ser encontradas
no final deste documento.

Se voce nao for a pessoa correta para corrigir o problema destes
equipamentos com o servico mDNS habilitado, por favor repasse
essa mensagem para alguem de sua organizacao que possa faze-lo.

O indicador no campo ''Resultados do Teste'' indica o tipo de problema
testado e significa:

 * mdns: status/pacotes/bytes, onde status e'' "open", e
   pacotes/bytes indicam o tamanho da resposta recebida, em
   pacotes/bytes;

====================================================================================
Endereco IP      | ASN    | Status | Data do Teste             | Resultados do Teste
====================================================================================
Mais detalhes sobre o porque do envio desta mensagem, quem e'' o
CERT.br e como resolver este problema estao listados abaixo.

Cordialmente,
--
CERT.br
<cert@cert.br>
https://www.cert.br/

* O que e'' o servico mDNS (5353/udp)?

  O mDNS (Multicast DNS) e'' um protocolo de rede utilizado para
  a resolucao de nomes em redes locais que nao possuem um servidor
  DNS proprio. Por se tratar de um servico utilizado apenas dentro
  de redes locais, nao e'' necessario que o servico mDNS esteja exposto
  `a Internet.

  Caso esteja acessivel a toda a Internet via UDP, esse servico pode
  ser explorado para ataques DDoS que usem amplificacao. Isto ocorre
  porque o atacante envia uma requisicao forjando o IP da vitima e o
  servidor com mDNS retorna uma resposta muito maior que a requisicao.

* Por que devo me preocupar com isso?

  O servico mDNS pode ser abusado para causar danos a terceiros,
  envolvendo sua rede em ataques a outras organizacoes, alem de
  implicar em um consumo de banda maior.

  Informacoes adicionais sobre como evitar que sua rede seja abusada
  para este e outros ataques DDoS podem ser econtradas aqui:

    https://www.cert.br/docs/whitepapers/ddos/

* Como faco para corrigir o problema?

  Se o servico mDNS nao for utilizado na sua rede desabilite o servico no
  seu dispositivo. Se o recurso for necessario em sua rede, configure-o
  de modo que esteja disponivel apenas para a rede local.

* Onde posso obter informacoes adicionais sobre o abuso do protocolo
  mDNS para ataques DDoS?

  - UDP-Based Amplification Attacks
    https://www.us-cert.gov/ncas/alerts/TA14-017A

* Como o CERT.br sabe que este e'' um dispositivo vulneravel?

  O CERT.br esta'' recebendo notificacoes com listas de dispositivos
  que usam mDNS que possivelmente estao sendo abusados e utilizados em
  ataques distribuidos de negacao de servidos (DDoS). O CERT.br esta''
  notificando os responsaveis pelos dispositivos brasileiros presentes
  nestas listas.

* Como posso ter certeza que resolvi o problema?

  Voce pode verificar seu dispositivo atraves do seguinte comando:
  (preferencialmente execute-o a partir da Internet, ou seja, fora de
  uma rede interna que tenha permissao de acesso ao dispositivo).

    $ dig @ENDERECO_IP -p 5353 ptr _services._dns-sd._udp.local

  Onde ENDERECO_IP e'' o IP do dispositivo usando mDNS a ser testado.
  Antes de executar o comando acima certifique-se que voce tem a
  ferramenta dig instalada em seu computador.

* Onde aprender mais sobre configuracao segura de sistemas?

  - Praticas de Seguranca para Administradores de Redes Internet
    https://www.cert.br/docs/seg-adm-redes/

* Por que estou recebendo essa mensagem?

  Voce esta'' recebendo esse email por estar listado em
  https://registro.br/ como contato desta rede ou dominio.

  Se voce for contato de varias redes diferentes e'' possivel que voce
  receba mais de um email, com conteudos diferentes.  Por favor nao
  apague outras copias que vier a receber.

* O que e'' o CERT.br?

  O CERT.br -- Centro de Estudos, Resposta e Tratamento de Incidentes de
  Seguranca no Brasil -- e'' o Grupo de Resposta a Incidentes de
  Seguranca para a Internet brasileira, mantido pelo NIC.br do Comite
  Gestor da Internet no Brasil.  E'' o grupo responsavel por tratar
  incidentes de seguranca em computadores, envolvendo redes conectadas
  `a Internet brasileira.
');



INSERT INTO tipo_vulnerabilidade(id,nome,modelo_mensagem) values(null,'Servidores DNS recursivos abertos',
'Caro responsavel,

Os IPs presentes no log abaixo sao servidores DNS recursivos abertos
(53/udp) sob sua responsabilidade. Estes servidores podem ser
abusados para fazer parte de ataques distribuidos de negacao de
servico, consumindo recursos da sua rede e impactando terceiros.

Lembramos que os enderecos IP listados tambem podem ser de
dispositivos de rede com funcionalidade de resolucao de nomes, como
roteadores e CPEs (modem ou roteador de uso domestico instalado nos
clientes), entre outros.

Gostariamos de solicitar que:

 * Os servidories DNS listados sejam configurados de modo a corrigir
 este problema.

Uma descricao do problema e possiveis solucoes podem ser encontradas
em:

   https://www.cert.br/docs/whitepapers/dns-recursivo-aberto/

====================================================================================
Endereco IP      | ASN    | Status | Data do Teste             | Resultados do Teste
====================================================================================

Os indicadores no campo ''Resultados dos Testes'' significam:

 * ancount: numero de registros na secao de resposta do pacote DNS;
 * nscount: numero de registros na secao de reposta autoritativa;
 * arcount: numero de registros na secao adicional de resposta;
 * ra:      recursividade: 1=ativada, 0=desativada;
 * rcode:   status da query DNS.

Se voce nao for a pessoa correta para corrigir o problema deste
servidor DNS recursivo aberto, por favor repasse essa mensagem para
alguem de sua organizacao que possa faze-lo.

Mais detalhes sobre o porque do envio desta mensagem, quem e'' o
CERT.br e como resolver este problema estao listados abaixo.

Cordialmente,
--
CERT.br
<cert@cert.br>
https://www.cert.br/

* O que e'' um servidor DNS recursivo aberto?

  Um servidor DNS recursivo e'' considerado aberto quando aceita
  consultas recursivas de modo indiscriminado, de qualquer rede.

* Por que devo me preocupar com isso?

  Um servidor DNS recursivo aberto pode ser abusado para causar danos
  a terceiros, envolvendo sua rede em ataques a outras organizacoes,
  alem de implicar em um consumo de banda maior.

* Onde posso obter informacoes sobre o problema e como soluciona-lo?

  - Recomendacoes para Evitar o Abuso de Servidores DNS Recursivos Abertos
    https://www.cert.br/docs/whitepapers/dns-recursivo-aberto/

* Onde aprender mais sobre configuracao segura de sistemas?

  - Praticas de Seguranca para Administradores de Redes Internet
    https://www.cert.br/docs/seg-adm-redes/

* Por que estou recebendo essa mensagem?

  Voce esta'' recebendo esse email por estar listado em
  https://registro.br/ como contato desta rede ou dominio.

  Se voce for contato de varias redes diferentes e'' possivel que voce
  receba mais de um email, com conteudos diferentes.  Por favor nao
  apague outras copias que vier a receber.

* Como o CERT.br sabe que este e'' um servidor recursivo aberto?

  O CERT.br esta'' recebendo notificacoes com listas de servidores DNS
  recursivos abertos que possivelmente estao sendo abusados e utilizados
  em ataques distribuidos de negacao de servidos (DDoS).  O CERT.br
  esta'' notificando os responsaveis pelos servidores brasileiros
  presentes nestas listas.

* Como posso ter certeza que resolvi o problema?

  Voce pode verificar seu servidor atraves destes sites:

  * http://security.zensupport.co.uk/

  * http://www.openresolver.nl/

  Apesar do ultimo site de teste estar em holandes, os resultados mais
  detalhados do teste (via botao Show) estao em ingles. Neste mesmo
  site, um botao verde indica que seu DNS recursivo esta configurado
  corretamente.

* O que e'' o CERT.br?

  O CERT.br -- Centro de Estudos, Resposta e Tratamento de Incidentes de
  Seguranca no Brasil -- e'' o Grupo de Resposta a Incidentes de
  Seguranca para a Internet brasileira, mantido pelo NIC.br do Comite
  Gestor da Internet no Brasil.  E'' o grupo responsavel por tratar
  incidentes de seguranca em computadores, envolvendo redes conectadas
  `a Internet brasileira.
');


INSERT INTO tipo_vulnerabilidade(id,nome,modelo_mensagem) values(null,'Serviço NetBios habilitado',
'Caro responsavel,

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

O indicador no campo ''Resultados do Teste'' indica o tipo de problema
testado e significa:

 * netbios: status/pacotes/bytes, onde status e'' "open", e
   pacotes/bytes indicam o tamanho da resposta recebida, em
   pacotes/bytes;

====================================================================================
Endereco IP      | ASN    | Status | Data do Teste             | Resultados do Teste
====================================================================================

Mais detalhes sobre o porque do envio desta mensagem, quem e'' o
CERT.br e como resolver este problema estao listados abaixo.

Cordialmente,
--
CERT.br
<cert@cert.br>
https://www.cert.br/


* O que e'' o servico NetBIOS (137/udp)?

  O servico NetBIOS e'' utilizado tipicamente por sistemas Microsoft
  Windows, ou sistemas Unix atraves do Samba, para compartilhamento de
  arquivos e impressoras.

  Por se tratar de um servico geralmente utilizado apenas dentro de
  redes locais e com sistemas anteriores ao Microsoft Windows 2000, e''
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

* Como o CERT.br sabe que este e'' um servidor NetBIOS vulneravel?

  O CERT.br esta'' recebendo notificacoes com listas de servidores
  NetBIOS que possivelmente estao sendo abusados e utilizados em
  ataques distribuidos de negacao de servicos (DDoS). O CERT.br esta''
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

  Onde IP_SERVIDOR e'' o IP do servidor NetBIOS a ser testado.

  Se o teste for realizado a partir de um sistema Unix, recomendamos
  que antes de executar o comando acima certifique-se que voce tem a
  ferramenta nmblookup instalada em seu computador.

* Onde aprender mais sobre configuracao segura de sistemas?

  - Praticas de Seguranca para Administradores de Redes Internet
    https://www.cert.br/docs/seg-adm-redes/

* Por que estou recebendo essa mensagem?

  Voce esta'' recebendo esse email por estar listado em
  https://registro.br/ como contato desta rede ou dominio.

  Se voce for contato de varias redes diferentes e'' possivel que voce
  receba mais de um email, com conteudos diferentes.  Por favor nao
  apague outras copias que vier a receber.

* O que e'' o CERT.br?

  O CERT.br -- Centro de Estudos, Resposta e Tratamento de Incidentes de
  Seguranca no Brasil -- e'' o Grupo de Resposta a Incidentes de
  Seguranca para a Internet brasileira, mantido pelo NIC.br do Comite
  Gestor da Internet no Brasil.  E'' o grupo responsavel por tratar
  incidentes de seguranca em computadores, envolvendo redes conectadas
  `a Internet brasileira.
');


INSERT INTO tipo_vulnerabilidade(id,nome,modelo_mensagem) values(null,'Servico SSDP/uPnP habilitado',
'Caro responsavel,

Os IPs presentes no log abaixo sao de servidores sob sua
responsabilidade com o servico SSDP/uPnP (1900/udp) habilitado. Este
servico pode ser abusado para fazer parte de ataques distribuidos de
negacao de servico, consumindo recursos da sua rede e impactando
terceiros.

Lembramos que os enderecos IP listados tambem podem ser dispositivos de
rede com o servico SSDP/UPnP habilitado, como roteadores e CPEs (modem
ou roteador de uso domestico instalado nos clientes).

Gostariamos de solicitar que:

 * o servico SSDP/UPnP seja configurado corretamente ou desabilitado no
 equipamento, caso nao esteja em uso.

Uma descricao do problema e possiveis solucoes podem ser encontradas
no final deste documento.

Se voce nao for a pessoa correta para corrigir o problema destes
equipamentos com o servico SSDP/UPnP habilitado, por favor repasse
essa mensagem para alguem de sua organizacao que possa faze-lo.

O indicador no campo ''Resultados do Teste'' indica o tipo de problema
testado e significa:

 * msearch: status/pacotes/bytes, onde status e'' "open", e
   pacotes/bytes indicam o tamanho da resposta recebida, em
   pacotes/bytes;

====================================================================================
Endereco IP      | ASN    | Status | Data do Teste             | Resultados do Teste
====================================================================================
Mais detalhes sobre o porque do envio desta mensagem, quem e'' o
CERT.br e como resolver este problema estao listados abaixo.

Cordialmente,
--
CERT.br
<cert@cert.br>
https://www.cert.br/

* O que e'' o servico SSDP/UPnP (1900/udp)?

  O SSDP (Simple Service Discovery Protocol) e'' um protocolo de rede
  utilizado, em uma rede local, para descoberta de dispositivos Plug
  and Play rodando o protocolo UPnP (Universal Plug and Play).

  Caso esteja acessivel a toda a Internet via UDP, esse servico pode
  ser explorado para ataques DDoS que usem amplificacao. Isto ocorre
  porque o atacante envia uma requisicao forjando o IP da vitima e o
  servidor com SSDP/UPnP retorna uma resposta muito maior que a
  requisicao.

* Por que devo me preocupar com isso?

  O servico SSDP pode ser abusado para causar danos a terceiros,
  envolvendo sua rede em ataques a outras organizacoes, alem de
  implicar em um consumo de banda maior.

  Informacoes adicionais sobre como evitar que sua rede seja abusada
  para este e outros ataques DDoS podem ser econtradas aqui:

    https://www.cert.br/docs/whitepapers/ddos/

* Como faco para corrigir o problema?

  Se o SSDP/UPnP nao for utilizado na sua rede desabilite o servico no
  seu dispositivo. Se o recurso for utilizado na rede local, configure-o
  de modo que esteja disponivel apenas para a rede local.

* Onde posso obter informacoes adicionais sobre o abuso do protocolo
  SSDP para ataques DDoS?

  - UDP-Based Amplification Attacks
    https://www.us-cert.gov/ncas/alerts/TA14-017A

* Como o CERT.br sabe que este e'' um dispositivo vulneravel?

  O CERT.br esta'' recebendo notificacoes com listas de dispositivos
  que usam SSDP que possivelmente estao sendo abusados e utilizados em
  ataques distribuidos de negacao de servidos (DDoS). O CERT.br esta''
  notificando os responsaveis pelos dispositivos brasileiros presentes
  nestas listas.

* Como posso ter certeza que resolvi o problema?

  Voce pode verificar seu dispositivo atraves do seguinte comando:
  (preferencialmente execute-o a partir da Internet, ou seja, fora de
  uma rede interna que tenha permissao de acesso ao dispositivo).

    $ printf "M-SEARCH * HTTP/1.1\r\nHost:239.255.255.250:1900\r\nST:upnp:rootdevice\r\nMan:\"ssdp:discover\"\r\nMX:3\r\n\r\n" | nc
 -u IP_SSDP 1900

  Onde IP_SSDP e'' o IP do dispositivo usando SSDP a ser testado.
  Antes de executar o comando acima certifique-se que voce tem a ferramenta
  netcat (nc) instalada.

* Onde aprender mais sobre configuracao segura de sistemas?

  - Praticas de Seguranca para Administradores de Redes Internet
    https://www.cert.br/docs/seg-adm-redes/

* Por que estou recebendo essa mensagem?

  Voce esta'' recebendo esse email por estar listado em
  https://registro.br/ como contato desta rede ou dominio.

  Se voce for contato de varias redes diferentes e'' possivel que voce
  receba mais de um email, com conteudos diferentes.  Por favor nao
  apague outras copias que vier a receber.

* O que e'' o CERT.br?

  O CERT.br -- Centro de Estudos, Resposta e Tratamento de Incidentes de
  Seguranca no Brasil -- e'' o Grupo de Resposta a Incidentes de
  Seguranca para a Internet brasileira, mantido pelo NIC.br do Comite
  Gestor da Internet no Brasil.  E'' o grupo responsavel por tratar
  incidentes de seguranca em computadores, envolvendo redes conectadas
  `a Internet brasileira.
');


INSERT INTO tipo_vulnerabilidade(id,nome,modelo_mensagem) values(null,'Servico Memcached habilitado',
'Caro responsavel,

Os IPs presentes no log abaixo sao de servidores sob sua
responsabilidade com o servico Memcached (11211/udp) habilitado. Este
servico pode ser abusado para fazer parte de ataques distribuidos de
negacao de servico, consumindo recursos da sua rede e impactando
terceiros, alem de poder revelar informacoes sensiveis armazenadas
neste equipamento.

Gostariamos de solicitar que:

 * O servico Memcached seja acessivel somente aos servidores
 (provavelmente Web) de sua rede, que utilizem esse servico. Caso o
 servico Memcached seja desnecessario nesse servidor, recomendamos que
 ele seja desativado;

Uma descricao do problema e possiveis solucoes podem ser encontradas no
final deste documento.

Se voce nao for a pessoa correta para corrigir o problema destes
servidores com o servico Memcached habilitado, por favor repasse essa
mensagem para alguem de sua organizacao que possa faze-lo.

O indicador no campo ''Resultados do Teste'' indica o tipo de problema
testado e significa:

 * memcached: status/pacotes/bytes, onde status e'' "open", e
   pacotes/bytes indicam o tamanho da resposta recebida, em
   pacotes/bytes;

====================================================================================
Endereco IP      | ASN    | Status | Data do Teste             | Resultados do Teste
====================================================================================

Mais detalhes sobre o porque do envio desta mensagem, quem e'' o
CERT.br e como resolver este problema estao listados abaixo.

Cordialmente,
--
CERT.br
<cert@cert.br>
https://www.cert.br/


* O que e'' o servico Memcached (11211/udp)?

  O servico Memcached e'' geralmente utilizado para armazenar em
  memoria os dados de paginas Web dinamicas e assim acelerar a entrega
  desses dados para os servidores HTTP. Esse servico geralmente atende
  as requisicoes nas portas 11211/tcp e 11211/udp. Caso esteja
  acessivel a toda a Internet via UDP, esse servico pode ser explorado
  para ataques DDoS que usem amplificacao. Isto ocorre porque o
  atacante envia uma requisicao forjando o IP da vitima e o servidor
  Memcached retorna uma resposta muito maior que a requisicao.

* Por que devo me preocupar com isso?

  O Memcached pode ser abusado para causar danos a terceiros, envolvendo
  sua rede em ataques a outras organizacoes, alem de implicar em um
  consumo de banda maior. Alem dessas implicacoes, esse servico pode
  revelar informacoes sensiveis sobre sua rede e seus dados
  armazenados.

  Informacoes adicionais sobre como evitar que sua rede seja abusada
  para ataques DDoS podem ser econtradas aqui:

    https://www.cert.br/docs/whitepapers/ddos/

* Como faco para corrigir o problema?

  Configure o servico Memcached de forma que ele seja acessivel
  somente aos servidores (provavelmente Web) de sua rede, que utilizem
  esse servico, ou que ele seja acessivel apenas via TCP. Caso o
  servico Memcached seja desnecessario nesse servidor, recomendamos
  que ele seja desativado. Recomendamos tambem que mantenha o software
  do Memcached sempre atualizado.

* Onde posso obter informacoes adicionais sobre o abuso do protocolo
  Memcache para ataques DDoS?

  - UDP-Based Amplification Attacks
    https://www.us-cert.gov/ncas/alerts/TA14-017A

  - Openly accessible Memcached servers
    https://www.bsi.bund.de/EN/Topics/IT-Crisis-Management/CERT-Bund/CERT-Reports/HOWTOs/Open-Memcached-Server/open-Memcached-server_node.html

  - memcached on port 11211 UDP & TCP being exploited
    **(Contem exemplos de filtragem)**
    http://www.senki.org/memcached-on-port-11211-udp-tcp-being-exploited/

* Como o CERT.br sabe que este e'' um servidor Memcached vulneravel?

  O CERT.br esta'' recebendo notificacoes com listas de servidores
  Memcached que possivelmente estao sendo abusados e utilizados em
  ataques distribuidos de negacao de servicos (DDoS). O CERT.br esta''
  notificando os responsaveis pelos servidores brasileiros presentes
  nestas listas.

* Como posso ter certeza que resolvi o problema?

  Voce pode verificar seu servidor atraves do seguinte comando:
  (preferencialmente execute-os a partir da Internet, ou seja, fora de
  uma rede interna que tenha permissao de acesso ao servidor).

    printf ''\x0\x0\x0\x0\x0\x1\x0\x0\x73\x74\x61\x74\x73\x0a'' | nc -u IP_SERVIDOR 11211

  Onde IP_SERVIDOR e'' o IP do servidor Memcached a ser testado.

* Onde aprender mais sobre configuracao segura de sistemas?

  - Praticas de Seguranca para Administradores de Redes Internet
    https://www.cert.br/docs/seg-adm-redes/

* Por que estou recebendo essa mensagem?

  Voce esta'' recebendo esse email por estar listado em
  https://registro.br/ como contato desta rede ou dominio.

  Se voce for contato de varias redes diferentes e'' possivel que voce
  receba mais de um email, com conteudos diferentes.  Por favor nao
  apague outras copias que vier a receber.

* O que e'' o CERT.br?

  O CERT.br -- Centro de Estudos, Resposta e Tratamento de Incidentes de
  Seguranca no Brasil -- e'' o Grupo de Resposta a Incidentes de
  Seguranca para a Internet brasileira, mantido pelo NIC.br do Comite
  Gestor da Internet no Brasil.  E'' o grupo responsavel por tratar
  incidentes de seguranca em computadores, envolvendo redes conectadas
  `a Internet brasileira.
');


INSERT INTO tipo_vulnerabilidade(id,nome,modelo_mensagem) values(null,'Servico SNMP habilitado',
'Caro responsavel,

Os IPs presentes no log abaixo sao de servidores sob sua
responsabilidade com o servico SNMP (161/udp) habilitado. Este servico
pode ser abusado para fazer parte de ataques distribuidos de negacao
de servico, consumindo recursos da sua rede e impactando terceiros.

Lembramos que os enderecos IP listados, alem de servidores e
computadores, tambem podem ser de dispositivos de rede com o servico
SNMP habilitado, como roteadores, impressoras, CPEs (modem ou roteador
de uso domestico instalado nos clientes), entre outros.

Gostariamos de solicitar que:

 * o servico SNMP seja configurado corretamente ou desabilitado no
   equipamento, caso nao esteja em uso.

Uma descricao do problema e possiveis solucoes podem ser encontradas
no final deste documento.

Se voce nao for a pessoa correta para corrigir o problema destes
equipamentos com o servico SNMP habilitado, por favor repasse essa
mensagem para alguem de sua organizacao que possa faze-lo.

O indicador no campo ''Resultados do Teste'' indica o tipo de problema
testado e significa:

 * snmp: status/pacotes/bytes, onde status e'' "open", e pacotes/bytes
   indicam o tamanho da resposta recebida, em pacotes/bytes.

====================================================================================
Endereco IP      | ASN    | Status | Data do Teste             | Resultados do Teste
====================================================================================
Mais detalhes sobre o porque do envio desta mensagem, quem e'' o
CERT.br e como resolver este problema estao listados abaixo.

Cordialmente,
--
CERT.br
<cert@cert.br>
https://www.cert.br/

* O que e'' o servico SNMP (161/udp)?

  O SNMP (Simple Network Management Protocol) e'' um protocolo de rede
  utilizado para gerenciamento e diagnostico de dispositivos de redes.

  Caso esteja acessivel a toda a Internet via UDP, esse servico pode
  ser explorado para ataques DDoS que usem amplificacao. Isto ocorre
  porque o atacante envia uma requisicao forjando o IP da vitima e o
  servidor com SNMP retorna uma resposta muito maior que a requisicao.

* Por que devo me preocupar com isso?

  O servico SNMP pode ser abusado para causar danos a terceiros,
  envolvendo sua rede em ataques a outras organizacoes, alem de
  implicar em um consumo de banda maior.

  Informacoes adicionais sobre como evitar que sua rede seja abusada
  para este e outros ataques DDoS podem ser econtradas aqui:

    https://www.cert.br/docs/whitepapers/ddos/

* Como faco para corrigir o problema?

  Se o SNMP nao for utilizado na sua rede desabilite o servico no seu
  dispositivo. Se o recurso for utilizado na rede local, configure-o
  de modo que esteja disponivel apenas para a rede local.

  Evite utilizar comunidades public e se possivel utilize autenticacao
  quando disponivel.

* Onde posso obter informacoes adicionais sobre o abuso do protocolo
  SNMP para ataques DDoS?

  - UDP-Based Amplification Attacks
    https://www.us-cert.gov/ncas/alerts/TA14-017A

* Como o CERT.br sabe que este e'' um dispositivo vulneravel?

  O CERT.br esta'' recebendo notificacoes com listas de dispositivos
  que usam SNMP que possivelmente estao sendo abusados e utilizados em
  ataques distribuidos de negacao de servidos (DDoS).  O CERT.br esta''
  notificando os responsaveis pelos dispositivos brasileiros presentes
  nestas listas.

* Como posso ter certeza que resolvi o problema?

  Voce pode verificar seu dispositivo atraves dos seguintes comandos:
  (preferencialmente execute-os a partir da Internet, ou seja, fora de
  uma rede interna que tenha permissao de acesso ao dispositivo).

    $ snmpget -v 2c -c public IP_SNMP iso.3.6.1.2.1.1.1.0

    ou

    $ snmpctl snmp get IP_SNMP oid iso.3.6.1.2.1.1.1.0

  Onde IP_SNMP e'' o IP do dispositivo usando SNMP a ser testado.
  Antes de executar o comando acima certifique-se que voce tenha as
  ferramentas snmpget ou snmpctl instaladas.

* Onde aprender mais sobre configuracao segura de sistemas?

  - Praticas de Seguranca para Administradores de Redes Internet
    https://www.cert.br/docs/seg-adm-redes/

* Por que estou recebendo essa mensagem?

  Voce esta'' recebendo esse email por estar listado em
  https://registro.br/ como contato desta rede ou dominio.

  Se voce for contato de varias redes diferentes e'' possivel que voce
  receba mais de um email, com conteudos diferentes.  Por favor nao
  apague outras copias que vier a receber.

* O que e'' o CERT.br?

  O CERT.br -- Centro de Estudos, Resposta e Tratamento de Incidentes
  de Seguranca no Brasil -- e'' o Grupo de Resposta a Incidentes de
  Seguranca para a Internet brasileira, mantido pelo NIC.br do Comite
  Gestor da Internet no Brasil.  E'' o grupo responsavel por tratar
  incidentes de seguranca em computadores, envolvendo redes conectadas
  `a Internet brasileira.');


INSERT INTO tipo_vulnerabilidade(id,nome,modelo_mensagem) values(null,'Servidores NTP mal configurados',
'Caro responsavel,

Os IPs presentes no log abaixo sao servidores NTP mal configurados sob
sua responsabilidade (123/udp). Estes servidores podem ser abusados
para fazer parte de ataques distribuidos de negacao de servico,
consumindo recursos da sua rede e impactando terceiros.

Lembramos que os enderecos IP listados tambem podem ser dispositivos
de rede com funcionalidade NTP, como roteadores e CPEs (modem ou
roteador de uso domestico instalado nos clientes).

Gostariamos de solicitar que:

 * Os servidores NTP listados sejam configurados de modo a corrigir
 este problema.

Uma descricao do problema e possiveis solucoes podem ser encontradas
no final deste documento.

Se voce nao for a pessoa correta para corrigir o problema destes
servidores NTP mal configurados, por favor repasse essa mensagem para
alguem de sua organizacao que possa faze-lo.

Os indicadores no campo ''Resultados do Teste'' indicam os tipos de
problemas testados e significam:

 * monlist: status/pacotes/bytes, onde status pode ser "timeout",
   "open" ou "closed", e pacotes/bytes sao o tamanho da resposta
   recebida, em pacotes/bytes;

 * readvar: status/pacotes/bytes, onde status pode ser "timeout",
   "open" ou "closed", e pacotes/bytes sao o tamanho da resposta
   recebida, em pacotes/bytes;

====================================================================================
Endereco IP      | ASN    | Status | Data do Teste             | Resultados do Teste
====================================================================================

Mais detalhes sobre o porque do envio desta mensagem, quem e'' o
CERT.br e como resolver este problema estao listados abaixo.

Cordialmente,
--
CERT.br
<cert@cert.br>
https://www.cert.br/

* O que e'' um servidor NTP mal configurado e passivel de amplificacao?

  Um servidor NTP e'' considerado mal configurado e passivel de
  amplificacao quando aceita determinados comandos, como monlist ou
  readvar, que permitem gerar respostas muito maiores que a pergunta,
  para origens forjadas.

* Por que devo me preocupar com isso?

  Um servidor NTP mal configurado pode ser abusado para causar danos a
  terceiros, envolvendo sua rede em ataques a outras organizacoes,
  alem de implicar em um maior consumo de banda.

  Informacoes adicionais sobre como evitar que sua rede seja abusada
  para este e outros ataques DDoS podem ser econtrados aqui:

    https://www.cert.br/docs/whitepapers/ddos/

* Como faco para corrigir o problema em sistemas Unix?

  1. Desabilite o comando "monlist".  Isso pode ser feito de duas
      maneiras:

     - Inclua no ntpd.conf a seguinte linha:

       disable monitor

     - Instale a versao 4.2.7p26 ou mais atual, que nao possui o
       comando monlist.

  2. Desabilite o comando "readvar"

     - Inclua no ntpd.conf as seguintes linhas:

       restrict default kod notrap nomodify nopeer noquery
       restrict -6 default kod notrap nomodify nopeer noquery

* Onde posso obter informacoes adicionais sobre configuracao segura de
  servidores NTP?

  - Guia NTP para Linux/BSD
    http://www.ntp.br/guia-linux-avancado.php

    Team Cymru Secure NTP Template (inclui cisco e juniper)
  - https://www.team-cymru.com/secure-ntp-template.html

* Como o CERT.br sabe que este e'' um servidor NTP vulneravel?

  O CERT.br esta'' recebendo notificacoes com listas de servidores NTP
  que possivelmente estao sendo abusados e utilizados em ataques
  distribuidos de negacao de servidos (DDoS). O CERT.br esta''
  notificando os responsaveis pelos servidores brasileiros presentes
  nestas listas.

* Como posso ter certeza que resolvi o problema?

  Voce pode verificar seu servidor atraves dos seguintes comandos:
  (preferencialmente execute-os a partir da Internet, ou seja, fora de
  uma rede interna que tenha permissao de acesso ao servidor).

    $ ntpdc -n -c monlist SERVIDOR_NTP

    ou

    $ ntpq -c rv SERVIDOR_NTP

  Onde SERVIDOR_NTP e'' o IP do servidor NTP a ser testado.

* Onde aprender mais sobre configuracao segura de sistemas?

  - Praticas de Seguranca para Administradores de Redes Internet
    https://www.cert.br/docs/seg-adm-redes/

* Por que estou recebendo essa mensagem?

  Voce esta'' recebendo esse email por estar listado em
  https://registro.br/ como contato desta rede ou dominio.

  Se voce for contato de varias redes diferentes e'' possivel que voce
  receba mais de um email, com conteudos diferentes.  Por favor nao
  apague outras copias que vier a receber.

* O que e'' o CERT.br?

  O CERT.br -- Centro de Estudos, Resposta e Tratamento de Incidentes de
  Seguranca no Brasil -- e'' o Grupo de Resposta a Incidentes de
  Seguranca para a Internet brasileira, mantido pelo NIC.br do Comite
  Gestor da Internet no Brasil.  E'' o grupo responsavel por tratar
  incidentes de seguranca em computadores, envolvendo redes conectadas
  `a Internet brasileira.');