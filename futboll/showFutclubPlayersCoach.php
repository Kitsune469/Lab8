<html>
<head>
    <meta charset="utf-8">
    <meta name="keywords" content="Лабораторна робота, MySQL, з'єднання з базою даних">
    <meta name="description" content="Лабораторна робота. З'єднання з базою даних">
    <title>Таблиця Players</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Таблиця Players</h1>


    <?php

    $mysqli = new mysqli('localhost', 'root', '', 'futinfo'); // Створюємо нове підключення з назвою $mysqli за допомогою створення об'єта класу mysqli. Параметри підключення по порядку: сервер, логін, пароль, БД
    $mysqli->set_charset("utf8"); // Встановлюємо кодування utf8
    
    if (mysqli_connect_errno()) {
    printf("Підключення до сервера не вдалось. Код помилки: %s\n", mysqli_connect_error());
    exit;
    }

    /* Надсилаємо запит серверу */
    if($result = $mysqli->query('SELECT g.Clubname, COUNT(s.IDfutclub) as "kilk_player" FROM futclub AS g LEFT JOIN players AS s ON g.IDfutclub = s.IDfutclub GROUP BY s.IDfutclub ')) {   // $mysqli - наш об'єкт, через який здійснюємо підключення, query - метод, який дозволяє виконати довільний запит

        printf("<h3>Звіт - Кількість гравців в командах:  </h3><br>");   // <br> в html - розрив рядка
        printf("<table><tr><th>Назва команди</th><th>Кількість гравців</th></tr>");   // <br> в html - розрив рядка
        /* Вибірка результатів запиту  */
        while( $row = $result->fetch_assoc() ){ // fetch_assoc() повертає рядок із запиту у вигляді асоціативного масиву, наприклад $row = ['id'=>'1', 'pib'=>'Олександр', 'grupa'=>'ІПЗ-31']
            printf("<tr><td>%s</td><td>%s</td></tr>", $row['Clubname'], $row['kilk_player']); //виводимо результат на сторінку
        };
        printf("</table>");
        /*Звільняємо пам'ять*/
        $result->close();
    }

    /*Закриваємо з'єднання*/
    $mysqli->close();
    ?>

    <br><br><br>

    <ul>
        <li><a href="showPlayers.php">Таблиця Players</a><br></li>
        <li><a href="showFutclub.php">Таблиця Futclub</a><br></li>
        <li><a href="showCoach.php">Таблиця Coach</a><br></li>
        <li><a href="index.html">На головну</a><br></li>
    </ul>
    
</body>
</html>
