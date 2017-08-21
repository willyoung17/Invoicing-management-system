<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>采购退货</title>
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	var url;
	
	function deleteStudent(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要退货的商品！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].id);
		}
		var strNames=[];
		for(var i=0;i<selectedRows.length;i++){
			strNames.push(selectedRows[i].spname);
		}
		var strSpIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strSpIds.push(selectedRows[i].spId);
		}
		var strSpSls=[];
		for(var i=0;i<selectedRows.length;i++){
			strSpSls.push(selectedRows[i].spSl);
		}
		var ids=strIds.join(",");
		var names =strNames.join(",");
		var strIds =strSpIds.join(",");
		var strSls =strSpSls.join(",");
		$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("rukutuihuo",{id:ids,spname:names,spId:strIds,spSl:strSls},function(result){
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
/* 查询方法 */
	function searchStudent() {

		$('#dg').datagrid('load', {
			spId : $('#spId').val(),
			spname : $('#spname').val()
		});
	}
	
	
</script>
</head>
<body style="margin: 5px;">
	<table id="dg" title="价格调整" class="easyui-datagrid" fitColumns="true"
		pagination="true" rownumbers="true" url="rukulist"
		fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="id" width="100" align="center" hidden="true">编号</th>
				<th field="gys" width="100" align="center">供应商</th>
				<th field="lxr" width="100" align="center">联系人</th>
				<th field="jhsj" width="100" align="center">进货时间</th>
				<th field="spId" width="100" align="center">商品编号</th>
				<th field="spname" width="100" align="center">商品全称</th>
				<th field="spGg" width="100" align="center">规格</th>
				<th field="spScdz" width="100" align="center">产地</th>
				<th field="spDw" width="150" align="center">单位</th>
				<th field="spDj" width="150" align="center">单价</th>
				<th field="spSl" width="150" align="center">商品数量</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:deleteStudent()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">退货</a>
		</div>
		<!-- 添加查询条件 -->
		<div>
			&nbsp;商品名称：&nbsp;<input type="text" name="spname" id="spname"
				size="10" /> &nbsp;商品编号&nbsp;<input type="text" name="spId" id="spId"
				size="10" />
			<!-- 查询按钮添加查询事件 -->
			<a href="javascript:searchStudent()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索</a>
		</div>
		    
		<a href="javascript:searchStudent()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></div>
	</div>
	
	
</body>
</html>