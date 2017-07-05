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
	function doAdd(){
		//alert("Add...");
		$('#addStaffWindow').window("open");
	}
	
	function doView(){
		alert("View...");
	}
	
	function doDelete(){
		//get selected raws
		var rows = $("#grid").datagrid("getSelections");
		if(rows.length == 0){
			// give tips if no one be selected
			$.messager.alert("Message","Please select records need to be deleted！","warning");
		}else{
			var array = new Array();
			//get all ids from selections
			for(var i=0;i<rows.length;i++){
				var id = rows[i].id;
				array.push(id);
			}
			var ids = array.join(",");
			//send request with ids
			window.location.href = '${pageContext.request.contextPath}/staffAction_delete.action?ids='+ids;
		}
	}
	
	function doRestore(){
		alert("Restore...");
	}
	//toolbar
	var toolbar = [ {
		id : 'button-view',	
		text : 'Query',
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
	},{
		id : 'button-save',
		text : 'Restore',
		iconCls : 'icon-save',
		handler : doRestore
	}];
	// column
	var columns = [ [ {
		field : 'id',
		checkbox : true,
	},{
		field : 'name',
		title : 'Name',
		width : 120,
		align : 'center'
	}, {
		field : 'telephone',
		title : 'Telephone',
		width : 120,
		align : 'center'
	}, {
		field : 'haspda',
		title : 'Has PDA?',
		width : 120,
		align : 'center',
		formatter : function(data,row, index){
			if(data=="1"){
				return "Yes";
			}else{
				return "No";
			}
		}
	}, {
		field : 'deltag',
		title : 'Deleted?',
		width : 120,
		align : 'center',
		formatter : function(data,row, index){
			if(data=="0"){
				return "Normal"
			}else{
				return "Deleted";
			}
		}
	}, {
		field : 'standard',
		title : 'Standard',
		width : 120,
		align : 'center'
	}, {
		field : 'station',
		title : 'Department',
		width : 200,
		align : 'center'
	} ] ];
	
	$(function(){
		// Hide body and then display to in case page refresh
		$("body").css({visibility:"visible"});
		
		// receive&send table
		$('#grid').datagrid( {
			iconCls : 'icon-forward',
			fit : true,
			border : false,
			rownumbers : true,
			striped : true,
			pageList: [3,5,10],
			pagination : true,
			toolbar : toolbar,
			url : "${pageContext.request.contextPath}/staffAction_pageQuery.action",
			idField : 'id',
			columns : columns,
			onDblClickRow : doDblClickRow
		});
		
		// Add&Eidt courier
		$('#addStaffWindow').window({
	        title: 'Add/Eidt courier',
	        width: 400,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
	    });
		
	});

	function doDblClickRow(rowIndex, rowData){
		alert("Double click table...");
	}
</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<div region="center" border="false">
    	<table id="grid"></table>
	</div>
	<div class="easyui-window" title="Add/Eidt courier" id="addStaffWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >Save</a>
				<script type="text/javascript">
					$(function(){
						//event
						$("#save").click(function(){
							//validation is ok?
							var v = $("#addStaffForm").form("validate");
							if(v){
								//submit if it is ok
								$("#addStaffForm").submit();
							}
						});
					});
				</script>
			</div>
		</div>
		
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="addStaffForm" action="${pageContext.request.contextPath }/staffAction_add.action"
					 method="post">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">Courier information</td>
					</tr>
					<!-- TODO Adding courier table -->
					<tr>
						<td>Name</td>
						<td><input type="text" name="name" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>Telephone</td>
						<td><input type="text" name="telephone" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>Station</td>
						<td><input type="text" name="station" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td colspan="2">
						<input type="checkbox" name="haspda" value="1" />
						Has PDA?</td>
					</tr>
					<tr>
						<td>Standard</td>
						<td>
							<input type="text" name="standard" class="easyui-validatebox" required="true"/>  
						</td>
					</tr>
					</table>
			</form>
		</div>
	</div>
</body>
</html>	