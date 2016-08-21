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
		<div class="container content">		
			<div class="process"><img src="/images/process1.png" /></div>
			<div class="section">
				<div class="section-box">
					<div class="open-wrap">
						<div id="phoneDiv" class="form-item">
							<div class="input-item">
								<label>手机号码</label>
								<input id="phoneNum" type="text" placeholder="客户常用手机号码" name="mobile-name" />							
								<i class="icon-clear"></i>
							</div>
							<p class="error-tip">
								手机号码错误，请重新输入
							</p>
						</div>
						<div id="pwdDiv" class="form-item reset-box">
							<div class="input-item">
								<label>设置登录密码</label>
								<input id="pwd" type="password" placeholder="设置6~8位登录密码" name="password" maxlength="8" /><a href="javascript:void(0)"; class="reset">重置密码</a>					
							</div>
							<p class="error-tip">
								密码不一致，请重新输入
							</p>
						</div>
						<div id="rePwdDiv" class="form-item">
							<div class="input-item">
								<label>确认登录密码</label>
								<input id="rePwd" type="password" placeholder="确认6~8位登录密码" name="password-again" maxlength="8" />							
								<i class="icon-clear"></i>
							</div>
							<p class="error-tip">
								密码不一致，请重新输入
							</p>
						</div>
					</div>					
					<div class="error book-box">
						<div class="title">本人手持身份证及确认书</div>
						<div>
							<jsp:include page="/page/swf/camera.jsp" flush="true"/>
						</div>
						
						<div class="book-link">
							<span>阅读并打印</span><a href="/open/book.html" target="_blank">确认书</a>
						</div>
						<p id="photoError" class="hidden" style="color: #ff6000;">
								密码不一致，请重新输入
						</p>
						<div>
						</div>
					</div>					
				</div>				
				<div class="submit-btn">
					<input type="button" class="btn" id="submit" value="提交申请">
				</div>
			</div>
		</div>
		<!--content end-->
		
		<!--footer start-->
		<jsp:include page="/page/common/foot.jsp" flush="true"/>
		<!--footer end-->
	</div>
	
	<script type="text/javascript">
		var photoData = "";
	
		//重置密码
		$('.reset').on('click',function(){
			$('.form-item').removeClass('error');
			$('.form-item input[type=password]').val('');
		});
		
		//清空当前输入框
		$('.icon-clear').on('click',function(){
			$(this).parents('.form-item').find('input').val('');
			$(this).parents('.form-item').removeClass('error');
			$('#submit').addClass('disabled');
		});
		
		$('#submit').on('click',function(){			
			if($(this).hasClass('disabled')){
				return false;
			}
			
			var phoneNum = $("#phoneNum").val();
			var pwd = $("#pwd").val();
			var rePwd = $("#rePwd").val();
			
			if("" == phoneNum) {
				$("#phoneDiv").addClass("error");
				$("#phoneDiv .error-tip").html("请输入手机号码");
				setTimeout(function(){
					$("#phoneDiv").removeClass("error");
				}, 2000)
				return false;
			}
			
			if("" == pwd) {
				$("#pwdDiv").addClass("error");
				$("#pwdDiv .error-tip").html("请输入密码");
				setTimeout(function(){
					$("#pwdDiv").removeClass("error");
				}, 2000)
				return false;
			}
			
			if("" == rePwd) {
				$("#rePwdDiv").addClass("error");
				$("#rePwdDiv .error-tip").html("请输入确认密码");
				setTimeout(function(){
					$("#rePwdDiv").removeClass("error");
				}, 2000)
				return false;
			}
			
			if(pwd != rePwd) {
				$("#rePwdDiv").addClass("error");
				$("#rePwdDiv .error-tip").html("密码不一致，请重新输入");
				setTimeout(function(){
					$("#rePwdDiv").removeClass("error");
				}, 2000)
				return false;
			}
			
			if("" == photoData) {
				$("#photoError").html("请拍照");
				$("#photoError").removeClass("hidden");
				setTimeout(function(){
					$("#photoError").addClass("hidden");
				}, 2000)
				return false;
			}
			
			$(this).addClass("disabled");
			
			save(phoneNum, pwd, rePwd);
		});
		
		function confirmPhoto(photoBase64) {
			photoData = photoBase64;
		}
		
		function save(phoneNum, pwd, rePwd) {
			
			$.ajax({
               type: "POST",
               dataType: "json",
               url: "/open/save.html",
               data: "photoData="+photoData+"&pwd="+pwd+"&rePwd="+rePwd+"&phoneNum="+phoneNum,
               success: function(data){
               		   if (data.success) {
               		   	window.location.href = '/open/success.html';
               		   } else {
               		   		$('#submit').removeClass("disabled");
               		   		alert(data.message);
               		   }
                  }
            });
		}
		
	</script>
</body>
</html>
