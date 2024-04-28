<?php

// Informations de connexion à la base de données
$serveur = "localhost";
$utilisateur = "root";
$motDePasseBDD = "";
$nomBDD = "leave_staff";

// Connexion à la base de données
$connexion = new mysqli($serveur, $utilisateur, $motDePasseBDD, $nomBDD);

// Vérifier la connexion
if ($connexion->connect_error) {
    die("La connexion à la base de données a échoué : " . $connexion->connect_error);
}

// Fonction pour changer le mot de passe
function changerMotDePasse($connexion, $email, $newPassword) {
    // Préparer la requête SQL pour mettre à jour le mot de passe
    $requete = $connexion->prepare("UPDATE tblemployees SET Password = ? WHERE EmailId = ?");

    // Vérifier si la requête est valide
    if ($requete === false) {
        die("Erreur lors de la préparation de la requête : " . $connexion->error);
    }

    // Liaison des paramètres et exécution de la requête
    $requete->bind_param("ss", $newPassword, $email);
    $resultat = $requete->execute();

    // Vérifier si la requête a réussi
    if ($resultat === false) {
        die("Erreur lors de l'exécution de la requête : " . $requete->error);
    } else {
        echo "Mot de passe changé avec succès pour l'Email $email";
    }

    // Fermer la requête
    $requete->close();
}

// Exemple d'utilisation de la fonction
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $email = $_POST["email"];
    $newPassword = md5($_POST["new_password"]);

    // Appeler la fonction pour changer le mot de passe
    changerMotDePasse($connexion, $email, $newPassword);
}

// Fermer la connexion à la base de données
$connexion->close();
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Changer le mot de passe</title>
    <style>body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}
form {
            margin-top: 20px;
            text-align: center; /* Centre le contenu du formulaire */
        }
p{
    margin-bottom: 20px;
    text-align: center;
}
.container {
    width: 400px;
    margin: 50px auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
    text-align: center;
    color: #333;
}

form {
    margin-top: 20px;
}

label {
    display: block;
    margin-bottom: 5px;
    color: #333;
}

input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

button[type="submit"] {
    background-color: #007bff;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
}

button[type="submit"]:hover {
    background-color: #0056b3;
}
</style>
</head>
<body>
    <h2>Changer le mot de passe</h2>
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
        <label for="email">Email :</label>
        <input type="text" id="email" name="email" required><br><br>
        
        <label for="new_password">Nouveau mot de passe :</label>
        <input type="password" id="new_password" name="new_password" required><br><br>
        
        <button type="submit">Changer le mot de passe</button>
    </form>
    <p>Retourner à la <a href="index.php">Page d'acceuil</a>.</p>
</body>
</body>
</html>
