<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学生信息管理</title>
<link rel="stylesheet" type="text/css"
	href="jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	var url;

	function searchCommodity() {
		$('#dg').datagrid('load', {
			id : $('#id').val(),
			spname : $('#spname').val()
		});
	}

	/* 打开添加学生对话框 */
	function openStudentAddDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "添加学生信息");
		url = "saveJiage";
	}
	function saveStudent() {
		$("#fm").form("submit", {
			url : url,
			onSubmit : function() {
				if ($("#stuName").val() == '') {
					$.messager.alert("系统提示", "请输入单价");
					return false;
				}
				return $(this).form("validate");
			},
			success : function(result) {
				if (result.errorMsg) {
					$.messager.alert("系统提示", result.errorMsg);
					return;
				} else {
					$.messager.alert("系统提示", "保存成功");
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}
			}
		});
	}
</script>
</head>
<!-- 表头信息 -->
<body style="margin: 5px;">
	<table id="dg" title="价格调整" class="easyui-datagrid" fitColumns="true"
		pagination="true" rownumbers="true" url="ShangpinInfoServlet"
		fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="id" width="100" align="center">货品编号</th>
				<th field="spname" width="100" align="center">商品全称</th>
				<th field="gg" width="100" align="center">规格</th>
				<th field="cd" width="100" align="center">产地</th>
				<th field="bz" width="100" align="center">包装</th>
				<th field="dw" width="150" align="center">单位</th>
				<th field="dj" width="150" align="center">单价</th>
				<th field="kcsl" width="150" align="center">库存数量</th>
				<th field="spbz" width="250" align="center">备注</th>
			</tr>
		</thead>
	</table>
	<!-- 给增删改按钮添加事件 -->
	<div id="tb">
		<!-- 添加查询条件 -->
		<div>
			&nbsp;商品名称：&nbsp;<input type="text" name="spname" id="spname"
				size="10" /> &nbsp;货品编号&nbsp;<input type="text" name="id" id="id"
				size="10" />
			<!-- 查询按钮添加查询事件 -->
			<a href="javascript:searchCommodity()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
	<!-- 添加修改模态框的text框 -->
	<div id="dlg" class="easyui-dialog"
		style="width: 570px; height: 350px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="5px;">
				<tr>
					<td>商品名称：</td>
					<td><input type="text" name="spname" id="stuNo"
						class="easyui-validatebox" required="true" /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td>商品单价</td>
					<td><input type="text" name="dj" id="stuName"
						class="easyui-validatebox" required="true" /></td>
				</tr>
			</table>
		</form>
	</div>

	<div id="dlg-buttons">
		<a href="javascript:saveStudent()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeStudentDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>