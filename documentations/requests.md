# Comminication vers l'API

## Sommaire
* Résumé
* Client
* Serveur
* Méthodes
* Collections
	* Collection: /friends/
	* Collection: /u/
	* Collection: /pos/
	* Collection: /config/

# Résumé
* Les messages envoyé à l'API sera sous:
	* `application/x-www-form-urlencoded`: pour l'envoi de text (converti en ASCII)
	* `multipart/form-data`: pour l'envoi de données tel quel, utilisé pour l'envoi de fichier.
* L'intéraction avec l'API se fera en **REST**.
* Les réponse de l'API sera en **JSON**.

# Client
L'application envera des message sous la forme:<br>
*URL encoded data, example:*
```plain
fname=john&lname=doe&email=john.doe%40protonmail.ch&message=hello+you
```
> Note: les données envoyé diffère suivant la ressource distante.

# Serveur
L'API répondra en JSON, sous la forme:
```json
{
	"e": 0,
	"c": 0,
	"data": {}
}
```
> Note:
> * **e**: (*int*) indique le code d'erreur.
> * **c**: (*int*) indique le code de résultat de l'appel (si non `e`).
> * **data**: (*multi*) les données (si non `e` ; optionnel).

# Méthodes
Les méthodes HTTP utilisé seront:

* `DELETE`	: supprime des (ressources|informations|méta-données|fichiers).
* `GET`		: (récupère|liste) des (ressources|informations|méta-données|fichiers).
* `HEAD`	: récupère les informations d'un(e) (ressource|fichier).
* `POST`	: envoi des (informations|méta-données).
* `PUT`		: (créer|met à jour) un fichier.

# Collections
> Note:
> * **/friends/**	: collection des relations d'amis.<br>
> * **/u/**			: collection des utilisateurs.<br>
> * **/pos/**		: collection des positions.<br>
> * **/conf/**		: collection des configuration.

## Collection: /friends/
* **GET** :
	* /friends		: récupère la liste des amis de l'utilisateur actuellement connecté.
	* /friends/*[id-user]*	: test si l'utilisateur actuellement connecté est ami avec `[id-user]`.
		* 200:oui, 404: non.
* **POST** :
	* /friends/*[id-user]*	: créer une demande d'ami à `[id-user]`.
* **DELETE** :
	* /friends/*[id-user]*	: supprime la relations avec `[id-user]`.

## Collection: /u/
* **GET** :
	* /u/*?search*		: liste les méta-données des utilisateurs, trouvé après une recherche en base via `search=...`.
		* 404: aucun résultat.
	* /u/*?search&n*	: pagination à la position `n`.
		* 404: aucun résultat.
	* /u/*[id-user]*	: liste les méta-données de l'utilisateur `[id-user]`.
		* 404: l'utilisateur `[id-user]` n'exist pas.
	* /u/me :
		* liste les méta-données de l'utilisateur actuellement connecté.
		* si la session existe, alors: 200, sinon: 404.
* **POST** :
	* /u/				: créer un utilisateur.
	* /u/me :
		* met à jour les méta-données de l'utilisateur actuellement connecté.
		* ou, connecte l'utilisateur, si l'authentification échoue, alors: 404, sinon: 200.

## Collection: /pos/
* **GET** :
	* /pos/					: récupère la position de l'utilisateur actuellement connecté.
	* /pos/friends			: récupère les positions des amis de l'utilisateur actuellement connecté.
	* /pos/friends/*[n]*	: pagination à la position `[n]`.
	* /pos/*[id-user]*		: récupère la position de l'utilisateur `[id-user]`.
* **POST** :
	* /pos/					: met à jour la position de l'utilisateur actuellement connecté.

## Collection: /config/
> TODO: à définir.