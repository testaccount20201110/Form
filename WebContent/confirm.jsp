<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="otoiawase.Sanitizing"%>
<%@ page import="otoiawase.InputUtil"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>入力内容の確認|お問い合わせ|研修課題１．フォームの作成</title>
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
	<div class="container">
		<div class="hero-unit">
			<h2>お問い合わせ</h2>
			<div>研修課題１．フォームの作成</div>
			<div class="pagination">
				<ul>
					<li class="disabled"><a href="#">お問い合わせ記入</a></li>
					<li class="active"><a href="#">入力内容の確認</a></li>
					<li class="disabled"><a href="#">お問い合わせ完了</a></li>
				</ul>
			</div>
			<div>
				入力内容に間違いがなければ、
				<button class="btn btn-mini btn-primary">送信</button>
				ボタンを押してください。
			</div>
		</div>
		<form class="form-horizontal well" action="CSVFileWriter"
			method="post">
			<dl class="dl-horizontal">
				<dt>氏名</dt>
				<dd><%=Sanitizing.htmlEscape((String) session.getAttribute("family_name"))%>
					<%=Sanitizing.htmlEscape((String) session.getAttribute("first_name"))%></dd>
				<dt>メールアドレス</dt>
				<dd><%=Sanitizing.htmlEscape((String) session.getAttribute("email"))%></dd>
				<dt>URL</dt>
				<dd>
					<%
						if (!session.getAttribute("url").equals("")) {
							out.print(Sanitizing.htmlEscape((String) session.getAttribute("url")));
						} else {
							out.print("　");
						}
					%>
				</dd>
				<dt>性別</dt>
				<dd><%=Sanitizing.htmlEscape((String) session.getAttribute("sex"))%></dd>
				<dt>生年月日</dt>
				<dd><%=Sanitizing.htmlEscape(InputUtil.firstZeroDelete((String) session.getAttribute("birth_year")))
					+ "年" + Sanitizing.htmlEscape((String) session.getAttribute("birth_month")) + "月"
					+ Sanitizing.htmlEscape((String) session.getAttribute("birth_day")) + "日"%></dd>
				<dt>郵便番号</dt>
				<dd><%=Sanitizing.htmlEscape((String) session.getAttribute("zip1")) + "-"
					+ Sanitizing.htmlEscape((String) session.getAttribute("zip2"))%></dd>
				<dt>住所</dt>
				<dd>
					<%
						if (!session.getAttribute("address").equals("")) {
							out.print(Sanitizing.htmlEscape((String) session.getAttribute("address")));
						} else {
							out.print("　");
						}
					%>
				</dd>
				<dt>興味があること</dt>
				<dd><%=Sanitizing.htmlEscape((String) session.getAttribute("interest"))%></dd>
				<dt>内容</dt>
				<dd><%=Sanitizing.htmlEscape((String) session.getAttribute("inq_kind"))%></dd>
				<dt>詳細</dt>
				<dd><%=Sanitizing.htmlEscape((String) session.getAttribute("detail"))%></dd>
			</dl>
			<fieldset>
				<div class="form-actions">
					<button type="submit" class="btn btn-primary btn-large">送信</button>
					<a class="btn btn-large" href="./index.jsp">戻る</a>
				</div>
			</fieldset>
		</form>
		<footer>
			<p>&copy; Seraku Co.,Ltd. 2012</p>
		</footer>

	</div>
	<!-- /container -->
</body>
</html>
