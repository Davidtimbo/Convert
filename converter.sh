#!/bin/bash


# Ativação do modo de depuração (descomente para ativar)
#set -x

# Definição de um sinal de armadilha para o evento DEBUG (descomente para ativar)
#trap read DEBUG


# Navega para o diretório onde os arquivos estão localizados
#cd /home/crase/converterTeste
cd /mnt/dpessoal/CONVERTE-TXT


#Remove linhas específicas de formatação e linhas em branco dos arquivos .txt (descomente para ativar)
#sed 's/!R! page;exit;//;1,2d;/^$/d' *.txt



# Loop através de todos os arquivos .txt no diretório
for Ad in `ls -1 *.txt`;
do
        #sed -i 's/\\r//g' "$Ad"         
        #P1=$(echo "$Ad" | cut -d"." -f1)

        #Verifica se o nome do arquivo contém "R.txt"
	if [[ "$Ad" == *R.txt ]]; then

	        #Se sim, define o nome do arquivo sem a extensão
	        P1=$(echo "$Ad" | cut -d"." -f1)

		#Converte o arquivo .txt em PDF no modo RETRATO
		python  /root/adm/codpython/convertertxtpdf.py "$Ad" -l 80 -v 9 -s 10 -c 85 -o /mnt/consultores/PDFS/"$P1"".pdf"


	#Verifica se o nome do arquivo contém "P.txt"
	elif [[ "$Ad" == *P.txt ]]; then

	        #Se sim, define o nome do arquivo sem a extensão
	        P1=$(echo "$Ad" | cut -d"." -f1)

	        #Converte o arquivo .txt em PDF no modo PAISAGEM
		python  /root/adm/codpython/convertertxtpdf.py "$Ad" -l 52 -v 7 -L -s 7 -c 134 -F -o /mnt/consultores/PDFS/"$P1"".pdf"

	fi

	#Define as permissões do arquivo PDF para 777
	chmod 777 "/mnt/consultores/PDFS/$P1.pdf"
done

#Remove todos os arquivos .txt no diretório após a conversão (descomente para ativar)
#rm /mnt/dpessoal/CONVERTE-TXT/*.txt

trap "" DEBUG

