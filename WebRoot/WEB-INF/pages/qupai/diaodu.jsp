<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Artificial dispatch</title>
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
	$(function() {
		$("#grid").datagrid({
			singleSelect : true,
			toolbar : [ {
				id : 'diaodu',
				text : 'Artificial dispatch',
				iconCls : 'icon-edit',
				handler : function() {
					// pop-up window
					$("#diaoduWindow").window('open');
				}
			} ],
			columns : [ [ {
				field : 'id',
				title : 'Id',
				width : 100
			}, {
				field : 'delegater',
				title : 'Delegater',
				width : 100
			}, {
				field : 'telephone',
				title : 'Telephone',
				width : 100
			}, {
				field : 'pickaddress',
				title : 'Pick Address',
				width : 100
			}, {
				field : 'product',
				title : 'Product',
				width : 100
			}, {
				field : 'pickdate',
				title : 'Pick date',
				width : 100,
				formatter : function(data, row, index) {
					return data.replace("T", " ");
				}
			} ] ],
			url : '${pageContext.request.contextPath}/noticebill_findnoassociations.action'
		});

		// Save --- create order
		$("#save").click(function() {

		});
	});
</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'center',border:false">
		<table id="grid"></table>
	</div>
	<div class="easyui-window" title="Artificial dispatch" id="diaoduWindow" closed="true"
		collapsible="false" minimizable="false" maximizable="false"
		style="top:100px;left:200px;width: 500px; height: 300px">
		<div region="north" style="height:31px;overflow:hidden;" split="false"
			border="false">
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="#" class="easyui-linkbutton"
					plain="true">Save</a>
			</div>
		</div>
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="diaoduForm" method="post">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">Artificial dispatch</td>
					</tr>
					<tr>
						<td>Order id</td>
						<td><input type="hidden" name="id" id="noticebillId" /> <span
							id="noticebillIdView"></span>
					</tr>
					<tr>
						<td>Choose courier</td>
						<td><input class="easyui-combobox" required="true"
							name="staff.id"
							data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath }/staff_ajaxlist.action'" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>