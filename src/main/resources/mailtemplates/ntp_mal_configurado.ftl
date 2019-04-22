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

Os indicadores no campo 'Resultados do Teste' indicam os tipos de
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
${tabelaVulnerabilidades}

Mais detalhes sobre o porque do envio desta mensagem, quem e' o
CERT.br e como resolver este problema estao listados abaixo.

Cordialmente,
--
CERT.br
<cert@cert.br>
https://www.cert.br/

* O que e' um servidor NTP mal configurado e passivel de amplificacao?

  Um servidor NTP e' considerado mal configurado e passivel de
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

* Como o CERT.br sabe que este e' um servidor NTP vulneravel?

  O CERT.br esta' recebendo notificacoes com listas de servidores NTP
  que possivelmente estao sendo abusados e utilizados em ataques
  distribuidos de negacao de servidos (DDoS). O CERT.br esta'
  notificando os responsaveis pelos servidores brasileiros presentes
  nestas listas.

* Como posso ter certeza que resolvi o problema?

  Voce pode verificar seu servidor atraves dos seguintes comandos:
  (preferencialmente execute-os a partir da Internet, ou seja, fora de
  uma rede interna que tenha permissao de acesso ao servidor).

    $ ntpdc -n -c monlist SERVIDOR_NTP

    ou

    $ ntpq -c rv SERVIDOR_NTP

  Onde SERVIDOR_NTP e' o IP do servidor NTP a ser testado.

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
