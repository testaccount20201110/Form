<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>お問い合わせ完了|お問い合わせ|研修課題１．フォームの作成</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="bootstrap.css"
	rel="stylesheet">
<style type="text/css">
body {
	padding-top: 60px;
	padding-bottom: 40px;
}

.pagination .active a {
	background-color: #468847;
	color: white;
}

.dl-horizontal {
	margin-left: 20px;
}

.dl-horizontal dt, .dl-horizontal dd {
	line-height: 2em;
	font-size: medium;
}
</style>

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- Le fav and touch icons -->
<link rel="shortcut icon" href="../ico/favicon.ico">
</head>

<body>
	<% session.invalidate(); %>
	<div class="container">
		<div class="hero-unit">
			<h2>お問い合わせ</h2>
			<div>研修課題１．フォームの作成</div>
			<div class="pagination">
				<ul>
					<li class="disabled"><a href="#">お問い合わせ記入</a></li>
					<li class="disabled"><a href="#">入力内容の確認</a></li>
					<li class="active"><a href="#">お問い合わせ完了</a></li>
				</ul>
			</div>
		</div>
		<div class="well">
			<p>お問い合わせありがとうございました。</p>
			<a class="btn" href="./index.jsp">フォームへ</a>
		</div>
		<footer>
			<p>&copy; Seraku Co.,Ltd. 2012</p>
		</footer>

	</div>
	<!-- /container -->
</body>
</html>
