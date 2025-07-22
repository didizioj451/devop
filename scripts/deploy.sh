
#!/bin/bash
echo " Démarrage du déploiement..."
# Vérification de Docker
if ! command -v docker &> /dev/null; then
echo " Docker n'est pas installé"
exit 1
fi
# Arrêt des conteneurs existants
echo " Arrêt des conteneurs existants..."
docker-compose down
# Construction des images
echo " Construction des images..."
docker-compose build
# Démarrage des services
echo " Démarrage des services..."
docker-compose up -d
# Attente de la base de données
echo " Attente de la base de données..."
sleep 10
# Migrations
echo " Application des migrations..."
docker-compose exec -T web python manage.py migrate
# Collecte des fichiers statiques
echo " Collecte des fichiers statiques..."
docker-compose exec -T web python manage.py collectstatic --noinput
echo " Déploiement terminé!"
echo " Application disponible sur http://localhost:8000"