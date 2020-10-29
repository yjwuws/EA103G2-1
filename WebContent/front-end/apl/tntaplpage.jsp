<%@page import="com.tnt.model.TntService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.housemanage.model.*"%>
<%@ page import="com.apl.model.*"%>
<%@ page import="com.tnt.model.*"%>

<%
	String tnt_no = (String) session.getAttribute("tnt_no");
	if (tnt_no == null) {
		tnt_no = request.getParameter("tnt_no");
	}

	List<Con_aplVO> list = (List<Con_aplVO>)request.getAttribute("list");
	if(list == null){
		Con_aplService con_aplService = new Con_aplService();
		list = con_aplService.tntgetAll(tnt_no);
	}
	pageContext.setAttribute("list",list);
	session.setAttribute("tnt_no", tnt_no);
	 
	TntService tntService = new TntService();
	TntVO tntVO = tntService.getOneTntProfile(tnt_no);

%>

<jsp:useBean id="aplSvc" scope="page" class="com.apl.model.Con_aplService" />
<jsp:useBean id="tntSvc" scope="page" class="com.tnt.model.TntService" />
<jsp:useBean id="lldSvc" scope="page" class="com.lld.model.LldService" />
<jsp:useBean id="hosSvc" scope="page" class="com.housemanage.model.HouseService" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>租屋申請</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel=stylesheet type="text/css" href="<%=request.getContextPath()%>/front-end/contract/css/contlist_tnt.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/navbar/navbar.css">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/front-end/house_manage/js/house_unrent.js" charset="UTF-8"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<div><jsp:include page="/front-end/navbar/navbar.jsp"/></div>
	<div id="body">
		<div id="left">
			<nav id="housenav">
				<div class="menu-btn">
					<div class="line line--1"></div>
					<div class="line line--2"></div>
					<div class="line line--3"></div>
				</div>
				<div class="nav-links">
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/apl/Con_aplServlet">
						<input type="hidden" name="tnt_no" value="<%=tnt_no%>">
						<input type="hidden" name="action" value="tntgetallapl">
						<button type="submit" class="link" style="color: #D37707;">租屋申請</button><br>
						<span id="count">共<%=list.size()%>個申請</span>
					</FORM>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/cont/ConServlet">
						<input type="hidden" name="tnt_no" value="<%=tnt_no%>">
						<input type="hidden" name="action" value="gettntcontract">
						<button type="submit" class="link">合約管理</button><br>
					</FORM>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/repair/repair.servlet">
						<input type="hidden" name="tnt_no" value="<%=tnt_no%>">
						<input type="hidden" name="action" value="getTntRepair">
						<button type="submit" class="link">修繕管理</button><br>
					</FORM>
					
				</div>
			</nav>
		</div>
		<div id="center">
			<%@ include file="tntpage1"%>
			<c:forEach var="con_aplVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
				<div class="houseinfo">
					<div class="linfo">
						<c:if test="${con_aplVO.apl_status == 0}">
						<img
							src="<%=request.getContextPath()%>/front-end/apl/images/aplimage.jpg"
							class="pic" />
						</c:if>
						<c:if test="${con_aplVO.apl_status == 1}">
						<img
							src="<%=request.getContextPath()%>/front-end/apl/images/accept.jpg"
							class="pic" />
						</c:if>
						<c:if test="${con_aplVO.apl_status == 2}">
						<img
							src="<%=request.getContextPath()%>/front-end/apl/images/reject.png"
							class="pic" />
						</c:if>
						<c:if test="${con_aplVO.apl_status == 3}">
						<img
							src="<%=request.getContextPath()%>/front-end/apl/images/cancel.jpg"
							class="pic" />
						</c:if>
					</div>
					<div class="cinfo">
						<ul>
<%-- 							<li><span class="infotitle">租屋申請編號 : </span><span>${con_aplVO.apl_no}</span></li> --%>
							<li><span class="infotitle">房屋名稱 : </span><span>${hosSvc.getHouseInfo(con_aplVO.hos_no).hos_name}</span></li>
							<li><span class="infotitle">房東姓名 : </span><span>${lldSvc.getOneLldProfile(hosSvc.getHouseInfo(con_aplVO.hos_no).lld_no).lld_name}</span></li>
							<li><span class="infotitle">租屋申請時間 : </span><span>${con_aplVO.apl_time}</span></li>
							<li><span class="infotitle">租屋開始時間 : </span><span>${con_aplVO.apl_str}</span></li>
							<li><span class="infotitle">租屋結束時間 : </span><span>${con_aplVO.apl_end}</span></li>
							<li><span class="infotitle">申請狀態 : </span><span>${aplSvc.getCon_statusText(con_aplVO.getApl_status())}</span></li>
						</ul>
					</div>					
						<div class="rinfo">
							<ul>
								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/apl/Con_aplServlet">
								<c:if test="${con_aplVO.apl_status == 0}">
								<li><button id="btn1">修改申請</button></li>
								</c:if>
								<input type="hidden" name="apl_no"  value="${con_aplVO.apl_no}">
			     				<input type="hidden" name="tnt_no" value="<%=tnt_no%>">
			     				<input type="hidden" name="action"	value="getOne_For_tntUpdate">
			     				</FORM>
			     				
			     				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/apl/Con_aplServlet">
			     				<c:if test="${con_aplVO.apl_status == 0}">
								<li><button id="btn2">取消申請</button></li>
								</c:if>
								<input type="hidden" name="apl_no"  value="${con_aplVO.apl_no}">
			     				<input type="hidden" name="apl_status" value=4>
			     				<input type="hidden" name="tnt_no" value="<%=tnt_no%>">
			     				<input type="hidden" name="action"	value="tntcancelapl">
			     				</FORM>
			     				
			     				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/HouseDet/HouseDetServlet?hos=${con_aplVO.hos_no}">
								<li><button id="btn3">瀏覽房屋</button></li>
								<input type="hidden" name="apl_no"  value="${con_aplVO.apl_no}">
			     				<input type="hidden" name="tnt_no" value="<%=tnt_no%>">
			     				<input type="hidden" name="action"	value="tntcancelapl">
			     				</FORM>
			     				
			     				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/apl/Con_aplServlet">
								<c:if test="${con_aplVO.apl_status == 2}">
								<li><button id="btn4">房源推薦</button></li>
								</c:if>
								<input type="hidden" name="apl_no"  value="${con_aplVO.apl_no}">
			     				<input type="hidden" name="tnt_no" value="<%=tnt_no%>">
			     				<input type="hidden" name="action"	value="tntrecommend">
			     				</FORM>
			     				
								<li><button id="btn5">聊天</button></li>
																						
							</ul>
						</div>					
					</div>
			</c:forEach>
			<div id="right"></div>
		</div>
		<div id="foot"></div>
		<div id="outerdiv"
			style="position: fixed; top: 0; left: 0; background: rgba(0, 0, 0, 0.7); z-index: 2; width: 100%; height: 100%; display: none;">
			<div id="innerdiv" style="position: absolute;">
				<img id="bigimg" style="border: 5px solid #fff;" src="" />
			</div>
		</div>
</body>
</html>
