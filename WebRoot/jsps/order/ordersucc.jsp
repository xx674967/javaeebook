<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>ordersucc.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/order/ordersucc.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/book/list.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/pager/pager.css'/>" />
    <script type="text/javascript" src="<c:url value='/jsps/pager/pager.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jsps/js/book/list.js'/>"></script>
  </head>
  
  <body>
<div class="div1">
	<span class="span1">订单已生成</span>
</div>
<div class="div2">
	<img src="<c:url value='/images/duihao.jpg'/>" class="img"/>
	<dl>
		<dt>订单编号</dt>
		<dd>${order.oid }</dd>
		<dt>合计金额</dt>
		<dd><span class="price_t">&yen;${order.total }</span></dd>
		<dt>收货地址</dt>
		<dd>${order.address }</dd>
	</dl>
	<span>网上书城感谢您的支持，祝您购物愉快！</span>
	<a href="<c:url value='/OrderServlet?method=paymentPre&oid=${order.oid }'/>" id="linkPay">支付</a>
</div>
<hr>
<!-- 商品推荐 -->
<c:choose>
  	<c:when test="${bookflag == 1}">
  		<a style="border-color:blue;">购买该书的小伙伴也买了下列这些书：</a>
  	</c:when>
  	<c:otherwise>
  		<a style="border-color:blue;">猜你喜欢：</a>
  	</c:otherwise>
  	</c:choose>
	<pr>
	<ul>
<c:forEach items="${books }" var="book">
  <li>
  <div class="inner">
    <a class="pic" href="<c:url value='/BookServlet?method=load&bid=${book.bid }'/>"><img src="<c:url value='/${book.image_b }'/>" border="0"/></a>
    <p class="price">
		<span class="price_n">&yen;${book.currPrice }</span>
		<span class="price_r">&yen;${book.price }</span>
		(<span class="price_s">${book.discount }折</span>)
	</p>
	<p><a id="bookname" title="${book.bname }" href="<c:url value='/BookServlet?method=load&bid=${book.bid }'/>">${book.bname }</a></p>
	<%-- url标签会自动对参数进行url编码 --%>
	<c:url value="/BookServlet" var="authorUrl">
		<c:param name="method" value="findByAuthor"/>
		<c:param name="author" value="${book.author }"/>
	</c:url>
	<c:url value="/BookServlet" var="pressUrl">
		<c:param name="method" value="findByPress"/>
		<c:param name="press" value="${book.press }"/>
	</c:url>
	<p><a href="${authorUrl }" name='P_zz' title='${book.author }'>${book.author }</a></p>
	<p class="publishing">
		<span>出 版 社：</span><a href="${pressUrl }">${book.press }</a>
	</p>
	<p class="publishing_time"><span>出版时间：</span>${book.publishtime }</p>
  </div>
  </li>
</c:forEach>
</ul>
  </body>
</html>
