# Conversor de Arquivos TXT para PDF em Shell e Python
### Objetivo
- Automatizar a conversão de arquivos de texto (.txt) para PDF (.pdf) utilizando este script, a empresa pode reduzir drasticamente a necessidade de impressão física. Isso não apenas economiza papel, mas também contribui para a sustentabilidade ambiental, além de agilizar o processo de documentação, pois os documentos podem ser acessados digitalmente, eliminando a necessidade de armazenamento físico e reduzindo a necessidade de impressão de documentos.
<br> <br/>
- Em resumo, o script visa não apenas reduzir o consumo de papel, mas também melhorar a eficiência operacional da empresa, facilitando o acesso e a distribuição de documentos, além de contribuir para a sustentabilidade ambiental.
<br> <br/>
- O script em questão foi desenvolvido em colaboração com um colega de trabalho, que utiliza COBOL para processar e gerar arquivos de texto (.txt). Esses arquivos são então enviados para uma pasta específica na rede da empresa. O papel do script é monitorar essa pasta de 15 em 15 minutos e, automaticamente, o script vai converter todos os arquivos de texto encontrados para o formato PDF. Garantindo assim uma integração eficiente e eficaz entre os processos de geração de documentos em COBOL e a necessidade de transformar em PDF's.

 ### Resumo 
- Este script em Bash automatiza a conversão de arquivos de texto que utiliza um script Python para converter arquivos de texto (.txt) em arquivos PDF (.pdf). Ele é útil para processar arquivos de texto e convertê-los em PDF com diferentes configurações de layout, dependendo do conteúdo do arquivo original.
- O script foi projetado para processar arquivos em dois modos diferentes: retrato e paisagem, dependendo do sufixo do nome do arquivo de entrada.
- A cada 15 minutos o script bash roda via crontab.


## Requisitos
  - Python: O script depende de um script Python chamado convertertxtpdf.py para realizar a conversão do texto para PDF.
  - Permissões: As permissões de execução devem ser concedidas ao script Bash para que ele possa ser executado.


## Uso

### 1. Navegação para o Diretório: O script navega para o diretório onde os arquivos .txt estão localizados. 

### 2. Conversão de Arquivos: O script percorre todos os arquivos .txt no diretório especificado e realiza as seguintes ações:
- Verificação de Arquivos: O script verifica cada arquivo .txt no diretório. Se o nome do arquivo contém "R.txt", o arquivo será convertido em PDF no modo retrato. Se o nome do arquivo contém "P.txt", o arquivo será convertido em PDF no modo paisagem.
- Para arquivos com "R.txt" no nome, converte o texto para PDF no modo retrato.
- Para arquivos com "P.txt" no nome, converte o texto para PDF no modo paisagem.
- Permissões do PDF: Define as permissões do arquivo PDF resultante para 777 tornando-o acessível a todos os usuários.

- Limpeza Opcional: Há uma seção para remover os arquivos .txt originais após a conversão. Essa parte está comentada por padrão para evitar a exclusão automática dos arquivos, mas pode ser ativada removendo o comentário.


## Parâmetros do Script Python
- ```-l``` ou  ```--lines```: Define o número de linhas por página.
- ```-v``` ou  ```--linespace```: Define o espaçamento entre as linhas.
- ```-s``` ou  ```--size```: Define o tamanho da fonte.
- ```-c``` ou  ```--chars```: Define o número máximo de caracteres por linha.
- ```-L``` ou  ```--landscape```: Ativa o modo paisagem.
- ```-F``` ou  ```--ignoreff```: Ignora o caractere de form feed (^L) como um separador de página.
- ```-o``` ou  ```--output```: Especifica o caminho e o nome do arquivo de saída.


## Configurações Adicionais
- Depuração: O modo de depuração pode ser ativado descomentando a linha set -x. Isso ajuda a depurar o script exibindo comandos conforme são executados.
- Armadilha de Depuração: A linha trap read DEBUG está disponível para ativar uma armadilha de depuração que pausa a execução após cada comando. Isso é útil para examinar o estado do script em cada etapa.

  ## Execução
  ```*/15 8-20 * * 1-5 root /home/crase/converter.sh```
