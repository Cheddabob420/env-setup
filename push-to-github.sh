#!/bin/bash
set -e

echo "🔧 Setting up Git config..."
git config --global user.name "Cheddabob420"
git config --global user.email "dntbanmethistime@yahoo.com"

echo "📁 Initializing Git repository..."
git init
git add .
git commit -m 'Initial commit: Thonny setup and MicroHome projects'

echo "🔗 Adding remote GitHub repo..."
git remote add origin https://github.com/Cheddabob420/env-setup.git

echo "🚀 Pushing to GitHub..."
git branch -M main
git push -u origin main
