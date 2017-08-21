<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>销售退货</title>
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	var url;
	/* 删除学生方法 */
	function deleteStudent(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的数据！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].number);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确认要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("xsthdeleteservlet",{number:ids},function(result){
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
/* 查询学生方法 */
	function searchStudent(){
		$('#dg').datagrid('load',{
			s_xsthID : $('#s_xsthID').val(),
			s_khname : $('#s_khname').val(),
			s_ysjl : $('#s_ysjl').combobox("getValue"),
			s_bthdate : $('#s_bthdate').datebox("getValue"),
			s_ethdate : $('#s_ethdate').datebox("getValue")
		});
	}
	/* 退货他入库 */
	function rukuspinfo(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要入库的数据！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].xsthID);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确认要入库这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("xsthrukuservlet",{number:ids},function(result){
					if(result.success){
						$.messager.alert("系统提示","您已成功入库<font color=red>"+result.delNums+"</font>条数据！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert('系统提示',result.errorMsg);
					}
				},"json");
			}
		});
	}
	/* 打开添加学生对话框 */
	function openStudentAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","增加退货数据");
		url="xsthsave";
	}
	/* 保存学生 */
	function saveStudent(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				$()
				if($('#ysjl').combobox("getValue")==""){
					$.messager.alert("系统提示","请验收结论");
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
	/* 重置值方法 */
	function resetValue(){
		$("#s_xsthID").val("");
		$("s_khname").val("");
		$("#s_ysjl").combobox("setValue","");
		$("#thdate").datebox("setValue","");
		$("#pzs").val("");
		$("#je").val("");
		$("#jsr").val("");
		$("#jsfs").val("");
	}
	/* 关闭学生对话框方法 */
	function closeStudentDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	/* 打开学生修改对话框方法 */
	function openStudentModifyDialog(){
		/* 当前选中行 */
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		/* $("#czy").attr("readonly","readonly");
		$("#jsr").attr("readonly","readonly"); */
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑销售退货信息");
		$("#fm").form("load",row);
		url="xsthsave?number="+row.number;
	}
</script>
</head><!-- 表头信息 -->
<body style="margin: 5px;">
	<table id="dg" title="销售退货" class="easyui-datagrid" fitColumns="true"
	 pagination="true" rownumbers="true" url="xiaoshoutuihuoServlet" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="number" width="100" align="center" hidden="true">编号</th>
				<th field="xsthID" width="100" align="center">销售退货编号</th>
				<th field="pzs" width="100" align="center">品种数</th>
				<th field="je" width="100" align="center">销售总金额</th>
				<th field="ysjl" width="100" align="center">验收结论</th>
				<th field="khname" width="100" align="center">客户名称</th>
				<th field="thdate" width="100" align="center">退货日期</th>
				<th field="jsr" width="100" align="center">结算人</th>
				<th field="jsfs" width="150" align="center">结算方式</th>
			</tr>
		</thead>
	</table>
	<!-- 给增删改按钮添加事件 -->
	<div id="tb">
		<div>
			<a href="javascript:openStudentAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">增添</a>
			<a href="javascript:openStudentModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">管理</a>
			<a href="javascript:deleteStudent()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">移除</a>
			<a href="javascript:rukuspinfo()" class="easyui-linkbutton" iconCls="icon-redo" plain="true">入库</a>
		</div>
		<!-- 添加查询条件 -->
		<div>&nbsp;退货编号：&nbsp;<input type="text" name="s_xsthID" id="s_xsthID" size="10"/>
		&nbsp;客户名称：&nbsp;<input type="text" name="s_khname" id="s_khname" size="10"/>
		&nbsp;验收结论：&nbsp;<select class="easyui-combobox" id="s_ysjl" name="s_ysjl editable="false" panelHeight="auto">
		    <option value="">请选择...</option>
			<option value="合格">合格</option>
			<option value="不合格">不合格</option>
		</select>
		&nbsp;退货日期：&nbsp;<input class="easyui-datebox" name="s_bthdate" id="s_bthdate" editable="false" size="10"/>-><input class="easyui-datebox" name="s_ethdate" id="s_ethdate" editable="false" size="10"/>
		<!-- 查询按钮添加查询事件 -->    
		<a href="javascript:searchStudent()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></div>
	</div>
	<!-- 添加修改模态框的text框 -->
	<div id="dlg" class="easyui-dialog" style="width: 570px;height: 350px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="5px;">
				<tr>
					<td>销售退货编号：</td>
					<td><input type="text" name="xsthID" id="xsthID" class="easyui-validatebox" required="true"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>品种数：</td>
					<td><input type="text" name="pzs" id="pzs" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>验收结论：</td>
					<td><select class="easyui-combobox" id="ysjl" name="ysjl" editable="false" panelHeight="auto" style="width: 155px">
					    <option value="">请选择...</option>
						<option value="合格">合格</option>
						<option value="不合格">不合格</option>
					</select></td>
					<td></td>
					<td>退货日期：</td>
					<td><input class="easyui-datebox" name="thdate" id="thdate" required="true" editable="false" /></td>
				</tr>
				<tr>
					<td>销售总金额</td>
					<td><input type="text" name="je" id="je" class="easyui-validatebox" required="true"/></td>
					<td></td>
					<td>客户名称：</td>
					<td><input type="text" name="khname" id="khname" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>操作员</td>
					<td><input type="text" name="czy" id="czy" class="easyui-validatebox" required="true"/></td>
					<td></td>
					<td>结算人</td>
					<td><input type="text" name="jsr" id="jsr" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>结算方式</td>
					<td><input type="text" name="jsfs" id="jsfs" class="easyui-validatebox" required="true"/></td>
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