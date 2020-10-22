<%@page import="com.lld.model.LldVO"%>
<%@page import="com.tnt.model.TntService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.housemanage.model.*"%>
<%@ page import="com.apl.model.*"%>
<%@ page import="com.tnt.model.*"%>
<%@ page import="com.cont.model.*"%>
<%@ page import="com.rec.model.*"%>

<%
	String tnt_no = (String) session.getAttribute("tnt_no");
	if (tnt_no == null) {
		tnt_no = request.getParameter("tnt_no");
	}
	
	List<RecVO> list = (List<RecVO>)session.getAttribute("list");
	pageContext.setAttribute("list",list);

%>

<jsp:useBean id="aplSvc" scope="page" class="com.apl.model.Con_aplService" />
<jsp:useBean id="tntSvc" scope="page" class="com.tnt.model.TntService" />
<jsp:useBean id="conSvc" scope="page" class="com.cont.model.ConService" />
<jsp:useBean id="hosSvc" scope="page" class="com.housemanage.model.HouseService" />
<jsp:useBean id="recSvc" scope="page" class="com.rec.model.RecService" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>House_Off</title>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel=stylesheet type="text/css" href="<%=request.getContextPath()%>/front-end/house_manage/css/house_rent.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/front-end/house_manage/js/house_rent.js" charset="UTF-8"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<div><jsp:include page="/front-end/navbar/navbar.jsp"/> </div>
	<div id="body">
		<div id="left">
			<nav id="housenav">
				<div class="menu-btn">
					<div class="line line--1"></div>
					<div class="line line--2"></div>
					<div class="line line--3"></div>
				</div>
				<div class="nav-links">
					</FORM>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/apl/Con_aplServlet">
						<input type="hidden" name="tnt_no" value="<%=tnt_no%>">
						<input type="hidden" name="action" value="tntgetallapl">
						<button type="submit" class="link">租屋申請</button><br>
					</FORM>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/cont/ConServlet">
						<input type="hidden" name="tnt_no" value="<%=tnt_no%>">
						<input type="hidden" name="action" value="gettntcontract">
						<button type="submit" class="link" style="color: #D37707;">歷史合約</button><br>
					</FORM>
					
				</div>
			</nav>
		</div>
		<div id="center">
			<%@ include file="tntpage1"%>
			<c:forEach var="recVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
				<div class="houseinfo">
					<div class="linfo">
						<img
							src="<%=request.getContextPath()%>/front-end/apl/images/aplimage.jpg"
							class="pic" />
					</div>
					<div class="cinfo">
						<ul>
							<li><span class="infotitle">訂單編號 : </span><span>${recVO.rec_no}</span></li>							
							<li><span class="infotitle">訂單月份 : </span><span>${recSvc.getMonthText(recVO.rec_mon)}</span></li>
							<li><span class="infotitle">本月使用水量 : </span><span>${recVO.rec_water}</span></li>
							<li><span class="infotitle">本月使用電量 : </span><span>${recVO.rec_elec}</span></li>
							<li><span class="infotitle">總金額 : </span><span>${recVO.rec_total}</span></li>
							<li><span class="infotitle">帳單狀態 : </span><span>${recSvc.getRecStatusText(recVO.rec_sta)}</span></li>
						</ul>
					</div>					
						<div class="rinfo">
							
							<ul>
			     				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/rec/RecServlet">
								<li><button id="btn2">本月詳情</button></li>
								<input type="hidden" name="rec_no"  value="${recVO.rec_no}">
								<input type="hidden" name="hos_no"  value="${recVO.hos_no}">
								<input type="hidden" name="con_no"  value="${recVO.con_no}">
			     				<input type="hidden" name="tnt_no" value="<%=tnt_no%>">
			     				<input type="hidden" name="action"	value="gettntrecdetail">
			     				</FORM>
			     				
			     				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/apl/Con_aplServlet">
								<li><button id="btn2">歷史帳單</button></li>
								<input type="hidden" name="apl_no"  value="${con_aplVO.apl_no}">
			     				<input type="hidden" name="apl_status" value=2>
			     				<input type="hidden" name="tnt_no" value="<%=tnt_no%>">
			     				<input type="hidden" name="action"	value="tntupdate">
			     				</FORM>
			     				
			     				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/rec/RecServlet">
								<li><button id="btn1">檢舉帳單</button></li>
								<input type="hidden" name="rec_no"  value="${recVO.rec_no}">
								<input type="hidden" name="hos_no"  value="${recVO.hos_no}">
								<input type="hidden" name="con_no"  value="${recVO.con_no}">
			     				<input type="hidden" name="tnt_no" value="<%=tnt_no%>">
			     				<input type="hidden" name="action"	value="getOne_For_Update">
			     				</FORM>
			     				
								<li><button id="btn3">聊天</button></li>
								
														
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
