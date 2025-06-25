mkdir -p "$HOME/Investigation" \
         "$HOME/Archive/Case42" \
         "$HOME/Beweisarchiv" \
         "$HOME/ScotlandYard/Case42/Revolver" \
         "$HOME/Holmes/Archive/1895/Blackwood" \
         "$HOME/Investigation/dossier" \
         "$HOME/LightBackup" \
         /tmp/footprints

touch "$HOME/Investigation/footprint.txt"

cat <<'EOF' >"$HOME/Investigation/note.txt"
Nur eine harmlose Notiz – oder doch nicht?
EOF

cat <<'EOF' >"$HOME/Investigation/dossier/dossier1.txt"
Ministerium – Fall 42 – streng vertraulich
EOF

printf 'SECRET TELEGRAM – Eyes Only\n' >"$HOME/Investigation/secret.txt"

cat <<'EOF' >"$HOME/Investigation/server.log"
Log Entry #1: Everything normal
Log Entry #2: Suspicious activity
EOF

head -c 128 /dev/urandom >"$HOME/Investigation/mysterious.bin"

cat <<'EOF' >/tmp/trap.sh
#!/usr/bin/env bash
echo "💥  Boom! (Nur eine Übungsfalle …)"
EOF
chmod +x /tmp/trap.sh
head -c 512 /dev/urandom >"$HOME/LightBackup/evidence.jpg"
ln -sf "$HOME/Investigation" "$HOME/Investigation_symlink"
sudo mkdir -p /var/spool/telegraphs
sudo touch /var/spool/telegraphs/msg1.tgf /var/spool/telegraphs/msg2.tgf
