#!/bin/bash

echo "🚀 Démarrage de la démonstration..."

# Démarrage de l'application
docker-compose up -d

# Attente du démarrage
echo "⏳ Attente du démarrage..."
sleep 15

# Vérification de santé
if curl -f http://localhost:8000/health/ > /dev/null 2>&1; then
    echo "✅ Application démarrée"
    
    # Lancement de ngrok en arrière-plan
    ngrok http 8000 > /dev/null 2>&1 &
    NGROK_PID=$!
    
    # Attente de ngrok
    sleep 5
    
    # Récupération de l'URL publique
    PUBLIC_URL=$(curl -s localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')
    
    echo "🌐 Application accessible publiquement sur : $PUBLIC_URL"
    echo "👤 Interface d'administration : $PUBLIC_URL/admin/"
    echo "📊 Tunnel ngrok : http://localhost:4040"
    echo ""
    echo "Appuyez sur Ctrl+C pour arrêter la démonstration"
    
    # Attente d'interruption
    trap "echo '🛑 Arrêt de la démonstration...'; kill $NGROK_PID; docker-compose down; exit" INT
    
    # Boucle d'attente
    while true; do
        sleep 1
    done
else
    echo "❌ Erreur : Application non accessible"
    exit 1
fi