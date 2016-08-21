<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
<title>���֤��Ϣ</title>
</head>
<object classid="clsid:5EB842AE-5C49-4FD8-8CE9-77D4AF9FD4FF" id="IdrControl1" width="100" height="100" >
</object>

<body>
<form name="idCardForm" action="/saveIdCardInfo.html" method='post'>
<!-- ��������Ԫ��Ϊ�ύ��̨������ -->
<input id="idCode" name="idCode" type="hidden">
<input id="username" name="username" type="hidden">
<input id="sex" name="sex" type="hidden">
<input id="photoData" name="photoData" type="hidden">

<table id="oTable"  width="800" border="1" cellspacing="0" cellpadding="0" >
<tr>
<td width="200"><input type="button" value="�����֤" onClick="javascript:Idcard();">
</td>
<td width="500"><input id="saveButton" type="submit" value="�� ��" style="display:none;">
</td>
</tr>
<tr>
<td >��Ƭ��</td>
<td ></td>
</tr>
<tr>
<td >������</td>
<td >&nbsp;</td>
</tr>
<tr>
<td>���壺</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>�Ա�</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>������</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>�������֤���룺</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>��ַ��</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>ǩ�����أ�</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>��Ч���ڣ�</td>
<td >&nbsp;</td>
</tr>
<tr>
<td>��ȫģ��ţ�</td>
<td>&nbsp;</td >
</tr>    
<tr>
<td>���֤���ţ�</td>
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
    alert("�ؼ�δ��װ");  
}  	

	//ע�⣺��һ������Ϊ��Ӧ���豸�˿ڣ�USB��Ϊ1001��������Ϊ1��16
	result=IdrControl1.ReadCard("1001","");
	if (result==1){
		document.all.oTable.rows(1).cells(1).innerHTML='<img src="data:image/jpeg;base64,'+IdrControl1.GetCardPhotobuf()+'"/>';
		document.all.oTable.rows(2).cells(1).innerText=IdrControl1.GetName();
		document.all.oTable.rows(3).cells(1).innerText=IdrControl1.GetFolk();
		document.all.oTable.rows(4).cells(1).innerText=IdrControl1.GetSex();
		document.all.oTable.rows(5).cells(1).innerText=IdrControl1.GetBirthYear() + "��" + IdrControl1.GetBirthMonth() + "��" + IdrControl1.GetBirthDay() +  "��";
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
			alert("�˿ڳ�ʼ��ʧ�ܣ�");
		if (result==-2)
			alert("�����½���Ƭ�ŵ��������ϣ�");
		if (result==-3)
			alert("��ȡ����ʧ�ܣ�");
		if (result==-4)
			alert("������Ƭ�ļ�ʧ�ܣ������趨·���ʹ��̿ռ䣡");
	}
}
</script>
</body>
</html>