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

<form action="updatePlayers.php" method="post">
        <label>ІД рядка який змінюємо</label><input name="PlayersID" type="int"><br>
        <label>Нове значення ПІБ</label><input name="PlayerName" type="text"><br>
        <label>Нове значення Номер</label><input name="Number" type="number"><br>
        
        <input type="submit" value="Змінюємо рядок">
</form>

</body>
</html>