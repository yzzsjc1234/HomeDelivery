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
		//if one decidedzone was selected?
		var rows = $("#grid").datagrid("getSelections");
		if(rows.length == 1){
			id = rows[0].id;
			//selected one decidedzone
			$('#customerWindow').window('open');
			$("#noassociationSelect").empty();//clear box
			$("#associationSelect").empty();//clear box
			
			//send AJAX request and get customers without association decidedzone
			var url1 = "${pageContext.request.contextPath}/decidedzoneAction_findnoassociationCustomers.action";
			$.post(url1,{},function(data){
				// analyse Json data and fill to box
				for(var i=0;i<data.length;i++){
					var id = data[i].id;
					var name = data[i].name;
					$("#noassociationSelect").append("<option value='"+id+"'>"+name+"</option>");
				}
			},'json');
			
			//send AJAX request and get customers with this association decidedzone
			var url2 = "${pageContext.request.contextPath}/decidedzoneAction_findhasassociationCustomers.action";
			$.post(url2,{"id":rows[0].id},function(data){
				//analyse Json data and fill to box
				for(var i=0;i<data.length;i++){
					var id = data[i].id;
					var name = data[i].name;
					$("#associationSelect").append("<option value='"+id+"'>"+name+"</option>");
				}
			},'json');
		}else{
			$.messager.alert("Message","Please select one decidedzone!","warning");
		}
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
			url : "${pageContext.request.contextPath}/decidedzoneAction_pageQuery",
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
				<script type="text/javascript">
					$(function(){
						$("#save").click(function(){
							var v = $("#addDecidedzoneForm").form("validate");
							if(v){
								$("#addDecidedzoneForm").submit();
							}
						});
					});
				</script>
			</div>
		</div>
		
		<div style="overflow:auto;padding:5px;" border="false">
			<form id="addDecidedzoneForm" action="${pageContext.request.contextPath }/decidedzoneAction_add.action">
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
							<input class="easyui-combobox" name="staff.id"  
    							data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath }/staffAction_listajax.action'" />  
						</td>
					</tr>
					<tr height="300">
						<td valign="top">Accociated subarea</td>
						<td>
							<table id="subareaGrid"  class="easyui-datagrid" border="false" style="width:300px;height:300px" data-options="url:'${pageContext.request.contextPath }/subareaAction_listajax.action',fitColumns:true,singleSelect:false">
								<thead>  
							        <tr>  
							            <th data-options="field:'subareaid',width:30,checkbox:true">Id</th>  
							            <th data-options="field:'addresskey',width:150">Addresskey</th>  
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
	<div class="easyui-window" title="Associated customer" modal="true" id="customerWindow" collapsible="false" closed="true" minimizable="false" maximizable="false" style="top:20px;left:200px;width: 400px;height: 300px;">
		<div style="overflow:auto;padding:5px;" border="false">
			<form id="customerForm" action="${pageContext.request.contextPath }/decidedzoneAction_assigncustomerstodecidedzone.action" method="post">
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
							<script type="text/javascript">
								$(function(){
									//events for "toRight" & "toLeft"
									$("#toRight").click(function(){
										$("#associationSelect").append($("#noassociationSelect option:selected"));
									});
									$("#toLeft").click(function(){
										$("#noassociationSelect").append($("#associationSelect option:selected"));
									});
									
									//event for association between customers and decidedzone
									$("#associationBtn").click(function(){
										//select right options before submit
										$("#associationSelect option").attr("selected","selected");
										//get decidedzone id
										$("input[name=id]").val(id);
										$("#customerForm").submit();
									});
								});
							</script>
						</td>
						<td>
							<select id="associationSelect" name="customerIds" multiple="multiple" size="10"></select>
						</td>
					</tr>
					<tr>
						<td colspan="3"><a id="associationBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">Associate with customers</a> </td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>