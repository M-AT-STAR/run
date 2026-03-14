#!/bin/bash
# ---------------------------------------------------
# TK MASTER VIP - SECURE DEPLOYMENT BOOTSTRAPPER
# ---------------------------------------------------

URL_CORE="https://raw.githubusercontent.com/M-AT-STAR/run/main/core_setup.enc"
URL_ENGINE="https://raw.githubusercontent.com/M-AT-STAR/run/main/M@☆0scan$.tspy"

clear
echo -e "\e[95m=================================================\e[0m"
echo -e "\e[96m      👑 TK MASTER VIP SECURE DEPLOYMENT 👑      \e[0m"
echo -e "\e[95m=================================================\e[0m"
echo ""
echo -e "\e[93m[🔒] Enter your Activation PIN to begin:\e[0m"
read -s ACTIVATION_PIN
echo ""

echo -e "\e[96m[*] Verifying network and secure protocols...\e[0m"
pkg update -y > /dev/null 2>&1
pkg install gnupg wget -y > /dev/null 2>&1

echo -e "\e[96m[*] Downloading deployment packages...\e[0m"
wget -qO .core.enc "$URL_CORE"
wget -qO "M@☆0scan$.tspy" "$URL_ENGINE"

# Silently decrypt using the PIN
gpg --quiet --batch --yes --pinentry-mode loopback --passphrase "$ACTIVATION_PIN" -d .core.enc > .core_setup.sh 2>/dev/null

if [ $? -eq 0 ]; then
    echo -e "\e[92m[+] Activation Successful! Initializing core...\e[0m"
    sleep 1
    
    # Clean up the locked core file
    rm .core.enc
    
    # Run the setup logic
    bash .core_setup.sh
    
    # INSTANTLY delete the setup logic so hackers can't see it
    rm .core_setup.sh
else
    echo -e "\e[91m[-] ERROR: Invalid Activation PIN. Deployment aborted.\e[0m"
    rm -f .core.enc "M@☆0scan$.tspy"
    exit 1
fi

