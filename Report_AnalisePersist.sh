#!/bin/bash

# Diretório de saída e nome do arquivo
OUTPUT_FILE="/home/caisadm/results_$(date +"%Y%m%d_%H%M%S").txt"

# Executando CHKRootKit
echo "Executando CHKRootKit..." >> $OUTPUT_FILE
sudo chkrootkit >> $OUTPUT_FILE 2>&1 &

# Exec Rkhunter
echo "Executando Rkhunter..." >> $OUTPUT_FILE
sudo rkhunter --check --skip-keypress >> $OUTPUT_FILE 2>&1 &

# Exec Logwatch
echo "Executando Logwatch..." >> $OUTPUT_FILE
sudo logwatch >> $OUTPUT_FILE 2>&1 &

# Exec Lynis
echo "Executando Lynis..." >> $OUTPUT_FILE
sudo lynis audit system >> $OUTPUT_FILE 2>&1 &

# Exec ClamAV
echo "Executando ClamAV..." >> $OUTPUT_FILE
sudo clamscan -r --bell -i /tmp /var/tmp /bin /sbin /usr/bin /usr/sbin /home /var/www /etc /root /usr/local /boot /dev /var/mail >> $OUTPUT_FILE 2>&1 &

# Esperando todos os processos terminarem
wait

echo "Todos os scans foram concluídos. Verifique o arquivo $OUTPUT_FILE para ver os resultados." >> $OUTPUT_FILE
