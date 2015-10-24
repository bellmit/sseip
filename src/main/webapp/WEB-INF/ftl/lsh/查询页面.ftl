<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>北京双友之春</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/css.css" />
<script type="text/javascript" src="js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/sdmenu.js"></script>
<script type="text/javascript" src="js/laydate/laydate.js"></script>
</head>
<body>
<div class="header">
	 <div class="logo"><img src="img/logo.png" /></div>    
				<div class="header-right">
                <i class="icon-off icon-white"></i> <a id="modal-973558" href="#modal-container-973558" role="button" data-toggle="modal">注销</a> 
                <div id="modal-container-973558" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width:300px; margin-left:-150px; top:30%">
				<div class="modal-header">
					 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h3 id="myModalLabel">
						注销系统
					</h3>
				</div>
				<div class="modal-body">
					<p>
						您确定要注销退出系统吗？
					</p>
				</div>
				<div class="modal-footer">
					 <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button> <a class="btn btn-primary" style="line-height:20px;" href="登录.html" >确定退出</a>
				</div>
			</div>
				</div>
</div>
<!-- 顶部 -->     
            
<div id="middle">
     <div class="left">
     
     <script type="text/javascript">
var myMenu;
window.onload = function() {
	myMenu = new SDMenu("my_menu");
	myMenu.init();
};
</script>

<div id="my_menu" class="sdmenu">
	<div >
		<span>信息管理</span>
        <a href="发布客服.html">发布客服</a>
		<a href="查询页面.html">查看资源</a>
		<a href="分理处发货排行榜.html">新资源管理</a>
		<a href="开票界面.html">客服转资源管理</a>
		<a href="客户投诉.html">住院患者管理</a>
		<a href="线路管理.html">出院患者管理</a>
		<a href="#">下载文件</a>
        <a href="#">上传文件</a>
	</div>
	<div class="collapsed">
		<span>资源管理</span>
		<a href="#">资源统计</a>
        <a href="#">即将过期资源</a>
        <a href="#">已过期资源</a>
        <a href="#">无效资源</a>
	</div>
	<div class="collapsed">
		<span>用户管理</span>
		 <a href="#">用户管理</a>
		 <a href="#">添加用户</a>
	</div>    
 	<div class="collapsed">
		<span>平台管理</span>
		<a href="部门管理.html">部门管理</a>
		<a href="添加部门.html">添加部门</a>
		<a href="国家管理.html">国家管理</a>
        <a href="添加国家.html">添加国家</a>
		<a href="网站管理.html">网站管理</a>
		<a href="添加网站.html">添加网站</a>
		<a href="病种管理.html">病种管理</a>
        <a href="添加病种.html">添加病种</a>
	</div> 
</div>

     </div>
     <div class="Switch"></div>
     <script type="text/javascript">
	$(document).ready(function(e) {
    $(".Switch").click(function(){
	$(".left").toggle();
	 
		});
});
</script>

     <div class="right"  id="mainFrame">
     	<div class="tiaojian">
        	<div style=" float:left; margin-right:10px; ">
            欢迎您 ： <font color="#FF0000">xxx</font><font style="margin-left:20px;">2015/10/21 上午 10:00:00 星期三</font><font style="color:red; margin-left:20px;">今天我要完成我心中的任务</font>
            <div>查询时间 ： <input type="text"  value="" name="#" style=" width:100px;"/>到<input type="text" value="" name="#" style=" width:100px; margin-right:20px;"/>  查询条件 ： <select name="" style=" height:25px;"><option>请选择</option><option>患者姓名</option><option>患者症状</option><option>患者年龄</option><option>患者电话</option><option>所属网站（是否有效）</option><option>患者地址</option><option>紧急</option><option>权重</option><option>是否住院</option><option>是否打电话</option><option>是否转资源</option><option>是否边缘</option><option>客服录入姓名</option><option>重复电话查询</option></select></div>
            </div>
            <div style=" float:left;">
            <div id="dis" style=" display:none;">
                <br>输入姓名 ： <input type="text" />
            </div>
            <div id="dis1" style="display:none;" >
				<br>输入症状：<input type="text" value="" name="zhengzhuangwx">
			</div>
            <div id="dis2" style="display: none;">
				<br>输入年龄：<input type="text" value="" name="agewx">
			</div>
            <div id="dis3" style="display: none;">
				<br>输入电话：<input type="text" value="" name="phonewx">
			</div>
            <div id="dis4" class="dis4" style="display:block;" >
                <br>
                <select name="userwebwx" style=" width:150px;" >
                <option selected="selected" value="flag">请选择网站名称</option>
                <option value="肾病导航">肾病导航</option>
                <option value="专家在线">专家在线</option>
                <option value="肾病我知道">肾病我知道</option>
                <option value="肾病无忧">肾病无忧</option>
                <option value="宣七一组">宣七一组</option>
                <option value="宣七二组">宣七二组</option>
                <option value="肾病检查网">肾病检查网</option>
                </select>
                <select name="menzhenbu" style=" width:90px;" >
                <option value="flag">请选部门</option>
                <option value="刘学梅部门">刘学梅部门</option>
                <option value="门诊5部">门诊5部</option>
                </select>
                <select name="eanamewx">
                <option selected="" value="flag">请选择电话</option>
                <option value="周秀上海">邢台门诊部  周秀上海</option>
                <option value="周艳霞">门诊3部  周艳霞</option>
                <option value="周永">九分院  周永</option>
                <option value="周勇">刘洪娜部门  周勇</option>
                <option value="周郁美上海">邢台门诊部  周郁美上海</option>
                <option value="朱欢">门诊3部  朱欢</option>
                <option value="朱金辉">九分院  朱金辉</option>
                <option value="朱可可">邢台门诊部  朱可可</option>
                <option value="朱石磊">八分院  朱石磊</option>
                <option value="朱晓敏">八分院  朱晓敏</option>
                <option value="朱晓敏1">刘洪娜部门  朱晓敏1</option>
                </select>
                <select name="kfwx" >
                <option selected="" value="flag">请选择客服</option>
                <option value="王桐帅">王桐帅</option>
                <option value="张立">张立</option>
                <option value="武孟姣">武孟姣</option>
                <option value="周培志">周培志</option>
                </select>
                <select name="panduan">
                    <option value="flag">请选择病种</option>
                    <option value="肾炎">肾炎</option>
                    <option value="肾综">肾综</option>
                    <option value="尿毒症">尿毒症</option>
                    <option value="肾功能不全">肾功能不全</option>
                    <option value="多囊肾">多囊肾</option>
                    <option value="肾囊肿">肾囊肿</option>
                    <option value="IGA">IGA</option>
                    <option value="紫癜肾">紫癜肾</option>
                    <option value="狼疮肾">狼疮肾</option>
                    <option value="高血压肾病">高血压肾病</option>
                    <option value="糖尿病肾病">糖尿病肾病</option>
                    <option value="其他">其他</option>
                    <option value="糖尿病">糖尿病</option>
                    <option value="乙肝相关性肾病">乙肝相关性肾病</option>
                    <option value="直接留电话">直接留电话</option>
                </select>
                <br>
                <input type="radio" value="0" name="sfyx">
                有效  
                <input type="radio" value="3" name="sfyx">
                待定  
                <input type="radio" value="2" name="sfyx">
                过期  
                <input type="radio" value="4" name="sfyx">
                报备   
                <input type="radio" value="5" name="sfyx">
                追加报备  
                <input type="radio" value="1" name="sfyx">
                无效        
                <br>
                <input type="radio" value="0" name="hotflag">
                客服  
                <input type="radio" value="1" name="hotflag">
                热线  
                <input type="radio" value="3" name="hotflag">
                QQ(宣传)  
                <input type="radio" value="8" name="hotflag">
                QQ(客服)  
                <input type="radio" value="7" name="hotflag">
                企业QQ  
                <input type="radio" value="4" name="hotflag">
                微博(宣传)  
                <input type="radio" value="9" name="hotflag">
                微博(客服)  
                <input type="radio" value="5" name="hotflag">
                调查问卷  
                <input type="radio" value="6" name="hotflag">
                第三方  
                <input type="radio" value="2" name="hotflag">
                宣传   
                <input type="radio" value="24" name="hotflag">
                微信
                <br>
                <input type="hidden" value="" name="conentswx">
                <input type="hidden" value="" name="userphone">
                </div>
            <div id="dis5" style="display:none;">
				<br>输入地址：<input type="text" value="" name="addresswx">
			</div>
            <div id="dis7" style="display:none;">
				<br>紧急：<input type="radio" value="1" name="bjwx">是  <input type="radio" value="0" name="bjwx">否
			</div> 
            <div id="dis8" style="display:none">
                <br>权重：
                <input type="radio" value="0" name="qzwx">
                <font color="red">高</font>
                <input type="radio" value="1" name="qzwx">
                <font color="green">中</font>
                <input type="radio" value="2" name="qzwx">
                <font color="blue">低</font>
			</div>
            <div id="dis13" style="display: none;">
                <br>
                <input type="radio" value="0" name="sfzywx" checked="">
                住院  
                <input type="radio" value="1" name="sfzywx">
                未住院
            </div>
            <div id="dis14" style="display:none;">
                <br>
                <input type="radio" value="0" name="sfdhwx">
                打电话  
                <input type="radio" value="1" name="sfdhwx">
                未打电话  
                <input type="radio" value="2" name="sfdhwx">
                无人接听  
                <input type="radio" value="3" name="sfdhwx">
                有意向  
                <input type="radio" value="4" name="sfdhwx">
                关机  
                <input type="radio" value="5" name="sfdhwx">
                停机
                <br>
                <input type="radio" value="6" name="sfdhwx">
                拒接  
                <input type="radio" value="7" name="sfdhwx">
                重复  
                <input type="radio" value="8" name="sfdhwx">
                通话中  
                <input type="radio" value="9" name="sfdhwx">
                呼叫等待  
                <input type="radio" value="10" name="sfdhwx">
                来电转移   
                <input type="radio" value="11" name="sfdhwx">
                已加微信
            </div>
            <div id="dis15" style="display:none;">
                <br>
                <input type="radio" value="eeee" name="zzystas">
                是
            </div>
            <div id="dis16" style="display:none;">
                <br>
                  边缘：
                <input type="radio" value="1" name="bianyuan">
                <font color="red">是</font>
                <input type="radio" value="0" name="bianyuan">
                <font color="green">否</font>
            </div> 
            <div id="dis17" style="display:none;">
                <br>
                输入客服录入姓名：
                <input type="text" value="" name="bynamewx">
             </div>  
            <div id="dis18" style="display:none;">
                <br>
                录入电话：
                <input type="text" value="" name="byphonewx">
            </div>
            </div>
            <div style="margin-left:10px; float:left;">
                <br>
                <input type="button" onclick="checkdata();" value="查询/导出excel表">
            </div>
            <div style="float:left;width:700px;margin-top:15px; margin-bottom:15px;" >
                导出excel表：
                <input type="radio" value="no" name="excel">
                是
                <input type="radio" value="no" name="excel" checked="">
                否      
                <font color="green">
                <b>输入过期天数：</b>
                </font>
                <input type="text" name="bqname" value="" size="10">
                       查询结果是：183873条
            </div>            
        </div>
            <div class="right_cont" style="float:left;">     
   <div class="title_right"><strong>客服信息管理</strong></div>
   <table class="table table-bordered table-striped table-hover" >
     <tbody>
       <tr align="center">
         <td nowrap="nowrap"><strong><a href="#">全</a>/<a href="#">反</a></strong></td>
         <td nowrap="nowrap"><strong>患者姓名</strong></td>
         <td style="width:80px;"><strong>患者症状</strong></td>
         <td nowrap="nowrap"><strong>地址</strong></td>
         <td><strong>年龄</strong></td>
         <td style="width:80px;"><strong>最终归属</strong></td>
         <td style="width:80px;"><strong>发布客服</strong></td>
         <td style="width:130px;"><strong>所属网站</strong></td>
         <td><strong>电话备注</strong></td>
         <td style="width:180px;"><strong>网站url地址</strong></td>
         <td><strong>是否报备</strong></td>
         <td><strong>是否住院</strong></td>
         <td><strong>添加资源</strong></td>
         <td style="width:80px;"><strong>提交时间</strong></td>
         <td width="80" nowrap="nowrap"><strong> 操作 </strong></td>
         </tr>
       <tr align="center">
         <td nowrap="nowrap"><input type="checkbox" name="" /></td>
         <td nowrap="nowrap">zz </td>
         <td nowrap="nowrap"> </td>
         <td  style=" width:100px;">石家庄</td>
         <td nowrap="nowrap">59</td>
         <td nowrap="nowrap">0</td>
         <td nowrap="nowrap">0</td>
         <td nowrap="nowrap">0</td>
         <td nowrap="nowrap">0</td>
         <td nowrap="nowrap">0</td>
         <td nowrap="nowrap">0</td>
         <td nowrap="nowrap">0</td>
         <td nowrap="nowrap">0</td>
         <td nowrap="nowrap">0</td>
         <td nowrap="nowrap"><a href="#">删除</a> <a href="#">编辑</a></td>
         </tr>
     </tbody>
   </table>
   <div style=" width:310px; height:150px;border:solid 1px #CCC; margin-left:15px; padding:15px;">
   <fieldset style="height: 100px; width:300px; float:left; color:#336666; border-color:#666;">
<legend>
<font size="2" color="#36424a" style="font-weight:bolder;">删除/转移</font>
</legend>
<input type="button" onclick="deleteXZ();" value="批量删除">
<font size="2"> 共有50条资源</font>
<br>
<br>
<font size="2">将资源转给：</font>
<select id="admininfo_name" name="admininfo_name">
<option value="请选择客服人员">请选择客服人员</option>
<option value="admin"> admin </option>
<option value="houziru"> houziru </option>
<option value="白雪"> 白雪 </option>
<option value="王小云"> 王小云 </option>
<option value="吴丽霞"> 吴丽霞 </option>
</select>
<input type="button" onclick="ziyuanZY()" value="转移" name="zy">
</fieldset>
</div>
     </div>             
     </div>
    </div>   
 <script>
!function(){
laydate.skin('molv');
laydate({elem: '#Calendar'});
}();
 

</script>



 
</body>
</html>
