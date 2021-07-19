<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="otoiawase.Sanitizing"%>
<%@ page import="otoiawase.InputUtil"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<title>お問い合わせ記入|お問い合わせ|研修課題１．フォームの作成</title>
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
					<li class="active"><a href="#">お問い合わせ記入</a></li>
					<li class="disabled"><a href="#">入力内容の確認</a></li>
					<li class="disabled"><a href="#">お問い合わせ完了</a></li>
				</ul>
			</div>
			<div>
				下記のフォームに必要事項を記入して、
				<button class="btn btn-mini btn-primary">確認</button>
				ボタンを押してください。
			</div>
		</div>

		<!-- 初期値 -->
		<%
			String family_name = Sanitizing.htmlEscape(InputUtil.objToString(session.getAttribute("family_name")));
			String first_name = Sanitizing.htmlEscape(InputUtil.objToString(session.getAttribute("first_name")));
			String email = Sanitizing.htmlEscape(InputUtil.objToString(session.getAttribute("email")));
			String url = Sanitizing.htmlEscape(InputUtil.objToString(session.getAttribute("url")));
			String sex = Sanitizing.htmlEscape(InputUtil.objToString(session.getAttribute("sex")));
			if (sex.equals("") || sex == null) {
				sex = "男性";
			}
			String birth_year = Sanitizing.htmlEscape(InputUtil.objToString(session.getAttribute("birth_year")));
			String birth_month = Sanitizing.htmlEscape(InputUtil.objToString(session.getAttribute("birth_month")));
			String birth_day = Sanitizing.htmlEscape(InputUtil.objToString(session.getAttribute("birth_day")));
			String zip1 = Sanitizing.htmlEscape(InputUtil.objToString(session.getAttribute("zip1")));
			String zip2 = Sanitizing.htmlEscape(InputUtil.objToString(session.getAttribute("zip2")));
			String address = Sanitizing.htmlEscape(InputUtil.objToString(session.getAttribute("address")));
			String[] interests = (String[]) session.getAttribute("interests");
			String inq_kind = Sanitizing.htmlEscape(InputUtil.objToString(session.getAttribute("inq_kind")));
			String detail = Sanitizing.htmlEscape(InputUtil.objToString(session.getAttribute("detail")));
			ArrayList<String> errMsgArray = InputUtil.automaticCast(request.getAttribute("errMsgArray"));
			ArrayList<String> errMsgKind = InputUtil.automaticCast(request.getAttribute("errMsgKind"));
		%>

		<!-- エラー文の表示 -->
		<%
			if (request.getAttribute("errMsgArray") != null && request.getAttribute("errMsgKind") != null) {
				out.print("<div class=\"alert alert-error\">");
				if (errMsgArray != null && errMsgKind != null) {
					for (String str : errMsgArray) {
						out.print(str);
		%><br>
		<%
			}
				}
				out.print("</div>");
			}
		%>


		<form class="form-horizontal well" action="InputCheck" method="post">
			<fieldset>
				<div
					class="control-group <%=InputUtil.errKindFind(errMsgKind, "name")%>"
					bgcolor="#0f0">
					<label class="control-label">氏名<span
						class="badge badge-important">必須</span></label>
					<div class="controls">
						<input type="text" class="span3" placeholder="姓"
							name="family_name" maxlength=64 value=<%=family_name%>> <input
							type="text" class="span3" placeholder="名" name="first_name"
							maxlength=64 value=<%=first_name%>>
					</div>
				</div>
				<!-- <div class="control-group error">-->
				<div
					class="control-group <%=InputUtil.errKindFind(errMsgKind, "email")%>">
					<label class="control-label">メールアドレス<span
						class="badge badge-important">必須</span></label>
					<div class="controls">
						<input type="text" class="span6" placeholder="メールアドレス"
							name="email" maxlength=128 value=<%=email%>>
					</div>
				</div>
				<div
					class="control-group <%=InputUtil.errKindFind(errMsgKind, "url")%>">
					<label class="control-label">URL</label>
					<div class="controls">
						<input type="text" class="span6" placeholder="URL" name="url"
							maxlength=128 value=<%=url%>>
						<p class="help-block">※相互リンク希望の場合は必ず入力してください。</p>
					</div>
				</div>
				<div
					class="control-group <%=InputUtil.errKindFind(errMsgKind, "sex")%>">
					<label class="control-label">性別<span
						class="badge badge-important">必須</span></label>
					<div class="controls">
						<label class="radio"><input type="radio" id="sex_0"
							value="男性" name="sex"
							<%=InputUtil.initValue(sex, "男性", "checked")%>>男性</label> <label
							class="radio"><input type="radio" id="sex_1" value="女性"
							name="sex" <%=InputUtil.initValue(sex, "女性", "checked")%>>女性</label>
					</div>
				</div>
				<div
					class="control-group <%=InputUtil.errKindFind(errMsgKind, "birth")%>">
					<label class="control-label">生年月日<span
						class="badge badge-important">必須</span></label>
					<div class="controls">
						<input type="text" class="span1" placeholder="西暦"
							name="birth_year" maxlength=4 value=<%=birth_year%>> 年 <select
							class="span1" name="birth_month">
							<option <%=InputUtil.initValue(birth_month, "1", "selected")%>>1</option>
							<option <%=InputUtil.initValue(birth_month, "2", "selected")%>>2</option>
							<option <%=InputUtil.initValue(birth_month, "3", "selected")%>>3</option>
							<option <%=InputUtil.initValue(birth_month, "4", "selected")%>>4</option>
							<option <%=InputUtil.initValue(birth_month, "5", "selected")%>>5</option>
							<option <%=InputUtil.initValue(birth_month, "6", "selected")%>>6</option>
							<option <%=InputUtil.initValue(birth_month, "7", "selected")%>>7</option>
							<option <%=InputUtil.initValue(birth_month, "8", "selected")%>>8</option>
							<option <%=InputUtil.initValue(birth_month, "9", "selected")%>>9</option>
							<option <%=InputUtil.initValue(birth_month, "10", "selected")%>>10</option>
							<option <%=InputUtil.initValue(birth_month, "11", "selected")%>>11</option>
							<option <%=InputUtil.initValue(birth_month, "12", "selected")%>>12</option>
						</select> 月 <select class="span1" name="birth_day">
							<option <%=InputUtil.initValue(birth_day, "1", "selected")%>>1</option>
							<option <%=InputUtil.initValue(birth_day, "2", "selected")%>>2</option>
							<option <%=InputUtil.initValue(birth_day, "3", "selected")%>>3</option>
							<option <%=InputUtil.initValue(birth_day, "4", "selected")%>>4</option>
							<option <%=InputUtil.initValue(birth_day, "5", "selected")%>>5</option>
							<option <%=InputUtil.initValue(birth_day, "6", "selected")%>>6</option>
							<option <%=InputUtil.initValue(birth_day, "7", "selected")%>>7</option>
							<option <%=InputUtil.initValue(birth_day, "8", "selected")%>>8</option>
							<option <%=InputUtil.initValue(birth_day, "9", "selected")%>>9</option>
							<option <%=InputUtil.initValue(birth_day, "10", "selected")%>>10</option>
							<option <%=InputUtil.initValue(birth_day, "11", "selected")%>>11</option>
							<option <%=InputUtil.initValue(birth_day, "12", "selected")%>>12</option>
							<option <%=InputUtil.initValue(birth_day, "13", "selected")%>>13</option>
							<option <%=InputUtil.initValue(birth_day, "14", "selected")%>>14</option>
							<option <%=InputUtil.initValue(birth_day, "15", "selected")%>>15</option>
							<option <%=InputUtil.initValue(birth_day, "16", "selected")%>>16</option>
							<option <%=InputUtil.initValue(birth_day, "17", "selected")%>>17</option>
							<option <%=InputUtil.initValue(birth_day, "18", "selected")%>>18</option>
							<option <%=InputUtil.initValue(birth_day, "19", "selected")%>>19</option>
							<option <%=InputUtil.initValue(birth_day, "20", "selected")%>>20</option>
							<option <%=InputUtil.initValue(birth_day, "21", "selected")%>>21</option>
							<option <%=InputUtil.initValue(birth_day, "22", "selected")%>>22</option>
							<option <%=InputUtil.initValue(birth_day, "23", "selected")%>>23</option>
							<option <%=InputUtil.initValue(birth_day, "24", "selected")%>>24</option>
							<option <%=InputUtil.initValue(birth_day, "25", "selected")%>>25</option>
							<option <%=InputUtil.initValue(birth_day, "26", "selected")%>>26</option>
							<option <%=InputUtil.initValue(birth_day, "27", "selected")%>>27</option>
							<option <%=InputUtil.initValue(birth_day, "28", "selected")%>>28</option>
							<option <%=InputUtil.initValue(birth_day, "29", "selected")%>>29</option>
							<option <%=InputUtil.initValue(birth_day, "30", "selected")%>>30</option>
							<option <%=InputUtil.initValue(birth_day, "31", "selected")%>>31</option>
						</select> 日
					</div>
				</div>
				<div
					class="control-group <%=InputUtil.errKindFind(errMsgKind, "zip")%>">
					<label class="control-label">郵便番号<span
						class="badge badge-important">必須</span></label>
					<div class="controls">
						<input type="text" class="span1" placeholder="" name="zip1"
							maxlength=3 value=<%=zip1%>> - <input type="text"
							class="span1" placeholder="" name="zip2" maxlength=4
							value=<%=zip2%>>
					</div>
				</div>
				<div
					class="control-group <%=InputUtil.errKindFind(errMsgKind, "address")%>">
					<label class="control-label">住所</label>
					<div class="controls">
						<input type="text" class="span6" placeholder="住所" name="address"
							maxlength=128 value=<%=address%>>
					</div>
				</div>
				<div
					class="control-group <%=InputUtil.errKindFind(errMsgKind, "interests")%>">
					<label class="control-label">興味があること</label>
					<div class="controls">
						<label class="checkbox inline"> <input type="checkbox"
							id="inlineCheckbox1" value="PC" name="interest"
							<%=InputUtil.initValue(interests, "PC", "checked")%>> PC
						</label> <label class="checkbox inline"> <input type="checkbox"
							id="inlineCheckbox2" value="インターネット" name="interest"
							<%=InputUtil.initValue(interests, "インターネット", "checked")%>>
							インターネット
						</label> <label class="checkbox inline"> <input type="checkbox"
							id="inlineCheckbox3" value="就職" name="interest"
							<%=InputUtil.initValue(interests, "就職", "checked")%>> 就職
						</label> <label class="checkbox inline"> <input type="checkbox"
							id="inlineCheckbox4" value="音楽" name="interest"
							<%=InputUtil.initValue(interests, "音楽", "checked")%>> 音楽
						</label> <label class="checkbox inline"> <input type="checkbox"
							id="inlineCheckbox5" value="スポーツ" name="interest"
							<%=InputUtil.initValue(interests, "スポーツ", "checked")%>>
							スポーツ
						</label>
						<p class="help-block">※1つ以上を選択してください。</p>
					</div>
				</div>
				<div
					class="control-group <%=InputUtil.errKindFind(errMsgKind, "inq_kind")%>">
					<label class="control-label">内容<span
						class="badge badge-important">必須</span></label>
					<div class="controls">
						<select class="span3" name="inq_kind">
							<option <%=InputUtil.initValue(inq_kind, "相互リンク希望", "selected")%>>相互リンク希望</option>
							<option <%=InputUtil.initValue(inq_kind, "資料請求", "selected")%>>資料請求</option>
							<option <%=InputUtil.initValue(inq_kind, "その他", "selected")%>>その他</option>
						</select>
					</div>
				</div>
				<div
					class="control-group <%=InputUtil.errKindFind(errMsgKind, "detail")%>">
					<label class="control-label" for="textarea">詳細<span
						class="badge badge-important">必須</span></label>
					<div class="controls">
						<textarea class="span6" id="textarea" rows="5" name="detail"><%=detail%></textarea>
					</div>
				</div>
				<div class="form-actions">
					<button type="submit" class="btn btn-primary btn-large">確認</button>
					<a type="button" class="btn btn-large"
						onClick=<%session.invalidate();%> href="./index.jsp">リセット</a>
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
