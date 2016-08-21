<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<body>
		
	<div class="page-full">
	<object classid="clsid:5EB842AE-5C49-4FD8-8CE9-77D4AF9FD4FF" id="IdrControl1" width="12" height="12" >
</object>
		<!--header start-->
		<jsp:include page="/page/common/head.jsp" flush="true"/>
		<!--header end-->
		
		<!--content start-->
		<div class="container content">		
			<div class="process"><img src="/images/process0.png" /></div>
			<div id="readDiv" class="section section0">
				<div class="section-box">			
					<p class="check-again">
					<input type="button"  class="btn border read" value="读取信息" onclick="Idcard();">
					</p>
					<div class="single-box">
						<div class="card"></div>
						<div class="single single0"></div>
						<div class="single single1"></div>
					</div>					
				</div>			
			</div>
			<div id="userinfoDiv" class="section section1">
				<div class="section-box">					
					<div class="clearfix">
						<label>姓名</label><span id="realname"></span>
					</div>
					<div class="clearfix">
						<label>性别</label><span id="sex"></span>
					</div>
					<div class="clearfix">
						<label>身份证号码</label><span id="idcode"></span>
					</div>
					<div class="clearfix">
						<label>会员单位</label><span>621-江苏大圆茶业有限公司</span>
					</div>
					<div class="clearfix">
						<label>团队</label><span>621-江苏大圆茶业有限公司</span>
					</div>
					<div id="photoCard" class="photo-box">						
					</div>
				</div>
				<div class="error-text">该用户信息已存在，请用户前往网上开户平台-个人中心进行相关操作。</div>
				<div class="btn-box clearfix">
					<a href="###" onclick="Idcard();" class="btn border read float-right">重新读取信息</a>
					<input type="button" class="btn float-left" value="提交用户信息" onclick="saveUserInfo();">
				</div>
			</div>
		</div>
		<!--content end-->
		
		<!--footer start-->
		<jsp:include page="/page/common/foot.jsp" flush="true"/>
		<!--footer end-->
	</div>
	
	<script language=javascript>
		var photoData = "";
	    $(document).ready(function(){  
	         try {  
			    var ax = new ActiveXObject("IDRCONTROL.IdrControlCtrl.1");
			} catch(e) {  
			    alert("控件未安装");  
			}
	         $("#userinfoDiv").hide();
	    });  
	    
		function Idcard(){
			$("#userinfoDiv").show();
			
			$("#readDiv").hide();
			
			var result;
			
			//注意：第一个参数为对应的设备端口，USB型为1001，串口型为1至16
			result=IdrControl1.ReadCard("1001","");
			if (result==1){
				$("#realname").html(IdrControl1.GetName());
				$("#sex").html(IdrControl1.GetSex());
				$("#idcode").html(IdrControl1.GetCode());
				$("#photoCard").html('<img src="data:image/jpeg;base64,'+IdrControl1.GetCardPhotobuf()+'"/>');
				photoData = IdrControl1.GetCardPhotobuf();
			} else {
				if (result==-1)
					alert("端口初始化失败！");
				if (result==-2)
					alert("请重新将卡片放到读卡器上！");
				if (result==-3)
					alert("读取数据失败！");
				if (result==-4)
					alert("生成照片文件失败，请检查设定路径和磁盘空间！");
			}
		}

		function saveUserInfo() {
			var realname = $("#realname").val();
			var sex = $("#sex").val();
			var idcode = $("#idcode").val();
			
			$.ajax({
               type: "POST",
               dataType: "json",
               url: "/userInfo/save.html",
               data: "realname="+realname+"&sex="+sex+"&idcode="+idcode+"&photoData="+photoData,
               success: function(data){
               		   if (data.success) {
               		   	window.location.href = '/open/toOpen.html';
               		   } else {
               		   		alert(data.message);
               		   }
                       
                  }
            });
		}
		
</script>

</body>
</html>
