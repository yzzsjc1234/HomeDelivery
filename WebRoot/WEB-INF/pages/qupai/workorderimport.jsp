<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Order batch import</title>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/ocupload/jquery.ocupload-1.1.2.js"></script>	
<script type="text/javascript">
	$(function(){
		$("#grid").datagrid({
			url : '',
			toolbar : [
				{
					id : 'btn-download',
					text : 'Download template',
					iconCls : 'icon-save',
					handler : function(){
						location.href = "${pageContext.request.contextPath}/download.action?filename=order_template.xls";
					}
				},{
					id : 'btn-upload',
					text : 'Batch import',
					iconCls : 'icon-redo'
				},{
					id : 'btn-refresh',
					text : 'Refresh',
					iconCls : 'icon-reload',
					handler : function(){
						$("#grid").datagrid('reload');						
					}
				}        
			],
			columns : [[
				{
					field : 'id',
					title : 'Id',
					width : 120 ,
					align : 'center'
				},{
					field : 'product',
					title : 'Product',
					width : 120 ,
					align : 'center'
				},{
					field : 'prodtimelimit',
					title : 'Prodtimelimit',
					width : 120 ,
					align : 'center'
				},{
					field : 'prodtype',
					title : 'Prodtype',
					width : 120 ,
					align : 'center'
				},{
					field : 'sendername',
					title : 'Sender name',
					width : 120 ,
					align : 'center'
				},{
					field : 'senderphone',
					title : 'Sender phone',
					width : 120 ,
					align : 'center'
				},{
					field : 'senderaddr',
					title : 'Sender address',
					width : 120 ,
					align : 'center'
				},{
					field : 'receivername',
					title : 'Receiver name',
					width : 120 ,
					align : 'center'
				},{
					field : 'receiverphone',
					title : 'Receiver phone',
					width : 120 ,
					align : 'center'
				},{
					field : 'receiveraddr',
					title : 'Receiver address',
					width : 120 ,
					align : 'center'
				},{
					field : 'actlweit',
					title : 'Actual weight',
					width : 120 ,
					align : 'center'
				}
			]],
			pageList: [10,20,30],
			pagination : true,
			striped : true,
			singleSelect: true,
			rownumbers : true,
			fit : true // full container
		});
		
		// upload
		$("#btn-upload").upload({
			 name: 'upload',  // <input name="file" />
		     action: '${pageContext.request.contextPath}/workOrderManage_batchImport.action',  // action path
		     enctype: 'multipart/form-data', // formate
		     autoSubmit: true, // autosubmit
		     onComplete: function(response) {
		        	if(response=="success"){
		        		$.messager.alert("Message","Succeed！","info");
		        		$("#grid").datagrid("reload");
		        	}else{
		        		$.messager.alert("Error",response,"error");
		        	}
		     }
		});
	});
</script>	
</head>
<body class="easyui-layout" >
	<div region="center">
		<table id="grid"></table>
	</div>
</body>
</html>