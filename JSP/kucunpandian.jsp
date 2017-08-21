<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>库存管理</title>
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	var url;
	

	function searchStudent(){
		$('#dg').datagrid('load',{
			stuNo:$('#s_stuNo').val(),
			stuName:$('#s_stuName').val(),
			sex:$('#s_sex').combobox("getValue"),
			bbirthday:$('#s_bbirthday').datebox("getValue"),
			ebirthday:$('#s_ebirthday').datebox("getValue"),
			gradeId:$('#s_gradeId').combobox("getValue")
		});
	}
	
	
	function xiazaispinfo(){
		$("#dlg").dialog("close");
		resetValue();
	}
</script>
</head>
<body style="margin: 5px;">
	<table id="dg" title="价格调整" class="easyui-datagrid" fitColumns="true"
		pagination="true" rownumbers="true" url="ShangpinInfoServlet"
		fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="number" width="50" align="center" hidden="true">编号</th>
				<th field="id" width="100" align="center">货品编号</th>
				<th field="spname" width="100" align="center">商品全称</th>
				<th field="gg" width="100" align="center">规格</th>
				<th field="cd" width="100" align="center">产地</th>
				<th field="bz" width="100" align="center">包装</th>
				<th field="dw" width="150" align="center">单位</th>
				<th field="dj" width="150" align="center">单价</th>
				<th field="kcsl" width="150" align="center">库存数量</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<div>
			<div>
				&nbsp;盘点日期：&nbsp;<input class="easyui-datebox" name="s_bbirthday" id="s_bbirthday" editable="false" size="10"/>-><input class="easyui-datebox" name="s_ebirthday" id="s_ebirthday" editable="false" size="10"/>	
				<a href="javascript:searchStudent()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查看...</a>
			</div>
			数据文件<a href="javascript:xiazaispinfo()" class="easyui-linkbutton" iconCls="icon-print" plain="true">打印</a>	
		</div>
	</div>
	
	
</body>
</html>