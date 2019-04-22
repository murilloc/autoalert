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
${tabelaVulnerabilidades}

Os indicadores no campo 'Resultados dos Testes' significam:

 * ancount: numero de registros na secao de resposta do pacote DNS;
 * nscount: numero de registros na secao de reposta autoritativa;
 * arcount: numero de registros na secao adicional de resposta;
 * ra:      recursividade: 1=ativada, 0=desativada;
 * rcode:   status da query DNS.

Se voce nao for a pessoa correta para corrigir o problema deste
servidor DNS recursivo aberto, por favor repasse essa mensagem para
alguem de sua organizacao que possa faze-lo.

Mais detalhes sobre o porque do envio desta mensagem, quem e' o
CERT.br e como resolver este problema estao listados abaixo.

Cordialmente,
--
CERT.br
<cert@cert.br>
https://www.cert.br/

* O que e' um servidor DNS recursivo aberto?

  Um servidor DNS recursivo e' considerado aberto quando aceita
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

  Voce esta' recebendo esse email por estar listado em
  https://registro.br/ como contato desta rede ou dominio.

  Se voce for contato de varias redes diferentes e' possivel que voce
  receba mais de um email, com conteudos diferentes.  Por favor nao
  apague outras copias que vier a receber.

* Como o CERT.br sabe que este e' um servidor recursivo aberto?

  O CERT.br esta' recebendo notificacoes com listas de servidores DNS
  recursivos abertos que possivelmente estao sendo abusados e utilizados
  em ataques distribuidos de negacao de servidos (DDoS).  O CERT.br
  esta' notificando os responsaveis pelos servidores brasileiros
  presentes nestas listas.

* Como posso ter certeza que resolvi o problema?

  Voce pode verificar seu servidor atraves destes sites:

  * http://security.zensupport.co.uk/

  * http://www.openresolver.nl/

  Apesar do ultimo site de teste estar em holandes, os resultados mais
  detalhados do teste (via botao Show) estao em ingles. Neste mesmo
  site, um botao verde indica que seu DNS recursivo esta configurado
  corretamente.

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
