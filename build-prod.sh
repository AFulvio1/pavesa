#!/bin/bash
set -e

# Versione di Hugo da usare
HUGO_VERSION="0.123.3"

echo "📥 Scaricando Hugo v${HUGO_VERSION}..."
curl -sL "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz" | tar xz

echo "🔨 Building del sito con Hugo..."
./hugo --minify

echo "✅ Build completato con successo!"
