<html>
<head>
<META http-equiv="content-type" content="text/html; charset=UTF-8">
<title>PHP CURD by LeCheng</title>
<style>
body {
	text-align: center;
}

ul {
	background: gray;
	width: 100%;
	padding: 20px;
	-webkit-perspective: 200;
}

li {
	list-style: none;
	height: 50px;
	width: 100px;
	padding: 0;
	margin: 0;
	display: inline-block;
	background: white;
	border-radius: 2px;
}

.anim {
	animation: anim 1s infinite;
	width: 100px;
	margin-left: -100px;
	background: white
}

@
keyframes anim {to { transform:rotateY(-360deg);
	
}

}
.anim2 {
	animation: anim2 1s infinite;
	width: 100px;
	margin-left: -100px;
	background: white
}

@
keyframes anim2 { 25% {
	transform: rotateY(0deg);
}

to {
	transform: rotateY(-360deg);
}

#animated_div {
	width: 76px;
	height: 47px;
	background: #92B901;
	color: #ffffff;
	position: relative;
	font-weight: bold;
	font-size: 20px;
	padding: 10px;
	animation: animated_div 5s 1;
	-moz-animation: animated_div 5s 1;
	-webkit-animation: animated_div 5s 1;
	-o-animation: animated_div 5s 1;
	border-radius: 5px;
	-webkit-border-radius: 5px;
}

	style.css ?v=1.09: 10
	a, abbr, address, blockquote, body, caption, cite, code, dd, del, dfn,
	div, dl, dt, em, fieldset, form, h1, h2, h3, h4, h5, h6, html, iframe,
	img, ins, label, legend, li, object, ol, p, pre, q, small, span, strong,
	sub, sup, table, tbody, td, tfoot, th, thead, tr, ul {
	border: 0;
	margin: 0;
	padding: 0;
}
}
</style>
</head>
<body>
	<ul>
		<li>
		<li class="anim">
		<li class="anim2">
	</ul>
	<br />
	<div id="animated_div">
		CSS3<br>
		<span style="font-size:10px">动画</span>
	</div>
	<a href="http://www.jb51.net/article/69378.htm">http://www.jb51.net/article/69378.htm</a>
	<h1>PHP CURD by LeCheng</h1>
	<h1>List:</h1>
	<?php include 'list.php'; ?>
	<br />
	<h1>Insert:</h1>
	<form action="insert.php" method="post">
		username:<br> <input type="name" name="username" /> <br />
		password:<br> <input type="password" name="password" /> <br />
		text:<br> <input type="text" name="content" /> <input
			type="submit" value="submit" />
	</form>
	<br />
	<hr />
	<br />
	<h1>Delete</h1>
	<form action="delete.php" method="post">
		username:<br> <input type="name" name="username" /> <br /> Are
		you sure?<br> <input type="submit" value="sure" />
	</form>
	<br />
	<hr />
	<br />
	<h1>Update</h1>
	<form action="update.php" method="post">
		username:<br> <input type="name" name="username" /> <br /> You
		want to change your password into:<br> <input type="password"
			name="password" /> <input type="submit" value="submit" />
	</form>
	<br />
	<hr />
	<br />
</body>
</html>