<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div style="padding:10px;">
	<table class="easyui-datagrid"
		style="height:auto;overflow:auto">
		<thead>
			<tr>
				<th data-options="field:'priority'">Priority</th>
				<th data-options="field:'state'">Status</th>
				<th data-options="field:'subject'">Topic</th>
				<th data-options="field:'sender'">User</th>
				<th data-options="field:'senddate'">Date</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Critical</td>
				<td>Pending read</td>
				<td>2013 new year plan modification</td>
				<td>Dennis</td>
				<td>12/30/2012</td>
			</tr>
		</tbody>
	</table>
</div>