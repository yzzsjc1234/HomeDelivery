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
		$("body").css({visibility:"visible"});
		// button events
		$('#reset').click(function() {
			$('#form').form("clear");
		});
		// combobox events
		$("select").combobox( {
			width : 155,
			listWidth : 180,
			editable : true
		});
		// ajax searching
		$('#ajax').click(function() {
			var elWin = $("#list").get(0).contentWindow;
			elWin.$('#grid').datagrid( {
				pagination : true,
				url : "${pageContext.request.contextPath}/json/users.json"
			});
		});
	});
</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
    <div region="east" title="Query terms" icon="icon-forward" style="width:180px;overflow:auto;" split="false" border="true" >
		<div class="datagrid-toolbar">	
			<a id="reset" href="#" class="easyui-linkbutton" plain="true" icon="icon-reload">Reset</a>
		</div>
		
		<form id="form" method="post" >
			<table class="table-edit" width="100%" >				
				<tr><td>
					<b>Username</b><span class="operator"><a name="username-opt" opt="all"></a></span>
					<input type="text" id="username" name="username"/>
				</td></tr>
				<tr><td>
					<b>Gender</b><span class="operator"><a name="gender-opt" opt="all"></a></span>
					<select id="gender" name="gender" >
					    <option value=""></option>
					    <option value="0">female</option>
					    <option value="1">male</option>
					</select>
				</td></tr>
				<tr><td>
					<b>Birthday</b><span class="operator"><a name="birthday-opt" opt="date"></a></span>
					<input type="text" id="birthday" name="birthday" value="11/11/1977" class="easyui-datebox" /><br/>
					<input type="text" id="_birthday2" name="_birthday2" value="11/11/1988" class="easyui-datebox" />
				</td></tr>

			</table>
		</form>
		
		<div class="datagrid-toolbar">	
			<a id="ajax" href="#" class="easyui-linkbutton" plain="true" icon="icon-search">Query</a>
		</div>
    </div>
    <div region="center" style="overflow:hidden;" border="false">
		<iframe id="list" src="${pageContext.request.contextPath }/page_admin_userlist.action" scrolling="no" style="width:100%;height:100%;border:0;"></iframe>
    </div>
</body>
</html>