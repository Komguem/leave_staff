<?php

if(isset($_POST['reset_password'])) {
    // Récupérer l'email soumis dans le formulaire
    $email = $_POST['email'];

    // Générer un nouveau mot de passe aléatoire
    $new_password = generateRandomPassword(); // Fonction pour générer un mot de passe aléatoire

    // Crypter le nouveau mot de passe
    $hashed_password = password_hash($new_password, PASSWORD_DEFAULT);

    // Mettre à jour le mot de passe dans la base de données
    $sql = "UPDATE users SET password = :password WHERE email = :email";
    $query = $dbh->prepare($sql);
    $query->bindParam(':password', $hashed_password, PDO::PARAM_STR);
    $query->bindParam(':email', $email, PDO::PARAM_STR);
    $query->execute();

    // Envoyer le nouveau mot de passe par email
    $subject = "Réinitialisation de mot de passe";
    $message = "Votre nouveau mot de passe est : $new_password"; // Vous pouvez personnaliser ce message selon vos besoins
    $headers = "From: votreadresse@example.com";

    if(mail($email, $subject, $message, $headers)) {
        echo "<script>alert('Un nouveau mot de passe a été envoyé à votre adresse email. Veuillez vérifier votre boîte de réception.');</script>";
    } else {
        echo "<script>alert('Une erreur est survenue lors de l'envoi du nouveau mot de passe. Veuillez réessayer.');</script>";
    }
}

// Fonction pour générer un mot de passe aléatoire
function generateRandomPassword($length = 10) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $password = '';
    for ($i = 0; $i < $length; $i++) {
        $password .= $characters[rand(0, strlen($characters) - 1)];
    }
    return $password;
}
?>

<!-- Le reste de votre formulaire HTML pour saisir l'email de l'utilisateur -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Réinitialisation du mot de passe</title>
    <style>body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

.container {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
    margin-top: 0;
}

label {
    font-weight: bold;
}

input[type="email"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 3px;
    box-sizing: border-box;
}

input[type="submit"] {
    width: 100%;
    padding: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 3px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

p {
    margin-top: 20px;
    text-align: center;
}

a {
    color: #007bff;
}
</style>
</head>
<body>

<h2>Réinitialisation du mot de passe</h2>
<p>Veuillez saisir votre adresse email pour réinitialiser votre mot de passe.</p>

<form method="post" action="reset_password.php">
    <label for="email">Adresse Email:</label><br>
    <input type="email" id="email" name="email" required><br><br>

    <input type="submit" value="Envoyer le lien de réinitialisation">
</form>
<p>Retourner à la <a href="index.php">Page d'acceuil</a>.</p>
</body>
</html>
