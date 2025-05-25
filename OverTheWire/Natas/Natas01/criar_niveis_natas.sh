#!/bin/bash

# Caminho base: a pasta atual (já dentro de OverTheWire/Natas)
BASE_DIR="."

# Loop do Level 1 até 33
for i in $(seq -w 1 33); do
    next=$(printf "%02d" $((10#$i + 1)))
    folder="Natas${i}-${next}"
    full_path="${BASE_DIR}/${folder}"

    mkdir -p "$full_path"

    echo "# 🕵️ Natas - Nível ${i}-${next} (🇧🇷 Português)" > "${full_path}/Readme-BR.md"
    echo "# 🕵️ Natas - Level ${i}-${next} (🇺🇸 English)" > "${full_path}/Readme-US.md"

    echo "✅ Criado: ${folder}"
done
