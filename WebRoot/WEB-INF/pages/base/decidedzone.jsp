<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Decide zone</title>
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
		$('#addDecidedzoneWindow').window("open");
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
	
	function doAssociations(){
		$('#customerWindow').window('open');
	}
	
	//tools bar
	var toolbar = [ {
		id : 'button-search',	
		text : 'Search',
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
		id : 'button-association',
		text : 'Associated customer',
		iconCls : 'icon-sum',
		handler : doAssociations
	}];
	// column
	var columns = [ [ {
		field : 'id',
		title : 'Zone id',
		width : 120,
		align : 'center'
	},{
		field : 'name',
		title : 'Zone name',
		width : 120,
		align : 'center'
	}, {
		field : 'staff.name',
		title : 'Owner',
		width : 120,
		align : 'center',
		formatter : function(data,row ,index){
			return row.staff.name;
		}
	}, {
		field : 'staff.telephone',
		title : 'Telephone',
		width : 120,
		align : 'center',
		formatter : function(data,row ,index){
			return row.staff.telephone;
		}
	}, {
		field : 'staff.station',
		title : 'Department',
		width : 120,
		align : 'center',
		formatter : function(data,row ,index){
			return row.staff.station;
		}
	} ] ];
	
	$(function(){
		//  Hide body and then display to in case page refresh
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
			url : "json/decidedzone.json",
			idField : 'id',
			columns : columns,
			onDblClickRow : doDblClickRow
		});
		
		// Add&Eidt zone
		$('#addDecidedzoneWindow').window({
	        title: 'Add/Eidt zone',
	        width: 600,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
	    });
		
		// Query zone
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
		});
		
	});

	function doDblClickRow(){
		alert("Double click table...");
		$('#association_subarea').datagrid( {
			fit : true,
			border : true,
			rownumbers : true,
			striped : true,
			url : "json/association_subarea.json",
			columns : [ [{
				field : 'id',
				title : 'Id',
				width : 120,
				align : 'center'
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
				title : 'Start num',
				width : 100,
				align : 'center'
			}, {
				field : 'endnum',
				title : 'End num',
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
			} ] ]
		});
		$('#association_customer').datagrid( {
			fit : true,
			border : true,
			rownumbers : true,
			striped : true,
			url : "json/association_customer.json",
			columns : [[{
				field : 'id',
				title : 'Customer id',
				width : 120,
				align : 'center'
			},{
				field : 'name',
				title : 'Name',
				width : 120,
				align : 'center'
			}, {
				field : 'station',
				title : 'Company',
				width : 120,
				align : 'center'
			}]]
		});
		
	}
</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<div region="center" border="false">
    	<table id="grid"></table>
	</div>
	<div region="south" border="false" style="height:150px">
		<div id="tabs" fit="true" class="easyui-tabs">
			<div title="Associated subarea" id="subArea"
				style="width:100%;height:100%;overflow:hidden">
				<table id="association_subarea"></table>
			</div>	
			<div title="Associated customer" id="customers"
				style="width:100%;height:100%;overflow:hidden">
				<table id="association_customer"></table>
			</div>	
		</div>
	</div>
	
	<!-- Add/Edit subarea -->
	<div class="easyui-window" title="Add/Edit subarea" id="addDecidedzoneWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >Save</a>
			</div>
		</div>
		
		<div style="overflow:auto;padding:5px;" border="false">
			<form>
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">Zone information</td>
					</tr>
					<tr>
						<td>Zone id</td>
						<td><input type="text" name="id" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>Zone name</td>
						<td><input type="text" name="name" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>owner</td>
						<td>
							<input class="easyui-combobox" name="region.id"  
    							data-options="valueField:'id',textField:'name',url:'json/standard.json'" />  
						</td>
					</tr>
					<tr height="300">
						<td valign="top">Accociated subarea</td>
						<td>
							<table id="subareaGrid"  class="easyui-datagrid" border="false" style="width:300px;height:300px" data-options="url:'json/decidedzone_subarea.json',fitColumns:true,singleSelect:false">
								<thead>  
							        <tr>  
							            <th data-options="field:'id',width:30,checkbox:true">Id</th>  
							            <th data-options="field:'addresskey',width:150">Key word</th>  
							            <th data-options="field:'position',width:200,align:'right'">Location</th>  
							        </tr>  
							    </thead> 
							</table>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- Query zone -->
	<div class="easyui-window" title="Query zone" id="searchWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div style="overflow:auto;padding:5px;" border="false">
			<form>
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">Query terms</td>
					</tr>
					<tr>
						<td>Zone id</td>
						<td><input type="text" name="id" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>Department</td>
						<td><input type="text" name="staff.station" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td colspan="2"><a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">Query</a> </td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<!-- Associated customer -->
	<div class="easyui-window" title="Associated customer" id="customerWindow" collapsible="false" closed="true" minimizable="false" maximizable="false" style="top:20px;left:200px;width: 400px;height: 300px;">
		<div style="overflow:auto;padding:5px;" border="false">
			<form id="customerForm" action="${pageContext.request.contextPath }/decidedzone_assigncustomerstodecidedzone.action" method="post">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="3">Associated customer</td>
					</tr>
					<tr>
						<td>
							<input type="hidden" name="id" id="customerDecidedZoneId" />
							<select id="noassociationSelect" multiple="multiple" size="10"></select>
						</td>
						<td>
							<input type="button" value="》》" id="toRight"><br/>
							<input type="button" value="《《" id="toLeft">
						</td>
						<td>
							<select id="associationSelect" name="customerIds" multiple="multiple" size="10"></select>
						</td>
					</tr>
					<tr>
						<td colspan="3"><a id="associationBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">Associated customer</a> </td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>