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

Caro responsável,

Chegou ao nosso conhecimento que os IPs presentes no log abaixo são de
dispositivos de rede Ubiquiti Networks sob sua responsabilidade que
possuem o serviço Device Discovery (10001/udp) habilitado.

Em decorrência, os seguintes problemas podem estar ocorrendo em sua
rede:

* Este serviço pode ser abusado para fazer parte de ataques
distribuídos de negação de serviço, consumindo recursos da sua rede
e impactando terceiros;

* As respostas providas por este serviço podem revelar informações
sensíveis de sua rede;

* Em alguns casos há indícios de comprometimento do dispositivo,
evidenciados por uma resposta contendo o termo "HACKED-ROUTER" no
campo payload dos logs apresentados abaixo.

Gostaríamos de solicitar que:

* esse serviço esteja acessível apenas para a sua própria rede ou que
desative o serviço caso ele não seja utilizado;

* verifique esses dispositivos em busca de sinais da invasão;

* se confirmado o comprometimento, restaure as configurações de
fábrica, atualize o sistema para a última versão e, finalmente,
restaure um backup das configurações, sempre utilizando uma senha
forte.

Se você não for a pessoa correta para corrigir o problema destes
dispositivos, por favor repasse essa mensagem para alguém de sua
organização que possa fazê-lo.

O indicador no campo 'Resultados do Teste' indica o tipo de problema
testado e significa:

* status/pacotes/bytes, onde status é "open", e pacotes/bytes
indicam o tamanho da resposta recebida, em pacotes/bytes.

* Payload: parte do payload da resposta recebida, em alguns casos
indicando um equipamento comprometido.

======================================================================================================================
Endereco IP      | ASN    | Status | Data do Teste (UTC)  | Resultado  | Payload
======================================================================================================================
${tabelaVulnerabilidades}

Mais detalhes sobre esse problema, como corrigi-lo e quem é o CERT.br
estão listados abaixo.

Cordialmente,
--
CERT.br
<cert@cert.br>
https://www.cert.br/

* Onde posso obter informações adicionais sobre esse problema?

Understanding Ubiquiti Discovery Service Exposures
https://blog.rapid7.com/2019/02/01/ubiquiti-discovery-service-exposures/

* Como faço para corrigir o problema?

Com relação ao problema de abuso para ataques de negação de serviço,
recomendamos que o serviço Device Discovery seja acessível apenas à
sua rede, adotando os procedimentos apresentados pelo fabricante na
URL abaixo:

UNMS - Device Discovery
https://help.ubnt.com/hc/en-us/articles/115015690147-UNMS-Device-Discovery

Se confirmado o comprometimento, recomendamos que adote os seguintes
procedimentos antes de limitar o acesso ao serviço:

- restaure as configurações de fábrica;

- atualize a versão do sistema para a última versão disponível;

- jamais deixe a senha padrão, sempre adotando senhas fortes;

- e, finalmente, restaure o backup das configurações do dispositivo.

Recomendamos também que mantenha a versão do sistema sempre atualizada
e desabilite os serviços desnecessários nesses equipamentos, mesmo que
não encontre os sinais de comprometimento.

* Como posso ter certeza que resolvi o problema?

Você pode verificar seu dispositivo através dos seguintes comandos:

(veja que executar esses comandos fora de sua rede deve apresentar
resultados diferentes daqueles apresentados quando o teste for
executado internamente)

$ printf  "\x01\x00\x00\x00" | nc -u IP_DISPOSITIVO 10001 | hexdump -C

Onde IP_DISPOSITIVO é o IP do dispositivo a ser testado. Antes de
executar o comando acima certifique-se que você tenha as ferramentas
netcat e hexdump instaladas em um sistema Unix.

* Por que estou recebendo essa mensagem?

Voce está recebendo esse email por estar listado em
https://registro.br/ como contato desta rede ou domínio.

Se você for contato de várias redes diferentes é possível que você
receba mais de um email, com conteúdos diferentes. Por favor não
apague outras cópias que vier a receber.

* O que é o CERT.br?

O CERT.br -- Centro de Estudos, Resposta e Tratamento de Incidentes de
Segurança no Brasil -- é o Grupo de Resposta a Incidentes de
Segurança para a Internet brasileira, mantido pelo NIC.br do Comitê
Gestor da Internet no Brasil.  É o grupo responsável por tratar
incidentes de segurança em computadores, envolvendo redes conectadas
à Internet brasileira.

</pre>
</body>
</html>

