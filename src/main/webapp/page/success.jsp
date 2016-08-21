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
		<div class="content result-box">
			<div class="img"><img src="/images/success-img.png" /></div>
			<p class="title-tip">开户请求已提交</p>
			<p class="text-tip">您的开户请求已经提交，我们将在1-2个工作日内进行客户资料审核！</p>
			<p class="btn-box"><a href="/userInfo/toUser.html" class="btn">返回</a></p>
		</div>
		<!--content end-->
		
		<!--footer start-->
		<div class="footer">
			<jsp:include page="/page/common/foot.jsp" flush="true"/>
		</div>
		<!--footer end-->
	</div>

</body>
</html>
