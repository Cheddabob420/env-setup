#!/bin/bash
set -e

echo "🔄 Updating system..."
sudo apt update

echo "📦 Installing dependencies..."
sudo apt install -y wget curl git jq python3 python3-pip

echo "🐍 Setting up Thonny IDE..."
THONNY_URL=$(curl -s https://api.github.com/repos/thonny/thonny/releases/latest | \
  jq -r '.assets[] | select(.name | endswith(".deb")) | .browser_download_url')

wget -O thonny_latest.deb "$THONNY_URL"
sudo dpkg -i thonny_latest.deb || sudo apt -f install -y
rm thonny_latest.deb

echo "📁 Restoring Projects folder to ~/projects"
mkdir -p ~/projects
cp -r ./projects/* ~/projects/ || echo "No projects to copy."

echo "🐍 Creating Python virtual environment for esptool..."
python3 -m venv ~/esptool-env
source ~/esptool-env/bin/activate
pip install --upgrade pip
pip install esptool
deactivate

echo "📌 Adding alias to ~/.bashrc"
echo 'alias esptool-env="source ~/esptool-env/bin/activate"' >> ~/.bashrc

echo "✅ Setup complete!"
echo "To use esptool, run: source ~/esptool-env/bin/activate"
