お気に入りのアプリの中から AI を直接お試しください。 … Gemini を使用して下書きを生成したり、コンテンツの質を高めたりすることができます。さらに、Gemini Advanced では Google の次世代 AI にアクセスできます。1 か月間、￥2,900 ￥0
index.php
<!DOCTYPE html>
<html lang="ja">
  <head>
<link href="login.css" rel="stylesheet" />
<div class="login-container">
  </head>

  <meta charset="utf-8" />
  <title>Search</title>

  <body>
  <h1>ログイン</h1>
  <form action="output.php" method="post">
    <div class="form-group">
      <label for="username">ユーザー名</label>
      <input type="text" id="username" name="username" required>
    </div>
    
    <div class="form-group">
      <label for="password">パスワード</label>
      <input type="password" id="password" name="password" required>
    </div>
    
    <button type="submit">ログイン</button>
    <a href="/register/register_input.php">SignUp</a>
    <a href="/reset/reset.php">Resetpassword</a>
    </form>
  </div>
  </body>
</html>
