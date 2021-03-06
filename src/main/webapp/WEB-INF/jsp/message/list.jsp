<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <title>用户留言页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

	  <!-- Loading Bootstrap -->
	  <link href="${ pageContext.request.contextPath }/static/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	  <!-- Loading Flat UI -->
	  <link href="${ pageContext.request.contextPath }/static/css/flat-ui.min.css" rel="stylesheet">

    <!-- 自定义 -->
    <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/static/css/my/advice.css">


	  <link rel="shortcut icon" href="${ pageContext.request.contextPath }/static/img/favicon.ico">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
	  <script src="${ pageContext.request.contextPath }/static/js/vendor/html5shiv.js"></script>
	  <script src="${ pageContext.request.contextPath }/static/js/vendor/respond.min.js"></script>
    <![endif]-->

  </head>
  <body>

  <!--导航栏开始 -->
  <jsp:include page="${ pageContext.request.contextPath }/WEB-INF/jsp/controler/nav.jsp"></jsp:include>
  <!--导航栏结束 -->

  <!-- 左侧开始-->
  <jsp:include page="${ pageContext.request.contextPath }/WEB-INF/jsp/controler/left.jsp"></jsp:include>
  <!--左侧结束 -->

   
	<div class="container div_main">
		<!-- 搜索框开始-->
		<div class="row div_search">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				 <form action="list" role="search">
				    <div class="input-group">
				      <input type="text" class="form-control" placeholder="搜索留言" name="condition">
				      <span class="input-group-btn">
				        <input class="btn " type="submit" value="Go"/>
				      </span>
					</div><!-- /input-group -->
			    </form>
			   <span class="span_tag">筛选条件：</span>
			    <a href="list?category=0"><span class="label label-danger">未处理</span></a>
		    	<a href="list?category=1"><span class="label label-warning">处理中</span></a>
		    	<a href="list?category=2"><span class="label label-success">已处理</span></a>
			  
		    </div>
		    <div class="col-md-3"></div>
		 </div>
		 <!--搜索框结束 -->
		 <br/>

		<!-- 用户意见列表开始 -->
		<div class="row" id="div_advice">
			<c:forEach items="${pagination.items}" var="MessageBoard">
				<div class="panel
				<c:if test="${MessageBoard.state == 0}">panel-danger</c:if>
				<c:if test="${MessageBoard.state == 1}">panel-warning</c:if>
				<c:if test="${MessageBoard.state == 2}">panel-success</c:if>
				">

					<div class="panel-heading">
						<table>
							<tbody>
							<tr class="row">
								<td class="col-md-2">会员ID:${MessageBoard.userId}</td>
								<td class="col-md-3">会员姓名:${MessageBoard.userName}</td>
								<td class="col-md-4">留言时间：${MessageBoard.date}</td>
								<td class="col-md-3">
									状态：
									<c:if test="${MessageBoard.state == 0}">未处理</c:if>
									<c:if test="${MessageBoard.state == 1}">处理中</c:if>
									<c:if test="${MessageBoard.state == 2}">已处理</c:if>
								</td>
							</tr>
							</tbody>
						</table>
					</div>

					<div class="panel-body">
						<table>
							<tbody >
							<tr>
								<td class="col-md-11">
									<div class="div_danger">
										${MessageBoard.message}
									</div>
								</td>
								<td class="col-md-1">
									<c:if test="${MessageBoard.state == 0}"><button class="btn btn-primary">进行处理</button></c:if>
									<c:if test="${MessageBoard.state == 1}"><button class="btn btn-primary">处理完成</button></c:if>
									<c:if test="${MessageBoard.state == 2}"><button class="btn " disabled="true">已处理</button></c:if>

								</td>
							</tr>
							</tbody>
						</table>
					</div>
				</div>
			</c:forEach>

		</div>
		<!-- 用户意见列表结束-->


		<!-- 分页列表-->
		<jsp:include page="${ pageContext.request.contextPath }/WEB-INF/jsp/controler/page.jsp"></jsp:include>
		<!--分页列表结束-->

		
	</div>

    <!-- jQuery (necessary for Flat UI's JavaScript plugins) -->
  <script src="${ pageContext.request.contextPath }/static/js/vendor/jquery.min.js"></script>

  <script src="${ pageContext.request.contextPath }/static/js/flat-ui.min.js"></script>

  </body>
</html>
