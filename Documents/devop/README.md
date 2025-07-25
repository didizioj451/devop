# Django DevOps Demo

Projet de formation DevOps avec Django, Docker, CI/CD et déploiement multi-plateforme.

## 🚀 Déploiements gratuits

### Développement
- **GitHub Codespaces**: [Ouvrir dans Codespaces](https://github.com/didizjoj451/devop/codespaces)
- **Local**: `docker-compose up -d`

### Test et Production
- **Render**: [Déployer sur Render](https://render.com)
- **Railway**: [Déployer sur Railway](https://railway.app)
- **ngrok**: `./scripts/demo-deploy.sh`

## 📋 Démarrage rapide

```bash
# Clone et setup
git clone https://github.com/didizjoj451/devop.git
cd devop

# Démarrage avec Docker
docker-compose up -d

# Accès à l'application
open http://localhost:8000
```

## 🛠️ Commandes utiles

```bash
# Logs en temps réel
docker-compose logs -f

# Migrations Django
docker-compose exec web python manage.py migrate

# Créer un superuser
docker-compose exec web python manage.py createsuperuser

# Tests
docker-compose exec web python manage.py test

# Monitoring des coûts
./scripts/monitor-costs.sh
```

## 🌐 Options de déploiement

| Plateforme | Coût | Durée | Mise en veille | Recommandé pour |
|------------|------|-------|----------------|-----------------|
| GitHub Codespaces | Gratuit (60h/mois) | Permanent | Non | Développement |
| Railway | Gratuit ($5 crédit) | Permanent | Non | Staging |
| Render | Gratuit (750h/mois) | Permanent | Oui (15min) | Tests |
| ngrok | Gratuit | Session | Non | Démonstrations |

## 📊 Monitoring

- **GitHub Actions**: [Voir les builds](https://github.com/didizjoj451/devop/actions)
- **Logs**: `docker-compose logs -f`
- **Health Check**: `/health/`

## 🔧 Configuration

Voir les fichiers de configuration :
- `render.yaml` - Configuration Render
- `railway.yml` - Configuration Railway  
- `docker-compose.yml` - Développement local
- `.github/workflows/` - CI/CD pipelines