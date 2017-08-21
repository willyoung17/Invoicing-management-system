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
	function sortAscMarket(){
		$('#dg').datagrid('load', {
			choose:$('#choose').combobox("getValue"),
			sort : $('#asc').text(),
			rows : '10',
			page: '1'
		});
		url = "sortMarket";
	}
	function sortDescMarket(){
		$('#dg').datagrid('load', {
			choose:$('#choose').combobox("getValue"),
			sort : $('#desc').text(),
			rows : '10',
			page: '1'
		});
		url = "sortMarket";
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
		pagination="true" rownumbers="true" url="sortMarket" fit="true"
		toolbar="#tb">
		<thead>
			<tr>
				
				<th field="spName" width="50" align="center">商品名称</th>
				<th field="kh" width="100" align="center">客户</th>
				<th field="lxr" width="100" align="center">联系人</th>
				<th field="spDj" width="100" align="center" sortable="true">商品单价</th>
				<th field="spSl" width="100" align="center" sortable="true">商品数量</th>
				<th field="zje" width="100" align="center" sortable="true">总金额</th>
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
			<select class="easyui-combobox" id="choose" name="choose" editable="false" panelHeight="auto" style="width: 155px">
				<option value="单价">单价</option>
				<option value="总价">总价</option>
				<option value="数量">数量</option>
			</select>
			<a href="javascript:sortAscMarket()" class="easyui-linkbutton" 
			iconCls="icon-search" plain="true" id="asc" >升序</a>
			
			<a href="javascript:sortDescMarket()" class="easyui-linkbutton" 
			iconCls="icon-search" plain="true" id="desc" >降序</a>
		</div>
	</div>

	
</body>
</html>