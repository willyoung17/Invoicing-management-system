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

function deleteRole(){
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
			$.post("roleDelete",{delIds:ids},function(result){
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

function searchRole(){
	$('#dg').datagrid('load',{
		rolename:$('#r_rolename').combobox("getValue")
	});
}


function openRoleAddDialog(){
	$("#dlg").dialog("open").dialog("setTitle","添加用户信息");
	url="roleSave";
}

function saveRole(){
	$("#fm").form("submit",{
		url:url,
		onSubmit:function(){
			if($('#rolename').combobox("getValue")=="请选择..."){
				$.messager.alert("系统提示","请选择角色类型");
				return false;
			}
			if($('#isForb').combobox("getValue")=="请选择..."){
				$.messager.alert("系统提示","请选择是否禁用");
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
	$("#id").val("");
	$("#menu").val("");
	$("#createTime").datebox("setValue","");
	$("#rolename").combobox("setValue","");
	$("#isForb").combobox("setValue","");
}

function closeRoleDialog(){
	$("#dlg").dialog("close");
	resetValue();
}

function openRoleModifyDialog(){
	var selectedRows=$("#dg").datagrid('getSelections');
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一条要编辑的数据！");
		return;
	}
	var row=selectedRows[0];
	$("#dlg").dialog("open").dialog("setTitle","编辑角色信息");
	$("#fm").form("load",row);
	url="roleSave?id="+row.id;
	$("#rolename").attr("disabled",true);
	$("#salt").attr("disabled",true);
	
}

</script>
</head>
<body>
	<body style="margin: 5px;">
	<table id="dg" title="角色信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" rownumbers="true" url="rolelist" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="id" width="10%" align="center" hidden="true">角色ID</th>
				<th field="rolename" width="10%" align="center">角色名称</th>
				<th field="menu" width="10%" align="center">角色权限</th>
				<th field="createTime" width="10%" align="center">创建时间</th>
				<th field="isForb" width="10%" align="center">是否禁用</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:openRoleAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openRoleModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteRole()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
		&nbsp;角色名称：&nbsp;<select class="easyui-combobox" id="r_rolename" name="r_rolename" editable="false" panelHeight="auto">
		    <option value="">请选择...</option>
			<option value="管理员">管理员</option>
			<option value="普通员工">普通员工</option>
		</select>
		<a href="javascript:searchRole()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></div>
	</div>
	<div id="dlg" class="easyui-dialog" style="width: 570px;height: 350px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="5px;">
				<tr>
					<td>角色名称：</td>
					<td><input type="text" name="rolename" id="rolename" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>角色权限：</td>
					<td><input type="text" name="menu" id="menu" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>是否禁用：</td>
					<td><select class="easyui-combobox" id="isForb" name="isForb" editable="false" panelHeight="auto" style="width: 155px">
					    <option value="">请选择...</option>
						<option value="是">是</option>
						<option value="否">否</option>
					</select></td>
				</tr>
			</table>
		</form>
	</div>	
	<div id="dlg-buttons">
		<a href="javascript:saveRole()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeRoleDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>>
</html>