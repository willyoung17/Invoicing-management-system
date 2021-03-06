<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>企业进销存管理系统</title>
<%
	// 权限验证
	if(session.getAttribute("currentUser")==null){
		response.sendRedirect("index.jsp");
		return;
	}
%>
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(function(){
		/*采购管理
		*
		*/
		var treeData=[{
			text:"采购管理",
			children:[{
				text:"采购入库单",
				attributes:{
					url:"caigouruku.jsp"
				}
			},{
				text:"采购退货单",
				attributes:{
					url:"caigoutuihuo.jsp"
				}
			}]
		}];
		
		// 实例化树菜单
		$("#tree").tree({
			data:treeData,
			lines:true,
			onClick:function(node){
				if(node.attributes){
					openTab(node.text,node.attributes.url);
				}
			}
		});
		
		// 新增Tab
		function openTab(text,url){
			if($("#tabs").tabs('exists',text)){
				$("#tabs").tabs('select',text);
			}else{
				var content="<iframe frameborder='0' scrolling='auto' style='width:100%;height:100%' src="+url+"></iframe>";
				$("#tabs").tabs('add',{
					title:text,
					closable:true,
					content:content
				});
			}
		}
		/*销售管理
		*
		*/
		var treeData=[{
			text:"销售管理",
			children:[{
				text:"销售出库单",
				attributes:{
					url:"xiaoshou.jsp"
				}
			},{
				text:"销售退货单",
				attributes:{
					url:"studentInfoManage.jsp"
				}
			}]
		}];
		
		// 实例化树菜单
		$("#tree1").tree({
			data:treeData,
			lines:true,
			onClick:function(node){
				if(node.attributes){
					openTab(node.text,node.attributes.url);
				}
			}
		});
		
		// 新增Tab
		function openTab(text,url){
			if($("#tabs").tabs('exists',text)){
				$("#tabs").tabs('select',text);
			}else{
				var content="<iframe frameborder='0' scrolling='auto' style='width:100%;height:100%' src="+url+"></iframe>";
				$("#tabs").tabs('add',{
					title:text,
					closable:true,
					content:content
				});
			}
		}
		/*库存管理
		*
		*/
		var treeData=[{
			text:"库存管理",
			children:[{
				text:"库存盘点",
				attributes:{
					url:"kucunpandian.jsp"
				}
			},{
				text:"价格调整",
				attributes:{
					url:"studentInfoManage.jsp"
				}
			}]
		}];
		//实例化树菜单
		$("#tree2").tree({
			data:treeData,
			lines:true,
			onClick:function(node){
				if(node.attributes){
					openTab(node.text,node.attributes.url);
				}
			}
		});
		
		// 新增Tab
		function openTab(text,url){
			if($("#tabs").tabs('exists',text)){
				$("#tabs").tabs('select',text);
			}else{
				var content="<iframe frameborder='0' scrolling='auto' style='width:100%;height:100%' src="+url+"></iframe>";
				$("#tabs").tabs('add',{
					title:text,
					closable:true,
					content:content
				});
			}
		}
		/*
		 *信息查询
		 */
		var treeData=[{
			text:"信息查询",
			children:[{
				text:"库存管理",
				attributes:{
					url:"marketSearch.jsp"
				}
			},{
				text:"商品查询",
				attributes:{
					url:"commodityQuery.jsp"
				}
			},{
				text:"销售排行",
				attributes:{
					url:"sortMarket.jsp"
					}
				}]
		}];
		//实例化树菜单
		$("#tree3").tree({
			data:treeData,
			lines:true,
			onClick:function(node){
				if(node.attributes){
					openTab(node.text,node.attributes.url);
				}
			}
		});
		
		// 新增Tab
		function openTab(text,url){
			if($("#tabs").tabs('exists',text)){
				$("#tabs").tabs('select',text);
			}else{
				var content="<iframe frameborder='0' scrolling='auto' style='width:100%;height:100%' src="+url+"></iframe>";
				$("#tabs").tabs('add',{
					title:text,
					closable:true,
					content:content
				});
			}
		}
		
		/*
		 *基本资料
		 */
		var treeData=[{
			text:"基本资料",
			children:[{
				text:"商品资料管理",
				attributes:{
					url:"gradeInfoManage.jsp"
				}
			},{
				text:"客户资料管理",
				attributes:{
					url:"studentInfoManage.jsp"
				}
			},{
				text:"供应商资料管理",
				attributes:{
					url:"studentInfoManage.jsp"
					}
				}]
		}];
		//实例化树菜单
		$("#tree4").tree({
			data:treeData,
			lines:true,
			onClick:function(node){
				if(node.attributes){
					openTab(node.text,node.attributes.url);
				}
			}
		});
		
		// 新增Tab
		function openTab(text,url){
			if($("#tabs").tabs('exists',text)){
				$("#tabs").tabs('select',text);
			}else{
				var content="<iframe frameborder='0' scrolling='auto' style='width:100%;height:100%' src="+url+"></iframe>";
				$("#tabs").tabs('add',{
					title:text,
					closable:true,
					content:content
				});
			}
		}
		/*
		 *基本资料
		 */
		var treeData=[{
			text:"帮助",
			children:[{
				text:"关于我们",
				attributes:{
					url:"aboutUs.jsp"
				}
			},{
				text:"技术支持",
				attributes:{
					url:"studentInfoManage.jsp"
				}
			},{
				text:"技术网站",
				attributes:{
					url:"studentInfoManage.jsp"
					}
				}]
		}];
		//实例化树菜单
		$("#tree5").tree({
			data:treeData,
			lines:true,
			onClick:function(node){
				if(node.attributes){
					openTab(node.text,node.attributes.url);
				}
			}
		});
		
		// 新增Tab
		function openTab(text,url){
			if($("#tabs").tabs('exists',text)){
				$("#tabs").tabs('select',text);
			}else{
				var content="<iframe frameborder='0' scrolling='auto' style='width:100%;height:100%' src="+url+"></iframe>";
				$("#tabs").tabs('add',{
					title:text,
					closable:true,
					content:content
				});
			}
		}
	});
</script>
</head>
<body class="easyui-layout">
	<div region="north" style="height: 80px;background-color: #E0EDFF">
		<div align="left" style="width: 80%;float: left"><img src="images/main.jpg"></div>
		<div style="padding-top: 50px;padding-right: 20px;">当前用户：&nbsp;<font color="red" >${currentUser.userName }</font></div>
		
	</div>
	<div region="center">
		<div class="easyui-tabs" fit="true" border="false" id="tabs">
			<div title="首页" >
				<div align="center" style="padding-top: 100px;"><font color="red" size="10">欢迎使用</font></div>
			</div>
		</div>
	</div>
	<div region="west" style="width: 150px;" title="导航菜单" split="true">
		<ul id="tree"></ul>
		<ul id="tree1"></ul>
		<ul id="tree2"></ul>
		<ul id="tree3"></ul> 
		<ul id="tree4"></ul>
		<ul id="tree5"></ul>
	</div>
	<div region="south" style="height: 25px;" align="center">版权所有<a href="http://www.mengzhiyi.com">www.梦之翼.com</a>侵权必究</div>
</body>
</html>