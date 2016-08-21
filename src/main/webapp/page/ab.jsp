<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>柜台开户</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />	
	<link rel="stylesheet" type="text/css" href="/css/base.css" />
	<link rel="stylesheet" type="text/css" href="/css/common.css" />
	<link rel="stylesheet" type="text/css" href="/css/globle.css" />
		<script src="js/jquery.min.js"></script>
	</head>
	<body>
		<div class="page-full">
		<!--header start-->
		<div class="header">
			<div class="container">
				<div href="javascript:void(0);" class="float-right icon-menu">
					<ul>
						<li><a href="/toPwd.html">修改密码</a></li>
						<li class="exit-user"><a href="javascript:void(0);">退出账户</a></li>
					</ul>
				</div>
				<span class="float-right icon-user">${sessionScope.login_username}</span>
				<a href="user.html" class="float-right">首页</a>
				<div class="logo"><div class="logo-img"></div></div>
			</div>
		</div>
		<!--header end-->
		
		<!--content start-->
		<div class="content">
			<div class="section">
				<div class="section-box">
					<div class="open-wrap">
						<div class="form-item">
							<div class="input-item">
								<label>旧登录密码</label>
								<input id="oldPwd" type="text" placeholder="请输入旧登录密码" name="mobile-name" />							
								<i class="icon-clear"></i>
							</div>
							<p class="error-tip">
								旧登录密码，请重新输入
							</p>
						</div>
						<div class="form-item reset-box">
							<div class="input-item">
								<label>新登录密码</label>
								<input id="newpwd" type="password" placeholder="请输入新登录密码" name="password" maxlength="8" />					
							</div>
						</div>
						<div class="form-item error">
							<div class="input-item">
								<label>确认新登录密码</label>
								<input id="reNewPwd" type="password" placeholder="请确认新登录密码" name="password-again" maxlength="8" />							
								<i class="icon-clear"></i>
							</div>
							<p class="error-tip">
							</p>
						</div>
					</div>									
				</div>				
				<div class="submit-btn">
					<a href="javascript:void(0);" class="btn disabled" id="submit">确认修改</a>
				</div>
			</div>
		</div>
		<!--content end-->
		
		<!--footer start-->
		<div class="footer">
			<p>江苏大圆银泰商品合约交易市场版权所有，增值电信业务经营许可证：苏B1-20130063 苏B2-20130224</p>
			<p>Copyright @ 2015 JSDYYT ALL Rights Reservsd. 苏ICP备12006275号 </p>
		</div>
		<!--footer end-->
		
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
		
		<div class="page-cover tip-dialog">
			<div class="dialog-wrap">
				<div id="msgDiv" class="dialog-content">
					<p><img src="/images/success-img.png" /></p>
					<p>密码修改成功！</p>
				</div>
			</div>
		</div>
		
		<script type="text/javascript" src="js/common.js"></script>
		<script>
		var ok = true;
			//监控是否可提交		
		$('.section input').on('input focus blur',function(){
			ok = true;
			var input = $('.input-item input');
			for(var i=0;i<input.length;i++){
				if(input.eq(i).val().length<=0){
					ok = false;
				}
			}
			if(ok){
				$('#submit').removeClass('disabled');
			}else{
				$('#submit').addClass('disabled');
			}
		});	
		$('#submit').on('click',function(){			
			if($(this).hasClass('disabled')){
				return false;
			}
			
			modifyPwd();
		});
		//清空当前输入框
		$('.icon-clear').on('click',function(){
			$(this).parents('.form-item').find('input').val('');
			$(this).parents('.form-item').removeClass('error');
			$('#submit').addClass('disabled');
		});
		
		function modifyPwd(){			
			var oldPwd = $("#oldPwd").val();
			var newpwd = $("#newpwd").val();
			var reNewPwd = $("#reNewPwd").val();
			
			$.ajax({
               type: "POST",
               dataType: "json",
               url: "/modifyPwd.html",
               data: "oldPwd="+oldPwd+"&newpwd="+newpwd+"&reNewPwd="+reNewPwd,
               success: function(data){
               		   if (data.success) {
               		   $("#msgDiv").html('<p><img src="/images/success-img.png" /></p><p>密码修改成功！</p>');
               		   	tioDialogShow($('.tip-dialog'),function(){window.location.href = '/toLogin.html';});
               		   } else {
               		   		$("#msgDiv").html('<p><img src="/images/failure-img.png" /></p><p>'+data.message+'</p>');
               		   		tioDialogShow($('.tip-dialog'));
               		   }
                       
                  }
            });
			
		}
		
		</script>
	</body>
</html>
