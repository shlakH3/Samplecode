<?php session_start(); ?>

//セッション配列削除
<?php
unset($_SESSION['users']);

//MySQL接続
try{
    $pdo=new PDO('mysql:host=<Database-IP>;dbname=<Databasename>;charset=utf8', '<DB_Username>', '<DB_Password>');

//エラー表示
}catch(PDOException $e){
    echo $e->getMessage();
    exit();
}

//SQL問い合わせ
$sql=$pdo->prepare('select * from users where uname = ? and password = ? ');
$sql->execute([$_REQUEST['username'], $_REQUEST['password']]);


//SELECTで取得した情報をセッション配列に格納
foreach ($sql as $row) {
	$_SESSION['users']=[
		'id'=>$row['uid'], 'name'=>$row['uname'], 'password'=>$row['password']];
}

//認証
if ($_SESSION['users']['name'] == 'root') {
	header("Location:/<Directory>/<Filename>.php");

} elseif (($_SESSION['users']['name'])){
    header("Location:/<Directory>/<Filename>.php");
    exit();

}else{
	echo 'ログイン名またはパスワードが違います。';
}
?>
