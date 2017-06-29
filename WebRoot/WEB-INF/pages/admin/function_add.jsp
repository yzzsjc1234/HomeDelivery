<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- import jQuery -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<!-- import easyUI -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/ext/portal.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/default.css">	
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/ext/jquery.portal.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/ext/jquery.cookie.js"></script>
<script
	src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-en.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		// click for save
		$('#save').click(function(){
			location.href='${pageContext.request.contextPath}/page_admin_function.action';
		});
	});
</script>	
</head>
<body class="easyui-layout">
<div data-options="region:'north'">
	<div class="datagrid-toolbar">
		<a id="save" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >Save</a>
	</div>
</div>
<div data-options="region:'center'">
	<form id="functionForm" method="post">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">Access information</td>
					</tr>
					<tr>
						<td width="200">Id</td>
						<td>
							<input type="text" name="id" class="easyui-validatebox" data-options="required:true" />						
						</td>
					</tr>
					<tr>
						<td>Name</td>
						<td><input type="text" name="name" class="easyui-validatebox" data-options="required:true" /></td>
					</tr>
					<tr>
						<td>Access path</td>
						<td><input type="text" name="page"  /></td>
					</tr>
					<tr>
						<td>Generate menu?</td>
						<td>
							<select name="generateMenu" class="easyui-combobox">
								<option value="0">No</option>
								<option value="1">Yes</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Privilege</td>
						<td>
							<input type="text" name="zindex" class="easyui-numberbox" data-options="required:true" />
						</td>
					</tr>
					<tr>
						<td>Parent function</td>
						<td>
							<input name="parentFunction.id" class="easyui-combobox" data-options="valueField:'id',textField:'info',url:''"/>
						</td>
					</tr>
					<tr>
						<td>Description</td>
						<td>
							<textarea name="description" rows="4" cols="60"></textarea>
						</td>
					</tr>
					</table>
			</form>
</div>
</body>
</html>