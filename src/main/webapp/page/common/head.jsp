<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false"%>

		<meta charset="utf-8">
		<meta name="keywords" content="大圆银泰商品合约交易市场有限公司 用户体验中心 UXC" />
		<meta name="description" content="大圆银泰商品合约交易市场有限公司 用户体验中心 UX"/>
		<title>柜台开户</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />	
		<link rel="stylesheet" type="text/css" href="/css/base.css" />
		<link rel="stylesheet" type="text/css" href="/css/common.css" />
		<link rel="stylesheet" type="text/css" href="/css/globle.css" />
		<script src="/js/jquery.min.js"></script>
		<script type="text/javascript" src="/js/common.js"></script>
		
		<!--header start-->
		<div class="header">
			<div class="container">
				<div href="javascript:void(0);" class="float-right icon-menu">
					<ul>
						<li><a href="/userInfo/toPwd.html">修改密码</a></li>
						<li class="exit-user"><a href="/userInfo/logout.html">退出账户</a></li>
					</ul>
				</div>
				<span class="float-right icon-user">${sessionScope.login_username}</span>
				<a href="user.html" class="float-right">首页</a>
				<div class="logo"><div class="logo-img"></div></div>
			</div>
		</div>
		<!--header end-->
		
		<div class="page-cover exit-dialog">
			<div class="dialog-wrap">
				<i class="icon-close"></i>
				<div class="dialog-content">
					<div class="img">
						<img src="/images/warning.png" />
					</div>
					<div class="text">
						确实要退出当前账户吗？
					</div>
					<div class="btn-box clearfix">
						<a href="javascript:dialogHide($('.exit-dialog'));" class="btn border float-right">取消</a><a class="btn float-left" href="index.html">退出</a>
					</div>
				</div>
			</div>
		</div>
		
		<script>
		</script>
