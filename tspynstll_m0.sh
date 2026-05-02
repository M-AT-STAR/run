#!/bin/bash
# ---------------------------------------------------
# TK MASTER [MSPY] - ZERO-RATED BOOTSTRAPPER (V76.25)
# ---------------------------------------------------
cd /data/data/com.termux/files/home/ || exit

URL_CORE="https://raw.githubusercontent.com/M-AT-STAR/run/main/c_stp_m0.enc"
URL_ENGINE="https://raw.githubusercontent.com/M-AT-STAR/run/main/M0scan.tspy"

clear
echo -e "\e[95m=================================================\e[0m"
echo -e "\e[96m      🌬️💙 TK MASTER [MSPY] SECURE DEPLOYMENT 💨      \e[0m"
echo -e "\e[96m         ✦ M@☆ Zero-Rated Scanner ✦        \e[0m"
echo -e "\e[96m               V76.25 Master Tier           \e[0m"
echo -e "\e[95m=================================================\e[0m"
echo ""

echo -e "\e[93m[!] STORAGE PERMISSION REQUIRED [!]\e[0m"
echo -e "\e[96m    1. A settings screen will open in a moment.\e[0m"
echo -e "\e[96m    2. Toggle the switch to 'ON' (Allow access to manage all files).\e[0m"
echo -e "\e[96m    3. Press your phone's BACK button to return here.\e[0m"
echo ""
echo -e "\e[92m[*] Press ENTER to open Settings...\e[0m"
read -r
termux-setup-storage
sleep 3

# ==========================================
# ⚡ HARDWARE ARCHITECTURE GATE ⚡
# ==========================================
SYS_ARCH=$(uname -m)
if [[ "$SYS_ARCH" != "aarch64" ]]; then
    echo -e "\e[91m[!] Hardware Incompatible (Error 0xHW-32). 64-bit Architecture Required.\e[0m"
    exit 1
fi

# ==========================================
# ⚡ SHIZUKU AUTO-BRIDGE INJECTION ⚡
# ==========================================
SHIZUKU_DIR="/storage/emulated/0/Shizuku"
BIN_DIR="/data/data/com.termux/files/usr/bin"

if [ -f "$SHIZUKU_DIR/rish" ] && [ -f "$SHIZUKU_DIR/rish_shizuku.dex" ]; then
    echo -e "\e[96m[*] Shizuku Export Detected. Forging Auto-Bridge...\e[0m"
    
    # Pre-Wipe Ghost Files (Bypass Android 14 Permission Denied Trap)
    chmod 700 "$BIN_DIR/rish_shizuku.dex" 2>/dev/null
    rm -f "$BIN_DIR/rish" "$BIN_DIR/rish_shizuku.dex"
    
    # Copy Fresh Files
    cp "$SHIZUKU_DIR/rish" "$BIN_DIR/"
    cp "$SHIZUKU_DIR/rish_shizuku.dex" "$BIN_DIR/"
    
    # Apply Execution and Android 14+ Security Patches
    chmod +x "$BIN_DIR/rish"
    chmod 400 "$BIN_DIR/rish_shizuku.dex"
    
    # Silently inject the Termux ID into the core Shizuku files
    sed -i 's/PKG="replace_me"/PKG="com.termux"/g' "$BIN_DIR/rish"
    sed -i 's/RISH_APPLICATION_ID=.*/RISH_APPLICATION_ID="com.termux"/g' "$BIN_DIR/rish"
    
    # Verification Ping
    if rish -c "id" 2>/dev/null | grep -q "uid=2000"; then
        echo -e "\e[92m[+] Shizuku Bridge Locked & Loaded! 🔥\e[0m\n"
    else
        echo -e "\e[93m[!] Shizuku Bridge copied, but Shizuku app is not running yet.\e[0m\n"
    fi
fi

# ==========================================
# ⚡ CORE SYNTHESIS (OG ARCHITECT LOGIC) ⚡
# ==========================================
echo -e "\e[96m[⠼] Synthesizing core systems (Iron-Clad Packages)...\e[0m"
(
    pkg update && pkg upgrade -y
    pkg install python git wget ruby openssl figlet cmatrix chafa termux-api ncurses -y
    pkg update -y && pkg upgrade -y
    pkg install -y bash coreutils python ruby git curl wget nano termux-api ncurses-utils openssl-tool
    pkg install -y figlet cmatrix chafa
    gem install lolcat
    python -m pip install --upgrade pip setuptools wheel
    pip install aiohttp requests dnspython tqdm termcolor colorama
    pkg install -y python-numpy gnupg
) > /dev/null 2>&1 &

INSTALL_PID=$!
while kill -0 $INSTALL_PID 2>/dev/null; do
    for i in "-" "\\" "|" "/"; do echo -ne "\e[93m\r[⠼] Synthesizing core systems... $i\e[0m"; sleep 0.2; done
done
echo -e "\e[92m\r[+] VIP environment & Packages setup complete!        \e[0m\n"

# ==========================================
# ⚡ THE KNOX-LEVEL SECURE FETCH ⚡
# ==========================================
echo -e "\e[96m[*] Fetching deployment packages...\e[0m"
wget -qO .core.enc "$URL_CORE"
wget -qO "M0scan.tspy" "$URL_ENGINE"

if [ ! -s .core.enc ] || [ ! -s "M0scan.tspy" ]; then
    echo -e "\e[91m[!] Secure connection refused (Error 0xNW-88). Servers unreachable.\e[0m"
    exit 1
fi

echo -e "\e[93m[🔒] Enter your Activation PIN:\e[0m"
echo -ne "\e[96m-M@☆ᵉⁿᵗᵉʳ: \e[0m"
read -s AUTH_PIN < /dev/tty
echo ""

# Mathematically append the '0' Salt and silently route backend errors to the void
gpg --quiet --batch --yes --pinentry-mode loopback --passphrase "${AUTH_PIN}0" -d .core.enc > c_stp_m0.sh 2>/dev/null

if [ $? -eq 0 ] && [ -s c_stp_m0.sh ]; then
    echo -e "\e[92m[+] Core Module Authenticated & Integrated.\e[0m"
    chmod +x c_stp_m0.sh
    bash c_stp_m0.sh
    rm -f c_stp_m0.sh
    rm -f .core.enc
else
    echo -e "\e[91m[!] Authentication Error (0x800A). Access Denied.\e[0m"
    rm -f c_stp_m0.sh
    rm -f .core.enc
    exit 1
fi

