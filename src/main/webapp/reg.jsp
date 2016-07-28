<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>写博客页面</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" charset="gbk" src="${pageContext.request.contextPath}/static/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="gbk" src="${pageContext.request.contextPath}/static/ueditor/ueditor.all.min.js">
	
</script>
<!--建议手动加载语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="gbk" src="${pageContext.request.contextPath}/static/ueditor/lang/zh-cn/zh-cn.js"></script>

<script type="text/javascript">
	function submitData() {
		var userName = $("#userName").val();
		var password = $("#password").val();
		var nickName = $("#nickName").val();
		var sign = $("#sign").val();
		var proFile = $("#proFile").val();
		var imageName = $("#imageName").val();

		if (userName == null || userName == '') {
			alert("请输入用户名！");
		} else if (password == null || password == '') {
			alert("请输入密码！");
		} else if (nickName == null || nickName == '') {
			alert("请输入昵称！");
		} else if (sign == null || sign == '') {
			alert("请输入个性签名！");
		} else if (proFile == null || proFile == '') {
			alert("请输入个人简介！");
		} else if (imageName == null || imageName == '') {
			alert("请输入个人头像！");
		} else {
			$.post("${pageContext.request.contextPath}/blogger/regSave.do", {
				'userName' : userName,
				'password' : password,
				'nickName' : nickName,
				'sign' : sign,
				'proFile' : proFile,
				'imageName' : imageName
			});
		}
	}
</script>
</head>

<body style="margin: 10px">
	<div id="p" class="easyui-panel" title="添加用户" style="padding: 10px">
		<table cellspacing="20px">
			<tr>
				<td>用户名：</td>
				<td>
					<input type="text" id="userName" name="userName" style="width: 100px;" />
				</td>
			</tr>
			<tr>
				<td>密码：</td>
				<td>
					<input type="text" id="password" name="password" style="width: 100px;" />
				</td>
			</tr>
			<tr>
				<td>昵称：</td>
				<td>
					<input type="text" id="nickName" name="nickName" style="width: 100px;" />
				</td>
			</tr>
			<tr>
				<td>个性签名：</td>
				<td>
					<input type="text" id="sign" name="sign" style="width: 100px;" />
				</td>
			</tr>
			<tr>
				<td>个人简介：</td>
				<td>
					<input type="proFile" id="proFile" name="proFile" style="width: 200px; height: 100px;"/>
					</script>
				</td>
			</tr>
			<tr>
				<td>博主头像：</td>
				<td>
					<input type="text" id="imageName" name="imageName" style="width: 100px;" />
				</td>
			</tr>
			<tr>
				<td>
					<a href="javascript:submitData()" class="easyui-linkbutton" data-options="iconCls:'icon-submit'">提交</a>
				</td>
			</tr>
		</table>
	</div>

</body>
</html>