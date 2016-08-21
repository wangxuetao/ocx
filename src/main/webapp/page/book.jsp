<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>柜台开户</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />	
		<link rel="stylesheet" type="text/css" href="/css/base.css" />
		<link rel="stylesheet" type="text/css" href="/css/common.css" />
		<link rel="stylesheet" type="text/css" href="/css/globle.css" />
		<script src="/js/jquery.min.js"></script>
		<style media="print">
			.noprint{
			  display:none;
			}
		</style>
	</head>
	<body>
		<div class="book-wrap">
			<p class="p0">编号：${sessionScope.login_username}</p>
			<h1 class="p1">确认书</h1>
			<p class="p2">尊敬的交易商：</p>
			<p class="p3">欢迎您通过江苏大圆银泰商品合约交易市场有限公司（以下简称“大圆银泰”）进行普洱茶交易的开户，为了更好地保障您的权益，请您再次对以下内容进行确认。</p>
			<p class="p3">1、您已于大圆银泰签署了《交易商入市协议书》、《普洱茶交易风险提示书》且签名均为您本人亲笔签署。</p>
			<p class="p3">2、您同意因履行《交易商入市协议书》有关的一切争议，根据《交易商入市协议书》的约定提交南京仲裁委员会进行仲裁。</p>
			<p class="p3">3、您知晓并同意大圆银泰通过其交易系统、官网（<a href="http://www.teaex.com">www.teaex.com</a>）及新闻媒体发布其制订或修订的普洱茶交易规则、管理办法及相关公告，且一经发布即对您产生约束力。</p>
			<p class="p4">如您对以上内容已全部知晓并确认无误，请签字确认。</p>
			<p class="p5">确认人：</p>
			<p class="p5">日期：</p>
		</div>
		<div class="noprint text-center">
			<a href="javascript:window.print();" class="btn">打印</a>
		</div>
	</body>
</html>
