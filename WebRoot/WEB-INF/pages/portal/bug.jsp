<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div style="padding:10px;">
<div style="margin-bottom:8px;">Your comments will help to improve performance of the system<br /></div>
<form id="bug_form" method="post" enctype="application/x-www-form-urlencoded">
<textarea name="bug_c" id="bug_c" cols="50" rows="7" style=" border:solid 3px #E2E2E2;line-height:16px; padding:5px;"></textarea>
<br />
<div style="margin-top:8px;"><a href="javascript:void(0);" onclick="$('#bug_form').submit();" id="bug_form_but" class="easyui-linkbutton">Submit</a></div>
</form>
</div>
<script>
//should be put alone
$('#bug_form').form({  
	url:"post.html",  
	onSubmit: function(){  
		if($('#bug_c').val()==""){
			$.messager.alert('Warning',"Comment cannot be null");	
			return false;
		}
	}, 
	success:function(data){  
		$.messager.alert('Warning',"Succeed"); 
		$('#bug_c').val("");
	}  
});   
</script>