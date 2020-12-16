<?php

$mysqli = new mysqli('localhost', 'root', '', 'futinfo'); // Створюємо нове підключення з назвою $mysqli за допомогою створення об'єта класу mysqli. Параметри підключення по порядку: сервер, логін, пароль, БД
$mysqli->set_charset("utf8"); // Встановлюємо кодування utf8

if (mysqli_connect_errno()) {
    printf("Підключення до сервера не вдалось. Код помилки: %s\n", mysqli_connect_error());
    exit;
}

$id = $_POST['PlayersID']; $pib = $_POST['PlayerName'];  $nb = $_POST['Number'];
$if = $_POST['IDfutclub']; 

$sql = "INSERT INTO players (PlayersID,PlayerName, Number,IDfutclub) VALUES ('$id','$pib', '$nb', '$if' )";


if($mysqli->query($sql)){
    echo "Рядок вставлено успішно";
    }
else
    {
        echo "Error" . $sql . "<br/>" . $mysqli->error;
    }



/*Закриваємо з'єднання*/
$mysqli->close();

include("showPlayers.php")
?>
