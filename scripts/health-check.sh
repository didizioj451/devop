#!/bin/bash

set -e

echo "🏥 Vérification de l'état de l'application..."

# Test de santé basique
HEALTH_URL="http://localhost:8000/health/"
echo "🔍 Test de l'endpoint de santé..."

if curl -f $HEALTH_URL > /dev/null 2>&1; then
    echo "✅ Application en ligne"
else
    echo "❌ Application hors ligne"
    exit 1
fi

# Test de la base de données
echo "🔍 Test de la base de données..."
docker-compose -f docker/docker-compose.yml exec -T web python manage.py check --database default

if [ $? -eq 0 ]; then
    echo "✅ Base de données OK"
else
    echo "❌ Problème base de données"
    exit 1
fi

# Test des fichiers statiques
echo "🔍 Test des fichiers statiques..."
STATIC_URL="http://localhost:8000/static/admin/css/base.css"

if curl -f $STATIC_URL > /dev/null 2>&1; then
    echo "✅ Fichiers statiques OK"
else
    echo "⚠️ Fichiers statiques non accessibles"
fi

# Test de performance basique
echo "🔍 Test de performance..."
RESPONSE_TIME=$(curl -o /dev/null -s -w '%{time_total}' http://localhost:8000/)
echo "⏱️ Temps de réponse: ${RESPONSE_TIME}s"

if (( $(echo "$RESPONSE_TIME < 2.0" | bc -l) )); then
    echo "✅ Performance OK"
else
    echo "⚠️ Performance lente"
fi

echo "🎉 Vérifications terminées"