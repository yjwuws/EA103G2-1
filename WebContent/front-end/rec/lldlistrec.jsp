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
	String lld_no = (String) session.getAttribute("lld_no");
	if (lld_no == null) {
		lld_no = request.getParameter("lld_no");
	}
	
	HouseVO lldInfo = (HouseVO) request.getAttribute("lldInfo");
	if (lldInfo == null) {
		HouseService houseSvc = new HouseService();
		lldInfo = houseSvc.getLldInfo(lld_no);
	}
	
	List<RecVO> list = (List<RecVO>)session.getAttribute("list");
	session.setAttribute("list", list);
	
	LldVO lldVO = (LldVO) request.getAttribute("lldVO");
	HouseVO houseVOlld = (HouseVO) request.getAttribute("houseVOlld");
	pageContext.setAttribute("lldVO", lldVO);
	pageContext.setAttribute("houseVOlld", houseVOlld);

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
<title>定期帳單</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel=stylesheet type="text/css" href="<%=request.getContextPath()%>/front-end/house_manage/css/house_rent.css">
<link rel=stylesheet type="text/css" href="<%=request.getContextPath()%>/front-end/house_manage/css/house_evaluation.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/navbar/navbar.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/front-end/house_manage/js/house_unrent.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/front-end/house_manage/js/house_evaluation.js" charset="UTF-8"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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
                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/house_manage/HouseServlet">
						<input type="hidden" name="lld_no" value="<%=lld_no%>">
						<input type="hidden" name="action" value="getLldAllHouse">
						<button type="submit" class="link">首頁</button>
					</FORM>
					<FORM METHOD="post" name="pub" ACTION="<%=request.getContextPath()%>/house_manage/HouseServlet">
						<input type="hidden" name="lld_no" value="<%=lld_no%>">
						<input type="hidden" id="lld_balance" name="lld_balance" value="<%=lldInfo.getLld_balance()%>">
						<input type="hidden" name="action" value="getLldPub">
						<button type="button" class="link" onclick="checkmoney()">上架房屋</button>
					</FORM>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/house_manage/HouseServlet">
						<input type="hidden" name="lld_no" value="<%=lld_no%>">
						<input type="hidden" name="action" value="getLldRentHouse">
						<button type="submit" class="link">已租房屋</button>
						
					</FORM>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/house_manage/HouseServlet">
						<input type="hidden" name="lld_no" value="<%=lld_no%>">
						<input type="hidden" name="action" value="getLldUnRentHouse">
						<button type="submit" class="link">待租房屋</button>
					</FORM>					
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/house_manage/HouseServlet">
						<input type="hidden" name="lld_no" value="<%=lld_no%>">
						<input type="hidden" name="action" value="getLldOffHouse">
						<button type="submit" class="link">下架房屋</button>
					</FORM>					
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/apl/Con_aplServlet">
						<input type="hidden" name="lld_no" value="<%=lld_no%>">
						<input type="hidden" name="action" value="lldgetAll">
						<button type="submit" class="link">租屋申請</button>
					</FORM>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/cont/ConServlet">
						<input type="hidden" name="lld_no" value="<%=lld_no%>">
						<input type="hidden" name="action" value="getlldcontract">
						<button type="submit" class="link" style="color: #D37707;">合約管理</button>
						<br><span id="count">共<%=list.size()%>個合約</span>
					</FORM>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/repair/repair.servlet">
						<input type="hidden" name="lld_no" value="<%=lld_no%>">
						<input type="hidden" name="action" value="getLldRepair">
						<button type="submit" class="link">修繕管理</button><br>
					</FORM>
					<button type="button" class="link">評價管理</button>
					
				</div>
			</nav>
		</div>
		<div id="center">
		<h3 class="houselisttitle">定期帳單</h3><hr>
			<%@ include file="page1.file"%>
			<c:forEach var="recVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
				<div class="houseinfo">
					<div class="linfo">
					<c:if test="${recVO.rec_sta == 0}">
						<img
							src="<%=request.getContextPath()%>/front-end/rec/images/lldunfill.png"
							class="pic" />
					</c:if>
					<c:if test="${recVO.rec_sta == 1}">
						<img
							src="<%=request.getContextPath()%>/front-end/rec/images/tntunpaid.png"
							class="pic" />
					</c:if>
					<c:if test="${recVO.rec_sta == 2}">
						<img
							src="<%=request.getContextPath()%>/front-end/rec/images/tntpaid.png"
							class="pic" />
					</c:if>
					<c:if test="${recVO.rec_sta == 3}">
						<img
							src="<%=request.getContextPath()%>/front-end/rec/images/tntexp.png"
							class="pic" />
					</c:if>
					</div>
					<div class="cinfo">
						<ul>
							<li><span class="infotitle">訂單編號 : </span><span>${recVO.rec_no}</span></li>							
							<li><span class="infotitle">訂單月份 : </span><span>${recSvc.getMonthText(recVO.rec_mon)}</span></li>
							<c:if test="${recVO.rec_sta != 0}">
							<li><span class="infotitle">本月使用水量 : </span><span>${recVO.rec_water}度</span></li>
							<li><span class="infotitle">本月使用電量 : </span><span>${recVO.rec_elec}度</span></li>
							<li><span class="infotitle">總金額 : </span><span>${recVO.rec_total}元</span></li>
							</c:if>
							<li><span class="infotitle">帳單狀態 : </span><span>${recSvc.getRecStatusText(recVO.rec_sta)}</span></li>
						</ul>
					</div>					
						<div class="rinfo">
							
							<ul>
								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/rec/RecServlet">
								<c:if test="${recVO.rec_sta == 0}">
								<li><button id="btn1">填寫帳單</button></li>
								</c:if>
								<input type="hidden" name="rec_no"  value="${recVO.rec_no}">
								<input type="hidden" name="hos_no"  value="${recVO.hos_no}">
								<input type="hidden" name="con_no"  value="${recVO.con_no}">
			     				<input type="hidden" name="lld_no" value="<%=lld_no%>">
			     				<input type="hidden" name="action"	value="getOne_For_Update">
			     				</FORM>
			     				
			     				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/rec/RecServlet">
			     				<c:if test="${recVO.rec_sta == 1 || recVO.rec_sta ==2}">
								<li><button id="btn2">帳單明細</button></li>
								</c:if>
								<input type="hidden" name="rec_no"  value="${recVO.rec_no}">
								<input type="hidden" name="hos_no"  value="${recVO.hos_no}">
								<input type="hidden" name="con_no"  value="${recVO.con_no}">
			     				<input type="hidden" name="lld_no" value="<%=lld_no%>">
			     				<input type="hidden" name="action"	value="getlldrecdetail">
			     				</FORM>
			     				
			     				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/rec/RecServlet">
			     				<c:if test="${recVO.rec_sta != 0}">
								<li><button type="button" id="btn3" data-toggle="modal" data-target="#exampleModalCenter">評價房客</button></li>
								</c:if>
								<input type="hidden" name="rec_no"  value="${recVO.rec_no}">
								<input type="hidden" name="hos_no"  value="${recVO.hos_no}">
								<input type="hidden" name="con_no"  value="${recVO.con_no}">
			     				<input type="hidden" name="lld_no" value="<%=lld_no%>">
<!-- 			     				<input type="hidden" name="action"	value="getOne_For_Update"> -->
			     				</FORM>
			     				
								<li><button id="btn4">聊天</button></li>
								
														
							</ul>
						</div>					
					</div>
					<!-- 房東填寫區塊 -->
					<div class="modal fade" id="fullin" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<form id="fullin" name="fullin">
								<div class="modal-header">
								    <h2>填寫本月水電費</h2>
								</div>
								<div class="modal-body">
									<table>
										<tr>
											<td>
												<label>本月水用量:&nbsp;<input type="number" class="num1" min="0" placeholder="0" name="rec_water" value=""${recVO.rec_water}">度</label>
											</td>
										</tr>
										<tr>
											<td>
												<label>本月電用量:&nbsp;<input type="number" class="num1" min="0" placeholder="0" name="rec_elec" value=""${recVO.rec_elec}">度</label>
											</td>
										</tr>
									</table>
								</div>
								<div class="modal-footer">			        					
									<button type="button" class="btn btn-primary" onclick="notice()">送出</button>					
									<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
								</div>
							</form>
						</div>
					</div>
				</div>
					<!-- 評價房屋區塊 -->
					<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<form id="evaluation" name="evaluation">
								<div class="modal-header">
								    <marquee scrollamount="10" class="evatitle">來對房客作評價吧~~</marquee>
								</div>
								<div class="modal-body">
									<ul>
										<li>
									    	<div class="item">			       				
									       		<ul class="rating">								   										
													<li><button type="button" value="5" onclick="eqpmtPoint(event)"><div class="star" value="5" onclick="eqpmtPoint(event)"></div></button></li>
													<li><button type="button" value="4" onclick="eqpmtPoint(event)"><div class="star" value="4" onclick="eqpmtPoint(event)"></div></button></li>
													<li><button type="button" value="3" onclick="eqpmtPoint(event)"><div class="star" value="3" onclick="eqpmtPoint(event)"></div></button></li>
													<li><button type="button" value="2" onclick="eqpmtPoint(event)"><div class="star" value="2" onclick="eqpmtPoint(event)"></div></button></li>
													<li><button type="button" value="1" onclick="eqpmtPoint(event)"><div class="star" value="1" onclick="eqpmtPoint(event)"></div></button></li>
													<span class="logo">
														<img src="https://www.flaticon.com/svg/static/icons/svg/169/169302.svg">
														<span class="itemtitle">整潔度 :</span>
													</span>
												</ul>
									       	</div>
									    </li>
									    <li>
									       	<div class="item">			       				
									       		<ul class="rating">								   
													<li><button type="button" value="5" onclick="convmtPoint(event)"><div class="star" value="5" onclick="convmtPoint(event)"></div></button></li>
													<li><button type="button" value="4" onclick="convmtPoint(event)"><div class="star" value="4" onclick="convmtPoint(event)"></div></button></li>
													<li><button type="button" value="3" onclick="convmtPoint(event)"><div class="star" value="3" onclick="convmtPoint(event)"></div></button></li>
													<li><button type="button" value="2" onclick="convmtPoint(event)"><div class="star" value="2" onclick="convmtPoint(event)"></div></button></li>
													<li><button type="button" value="1" onclick="convmtPoint(event)"><div class="star" value="1" onclick="convmtPoint(event)"></div></button></li>
													<span class="logo">
														<img src="https://www.flaticon.com/svg/static/icons/svg/168/168466.svg">
														<span class="itemtitle">溝通度 :</span>
													</span>
												</ul>
									       	</div>
									    </li>
									   	<li>
									       	<div class="item">
									       		<ul class="rating">								   
													<li><button type="button" value="5" onclick="neiborPoint(event)"><div class="star" value="5" onclick="neiborPoint(event)"></div></button></li>
													<li><button type="button" value="4" onclick="neiborPoint(event)"><div class="star" value="4" onclick="neiborPoint(event)"></div></button></li>
													<li><button type="button" value="3" onclick="neiborPoint(event)"><div class="star" value="3" onclick="neiborPoint(event)"></div></button></li>
													<li><button type="button" value="2" onclick="neiborPoint(event)"><div class="star" value="2" onclick="neiborPoint(event)"></div></button></li>
													<li><button type="button" value="1" onclick="neiborPoint(event)"><div class="star" value="1" onclick="neiborPoint(event)"></div></button></li>									    
													<span class="logo">
														<img src="https://www.flaticon.com/svg/static/icons/svg/263/263058.svg">
														<span class="itemtitle">滿意度 :</span>
													</span>
												</ul>
									       	</div>
									     </li>					
									     <li>
									       	<div class="item">
										       	<span class="logo" style="float:left;margin-top:5px;">
													<img src="https://www.flaticon.com/svg/static/icons/svg/263/263062.svg">
													<span class="itemtitle">評論 :</span>
												</span>
										       	<textarea rows="2" wrap="hard" onkeyup="checkLen(this)" name="hcm_commnt"></textarea>
												<div class="fontstyle">您還可以輸入 <span id="evacount">50</span> 個文字</div>			       		
									       	</div>
									     </li>
									</ul>
								</div>
								<div class="modal-footer">			        					
									<button type="button" class="btn btn-primary" onclick="notice()">送出</button>					
									<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</c:forEach>
			<%@ include file="page2.file"%>
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
