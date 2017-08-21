<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">

var url;

function deleteUser(){
	var selectedRows=$("#dg").datagrid('getSelections');
	if(selectedRows.length==0){
		$.messager.alert("系统提示","请选择要删除的数据！");
		return;
	}
	var strIds=[];
	for(var i=0;i<selectedRows.length;i++){
		strIds.push(selectedRows[i].id);
	}
	var ids=strIds.join(",");
	$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
		if(r){
			$.post("userDelete",{delIds:ids},function(result){
				if(result.success){
					$.messager.alert("系统提示","您已成功删除<font color=red>"+result.delNums+"</font>条数据！");
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert('系统提示',result.errorMsg);
				}
			},"json");
		}
	});
}

function searchUser(){
	$('#dg').datagrid('load',{
		username:$('#u_userName').val(),
		num : $('#u_Num').val(),
		type:$('#u_type').combobox("getValue"),
		blacklist:$('#u_blacklist').combobox("getValue")
	});
}


function openUserAddDialog(){
	$("#dlg").dialog("open").dialog("setTitle","添加用户信息");
	$("#username").attr("disabled",false);
	$("#salt").attr("disabled",true);
	url="userSave";
}

function saveUser(){
	$("#fm").form("submit",{
		url:url,
		onSubmit:function(){
			if($('#type').combobox("getValue")=="请选择..."){
				$.messager.alert("系统提示","请选择用户类型");
				return false;
			}
			if($('#blacklist').combobox("getValue")=="请选择..."){
				$.messager.alert("系统提示","请选择是否为黑名单");
				return false;
			}
			return $(this).form("validate");
		},
		success:function(result){
			if(result.errorMsg){
				$.messager.alert("系统提示",result.errorMsg);
				return;
			}else{
				$.messager.alert("系统提示","保存成功");
				resetValue();
				$("#dlg").dialog("close");
				$("#dg").datagrid("reload");
			}
		}
	});
}

function resetValue(){
	$("#num").val("");
	$("#username").val("");
	$("#password").val("");
	$("#salt").val("");
	$("#type").combobox("setValue","");
	$("#blacklist").combobox("setValue","");
}

function closeUserDialog(){
	$("#dlg").dialog("close");
	resetValue();
}

function openUserModifyDialog(){
	var selectedRows=$("#dg").datagrid('getSelections');
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一条要编辑的数据！");
		return;
	}
	var row=selectedRows[0];
	$("#dlg").dialog("open").dialog("setTitle","编辑用户信息");
	$("#fm").form("load",row);
	url="userSave?id="+row.id;
	$("#username").attr("disabled",true);
	$("#salt").attr("disabled",true);
	
}

</script>
</head>
<body>
	<body style="margin: 5px;">
	<table id="dg" title="用户信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" rownumbers="true" url="userList" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="id" width="10%" align="center" hidden="true">id</th>
				<th field="num" width="10%" align="center">编号</th>
				<th field="username" width="10%" align="center">帐号</th>
				<th field="password" width="10%" align="center">密码</th>
				<th field="salt" width="10%" align="center">盐</th>
				<th field="type" width="10%" align="center">类型</th>
				<th field="blacklist" width="10%" align="center">黑名单</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:openUserAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openUserModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteUser()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>&nbsp;编号：&nbsp;<input type="text" name="u_Num" id="u_Num" size="10"/>
		&nbsp;帐号：&nbsp;<input type="text" name="u_userName" id="u_userName" size="10"/>
		&nbsp;用户类型：&nbsp;<select class="easyui-combobox" id="u_type" name="u_type" editable="false" panelHeight="auto">
		    <option value="">请选择...</option>
			<option value="管理员">管理员</option>
			<option value="普通员工">普通员工</option>
		</select>
		&nbsp;黑名单：&nbsp;<select class="easyui-combobox" id="u_blacklist" name="u_blacklist" editable="false" panelHeight="auto">
		    <option value="">请选择...</option>
			<option value="是">是</option>
			<option value="否">否</option>
		</select>
		<a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></div>
	</div>
	<div id="dlg" class="easyui-dialog" style="width: 570px;height: 350px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="5px;">
				<tr>
					<td>编号：</td>
					<td><input type="text" name="num" id="num" class="easyui-validatebox" required="true"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>帐号：</td>
					<td><input type="text" name="username" id="username" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input type="password" name="password" id="password" class="easyui-validatebox" required="true"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>盐：</td>
					<td><input type="text" name="salt" id="salt" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>类型：</td>
					<td><select class="easyui-combobox" id="type" name="type" editable="false" panelHeight="auto" style="width: 155px">
					    <option value="">请选择...</option>
						<option value="管理员">管理员</option>
						<option value="普通用户">普通用户</option>
					</select></td>
					<td></td>
					<td>黑名单：</td>
					<td><select class="easyui-combobox" id="blacklist" name="blacklist" editable="false" panelHeight="auto" style="width: 155px">
					    <option value="">请选择...</option>
						<option value="是">是</option>
						<option value="否">否</option>
					</select></td>
				</tr>
			</table>
		</form>
	</div>	
	<div id="dlg-buttons">
		<a href="javascript:saveUser()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeUserDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>