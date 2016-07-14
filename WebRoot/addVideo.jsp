<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.download.action.VideoTypeAction"%>
<%@page import="com.download.model.Videotype"%>
<%@page import="com.download.dao.VideoTypeDao"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加视频</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" href="<%=basePath%>images/logo.png"/>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/font-awesome.css"/>
	
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootstrap-fileupload.js"></script>
  
  </head>
  
  <body>
 <header>
	    <div class="logo"><i class="fa fa-youtube-play"></i><a href="index.jsp">DownLoadV</a></div>
<!-- 	    
	    <nav>
			<ul>
				<li class="active"><a href="index.jsp">首页</a></li>
				<li class=""><a href="index.jsp">电影</a></li>
				<li class=""><a href="index.jsp">电视剧</a></li>
				<li class=""><a href="index.jsp">节目</a></li>
			</ul>
		</nav>
	 -->
	 <div class="containered">
					<div style="float: left;margin-left:500px; position: relative; top:20px; height: 40px;">
						<div class="bdsharebuttonbox">
							<a href="#" class="bds_more" data-cmd="more"></a>
							<a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
							<a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
							<a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
							<a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a>
							<a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
						</div>
						<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
						</script>
					</div>
			</div>
	    <div class="account">
    		<c:choose>
    			<c:when test="${customer.customerName==null}">
    				<a href="login.jsp">登录</a>
    				<a href="reg.jsp">用户注册</a>
    			</c:when>
    			<c:otherwise>
    				<c:out value="${customer.customerName}"></c:out>，欢迎您！
    			</c:otherwise>
    		</c:choose>
    	</div>
	</header>
      
      <nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
     <!-- <a class="navbar-brand" href="#">Brand</a> -->
      <a class="navbar-brand" href="#">
        <img alt="Brand" src="images/logo.png">
      </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">首页 <span class="sr-only">(current)</span></a></li>
        <li><a href="#">电影</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">类型 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left" action = "video/video_queryVideo" method = "post" role="search">
        <div class="form-group">
          <input type="text" class="form-control" title="关键词" name="keyWords" placeholder="输入关键词...">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">电视剧</a></li>
        <li><a href="#">节目</a></li>
        
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
  
			
</nav>

       <main class="container-fluid">
       	<div class="row">
          <div class="col-md-10">
            <s:form action="video/video_addVideo" cssClass="form-horizontal" enctype="multipart/form-data">
             <div class="panel panel-success">
             	<div class="panel-heading">
               		<h4 class="panel-title"><i class="fa fa-download"></i>添加视频</h4>
             	</div>
	             <div class="panel-body">
	           	   <div class="form-group">
		                <label class="control-label col-md-3">影片名</label>
		                <div class="col-md-4">
		                   <input type="text" name="video.videoName" class="form-control input-sm" required> 
		                </div>
             	   </div>
	               <div class="form-group">
	                	<label class="control-label col-md-3">描述</label>
	                	<div class="col-md-2">
	                  	 <input type="text" name="video.introduce" class="form-control input-sm" required> 
	                	</div>
	               </div>
	               
	              <!-- 有待商榷 -->
	         <!-- 
	              <div class="form-group">
	                <label class="control-label col-md-3">类型</label>
	                <div class="col-md-4">
	         			                </div>
	             </div>
	              -->
	        <!-- <div class="form-group">
	                <label class="control-label col-md-3">类型</label>
	                 <div class="dropdown">
					    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
					      类型
					      <span class="caret"></span>
					    </button>
					    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
					    <s:iterator value="downloadList" status="status">
					    
					    	<s:a href="download/download_showDetail?download.downloadId=%{downloadId}">
										          <s:property value="downloadId"></s:property></s:a>
					    </s:iterator>
					    </ul>
					  </div>
	             </div> -->
	             
	            	              <div class="form-group">
	                <label class="control-label col-md-3">导演</label>
	                <div class="col-md-2">
	                   <input type="text" name="video.director" class="form-control input-sm" required> 
	                </div>
	             </div>
	              <div class="form-group">
	                <label class="control-label col-md-3">上映日期</label>
	                <div class="col-md-4">
	                   <input type="text" name="video.pubishData" class="form-control input-sm" required> 
	                </div>
	             </div>
	              <div class="form-group">
	                <label class="control-label col-md-3">主要演员</label>
	                <div class="col-md-2">
	                   <input type="text" name="video.cast" class="form-control input-sm" required> 
	                </div>
	             </div>
	              <div class="form-group">
	                <label class="control-label col-md-3">影片照</label>
	                <div class="col-md-4">
	                   <div  class="fileupload fileupload-new" data-provides="fileupload">
	                   <div class="fileupload-new thumbnail" style="with:200px;height:150px;">
	                      <img src="<%=basePath%>upload/demoUpload.jpg" alt=""/>
	                   </div>
	                   <div class="fileupload-preview fileupload-exists thumbnail" 
                                   style="max-width: 200px; max-height:150px; line-height: 20px;">
                       </div>
	             			<div>
					             <span class="btn btn-file btn-primary">
					             	<span class="fileupload-new">浏览</span>
						      	   	<span class="fileupload-exists">浏览</span>
						        	<input type="file" name="videoPhoto"/>
						       	 </span><!--input type="file" 就可以上传  name="foodPhoto"这个文件域的名字-->
						        <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">取消</a>
		         				
		         			</div>
		         		</div>
	            	 </div>
	             </div>
               <!-- 这里还有待商榷 -->
              <div class="form-group">
                <label class="control-label col-md-3">路径</label>
                <div class="col-md-4">
  			   <input type="text" name="video.path" class="form-control input-sm" required> 
                </div>
             </div>
             
             <div class="form-group col-md-3">
               <button type="submit" class="btn btn-success pull-right">提 交</button>
             </div>
            </div>
            </div>
            </s:form>
             </div>
          </div>
       </main>
	<!-- 
	<script src="<%=basePath%>js/jquery.min.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
	<script src="<%=basePath%>js/bootstrap-fileupload.js"></script>
   -->
  </body>
</html>
