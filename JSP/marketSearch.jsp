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
	
	function deleteMarket() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length == 0) {
			$.messager.alert("系统提示", "请选择要删除的数据！");
			return;
		}
		var strIds = [];
		for (var i = 0; i < selectedRows.length; i++) {
			strIds.push(selectedRows[i].id);
		}
		var ids = strIds.join(",");
		$.messager.confirm("系统提示", "您确认要删掉这<font color=red>"
				+ selectedRows.length + "</font>条数据吗？", function(r) {
			if (r) {
				$.post("marketDelete", {
					delIds : ids
				}, function(result) {
					if (result.success) {
						$.messager.alert("系统提示", "您已成功删除<font color=red>"
								+ result.delNums + "</font>条数据！");
						$("#dg").datagrid("reload");
					} else {
						$.messager.alert('系统提示', result.errorMsg);
					}
				}, "json");
			}
		});
	}

	function searchMarket() {
		$('#dg').datagrid('load', {
			num : $('#m_num').val(),
			name : $('#m_name').val(),
			size : $('#m_size').val()
		});
	}

	function openMarketAddDialog() {
		$("#num").attr('readonly',false);
		$("#dlg").dialog("open").dialog("setTitle", "添加销售信息");
		url = "marketSave";
	}

	function saveMarket() {
		$("#fm").form("submit", {
			url : url,
			onSubmit : function() {
				if ($('#num').val() == "") {
					$.messager.alert("系统提示", "请输入编号");
					return false;
				}
				if ($('#name').val() == "") {
					$.messager.alert("系统提示", "请输入品名");
					return false;
				}
				if ($('#size').val() == "") {
					$.messager.alert("系统提示", "请输入类型");
					return false;
				}
				if ($('#amount').val() == "") {
					$.messager.alert("系统提示", "请输入");
					return false;
				}
				if ($('#unit').val() == "") {
					$.messager.alert("系统提示", "请输入数量");
					return false;
				}
				if ($('#price').val() == "") {
					$.messager.alert("系统提示", "请输入单价");
					return false;
				}
				if ($('#comment').val() == "") {
					$.messager.alert("系统提示", "请输入备注");
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

	function resetValue() {
		$("#num").val("");
		$("#name").val("");
		$("#size").val("");
		$("#amount").val("");
		$("#unit").val("");
		$("#price").val("");
		$("#money").val("");
		$("#comment").val("");
	}

	function closeStudentDialog() {
		$("#dlg").dialog("close");
		resetValue();
	}

	function openMarketModifyDialog() {
		$("#num").attr('readonly','readonly');
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length != 1) {
			$.messager.alert("系统提示", "请选择一条要编辑的数据！");
			return;
		}
		var row = selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle", "编辑销售信息");
		$("#fm").form("load", row);
		url = "marketSave?Id=" + row.id;
	}
/* 	$(function(){
		$('#dg').tabs({
			border : true,
			onSelect : function(title){
				alert(title+'is selected');
			}
		});
		$('#dg').tabs({
			onContextMenu : function(e,title,index){
				$("#dg").tabs('select',index);
				$("#mm").menu('show',{
					left : e.pageX,
					top : e.pageY
				});
			}
		});
		
	}) */
</script>
</head>
<body style="margin: 5px;">
	<table id="dg" title="销售信息" class="easyui-datagrid" fitColumns="true"
		pagination="true" rownumbers="true" url="marketList" fit="true"
		toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="num" width="50" align="center">商品编号</th>
				<th field="name" width="100" align="center">品名</th>
				<th field="size" width="100" align="center">规格</th>
				<th field="amount" width="100" align="center">数量</th>
				<th field="unit" width="100" align="center">单位</th>
				<th field="price" width="100" align="center">单价</th>
				<th field="money" width="100" align="center" sortable="true" cursor="pointer">金额</th>
				<th field="comment" width="150" align="center">备注</th>
			</tr>
		</thead>
	</table>
	
	<!-- <div id="mm" class="easyui-menu" style="width:150ps;">
		<div id="closeCurrent" name="closeCurrent" data-options="iconCls:'icon-no'">关闭当前</div>
		<div id="closeAll" name="closeAll" namedata-options="iconCls:'icon-no'">关闭全部</div>
		<div id="closeOther" name="closeOther" namedata-options="iconCls:'icon-no'">关闭其他</div>
	</div> -->

	<div id="tb">
		<div>
			<a href="javascript:openMarketAddDialog()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">添加</a> <a
				href="javascript:openMarketModifyDialog()"
				class="easyui-linkbutton" id="update" iconCls="icon-edit" plain="true">修改</a> <a
				href="javascript:deleteMarket()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
			&nbsp;编号：&nbsp;<input type="text" name="m_num" id="m_num" size="10" /> 
			&nbsp;品名：&nbsp;<input type="text" name="m_name" id="m_name" size="10" /> 
			&nbsp;规格：&nbsp;<input type="text" name="m_size" id="m_size" size="10" />
			<a href="javascript:searchMarket()" class="easyui-linkbutton" 
			iconCls="icon-search" plain="true">搜索</a>
			
		</div>
	</div>

	<div id="dlg" class="easyui-dialog"
		style=" width: 570px; height: 350px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table align="center" cellspacing="5px;">
				<tr>
					<td>商品编号：</td>
					<td><input type="text" name="num" id="num"
						class="easyui-validatebox" required="true" /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td>品名：</td>
					<td><input type="text" name="name" id="name"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>规格：</td>
					<td><input type="text" name="size" id="size"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>数量：</td>
					<td><input type="text" name="amount"id="amount"
						class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>单位：</td>
					<td><input type="text"  id="unit" name="unit"
						class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>单价：</td>
					<td><input type="text" name="price" id="price"
						class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>备注：</td>
					<td><input type="text" name="comment" id="comment"
						class="easyui-validatebox" required="true"/></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveMarket()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeStudentDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>