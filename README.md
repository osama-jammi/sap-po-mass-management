# Application SAP Fiori : Création et Modification en Masse de Commandes d'Achat (Purchase Orders) via Excel

## 📋 Description du Projet

Ce projet consiste à développer une application **SAP Fiori** permettant la création et la modification en masse de commandes d'achat (Purchase Orders) à partir d'un fichier Excel. Il s'appuie sur les technologies modernes **SAP S/4HANA Cloud** et **SAP BTP** (Business Technology Platform).

Dans de nombreuses entreprises, les acheteurs traitent des centaines de commandes d'achat. L'utilisation des transactions standards (ME21N, ME22N) de façon unitaire est chronophage. L'objectif de cette application est de rationaliser ce processus.

**Budget du projet :** 500 $ (Projet Réel)

## 🎯 Fonctionnalités Principales

- **Import de fichier Excel :** L'utilisateur peut charger un fichier contenant les données des commandes d'achat.
- **Vérification des données :** Validation des informations importées avant intégration.
- **Création en masse :** Génération automatique de nouvelles commandes d'achat.
- **Modification en masse :** Mise à jour de plusieurs commandes existantes simultanément.
- **Gestion des erreurs :** Affichage direct et convivial des erreurs depuis l'interface Fiori.
- **Expérience utilisateur (UX) :** Interface entièrement gérée depuis une application SAP Fiori.

## 🏗️ Architecture Technique

L'architecture suit les meilleures pratiques de développement SAP modernes :

```text
[ Fichier Excel ]
       │
       ▼
[ Application SAP Fiori (SAPUI5) ]   <-- Frontend utilisateur
       │
       ▼
[ OData Service ]                    <-- Protocole de communication
       │
       ▼
[ ABAP Cloud (RAP) ]                 <-- Logique métier (Restful ABAP Programming Model)
       │
       ▼
[ CDS Views ]                        <-- Modèle de données / Core Data Services
       │
       ▼
[ SAP Standard APIs ]                <-- APIs de création/modification (BAPIs / OData APIs)
       │
       ▼
[ Purchase Orders dans S/4HANA ]     <-- Base de données système SAP
```

## 🚀 Étapes de Réalisation du Projet

Voici les étapes clés pour mener à bien ce projet :

### 1. Préparation et Conception (Backend & Frontend)
- Définir la structure exacte du fichier Excel attendu (champs requis, types de données, colonnes pour en-têtes et postes).
- Identifier les APIs standards SAP (ex: `BAPI_PO_CREATE1`, `BAPI_PO_CHANGE` ou API OData SAP S/4HANA) à utiliser pour créer et modifier les commandes de manière programmatique.

### 2. Développement Backend (ABAP RESTful Application Programming Model - RAP)
- **Création des tables Z** : (Optionnel) Création d'une table de *staging* pour stocker temporairement les données chargées (Draft) avant validation finale.
- **Création des vues CDS (Core Data Services)** : Définir le modèle de données de l'application (Entités pour En-tête et Postes).
- **Behavior Definition & Implementation (BDEF & ABAP)** :
  - Définir les actions personnalisées (ex: `uploadExcel`, `simulate`, `createPO`).
  - Coder la logique métier en ABAP pour lire les données envoyées, les valider, et appeler les APIs standards de création/modification de PO.
  - Implémenter la gestion des messages d'erreur (SAP Message Class) pour remonter les anomalies au frontend de façon structurée.
- **Exposition du Service OData** : Créer la *Service Definition* et le *Service Binding* (OData V4 de préférence) pour exposer les données et les actions au frontend.

### 3. Développement Frontend (SAP Fiori / SAPUI5)
- **Génération de l'application** : Utiliser SAP Fiori Elements (si le scénario le permet, ex: List Report Object Page avec actions *custom*) ou une application Freestyle SAPUI5 (souvent plus adaptée pour gérer finement l'upload de fichiers complexes).
- **Intégration du composant d'Upload Excel** :
  - Utiliser le composant `sap.ui.unified.FileUploader` ou `sap.m.UploadCollection`.
  - Lire le contenu Excel côté client (via une bibliothèque JavaScript comme `SheetJS` / `xlsx`) puis envoyer les données formatées via OData, OU BIEN envoyer le fichier brut au backend (XSTRING) pour un traitement ABAP (ex: avec `XLSX Workbench` ou classes standards).
- **Interface de Validation** : Afficher un tableau (`sap.ui.table.Table` ou `sap.m.Table`) récapitulant les données extraites avec leur statut respectif (Prêt, Erreur, Créé) avant l'exécution finale.
- **Affichage des erreurs** : Intégrer un `MessagePopover` pour centraliser et afficher les retours de S/4HANA de manière ergonomique.

### 4. Tests et Validation
- Tester l'import avec différents jeux de données (fichiers valides et invalides).
- Vérifier la bonne création des PO dans le système S/4HANA (en consultant les transactions ME23N ou l'application Fiori standard).
- Vérifier la mise à jour correcte des PO existantes.
- Valider la gestion des erreurs (ex: code fournisseur inexistant, article invalide, quantité nulle).

### 5. Déploiement et Sécurité
- Déployer l'application SAPUI5 sur SAP BTP ou sur le système SAP S/4HANA On-Premise/Private Cloud via le SAP Fiori Launchpad.
- Configurer les rôles, les catalogues, et les autorisations (PFCG ou BTP Role Collections) pour restreindre l'accès aux utilisateurs concernés (Acheteurs).
