<%@ page contentType="text/html;charset=gb2312"%>
<html>
<head>
<title>身份证信息</title>
</head>
<object classid="clsid:5EB842AE-5C49-4FD8-8CE9-77D4AF9FD4FF" id="IdrControl1" width="100" height="100" >
</object>

<body>
<form name="idCardForm" action="/saveIdCardInfo.html" method='post'>
<!-- 以下隐藏元素为提交后台的数据 -->
<input id="idCode" name="idCode" type="hidden">
<input id="username" name="username" type="hidden">
<input id="sex" name="sex" type="hidden">
<input id="photoData" name="photoData" type="hidden">

<table id="oTable"  width="800" border="1" cellspacing="0" cellpadding="0" >
<tr>
<td width="200"><input type="button" value="读身份证" onClick="javascript:Idcard();">
</td>
<td width="500"><input id="saveButton" type="submit" value="保 存" style="display:none;">
</td>
</tr>
<tr>
<td >照片：</td>
<td ></td>
</tr>
<tr>
<td >姓名：</td>
<td >&nbsp;</td>
</tr>
<tr>
<td>民族：</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>性别</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>出生：</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>公民身份证号码：</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>地址：</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>签发机关：</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>有效日期：</td>
<td >&nbsp;</td>
</tr>
<tr>
<td>安全模块号：</td>
<td>&nbsp;</td >
</tr>    
<tr>
<td>身份证卡号：</td>
<td>&nbsp;</td >
</tr>
</table>
</form>
<script language=javascript>
function Idcard(){
	var result;
	var photoname;
	var cardname;
	var cardsn;
try {  
    var ax = new ActiveXObject("IDRCONTROL.IdrControlCtrl.1");
} catch(e) {  
    alert("控件未安装");  
}  	

	//注意：第一个参数为对应的设备端口，USB型为1001，串口型为1至16
	result=IdrControl1.ReadCard("1001","");
	if (result==1){
		document.all.oTable.rows(1).cells(1).innerHTML='<img src="data:image/jpeg;base64,'+IdrControl1.GetCardPhotobuf()+'"/>';
		document.all.oTable.rows(2).cells(1).innerText=IdrControl1.GetName();
		document.all.oTable.rows(3).cells(1).innerText=IdrControl1.GetFolk();
		document.all.oTable.rows(4).cells(1).innerText=IdrControl1.GetSex();
		document.all.oTable.rows(5).cells(1).innerText=IdrControl1.GetBirthYear() + "年" + IdrControl1.GetBirthMonth() + "月" + IdrControl1.GetBirthDay() +  "日";
		cardsn=IdrControl1.GetCode();
		document.all.oTable.rows(6).cells(1).innerText=cardsn;
		document.all.oTable.rows(7).cells(1).innerText=IdrControl1.GetAddress();
		document.all.oTable.rows(8).cells(1).innerText=IdrControl1.GetAgency();
		document.all.oTable.rows(9).cells(1).innerText=IdrControl1.GetValid();
		document.all.oTable.rows(10).cells(1).innerText=IdrControl1.GetSAMID();
		document.all.oTable.rows(11).cells(1).innerText=IdrControl1.GetIDCardSN();

		document.getElementById("idCode").value=IdrControl1.GetCode();
		document.getElementById("username").value=IdrControl1.GetName();
		document.getElementById("sex").value=IdrControl1.GetSex();
		document.getElementById("photoData").value=IdrControl1.GetCardPhotobuf();
		
		document.getElementById("saveButton").style.display="block";
		
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
</script>
</body>
</html>