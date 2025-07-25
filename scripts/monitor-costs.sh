#!/bin/bash

echo "💰 Monitoring des coûts et ressources..."

# Vérification de l'usage Docker
echo "🐳 Usage Docker:"
docker system df

# Nettoyage automatique
echo "🧹 Nettoyage Docker..."
docker system prune -f --volumes

# Vérification de l'espace disque
echo "💾 Espace disque:"
df -h

# Monitoring des processus
echo "⚡ Processus actifs:"
ps aux --sort=-%cpu | head -10

# Vérification des logs volumineux
echo "📋 Logs volumineux:"
find /var/log -name "*.log" -size +100M 2>/dev/null || echo "Aucun log volumineux trouvé"

# Rapport final
echo "✅ Monitoring terminé - $(date)"
