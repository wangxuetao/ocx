<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
	
	<body>
		<div class="page-full">
		<!--header start-->
		<jsp:include page="/page/common/head.jsp" flush="true"/>
		<!--header end-->
		
		<!--content start-->
		<div class="content">
			<div class="section">
				<div class="section-box">
					<div class="open-wrap">
						<div id="oldDiv" class="form-item">
							<div class="input-item">
								<label>旧登录密码</label>
								<input id="oldPwd" type="text" placeholder="请输入旧登录密码" name="mobile-name" />							
								<i class="icon-clear"></i>
							</div>
							<p class="error-tip">
								旧登录密码，请重新输入
							</p>
						</div>
						<div id="newDiv" class="form-item reset-box">
							<div class="input-item">
								<label>新登录密码</label>
								<input id="newpwd" type="password" placeholder="请输入新登录密码" name="password" maxlength="8" />					
							</div>
							<p class="error-tip">
								旧登录密码，请重新输入
							</p>
						</div>
						<div id="reNewDiv" class="form-item">
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
					<input type="button" class="btn" id="submit" value="确认修改">
				</div>
			</div>
		</div>
		<!--content end-->
		
		<!--footer start-->
		<jsp:include page="/page/common/foot.jsp" flush="true"/>
		<!--footer end-->
		
		<div class="page-cover tip-dialog">
			<div class="dialog-wrap">
				<div id="msgDiv" class="dialog-content">
					<p><img src="/images/success-img.png" /></p>
					<p>密码修改成功！</p>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="/js/common.js"></script>
		<script>
		var ok = true;
		
		$('#submit').on('click',function(){			
			if($(this).hasClass('disabled')){
				return false;
			}
			
			var oldPwd = $("#oldPwd").val();
			var newpwd = $("#newpwd").val();
			var reNewPwd = $("#reNewPwd").val();
			
			if("请输入旧登录密码" == oldPwd || "" == oldPwd) {
				$("#oldDiv").addClass("error");
				$("#oldDiv .error-tip").html("请输入旧密码");
				setTimeout(function(){
					$("#oldDiv").removeClass("error");
				}, 2000)
				return false;
			}
			
			if("请输入新登录密码" == newpwd || "" == newpwd) {
				$("#newDiv").addClass("error");
				$("#newDiv .error-tip").html("请输入新密码");
				setTimeout(function(){
					$("#newDiv").removeClass("error");
				}, 2000)
				return false;
			}
			
			if("请确认新登录密码" == reNewPwd || "" == reNewPwd) {
				$("#reNewDiv").addClass("error");
				$("#reNewDiv .error-tip").html("请输入确认密码");
				setTimeout(function(){
					$("#reNewDiv").removeClass("error");
				}, 2000)
				return false;
			}
			
			if(newpwd != reNewPwd) {
				$("#reNewDiv").addClass("error");
				$("#reNewDiv .error-tip").html("密码不一致，请重新输入");
				setTimeout(function(){
					$("#reNewDiv").removeClass("error");
				}, 2000)
				return false;
			}
			
			modifyPwd(oldPwd, newpwd, reNewPwd);
		});
		//清空当前输入框
		$('.icon-clear').on('click',function(){
			$(this).parents('.form-item').find('input').val('');
			$(this).parents('.form-item').removeClass('error');
			$('#submit').addClass('disabled');
		});
		
		function modifyPwd(oldPwd, newpwd, reNewPwd){			
			$.ajax({
               type: "POST",
               dataType: "json",
               url: "/userInfo/modifyPwd.html",
               data: "oldPwd="+oldPwd+"&newpwd="+newpwd+"&reNewPwd="+reNewPwd,
               success: function(data){
               		   if (data.success) {
               		   $("#msgDiv").html('<p><img src="/images/success-img.png" /></p><p>密码修改成功！</p>');
               		   	tioDialogShow($('.tip-dialog'),function(){window.location.href = '/toLogin.html';});
               		   } else {
               		   		$('#submit').removeClass("disabled");
               		   		$("#msgDiv").html('<p><img src="/images/failure-img.png" /></p><p>'+data.message+'</p>');
               		   		tioDialogShow($('.tip-dialog'));
               		   }
                       
                  }
            });
			
		}
		</script>
	</body>
</html>
