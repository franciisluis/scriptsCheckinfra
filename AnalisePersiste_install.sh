#!/bin/bash

# Atualizar os pacotes
sudo apt update

# Instalação do CHKRootKit
echo "Instalando CHKRootKit..."
sudo apt install -y chkrootkit

# Instalação do Rkhunter
echo "Instalando Rkhunter..."
sudo apt install -y rkhunter
# Atualizar definições do Rkhunter
sudo rkhunter --update
sudo rkhunter --propupd

# Instalação do ClamAV
echo "Instalando ClamAV..."
sudo apt install -y clamav clamav-daemon
# Atualizar base de dados de vírus do ClamAV
sudo freshclam

# Instalação do Logwatch
echo "Instalando Logwatch..."
sudo apt install -y logwatch

# Instalação do Logcheck
echo "Instalando Logcheck..."
sudo apt install -y logcheck

# Instalação do Lynis
echo "Instalando Lynis..."
sudo apt install -y lynis
# Sugerindo execução de auditoria básica (você pode querer executar manualmente depois com opções específicas)
echo "Sugerimos executar 'sudo lynis audit system' após a instalação para uma auditoria básica."

echo "Todas as ferramentas foram instaladas e configuradas com sucesso!"
