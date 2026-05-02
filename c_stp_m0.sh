#!/bin/bash
# ---------------------------------------------------
# TK MASTER VIP - ZERO-RATED CORE SETUP (V76.25)
# ---------------------------------------------------

HOME_DIR="/data/data/com.termux/files/home"
BIN_DIR="/data/data/com.termux/files/usr/bin"

cat << 'EOF' > "$BIN_DIR/M0scan"
#!/bin/bash
HOME_DIR="/data/data/com.termux/files/home"
ENC_FILE="$HOME_DIR/M0scan.tspy"
DEC_FILE="$HOME_DIR/.m0_tmp"
PASS_FILE="$HOME_DIR/.m0_sys.tok"

trap "rm -f '$DEC_FILE'" EXIT INT TERM

clear
while true; do
    if [ -f "$PASS_FILE" ]; then
        AUTH_TOKEN=$(cat "$PASS_FILE")
        echo -e "\e[92m[*] SV💙M@☆0scan detected....\e[0m"
    else
        echo -e "\e[96m      👑 TK MASTER [MSPY] ENGINE 👑      \e[0m"
        echo -e "\e[96m      ✦ M@☆ Zero-Rated Scanner ✦      \e[0m"
        echo -e "\e[96m      ✦ V76.25 Master Tier [2026] ✦      \e[0m\n"
        echo -e "\e[93m[🔒] Enter your Activation PIN for the second time:\e[0m"
        echo -ne "\e[96m-M@☆ᵉⁿᵗᵉʳ: \e[0m"
        read -s RAW_PIN < /dev/tty
        echo ""
        AUTH_TOKEN="${RAW_PIN}0"
    fi
    
    # 🔥 ANTI-GHOST & ANTI-BUSY PROTECTION 🔥
    pkill -f "$DEC_FILE" 2>/dev/null
    rm -f "$DEC_FILE"
    
    # ⚡ THE SILENT PULSE LOADER & DUAL-REVERSE FORGE ⚡
    # (Base64 decode piped into silent GPG decryption masked from Stderr)
    ( base64 -d "$ENC_FILE" | gpg --quiet --batch --yes --pinentry-mode loopback --passphrase "$AUTH_TOKEN" -d > "$DEC_FILE" 2>/dev/null ) &
    DEC_PID=$!
    
    frames=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")
    while kill -0 $DEC_PID 2>/dev/null; do
        for frame in "${frames[@]}"; do
            echo -ne "\r\e[96m[$frame] [-----M@☆-----]\e[0m"
            sleep 0.1
        done
    done
    echo -ne "\r\e[K"
    
    if [ -s "$DEC_FILE" ]; then
        echo "$AUTH_TOKEN" > "$PASS_FILE"
        chmod +x "$DEC_FILE"
        "$DEC_FILE"
        EXIT_CODE=$?
        rm -f "$DEC_FILE"
        exit $EXIT_CODE
    else
        echo -e "\e[91m[!] Authentication Error (0x800B). Invalid Token or Tampering Detected.\e[0m"
        rm -f "$PASS_FILE"
        rm -f "$DEC_FILE"
    fi
done
EOF

chmod +x "$BIN_DIR/M0scan"

cat << 'EOF' > "$BIN_DIR/M@☆0scan$"
#!/bin/bash
M0scan
EOF
chmod +x "$BIN_DIR/M@☆0scan$"

echo -e "\e[92m[+] V76.25 Engine Forged and Locked to your Matrix.\e[0m"
echo -e "\e[93m[+] Run command 'M0scan' to launch.\e[0m\n"

