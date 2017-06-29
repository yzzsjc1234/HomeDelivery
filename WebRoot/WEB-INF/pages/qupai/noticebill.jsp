<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Order information</title>
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
	
	function doRepeat(){
		alert("Repeat...");
	}
	
	function doCancel(){
		alert("Cancel...");
	}
	
	function doSearch(){
		$('#searchWindow').window("open");
	}
	
	//toolbar
	var toolbar = [ {
		id : 'button-search',	
		text : 'Query',
		iconCls : 'icon-search',
		handler : doSearch
	}, {
		id : 'button-repeat',
		text : 'Repeat',
		iconCls : 'icon-redo',
		handler : doRepeat
	}, {
		id : 'button-cancel',	
		text : 'Cancel',
		iconCls : 'icon-cancel',
		handler : doCancel
	}];
	// column
	var columns = [ [ {
		field : 'id',
		checkbox : true,
	}, {
		field : 'noticebill_id',
		title : 'Order id',
		width : 120,
		align : 'center'
	},{
		field : 'type',
		title : 'Type',
		width : 120,
		align : 'center'
	}, {
		field : 'pickstate',
		title : 'Pickstate',
		width : 120,
		align : 'center'
	}, {
		field : 'buildtime',
		title : 'Build time',
		width : 120,
		align : 'center'
	}, {
		field : 'attachbilltimes',
		title : 'Attach bill times',
		width : 120,
		align : 'center'
	}, {
		field : 'staff.name',
		title : 'Courier',
		width : 100,
		align : 'center'
	}, {
		field : 'staff.telephone',
		title : 'Telephone',
		width : 100,
		align : 'center'
	} ] ];
	
	$(function(){
		// Hide body and then display to in case page refresh
		$("body").css({visibility:"visible"});
		
		// receive&send table
		$('#grid').datagrid( {
			iconCls : 'icon-forward',
			fit : true,
			border : true,
			rownumbers : true,
			striped : true,
			pageList: [30,50,100],
			pagination : true,
			toolbar : toolbar,
			url :  "",
			idField : 'id',
			columns : columns,
			onDblClickRow : doDblClickRow
		});
		
		// Add&Eidt zone
		$('#searchWindow').window({
	        title: 'Query zone',
	        width: 400,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
	    });
		$("#btn").click(function(){
			alert("Searching...");
			$("#searchForm").get(0).reset();// reset
			$("#searchWindow").window("close"); // close
		});
	});

	function doDblClickRow(){
		alert("Double click table...");
	}
</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<div region="center" border="false">
    	<table id="grid"></table>
	</div>
	
	<!-- Add/Edit subarea -->
	<div class="easyui-window" title="Search window" id="searchWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div style="overflow:auto;padding:5px;" border="false">
			<form id="searchForm">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">Query terms</td>
					</tr>
					<tr>
						<td>Customer telephone</td>
						<td><input type="text" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>Courier</td>
						<td><input type="text" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>Accept date</td>
						<td><input type="text" class="easyui-datebox" required="true"/></td>
					</tr>
					<tr>
						<td colspan="2"><a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">Query</a> </td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>