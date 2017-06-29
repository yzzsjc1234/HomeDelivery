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
	// tools bar
	var toolbar = [ {
		id : 'button-view',	
		text : 'View',
		iconCls : 'icon-search',
		handler : doView
	}, {
		id : 'button-add',
		text : 'Add',
		iconCls : 'icon-add',
		handler : doAdd
	}, {
		id : 'button-delete',
		text : 'Delete',
		iconCls : 'icon-cancel',
		handler : doDelete
	}];
	//column
	var frozenColumns = [ [ {
		field : 'id',
		checkbox : true,
		rowspan : 2
	}, {
		field : 'username',
		title : 'Name',
		width : 80,
		rowspan : 2
	} ] ];


	// terms
	var columns = [ [ {
		field : 'gender',
		title : 'Gender',
		width : 60,
		rowspan : 2,
		align : 'center'
	}, {
		field : 'birthday',
		title : 'Birthday',
		width : 120,
		rowspan : 2,
		align : 'center'
	}, {
		title : 'Other information',
		colspan : 2
	}, {
		field : 'telephone',
		title : 'Telephone',
		width : 800,
		rowspan : 2
	} ], [ {
		field : 'station',
		title : 'Department',
		width : 80,
		align : 'center'
	}, {
		field : 'salary',
		title : 'Salary',
		width : 80,
		align : 'right'
	} ] ];
	$(function(){
		// init datagrid
		// create grid
		$('#grid').datagrid( {
			iconCls : 'icon-forward',
			fit : true,
			border : false,
			rownumbers : true,
			striped : true,
			toolbar : toolbar,
			url : "json/users.json",
			idField : 'id', 
			frozenColumns : frozenColumns,
			columns : columns,
			onClickRow : onClickRow,
			onDblClickRow : doDblClickRow
		});
		
		$("body").css({visibility:"visible"});
		
	});
	// double click
	function doDblClickRow(rowIndex, rowData) {
		var items = $('#grid').datagrid('selectRow',rowIndex);
		doView();
	}
	// click
	function onClickRow(rowIndex){

	}
	
	function doAdd() {
		alert("Add staff");
		location.href="${pageContext.request.contextPath}/page_admin_userinfo.action";
	}

	function doView() {
		alert("Edit staff");
		var item = $('#grid').datagrid('getSelected');
		console.info(item);
		//window.location.href = "edit.html";
	}

	function doDelete() {
		alert("Delete staff");
		var ids = [];
		var items = $('#grid').datagrid('getSelections');
		for(var i=0; i<items.length; i++){
		    ids.push(items[i].id);	    
		}
			
		console.info(ids.join(","));
		
		$('#grid').datagrid('reload');
		$('#grid').datagrid('uncheckAll');
	}
	
</script>		
</head>
<body class="easyui-layout" style="visibility:hidden;">
    <div region="center" border="false">
    	<table id="grid"></table>
	</div>
</body>
</html>