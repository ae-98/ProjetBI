## École Nationale des Sciences Appliquées

## Rapport de projet BI

# Modélisation et instauration d’un système

# décisionnel pour une compagnie

# d’assurance de biens

```
ERRKHISAyoub
ED-DAROUICHOtman
Promo 2020
```
Tuteur :M. LeESSOUSI Nassima

1 erAvril 2020 — 17 Mai 2020



## TABLE DES FIGURES ENSA Khouribga


- 1 Sch ́ema relationnelle police Table des figures
- 2 Sch ́ema relationnelle de la BD cible dwpolice
- 3 ETL pour dwpolice
- 4 Cr ́eation d’une nouvelle connexion pour BD source
- 5 requ ́ete SQL pour extraire les donn ́ees depuis la table client
- 6 Cr ́eation d’une nouvelle connexion pour BD cible
- 7 V ́erification de processus ETL
- 8 Tache d’envoie d’un ́email ou cas ou du succ`es
- 9 Cr ́eation d’une nouvelle connexion pour pentaho workbench
- 10 Cr ́eation du cube via pentaho workbench
- 11 Installation de Pivot4J Analytics
- 12 Choix du cube
- 13 Montant mensuel par client en
- 14 Montant annuel par client et par type de risque de
- 15 Nombre de transaction par client en
- 16 Montant annuel par client et type d’op ́erateur en
- 17 Sch ́ema relationnelle sinistre
- 18 Sch ́ema relationnelle de la BD cible dwsinistre
- 19 ETL pour dwsinistre
- 20 Cr ́eation d’une nouvelle connexion pour BD source
- 21 requ ́ete SQL pour extraire les donn ́ees depuis la table sinistre
- 22 Cr ́eation d’une nouvelle connexion pour BD cible
- 23 V ́erification de processus ETL
- 24 Tache d’envoie d’un ́email ou cas ou du succ`es
- 25 Cr ́eation d’une nouvelle connexion pour pentaho workbench
- 26 Cr ́eation du cube via pentaho workbench
- 27 Installation de Pivot4J Analytics
- 28 Choix du cube
- 29 Paiement par client en
- 30 Montant annuel par client et par type de risque de
- 31 Paiement par note et par client et par client en
- 32 Paiement par bien assur ́e et par client en
- 33 Sch ́ema relationnelle de la BD cible dwall
- 34 ETL pour dwall
- 35 Cr ́eation d’une nouvelle connexion pour BD source
- 36 requ ́ete SQL pour extraire les donn ́ees depuis la table transaction
- 37 Cr ́eation d’une nouvelle connexion pour BD cible
- 38 V ́erification de processus ETL
- 39 Tache d’envoie d’un ́email ou cas ou du succ`es
- 40 Cr ́eation d’une nouvelle connexion pour pentaho workbench TABLE DES FIGURES ENSA Khouribga
- 41 Cr ́eation du cube via pentaho workbench
- 42 Pentaho report deseigner
- 43 Cr ́eation d’un nouveau source de donn ́ee
- 44 Connexion au base de donn ́ee dwall
- 45 requˆete SQL
- 46 Pr ́eparation de tableau de bord
- 47 R ́esultat de la requˆete SQL
- 48 R ́esultat graphique de la requete SQL
- 49 requˆete SQL
- 50 R ́esultat de la requˆete SQL
- 51 requˆete SQL
- 52 R ́esultat de la requˆete SQL
- 53 R ́esultat de la requˆete SQL
- 54 requˆete SQL
- 55 R ́esultat de la requˆete SQL
- 56 requˆete SQL
- 57 R ́esultat de la requˆete SQL
- 58 requˆete SQL
- 59 R ́esultat de la requˆete SQL
- 60 requˆete SQL
- 61 R ́esultat de la requˆete SQL
- 62 requˆete SQL
- 63 R ́esultat de la requˆete SQL


1 DATA MART POLICE ENSA Khouribga

1 Data Mart Police

1.1 Base de donn ́ee relationnelle police

Nous allons cr ́eer une base de donn ́ee relationnelle police - Nous allons
ins ́erer quelques ligne - basant sur le sch ́ema suivant :

```
Figure1 – Sch ́ema relationnelle police
```
1.2 Base de donn ́ee d ́ecisionnelle police

Nous allons cr ́eer une base de donn ́ee cible qui s’appelledwpolicebasant
sur le sch ́ema suivant :


1 DATA MART POLICE ENSA Khouribga

```
Figure2 – Sch ́ema relationnelle de la BD cible dwpolice
```
1.3 De base de donn ́ee source au base de donn ́ee cible

Apr`es la cr ́eation de deux base de donn ́ee (source et cible) nous allons
appliquer l’ETLutilisant lePentaho data integration

```
Figure3 – ETL pour dwpolice
```

1 DATA MART POLICE ENSA Khouribga

Au premier lieu, allons cr ́eer une nouvelle connexionMySQLpour la base de
donn ́ee source.

```
Figure4 – Cr ́eation d’une nouvelle connexion pour BD source
```
Nous allons ajouter `a l’espace de travail un table input (contient une requˆete
SQL pour extraire les donn ́ees depuis la base de donn ́ee source), et un table
output o`u nous allons faire la correspondance entre les colonnes de base de
donn ́ee source et base de donn ́ee cible.


1 DATA MART POLICE ENSA Khouribga

```
Figure5 – requ ́ete SQL pour extraire les donn ́ees depuis la table client
```
Nous allons cr ́eer une autre connexion, cette fois-ci, pour charger les donn ́ee
vers la base de donn ́ee cible.

```
Figure6 – Cr ́eation d’une nouvelle connexion pour BD cible
```
Voici les autres requˆetes pour extraire les autres tables :


1 DATA MART POLICE ENSA Khouribga

### -----------------------------

```
-client -
-----------------------------
Select * from client
```
### -----------------------------

```
-b.assure -
-----------------------------
select * from bien_assure
```
### -----------------------------

```
-operation -
-----------------------------
select * from operateur
```
### -----------------------------

```
-date -
-----------------------------
SELECT distinct concat(YEAR(date_ecriture),
MONTH(date_ecriture)) as iddate,
YEAR(date_ecriture) as annee,
MONTH(date_ecriture) AS mois
FROM transaction
```
### -----------------------------

```
-police -
-----------------------------
select * from polices
```
### -----------------------------

```
-risque -
-----------------------------
select * from risque
```

1 DATA MART POLICE ENSA Khouribga

### -----------------------------

```
-fact-police -
-----------------------------
SELECT SUM(t.montant) as summe_of_montant,
count(c.idclient) ,
p.note,c.idclient,o.idoperateur ,
r.idrisque,b.idbien_assure,
concat(YEAR(date_ecriture),
MONTH(date_ecriture)) as iddate
from risque r, polices p ,operateur o ,
transaction t , client c ,bien_assure b
WHERE r.idrisque = b.risque_idrisque
and p.idpolices = b.DBpolices_idDBpolices
and o.idoperateur=t.operateur_idoperateur
and b.client_idclient=c.idclient
AND t.bien_assure_idbien_assure=b.idbien_assure
GROUP BY t.idtransaction
```
Nous allons v ́erifier que les donn ́ee sont bien extraire depuis la base de donn ́ee
source vers la base de donn ́ee cible.

```
Figure7 – V ́erification de processus ETL
```

1 DATA MART POLICE ENSA Khouribga

1.4 Cr ́eation de taches

Imaginons le sc ́enario suivant : le Pentaho data int ́egration va envoyer un
́email vers l’adresse ́emailayoub.errkhis@usms.ac.maau cas ou de suc ́es

```
Figure8 – Tache d’envoie d’un ́email ou cas ou du succ`es
```
1.5 Cr ́eation du cube police utilisant Pentaho Work-

bench

Nous allons cr ́eer notre cube police `a l’aide de Pentaho Workbench ,Au
premier lieu, il faut cr ́eer une nouvelle connexion.


1 DATA MART POLICE ENSA Khouribga

```
Figure9 – Cr ́eation d’une nouvelle connexion pour pentaho workbench
```
Apr ́es la connexion au base de donn ́ee cible de Data Mart police, nous allons
cr ́eer les six dimensions et notre table de fait. Nous allons analyser notre cube
via les colonnes suivantes :
— client : pr ́enom client
— op ́erateur : type d’op ́erateur
— risque : type de risque
— date : ann ́ee - mois
— bien assur ́e : nom de bien assur ́e
— police : note - ́etat
— indicateur : montant
— indicateur : nombre de transaction


1 DATA MART POLICE ENSA Khouribga

```
Figure10 – Cr ́eation du cube via pentaho workbench
```
NB : Il faut publier notre cube au serveur de pentaho utilisant la
source de donn ́ee

1.6 Analyse de cube utilisant Pivot4j Analytics

Il faut tout d’abord t ́el ́echarger l’outil Pivot4j depuis leMarketPlace de
Pentaho serveur.


1 DATA MART POLICE ENSA Khouribga

```
Figure11 – Installation de Pivot4J Analytics
```
Nous allons red ́emarrer le serveur et nous allons choisir nouvelle>Pivot4J
View, choisissons notre source de donn ́ee et notre cube.

```
Figure12 – Choix du cube
```
Alors nous allons essayer de r ́epondre aux questions suivantes :

1. Montant mensuel par client en 2020?


1 DATA MART POLICE ENSA Khouribga

2. Montant annuel par client et par type de risque de 2020?
3. Nombre de transaction par client en 2020?
4. Montant annuel par client et type d’op ́erateur en 2020?

```
Figure13 – Montant mensuel par client en 2020
```
```
Figure14 – Montant annuel par client et par type de risque de 2020
```

1 DATA MART POLICE ENSA Khouribga

```
Figure15 – Nombre de transaction par client en 2020
```
```
Figure16 – Montant annuel par client et type d’op ́erateur en 2020
```

2 DATA MART SINISTRE ENSA Khouribga

2 Data Mart Sinistre

2.1 Base de donn ́ee relationnelle sinistre

Nous allons cr ́eer une base de donn ́ee relationnelle sinistre - Nous allons
ins ́erer quelques ligne - basant sur le sch ́ema suivant :

```
Figure17 – Sch ́ema relationnelle sinistre
```
2.2 Base de donn ́ee d ́ecisionnelle sinistre

Nous allons cr ́eer une base de donn ́ee cible qui s’appelledwsinistrebasant
sur le sch ́ema suivant :


2 DATA MART SINISTRE ENSA Khouribga

```
Figure18 – Sch ́ema relationnelle de la BD cible dwsinistre
```
2.3 De base de donn ́ee source au base de donn ́ee cible

Apr`es la cr ́eation de deux base de donn ́ee (source et cible) nous allons
appliquer l’ETLutilisant lePentaho data integration

```
Figure19 – ETL pour dwsinistre
```

2 DATA MART SINISTRE ENSA Khouribga

Au premier lieu, allons cr ́eer une nouvelle connexionMySQLpour la base de
donn ́ee source.

```
Figure20 – Cr ́eation d’une nouvelle connexion pour BD source
```
Nous allons ajouter `a l’espace de travail un table input (contient une requˆete
SQL pour extraire les donn ́ees depuis la base de donn ́ee source), et un table
output o`u nous allons faire la correspondance entre les colonnes de base de
donn ́ee source et base de donn ́ee cible.


2 DATA MART SINISTRE ENSA Khouribga

```
Figure21 – requ ́ete SQL pour extraire les donn ́ees depuis la table sinistre
```
Nous allons cr ́eer une autre connexion, cette fois-ci, pour charger les donn ́ee
vers la base de donn ́ee cible.

```
Figure22 – Cr ́eation d’une nouvelle connexion pour BD cible
```
Voici les autres requˆetes pour extraire les autres tables :


2 DATA MART SINISTRE ENSA Khouribga

### -----------------------------

-client -
-----------------------------
Select * from client

### -----------------------------

-b.assure -
-----------------------------
select * from bien_assure

### -----------------------------

-operation -
-----------------------------
select * from operateur

### -----------------------------

-date -
-----------------------------
SELECT distinct concat(YEAR(date_ecriture),
MONTH(date_ecriture)) as iddate,
YEAR(date_ecriture) as annee,
MONTH(date_ecriture) AS mois
FROM transaction

### -----------------------------

-police -
-----------------------------
select * from polices

### -----------------------------

-risque -
-----------------------------
select * from risque


2 DATA MART SINISTRE ENSA Khouribga

### -----------------------------

-sinistre -
-----------------------------
select * from sinistre

### -----------------------------

-fact-sinistre -
-----------------------------
SELECT SUM(t.paiement) as summe_of_montant,s.idsinistre,
count(t.paiement) ,p.note,c.idclient,o.idoperateur ,
r.idrisque ,b.idbien_assure,
concat(YEAR(date_ecriture),MONTH(date_ecriture)) as iddate
from risque r, polices p ,operateur o ,transaction t ,
client c ,bien_assure b ,sinistre s
WHERE r.idrisque = b.risque_idrisque
and p.idpolices = b.DBsinistre_idDBsinistre
and o.idoperateur=t.operateur_idoperateur
and b.client_idclient=c.idclient
and b.sinistre_idsinistre = s.idsinistre
AND t.bien_assure_idbien_assure=b.idbien_assure
GROUP BY t.idtransaction

Nous allons v ́erifier que les donn ́ee sont bien extraire depuis la base de donn ́ee
source vers la base de donn ́ee cible.


2 DATA MART SINISTRE ENSA Khouribga

```
Figure23 – V ́erification de processus ETL
```
2.4 Cr ́eation de taches

Imaginons le sc ́enario suivant : le Pentaho data int ́egration va envoyer un
́email vers l’adresse ́emailayoub.errkhis@usms.ac.maau cas ou de suc ́es

```
Figure24 – Tache d’envoie d’un ́email ou cas ou du succ`es
```

2 DATA MART SINISTRE ENSA Khouribga

2.5 Cr ́eation du cube police utilisant Pentaho Work-

bench

Nous allons cr ́eer notre cube police `a l’aide de Pentaho Workbench ,Au
premier lieu, il faut cr ́eer une nouvelle connexion.

```
Figure25 – Cr ́eation d’une nouvelle connexion pour pentaho workbench
```
Apr ́es la connexion au base de donn ́ee cible de Data Mart sinistre, nous allons
cr ́eer les sept dimensions et notre table de fait. Nous allons analyser notre
cube via les colonnes suivantes :
— client : pr ́enom client
— op ́erateur : type d’op ́erateur
— risque : type de risque
— date : ann ́ee - mois
— bien assur ́e : nom de bien assur ́e
— police : note - ́etat
— sinistre : ́etat
— indicateur : paiement
— indicateur : nombre de paiement


2 DATA MART SINISTRE ENSA Khouribga

```
Figure26 – Cr ́eation du cube via pentaho workbench
```
NB : Il faut publier notre cube au serveur de pentaho utilisant la
source de donn ́ee

2.6 Analyse de cube utilisant Pivot4j Analytics

Il faut tout d’abord t ́el ́echarger l’outil Pivot4j depuis leMarketPlace de
Pentaho serveur.


2 DATA MART SINISTRE ENSA Khouribga

```
Figure27 – Installation de Pivot4J Analytics
```
Nous allons red ́emarrer le serveur et nous allons choisir nouvelle>Pivot4J
View, choisissons notre source de donn ́ee et notre cube.

```
Figure28 – Choix du cube
```
Alors nous allons essayer de r ́epondre aux questions suivantes :

1. Paiement par client en 2020?


2 DATA MART SINISTRE ENSA Khouribga

2. Paiement par client et par mois de risque de 2020?
3. Paiement par note et par client et par client en 2020?
4. Paiement par bien assur ́e et par client en 2020?

```
Figure29 – Paiement par client en 2020
```
```
Figure30 – Montant annuel par client et par type de risque de 2020
```

2 DATA MART SINISTRE ENSA Khouribga

```
Figure31 – Paiement par note et par client et par client en 2020
```
```
Figure32 – Paiement par bien assur ́e et par client en 2020
```

3 ENTREPOT DE DONNˆ EE ́ ENSA Khouribga

3 Entrepˆot de donn ́ee

3.1 Base de donn ́ee d ́ecisionnelle sinistre

Nous allons cr ́eer une base de donn ́ee cible qui s’appelledwall basant sur
le sch ́ema suivant :

```
Figure33 – Sch ́ema relationnelle de la BD cible dwall
```
3.2 De base de donn ́ee source au base de donn ́ee cible

Apr`es la cr ́eation de deux base de donn ́ee (source et cible) nous allons
appliquer l’ETLutilisant lePentaho data integration


3 ENTREPOT DE DONNˆ EE ́ ENSA Khouribga

```
Figure34 – ETL pour dwall
```
Au premier lieu, allons cr ́eer une nouvelle connexionMySQLpour la base de
donn ́ee source.

```
Figure35 – Cr ́eation d’une nouvelle connexion pour BD source
```
Nous allons ajouter `a l’espace de travail un table input (contient une requˆete
SQL pour extraire les donn ́ees depuis la base de donn ́ee source), et un table


3 ENTREPOT DE DONNˆ EE ́ ENSA Khouribga

output o`u nous allons faire la correspondance entre les colonnes de base de
donn ́ee source et base de donn ́ee cible.

Figure36 – requ ́ete SQL pour extraire les donn ́ees depuis la table transac-
tion

Nous allons cr ́eer une autre connexion, cette fois-ci, pour charger les donn ́ee
vers la base de donn ́ee cible.


3 ENTREPOT DE DONNˆ EE ́ ENSA Khouribga

```
Figure37 – Cr ́eation d’une nouvelle connexion pour BD cible
```
Voici les autres requˆetes pour extraire les autres tables :

### -----------------------------

-client -
-----------------------------
Select * from client

### -----------------------------

-b.assure -
-----------------------------
select * from bien_assure

### -----------------------------

-operation -
-----------------------------
select * from operateur

### -----------------------------

-date -


3 ENTREPOT DE DONNˆ EE ́ ENSA Khouribga

### -----------------------------

SELECT distinct concat(YEAR(date_ecriture),
MONTH(date_ecriture)) as iddate,
YEAR(date_ecriture) as annee,
MONTH(date_ecriture) AS mois
FROM transaction

### -----------------------------

-police -
-----------------------------
select * from polices

### -----------------------------

-risque -
-----------------------------
select * from risque

### -----------------------------

-sinistre -
-----------------------------
select * from sinistre

### -----------------------------

-fact-sinistre -
-----------------------------
SELECT SUM(t.paiement) as summe_of_montant,s.idsinistre,
count(t.paiement) ,p.note,c.idclient,o.idoperateur ,
r.idrisque ,b.idbien_assure,
concat(YEAR(date_ecriture),MONTH(date_ecriture)) as iddate
from risque r, polices p ,operateur o ,transaction t ,
client c ,bien_assure b ,sinistre s
WHERE r.idrisque = b.risque_idrisque
and p.idpolices = b.DBsinistre_idDBsinistre
and o.idoperateur=t.operateur_idoperateur
and b.client_idclient=c.idclient
and b.sinistre_idsinistre = s.idsinistre


3 ENTREPOT DE DONNˆ EE ́ ENSA Khouribga

AND t.bien_assure_idbien_assure=b.idbien_assure
GROUP BY t.idtransaction

### -----------------------------

-fact-police -
-----------------------------
SELECT SUM(t.montant) as summe_of_montant,
count(c.idclient) ,
p.note,c.idclient,o.idoperateur ,
r.idrisque,b.idbien_assure,
concat(YEAR(date_ecriture),
MONTH(date_ecriture)) as iddate
from risque r, polices p ,operateur o ,
transaction t , client c ,bien_assure b
WHERE r.idrisque = b.risque_idrisque
and p.idpolices = b.DBpolices_idDBpolices
and o.idoperateur=t.operateur_idoperateur
and b.client_idclient=c.idclient
AND t.bien_assure_idbien_assure=b.idbien_assure
GROUP BY t.idtransaction

Nous allons v ́erifier que les donn ́ee sont bien extraire depuis la base de donn ́ee
source vers la base de donn ́ee cible.


3 ENTREPOT DE DONNˆ EE ́ ENSA Khouribga

```
Figure38 – V ́erification de processus ETL
```
3.3 Cr ́eation de taches

Imaginons le sc ́enario suivant : le Pentaho data int ́egration va envoyer un
́email vers l’adresse ́emailayoub.errkhis@usms.ac.maau cas ou de suc ́es

```
Figure39 – Tache d’envoie d’un ́email ou cas ou du succ`es
```
3.4 Cr ́eation du cube police utilisant Pentaho Work-

bench

Nous allons cr ́eer nos cubes police et sinistre `a l’aide de Pentaho Work-
bench ,Au premier lieu, il faut cr ́eer une nouvelle connexion.


3 ENTREPOT DE DONNˆ EE ́ ENSA Khouribga

```
Figure40 – Cr ́eation d’une nouvelle connexion pour pentaho workbench
```
Apr ́es la connexion au base de donn ́ee cible d’entrepˆot de donn ́ee, nous allons
cr ́eer les sept dimensions et notre table de fait. Nous allons analyser notre
cube via les colonnes suivantes :
— client : pr ́enom client
— op ́erateur : type d’op ́erateur
— risque : type de risque
— date : ann ́ee - mois
— bien assur ́e : nom de bien assur ́e
— police : note - ́etat
— sinistre : ́etat
— cube Sinistre==>indicateur : paiement
— cube Sinistre==>indicateur : nombre de paiement
— cube Police==>indicateur : montant
— cube Police==>indicateur : nombre de transaction


3 ENTREPOT DE DONNˆ EE ́ ENSA Khouribga

```
Figure41 – Cr ́eation du cube via pentaho workbench
```
NB : Il faut publier notre cube au serveur de pentaho utilisant la
source de donn ́ee

3.5 L’analyse d’entrepˆot de donn ́ee

```
Pour cela, Nous allons utiliserPentaho report deseigner
```

3 ENTREPOT DE DONNˆ EE ́ ENSA Khouribga

```
Figure42 – Pentaho report deseigner
```
Choisissons nouveau rapport et apr`es nous allons cr ́eer une nouvelle connexion
pour se connecter au base de donn ́eedwall

```
Figure43 – Cr ́eation d’un nouveau source de donn ́ee
```
Il faut donner un nom au connexion, sp ́ecifier le port de notre RGBD et le
nom de notre base de donn ́ee


3 ENTREPOT DE DONNˆ EE ́ ENSA Khouribga

```
Figure44 – Connexion au base de donn ́ee dwall
```
Pour l’extraction des tableau de bords, nous allons sp ́ecifier `a chaque tableau
de bord une requˆete SQL.

3.6 Montant de police par mois

```
Nous allons extraire le tableau de bord utilisant la requˆete SQL suivante :
```
SELECT ‘ddate‘.‘mois‘, ‘dfact‘.‘monant‘
FROM ‘dwall‘.‘dfact‘ AS ‘dfact‘, ‘dwall‘.‘ddate‘ AS ‘ddate‘
WHERE ‘dfact‘.‘iddate‘ = ‘ddate‘.‘iddate‘
GROUP BY ‘ddate‘.‘mois‘


3 ENTREPOT DE DONNˆ EE ́ ENSA Khouribga

```
Figure45 – requˆete SQL
```
Cette requˆete a deux outputs mois et montant, nous allons glisser ces deux
colonnes vers l’espace de travail pour les visualiser

```
Figure46 – Pr ́eparation de tableau de bord
```
Apr`es l’ex ́ecution, les figures ci-dessous montrent les r ́esultats de cette requˆete
SQL.


3 ENTREPOT DE DONNˆ EE ́ ENSA Khouribga

```
Figure47 – R ́esultat de la requˆete SQL
```
```
Figure48 – R ́esultat graphique de la requete SQL
```
3.7 Somme annuelle pay ́ee par client

```
Nous allons extraire le tableau de bord utilisant la requˆete SQL suivante :
```

3 ENTREPOT DE DONNˆ EE ́ ENSA Khouribga

SELECT ‘dclient‘.‘prenom‘, ‘ddate‘.‘annee‘, ‘dfact‘.‘monant‘
FROM ‘dwall‘.‘dfact‘ AS ‘dfact‘,
‘dwall‘.‘dclient‘ AS ‘dclient‘, ‘dwall‘.‘ddate‘ AS ‘ddate‘
WHERE ‘dfact‘.‘client_idclient‘ = ‘dclient‘.‘idclient‘
AND ‘dfact‘.‘iddate‘ = ‘ddate‘.‘iddate‘
group by ‘ddate‘.‘annee‘,‘dclient‘.‘prenom‘
Limit 200

Cette requˆete a trois outputs ann ́ee, montant et pr ́enom de client .Nous allons
glisser ces colonnes vers l’espace de travail pour les visualiser

```
Figure49 – requˆete SQL
```
Apr`es l’ex ́ecution, les figures ci-dessous montrent les r ́esultats de cette requˆete
SQL.


3 ENTREPOT DE DONNˆ EE ́ ENSA Khouribga

```
Figure50 – R ́esultat de la requˆete SQL
```
3.8 nombre de transaction par bien assur ́e et par client

```
Nous allons extraire le tableau de bord utilisant la requˆete SQL suivante :
```
SELECT ‘dclient‘.‘prenom‘, ‘dbienassure‘.‘nomBienAssure‘,
count(‘dfact‘.‘nbrTransaction‘)
FROM ‘dwall‘.‘dfact‘ AS ‘dfact‘,
‘dwall‘.‘dbienassure‘ AS ‘dbienassure‘,
‘dwall‘.‘dclient‘ AS ‘dclient‘
WHERE ‘dfact‘.‘bienAssure_idbienAssure‘ = ‘dbienassure‘.‘idbienAssure‘
AND ‘dfact‘.‘client_idclient‘ = ‘dclient‘.‘idclient‘
group by ‘dclient‘.‘prenom‘
LIMIT 200

Cette requˆete a trois outputs pr ́enom, bien assur ́e et nombre de transaction
.Nous allons glisser ces colonnes vers l’espace de travail pour les visualiser


3 ENTREPOT DE DONNˆ EE ́ ENSA Khouribga

```
Figure51 – requˆete SQL
```
Apr`es l’ex ́ecution, les figures ci-dessous montrent les r ́esultats de cette requˆete
SQL.

```
Figure52 – R ́esultat de la requˆete SQL
```

3 ENTREPOT DE DONNˆ EE ́ ENSA Khouribga

```
Figure53 – R ́esultat de la requˆete SQL
```
3.9 Montant total de police par type de risque

```
Nous allons extraire le tableau de bord utilisant la requˆete SQL suivante :
```
SELECT ‘drisque‘.‘type_risque‘, ‘dfact‘.‘monant‘
FROM ‘dwall‘.‘dfact‘ AS ‘dfact‘,
‘dwall‘.‘dclient‘ AS ‘dclient‘,
‘dwall‘.‘doperateur‘ AS ‘doperateur‘,
‘dwall‘.‘ddate‘ AS ‘ddate‘, ‘dwall‘.‘drisque‘ AS ‘drisque‘,
‘dwall‘.‘dpolice‘ AS ‘dpolice‘
WHERE ‘dfact‘.‘client_idclient‘ = ‘dclient‘.‘idclient‘
AND ‘dfact‘.‘operateur_idoperateur‘ = ‘doperateur‘.‘idoperateur‘
AND ‘dfact‘.‘iddate‘ = ‘ddate‘.‘iddate‘
AND ‘dfact‘.‘risques_idrisques‘ = ‘drisque‘.‘idrisques‘
AND ‘dfact‘.‘table1_idnote‘ = ‘dpolice‘.‘idnote‘
GROUP BY ‘drisque‘.‘type_risque‘
LIMIT 200

Cette requˆete a deux outputs type de risque et montant. Nous allons glisser
ces colonnes vers l’espace de travail pour les visualiser


3 ENTREPOT DE DONNˆ EE ́ ENSA Khouribga

```
Figure54 – requˆete SQL
```
Apr`es l’ex ́ecution, les figures ci-dessous montrent les r ́esultats de cette requˆete
SQL.

```
Figure55 – R ́esultat de la requˆete SQL
```

3 ENTREPOT DE DONNˆ EE ́ ENSA Khouribga

3.10 ́etat de sinistre par bien assur ́e et par client

```
Nous allons extraire le tableau de bord utilisant la requˆete SQL suivante :
```
SELECT ‘dbienassure‘.‘nomBienAssure‘, ‘sinistre‘.‘etat‘,
‘dclient‘.‘prenom‘
FROM ‘dwall‘.‘dfact-sinistre‘ AS ‘dfact-sinistre‘,
‘dwall‘.‘sinistre‘ AS ‘sinistre‘,
‘dwall‘.‘dbienassure‘ AS ‘dbienassure‘,
‘dwall‘.‘dclient‘ AS ‘dclient‘
WHERE ‘dfact-sinistre‘.‘sinistre_idsinistre‘ = ‘sinistre‘.‘idsinistre‘
AND ‘dfact-sinistre‘.‘dbienAssure_idbienAssure‘ = ‘dbienassure‘.‘idbienAssure‘
AND ‘dfact-sinistre‘.‘dclient_idclient‘ = ‘dclient‘.‘idclient‘
GROUP BY ‘dbienassure‘.‘nomBienAssure‘, ‘dclient‘.‘prenom‘
LIMIT 200

Cette requˆete a trois outputs pr ́enom de client, bien assur ́e et l’ ́etat de si-
nistre. Nous allons glisser ces colonnes vers l’espace de travail pour les visua-
liser

```
Figure56 – requˆete SQL
```
Apr`es l’ex ́ecution, les figures ci-dessous montrent les r ́esultats de cette requˆete
SQL.


3 ENTREPOT DE DONNˆ EE ́ ENSA Khouribga

```
Figure57 – R ́esultat de la requˆete SQL
```
3.11 Montant police et paiement par mois

```
Nous allons extraire le tableau de bord utilisant la requˆete SQL suivante :
```
SELECT ‘ddate‘.‘mois‘, ‘dfact‘.‘monant‘,
‘dfact-sinistre‘.‘paiement‘
FROM ‘dwall‘.‘dfact‘ AS ‘dfact‘,
‘dwall‘.‘ddate‘ AS ‘ddate‘,
‘dwall‘.‘dpolice‘ AS ‘dpolice‘,
‘dwall‘.‘dfact-sinistre‘ AS ‘dfact-sinistre‘
WHERE ‘dfact‘.‘iddate‘ = ‘ddate‘.‘iddate‘
AND ‘dfact‘.‘table1_idnote‘ = ‘dpolice‘.‘idnote‘
AND ‘dfact-sinistre‘.‘ddate_iddate‘ = ‘ddate‘.‘iddate‘
AND ‘dfact-sinistre‘.‘dpolice_idnote‘ = ‘dpolice‘.‘idnote‘
group by ‘ddate‘.‘mois‘
ORDER BY ‘ddate‘.‘mois‘ ASC

Cette requˆete a trois outputs mois, montant et paiement. Nous allons glisser
ces colonnes vers l’espace de travail pour les visualiser


3 ENTREPOT DE DONNˆ EE ́ ENSA Khouribga

```
Figure58 – requˆete SQL
```
Apr`es l’ex ́ecution, les figures ci-dessous montrent les r ́esultats de cette requˆete
SQL.

```
Figure59 – R ́esultat de la requˆete SQL
```

3 ENTREPOT DE DONNˆ EE ́ ENSA Khouribga

3.12 Montant police et paiement par mois avec le ratio

Nous allons extraire le tableau de bord utilisant la requˆete SQL suivante,
consid ́eronsla ratio = montant de police / paiement de sinistre:

SELECT CAST(‘dfact-sinistre‘.‘paiement‘/‘dfact‘.‘monant‘
AS decimal(10,2)) AS result ,
‘ddate‘.‘mois‘, ‘dfact‘.‘monant‘, ‘dfact-sinistre‘.‘paiement‘
FROM ‘dwall‘.‘dfact‘ AS ‘dfact‘, ‘dwall‘.‘ddate‘ AS ‘ddate‘,
‘dwall‘.‘dpolice‘ AS ‘dpolice‘,
‘dwall‘.‘dfact-sinistre‘ AS ‘dfact-sinistre‘
WHERE ‘dfact‘.‘iddate‘ = ‘ddate‘.‘iddate‘
AND ‘dfact‘.‘table1_idnote‘ = ‘dpolice‘.‘idnote‘
AND ‘dfact-sinistre‘.‘ddate_iddate‘ = ‘ddate‘.‘iddate‘
AND ‘dfact-sinistre‘.‘dpolice_idnote‘ = ‘dpolice‘.‘idnote‘
group by ‘ddate‘.‘mois‘
ORDER BY ‘ddate‘.‘mois‘ ASC
LIMIT 200

Cette requˆete a trois outputs mois, montant , paiement et le ratio. Nous
allons glisser ces colonnes vers l’espace de travail pour les visualiser

```
Figure60 – requˆete SQL
```
Apr`es l’ex ́ecution, les figures ci-dessous montrent les r ́esultats de cette requˆete
SQL.


3 ENTREPOT DE DONNˆ EE ́ ENSA Khouribga

```
Figure61 – R ́esultat de la requˆete SQL
```
3.13 Ratio par note et type de risque

Nous allons extraire le tableau de bord utilisant la requˆete SQL suivante,
consid ́eronsla ratio = montant de police / paiement de sinistre:

SELECT CAST(‘dfact-sinistre‘.‘paiement‘/‘dfact‘.‘monant‘ as decimal(10,2))
as result , ‘drisque‘.‘type_risque‘, ‘dpolice‘.‘note‘
FROM ‘dwall‘.‘dfact-sinistre‘
AS ‘dfact-sinistre‘, ‘dwall‘.‘dpolice‘ AS ‘dpolice‘,
‘dwall‘.‘drisque‘ AS ‘drisque‘, ‘dwall‘.‘dfact‘ AS ‘dfact‘
WHERE ‘dfact-sinistre‘.‘dpolice_idnote‘ = ‘dpolice‘.‘idnote‘
AND ‘dfact-sinistre‘.‘drisque_idrisques‘ = ‘drisque‘.‘idrisques‘
AND ‘dfact‘.‘risques_idrisques‘ = ‘drisque‘.‘idrisques‘
AND ‘dfact‘.‘table1_idnote‘ = ‘dpolice‘.‘idnote‘
GROUP BY ‘drisque‘.‘type_risque‘ , ‘dpolice‘.‘note‘ LIMIT 200

Cette requˆete a trois outputs note, type de risque et le ratio. Nous allons
glisser ces colonnes vers l’espace de travail pour les visualiser


3 ENTREPOT DE DONNˆ EE ́ ENSA Khouribga

```
Figure62 – requˆete SQL
```
Apr`es l’ex ́ecution, les figures ci-dessous montrent les r ́esultats de cette requˆete
SQL.

```
Figure63 – R ́esultat de la requˆete SQL
```

3 ENTREPOT DE DONNˆ EE ́ ENSA Khouribga

3.14 Taille disque des tables de faits

Nous allons consid ́erer une seule police par client, et un seul agent par
bien couvert, nous obtenons pour la table de faitpolice
Nombre d’enregistrement : 2 000 000 (nb polices) x 10 (biens) x (36 mois) =
720 millions
Pour chaque enregistrement, 11 champs de 8 octets, soit :
720 millions x 11 x 8 = (environ) 64 Giga-octets
Pour la table de faitSinistre:
Nombre d’enregistrement : 720 millions x 5% = 36 millions
Taille total : 36 millions x 9 (champs) x 8 (octets) = (environ) 2.6 Giga-Octets

3.15 Les dimensions conformes

Nous parlons de dimension conforme ou partag ́ee lorsque la dimension est
utilis ́ee par les faits de plus qu’un data mart.
Alors pour notre cas, les dimensions conformes sont :

1. client
2. risque
3. police
4. bien assur ́e
5. op ́erateur
6. date
