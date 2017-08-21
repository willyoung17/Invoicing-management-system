<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title>梦之翼</title>
		<style type="text/css">
			#ix{
	position: relative;
	margin-top: -43%;
}
.img{
	position: absolute;
	top: 0;
	width: 79%;
	display: none;
	left: 20%;
}
.active{
	display: block;
}
.iu{
	list-style-type: none;
	margin-left: 400px;
	
}
.pp{
	display:inline-block ;
}
		</style>
	</head>
	<body style="background:url(img/1.jpg); hight:100%; width:100%">
		<div style="display: inline-flex;color: azure; width: 100%; background:rgba(211, 211, 211, 0.26);;">
			<div style="    margin-left: 24%;color: lightyellow;">
				<h3 >梦之翼电子有限公司</h3>
			</div >
			<div style="    margin-left: 35%;color:#02f424;;">
				<h3>热线电话:028-88888888</h3>
			</div>
		</div>
		<div style="color: white; width: 22%;height:30%;background:rgba(211, 211, 211, 0.41);">
			<div style="color:#b9ecd3;margin-left: 30%;"> <h1>联系我们</h1></div>
			<div style="margin-left: 16%;">
			<table>
				<tbody>
					<tr>
						<td>
							<div>姓名:<input type="text"></div>
							<div>公司:<input type="text"></div>
							<div>电话:<input type="text"></div>
							<div>地址:<input type="text"></div>
							<div>传真:<input type="text"></div>
							<div>问题:<input type="text"></div>
							<div>时间:<input type="time"></div>
							<div>邮箱:<input type="email"></div>
							<div style="margin-left: 40%;"><input type="button" value="  提交  "></div>
						</td>
					</tr>
				</tbody>
			</table>
			</div>
			<div>
				   <ul>
          <li><a href="../Home/News">新闻中心</a></li>
                            <li><a href="../Home/News?ID=29">>科技新闻</a></li>
                            <li><a href="../Home/News?ID=31">>公司新闻</a></li>
         
        </ul>
        <ul>
          <li><a href="../Home/Products">产品展示</a></li>
                            <li><a href="../Home/Products?ID=7">>叠层母排</a></li>
                            <li><a href="../Home/Products?ID=8">>软连接</a></li>
                            <li><a href="../Home/Products?ID=9">>金属基</a></li>
        </ul>
        <ul>
          <li><a href="../Home/About">关于我们</a></li>
                            <li><a href="../Home/About?ID=14">>产研能力</a></li>
                            <li><a href="../Home/About?ID=15">>联系我们</a></li>
                            <li><a href="../Home/About?ID=16">>公司资质</a></li>
                            <li><a href="../Home/GuestBook?ID=57">>留言反馈</a></li>
        </ul>
        <ul>
          <li><a href="../Home/Employee">员工风采</a></li>
                            <li><a href="../Home/Employee?ID=94">>员工风采</a></li>
        </ul>
        <ul>
          <li><a href="../Home/Partners">合作伙伴</a></li>
                            <li><a href="../Home/Partners?ID=38">>友情链接</a></li>
        </ul>

				
			</div>
		</div>
		<div id="ix">
			<img src="img/1.jpg" class="img active"></img>
			<img src="img/2.jpg"class="img"></img>
			<img src="img/3.jpg"class="img"></img>
			<img src="img/4.jpg"class="img"></img>
			<img src="img/5.jpg"class="img"></img>
			<ul class="iu">
				<li class="pp">1</li>
				<li class="pp">2</li>
				<li class="pp">3</li>
				<li class="pp">4</li>
				<li class="pp">5</li>
			</ul>
		</div>
	</body>
	<script type="text/javascript" src="js/jquery-2.1.4.js" ></script>
	<script type="text/javascript">
		var index =0;
var imgs =document.getElementsByClassName('img');

function changeImg(){
	index+=1;
	if (index==5) {
		index=0;
	}
		for(var i=0; i<imgs.length; i++){
		if(i == index){
			imgs[i].className = 'img active';
		} else {
			imgs[i].className = 'img';
		}
	}
}
setInterval(changeImg,1000);

function fanhui(){
	window.history.back();
}
	</script>
</html>