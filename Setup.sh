#!/bin/bash
# setup.sh - Crée toute la structure du projet Video AI Studio
# Usage: bash setup.sh

set -e
PROJECT="video-ai-studio"
mkdir -p $PROJECT/backend/services
mkdir -p $PROJECT/backend/outputs
mkdir -p $PROJECT/frontend
cd $PROJECT

# ============================================================
# README.md
# ============================================================
cat > README.md << 'EOF'
# Video AI Studio

Générateur de vidéos IA (style Pixar, sci-fi, action, drame) avec interface type Netflix.

## Stack
- **Backend**: FastAPI (Python)
- **Génération vidéo**: Agnes AI (`agnes-video-2.5-flash`, gratuit)
- **Découpage de script**: Ollama local (`llama3.1`)
- **Assemblage/découpage**: FFmpeg
- **Frontend**: à brancher (template Netflix React recommandé)

## Prérequis
- Python 3.10+
- FFmpeg (`winget install ffmpeg` / `brew install ffmpeg` / `sudo apt install ffmpeg`)
- Ollama (`https://ollama.com/download`) + modèle : `ollama pull llama3.1`
- Clé API Agnes : `https://platform.agnes-ai.com/` → Console → API Keys

## Installation
```bash
cd backend
pip install -r requirements.txt
cp .env.example .env
# Editer .env et coller AGNES_API_KEY
uvicorn main:app --reload --port 8000
