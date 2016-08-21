<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>柜台开户</title>
	<meta name="keywords" content="大圆银泰商品合约交易市场有限公司 用户体验中心 UXC" />
	<meta name="description" content="大圆银泰商品合约交易市场有限公司 用户体验中心 UX"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
	<link rel="stylesheet" type="text/css" href="/css/base.css" />
	<link rel="stylesheet" type="text/css" href="/css/common.css" />
	<link rel="stylesheet" type="text/css" href="/css/globle.css" />
	<script src="js/jquery.min.js"></script>
</head>
<body>
	<!--logo-->	
	<div class="index-header">
		<div class="container"><div class="logo"></div></div>
	</div>
	<!--login start-->
	<div class="login-wrap">
		<div class="title">
			<div class="title-img"></div>
		</div>
		<div id="accountDiv" class="form-item">
			<div class="input-item">
				<input id="username" type="text" placeholder="请输入登录账号" name="userId" autocomplete="off" />
				<label>登录账号</label>
				<i class="icon-clear"></i>
				<ul class="drop-menu">
				</ul>
			</div>
			<p class="error-tip">
				账号错误，请确认再登录
			</p>
		</div>
		<div id="pwdDiv" class="form-item">
			<div class="input-item">
				<input id="pwd" type="password" placeholder="请输入登录密码" name="password" />
				<label>登录密码</label>
				<i class="icon-clear"></i>
			</div>
			<p class="error-tip">
				密码错误，请确认再登录
			</p>
		</div>
		<div id="codeDiv" class="form-item">
			<div class="input-item clearfix">
		        <img id="codeImage" src="/codeImage.html" class="code-img float-right" name="img-code" onclick="refImg();" />
				<input id="codeImg" type="text" placeholder="图片验证码" class="check float-left" />
				<label>图片验证码</label>
				<i class="icon-clear"></i>
			</div>
			<p class="error-tip">
				验证码错误，请确认再登录
			</p>
		</div>
		<div id="activityDiv" class="form-item">
			<div class="input-item">
				<input id="activityName" type="text" placeholder="营销活动" name="activity-name" />
				<label>营销活动</label>
				<i class="icon-clear"></i>
			</div>
			<p class="error-tip">
				营销活动填写错误，请确认再登录
			</p>
		</div>
		<div class="form-btn">
			<input type="submit" value="登录" class="btn" onclick="login()" />
		</div>
		<div class="tip-text">
			忘记密码？请联系管理员进行重置
		</div>
	</div>
	<!--login end-->
	<img src="/images/login0.jpg" class="login0" />
	<img src="/images/login1.jpg" class="login1" />
	<img src="/images/login2.jpg" class="login2" />

	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript">
		//监控账号输入，如有输入记录，显示记录
		$('input[name=userId]').on('focus', function() {
			if ($('.drop-menu li').length > 0) {
				$('.drop-menu').show();
			}
		});
		$('input[name=userId]').on('blur', function() {
			$('.drop-menu').fadeOut();
		});
		
		//输入框label动画
		$('.input-item input').on('focus', function() {
			$(this).parent().find('label').animate({
				'left' : '-100px'
			}, 250);
		});
		$('.input-item input').on('blur', function() {
			$(this).parent().find('label').animate({
				'left' : '0'
			}, 100);
		});

		function login(){			
			var username = $("#username").val();
			var pwd = $("#pwd").val();
			var codeImg = $("#codeImg").val();
			var activityName = $("#activityName").val();
			
			if("请输入登录账号" == username || "" == username) {
				$("#accountDiv").addClass("error");
				$("#accountDiv .error-tip").html("请输入账号");
				setTimeout(function(){
					$("#accountDiv").removeClass("error");
				}, 2000)
				return false;
			}
			
			if("请输入登录密码" == pwd || "" == pwd) {
				$("#pwdDiv").addClass("error");
				$("#pwdDiv .error-tip").html("请输入密码");
				setTimeout(function(){
					$("#pwdDiv").removeClass("error");
				}, 2000)
				return false;
			}
			
			if("图片验证码" == codeImg || "" == codeImg) {
				$("#codeDiv").addClass("error");
				$("#codeDiv .error-tip").html("请输入验证码");
				setTimeout(function(){
					$("#codeDiv").removeClass("error");
				}, 2000)
				return false;
			}
			
			if("营销活动" == activityName || "" == activityName) {
				$("#activityDiv").addClass("error");
				$("#activityDiv .error-tip").html("请输入验证码");
				setTimeout(function(){
					$("#activityDiv").removeClass("error");
				}, 2000)
				return false;
			}
			
			$.ajax({
               type: "POST",
               dataType: "json",
               url: "/login.html",
               data: "username="+username+"&pwd="+pwd+"&codeImg="+codeImg+"&activityName="+activityName,
               success: function(data){
               		   if (data.success) {
               		   	window.location.href = '/userInfo/toUser.html';
               		   } else {
               		   		alert(data.message);
               		   }
                  }
            });
			
		}
		
		function refImg() {
			document.getElementById("codeImage").src="/codeImage.html?"+new Date().getTime(); 
		}
	</script>
</body>
</html>
