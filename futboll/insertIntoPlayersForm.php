<html>
<head>
    <meta charset="utf-8">
    <meta name="keywords" content="Лабораторна робота, MySQL, з'єднання з базою даних">
    <meta name="description" content="Лабораторна робота. З'єднання з базою даних">
    <title>Вставка даних</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <?php
        include("showPlayers.php")    
    ?>

    <form action="insertIntoPlayers.php" method="post">
        <label>ІД гравця</label><input name="PlayersID" type="int"><br>
        <label>ПІБ</label><input name="PlayerName" type="text"><br>
        <label>Номер</label><input name="Number" type="number"><br>

        <label>ІД футклубу</label><input name="IDfutclub" type="int"><br>
        

        <input type="submit" value="Вставити рядок">
    </form>

</body>
</html>
