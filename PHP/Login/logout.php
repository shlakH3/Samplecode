お気に入りのアプリの中から AI を直接お試しください。 … Gemini を使用して下書きを生成したり、コンテンツの質を高めたりすることができます。さらに、Gemini Advanced では Google の次世代 AI にアクセスできます。1 か月間、￥2,900 ￥0
logout.php
<?php session_start(); ?>

<?php
if (isset($_SESSION['users'])) {
    unset($_SESSION['users']);
    header('Location:/index.php');
    exit();
}else{
    header('refresh:5;Location:./index.php');
    echo "すでにログアウトしています";
    exit();
}
?>
