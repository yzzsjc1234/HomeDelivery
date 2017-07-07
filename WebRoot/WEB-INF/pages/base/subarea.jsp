<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Subarea management</title>
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
		$('#addSubareaWindow').window("open");
	}
	
	function doEdit(){
		alert("Edit...");
	}
	
	function doDelete(){
		alert("Delete...");
	}
	
	function doSearch(){
		$('#searchWindow').window("open");
	}
	
	function doExport(){
		alert("Export");
	}
	
	function doImport(){
		alert("Import");
	}
	
	//toolbar
	var toolbar = [ {
		id : 'button-search',	
		text : 'Query',
		iconCls : 'icon-search',
		handler : doSearch
	}, {
		id : 'button-add',
		text : 'Add',
		iconCls : 'icon-add',
		handler : doAdd
	}, {
		id : 'button-edit',	
		text : 'Edit',
		iconCls : 'icon-edit',
		handler : doEdit
	},{
		id : 'button-delete',
		text : 'Delete',
		iconCls : 'icon-cancel',
		handler : doDelete
	},{
		id : 'button-import',
		text : 'Import',
		iconCls : 'icon-redo',
		handler : doImport
	},{
		id : 'button-export',
		text : 'Export',
		iconCls : 'icon-undo',
		handler : doExport
	}];
	// column
	var columns = [ [ {
		field : 'id',
		checkbox : true,
	}, {
		field : 'showid',
		title : 'Id',
		width : 120,
		align : 'center',
		formatter : function(data,row ,index){
			return row.id;
		}
	},{
		field : 'province',
		title : 'Province',
		width : 120,
		align : 'center',
		formatter : function(data,row ,index){
			return row.region.province;
		}
	}, {
		field : 'city',
		title : 'City',
		width : 120,
		align : 'center',
		formatter : function(data,row ,index){
			return row.region.city;
		}
	}, {
		field : 'district',
		title : 'District',
		width : 120,
		align : 'center',
		formatter : function(data,row ,index){
			return row.region.district;
		}
	}, {
		field : 'addresskey',
		title : 'Addresskey',
		width : 120,
		align : 'center'
	}, {
		field : 'startnum',
		title : 'Startnum',
		width : 100,
		align : 'center'
	}, {
		field : 'endnum',
		title : 'Endnum',
		width : 100,
		align : 'center'
	} , {
		field : 'single',
		title : 'Single',
		width : 100,
		align : 'center'
	} , {
		field : 'position',
		title : 'Location',
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
			border : true,
			rownumbers : true,
			striped : true,
			pageList: [30,50,100],
			pagination : true,
			toolbar : toolbar,
			url : "json/subarea.json",
			idField : 'id',
			columns : columns,
			onDblClickRow : doDblClickRow
		});
		
		// Add&Eidt subarea
		$('#addSubareaWindow').window({
	        title: 'Add/Eidt subarea',
	        width: 600,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
	    });
		
		// Query subarea
		$('#searchWindow').window({
	        title: 'Query subarea',
	        width: 400,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
	    });
		$("#btn").click(function(){
			alert("Searching...");
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
	<!-- Add/Eidt subarea -->
	<div class="easyui-window" title="Add/Eidt subarea" id="addSubareaWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >Save</a>
				<script type="text/javascript">
					$(function(){
						$("#save").click(function(){
							var v = $("#addSubareaForm").form("validate");
							if(v){
								$("#addSubareaForm").submit();
							}
						});
					});
				</script>
			</div>
		</div>
		
		<div style="overflow:auto;padding:5px;" border="false">
			<form id="addSubareaForm"
				 action="${pageContext.request.contextPath }/subareaAction_add.action" 
				method="post">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">Subarea information</td>
					</tr>
					<tr>
						<td>Id</td>
						<td><input type="text" name="id" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>Region</td>
						<td>
							<input class="easyui-combobox" name="region.id" style="width:250px;"  
    							data-options="valueField:'id',textField:'name',mode:'remote',url:'${pageContext.request.contextPath }/regionAction_listajax.action'" />  
						</td>
					</tr>
					<tr>
						<td>Addresskey</td>
						<td><input type="text" name="addresskey" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>Start num</td>
						<td><input type="text" name="startnum" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>End num</td>
						<td><input type="text" name="endnum" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>Single</td>
						<td>
							<select class="easyui-combobox" name="single" style="width:150px;">  
							    <option value="0">Single</option>  
							    <option value="1">Odd</option>  
							    <option value="2">Even</option>  
							</select> 
						</td>
					</tr>
					<tr>
						<td>Location</td>
						<td><input type="text" name="position" class="easyui-validatebox" required="true" style="width:250px;"/></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- Query subarea -->
	<div class="easyui-window" title="Query subarea" id="searchWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div style="overflow:auto;padding:5px;" border="false">
			<form>
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">Query terms</td>
					</tr>
					<tr>
						<td>Province</td>
						<td><input type="text" name="region.province"/></td>
					</tr>
					<tr>
						<td>City</td>
						<td><input type="text" name="region.city"/></td>
					</tr>
					<tr>
						<td>District</td>
						<td><input type="text" name="region.district"/></td>
					</tr>
					<tr>
						<td>Addresskey</td>
						<td><input type="text" name="addresskey"/></td>
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