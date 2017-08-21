<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>采购入库管理</title>
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
			$.messager.alert("系统提示","请选择要删除的数据！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].stuId);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("studentDelete",{delIds:ids},function(result){
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

	function searchStudent() {

		$('#dg').datagrid('load', {
			spId : $('#id').val(),
			spname : $('#spname').val()
		});
	}
	
	
	function openStudentAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加商品信息");
		url="ruku";
	}
	
	function saveStudent(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
 				/* if($('#gys').combobox("getValue")==""){
					$.messager.alert("系统提示","请选择供应商");
					return false;
				}
				if($('#jsfs').combobox("getValue")==""){
					$.messager.alert("系统提示","请选择结算方式");
					return false;
				}  */
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
		
		$("#gys").val("");
		$("#lxr").val("");
		$("#jsfs").combobox("setValue","");
		$("#jhsj").datebox("setValue","");
		$("#spId").val("");
		$("#spName").val("");
		$("#spJc").val("");
		$("#spScdz").val("");
		$("#spGg").val("");
		$("#spBz").val("");
		$("#spDw").val("");
		$("#spDj").val("");
		$("#spSl").val("");
		$("#ysjl").val("");
		$("#czy").val("");

	}
	
	function closeStudentDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	

</script>
</head>
<body style="margin: 5px;">
	<table id="dg" title="价格调整" class="easyui-datagrid" fitColumns="true"
		pagination="true" rownumbers="true" url="kucun"
		fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="number" width="50" align="center">编号</th>
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
			<a href="javascript:openStudentAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">采购进货</a>

		</div>
		<!-- 添加查询条件 -->
		<div>
			&nbsp;商品名称：&nbsp;<input type="text" name="spname" id="spname"
				size="10" /> &nbsp;商品编号&nbsp;<input type="text" name="id" id="id"
				size="10" />
			<!-- 查询按钮添加查询事件 -->
			<a href="javascript:searchStudent()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索</a>
		</div>
		<a href="javascript:searchStudent()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></div>
	</div>
	  
	<div id="dlg" class="easyui-dialog" style="width: 570px;height: 350px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="5px;">
				<tr>
				<tr>
					<td>供应商：</td>
				    <td><input type="text" name="gys" id="gys" class="easyui-validatebox" required="true"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>联系人：</td>
					<td><input type="text" name="lxr" id="lxr" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>结算方式：</td>
					<td><select class="easyui-combobox" id="js" name="js" editable="false" panelHeight="auto" style="width: 155px">
					    <option value="">请选择...</option>
						<option value="现金">现金</option>
						<option value="支票">支票</option>
					</select></td>
					
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>进货时间：</td>
					<td><input class="easyui-datebox" name="jhsj" id="jhsj" editable="false" /></td>
				</tr>
					<td>编号：</td>
					<td><input type="text" name="spId" id="spId" class="easyui-validatebox" required="true"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>商品名字：</td>
					<td><input type="text" name="spName" id="spName" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>简称：</td>
					<td><input type="text" name="spJc" id="spJc" class="easyui-validatebox" required="true"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>生产地址：</td>
					<td><input type="text" name="spScdz" id="spScdz" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>规格：</td>
					<td><input type="text" name="spGg" id="spGg" class="easyui-validatebox" required="true"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>包装：</td>
						<td><input type="text" name="spBz" id="spBz" class="easyui-validatebox" required="true"/></td>
					
				</tr>
				<tr>
				   <td>单位：</td>
						<td><input type="text" name="spDw" id="spDw" class="easyui-validatebox" required="true"/></td>
					
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>单价：</td>
					<td><input type="text" name="spDj" id="spDj" class="easyui-validatebox" required="true"/></td>
					
				</tr>
				<tr>
				<td>数量：</td>
						<td><input type="text" name="spSl" id="spSl" class="easyui-validatebox" required="true"/></td>
					
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>验收结论：</td>
					<td><input type="text" name="ysjl" id="ysjl" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>操作员：</td>
						<td><input type="text" name="czy" id="czy" class="easyui-validatebox" required="true"/></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveStudent()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeStudentDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>