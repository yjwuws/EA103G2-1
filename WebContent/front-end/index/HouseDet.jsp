<%@page import="com.tnt.model.TntVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-tw">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=1280, initial-scale=1.0" />
    <title>租屋 - 房屋資訊</title>
           <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/Mycol/css/materialize.min.css" />
 
    
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/Mycol/css/jquery.fancybox.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/Mycol/css/swiper.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/Mycol/css/style.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/navbar/navbar.css">
		
<!-- 	下面2個韋恩需要	 -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/rptt/main.css" type="text/css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    

  <script
		src="<%=request.getContextPath()%>/resource/datetimepicker/jquery.js"></script>

  
</head>
<%@ page import="com.housedet.model.*" %>
<%@ page import="com.collection.model.CollectionDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.*" %>
<%HouseDetService hds =new HouseDetService();
Gson gson = new Gson();
String	tntno=(String)session.getAttribute("tnt_no");
TntVO tntVO=(TntVO)session.getAttribute("tntVO");
String hosno=request.getParameter("hos");
String tntname="未登入";
if(tntVO!=null){
	tntname=tntVO.getTnt_name();
}
session.setAttribute("HOS",hosno);
 	List<HosDetVO> list = hds.getHosDetfromHOSNO(hosno);
 	HosDetVO vo=(HosDetVO)list.get(0);
	pageContext.setAttribute("picnum",gson.toJson(vo.getHos_pic().size()));
%> 
<body>
  	 <div><jsp:include page="/front-end/navbar/navbar.jsp"/> </div>

    <div id="wrapper">
        <div class="container">
            <div class="row">
                <!--左側內容-->
                <div class="col-8" id="left-site">
                    <!--標題-->
                    <h1 class="title"><%= vo.getHos_name() %></h1>
                    <h6><%= vo.getHos_add() %></h6>
                    <!--圖片-->
                    <div class="pic-container">
                        <!--大圖-->
                        <div class="swiper-container gallery-top">
                            <div class="swiper-wrapper">
                           </div>
                            <div class="swiper-pagination"></div>
                            <div class="swiper-button-next swiper-button-white"></div>
                            <div class="swiper-button-prev swiper-button-white"></div>
                        </div>
                        <!--小圖-->
                        <div class="swiper-container gallery-thumbs">
                            <div class="swiper-wrapper">
                            </div>
                        </div>
                    </div>
                    <!--條件-->
                    <div class="info condition">
                        <ul>
                            <li><span>押金</span>
                                <p>二個月</p>
                            </li>
                            <li><span>車 位</span>
                                <p><%= vo.getHos_park() %></p>
                            </li>
                            <li><span>管理費</span>
                                <p id="fee">NT$<%= vo.getHos_manafee() %></p>
                            </li>
                            <li><span>最短租期</span>
                                <p id="MRP"><%= vo.getHos_mindate() %></p>
                            </li>
                            <li><span>開伙</span>
                                <p><%= vo.getHos_cook() %></p>
                            </li>
                            <li><span>養寵物</span>
                                <p><%= vo.getHos_pet() %></p>
                            </li>
                            <li><span>身份要求</span>
                                <p><%= vo.getHos_iden() %></p>
                            </li>
                            <li><span>性別要求</span>
                                <p><%= vo.getHos_sex() %></p>
                            </li>
                            <li><span>可遷入日</span>
                                <p><%= vo.getHos_mdate() %></p>
                            </li>
                            <li><span>格局</span>
                                <p><%= vo.getHos_pat() %></p>
                            </li>
                      
                        </ul>
                    </div>
                    <!--房東提供-->
                    <div class="info provide">
                        <h2>房東提供</h2>
                        <ul>
                            <li>
                                <p class=<%= vo.getHos_table() ==0 ? "no":"yes" %>  >桌子</p>
                            </li>
                            <li>
                                <p class=<%= vo.getHos_chair() ==0 ? "no":"yes" %> >椅子</p>
                            </li>
                            <li>
                                <p class=<%= vo.getHos_closet() ==0 ? "no":"yes" %> >衣櫃</p>
                            </li>
                            <li>
                                <p class=<%= vo.getHos_bed() ==0 ? "no":"yes" %> >床</p>
                            </li>
                            <li>
                                <p class=<%= vo.getHos_sofa() ==0 ? "no":"yes" %> >沙發</p>
                            </li>
                            <li>
                                <p class=<%= vo.getHos_hoter() ==0 ? "no":"yes" %> >熱水器</p>
                            </li>
                            <li>
                                <p class=<%= vo.getHos_tv() ==0 ? "no":"yes" %> >電視</p>
                            </li>
                            <li>
                                <p class=<%= vo.getHos_refrig() ==0 ? "no":"yes" %> >冰箱</p>
                            </li>
                            <li>
                                <p class=<%= vo.getHos_table() ==0 ? "no":"yes" %> >冷氣</p>
                            </li>
                            <li>
                                <p class=<%= vo.getHos_wash() ==0 ? "no":"yes" %> >洗衣機</p>
                            </li>
                            <li>
                                <p class=<%= vo.getHos_net() ==0 ? "no":"yes" %> >網路</p>
                            </li>
                            <li>
                                <p class=<%= vo.getHos_drink() ==0 ? "no":"yes" %>>銀水雞</p>
                            </li>
                            <li>
                                <p class=<%= vo.getHos_forth() ==0 ? "no":"yes" %>>第四台</p>
                            </li>
                            <li>
                                <p class=<%= vo.getHos_gas() ==0 ? "no":"yes" %>>天然瓦斯</p>
                            </li>
                        </ul>
                    </div>
                    <!--生活交通-->
                    <div class="info traffic">
                        <h2>生活交通</h2>
                        <ul class="full">
                            <li><span>生活機能</span>
                                <p><%= vo.getHos_liffun()==null ? "待屋主提供資訊": vo.getHos_liffun() %></p>
                            </li>
                            <li><span>附近交通</span>
                                <p><%= vo.getHos_trans()==null ? "待屋主提供資訊": vo.getHos_trans() %></p>
                            </li>
                        </ul>
                    </div>
                    <!--屋況說明-->
                    <div class="info">
                        <h2>地圖位置</h2>                    
                    <div class="map" id="map">
<!--                             <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3615.396775446296!2d121.52616831500599!3d25.020605483978564!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442a98e596b4a89%3A0xeeee920255b63d69!2z5Y-w6Zu75aSn5qiT56uZ!5e0!3m2!1szh-TW!2stw!4v1600146985805!5m2!1szh-TW!2stw" frameborder="0"></iframe> -->
                    </div></div>
                    <!--地圖-->
                    <div class="info">
                        <h2>預約看屋</h2>
                        <div class="booking">
<%-- 						<jsp:include page="/front-end/booking/bookingforhouse.jsp" /> --%>
                  <iframe src="<%= request.getContextPath() %>/front-end/booking/bookingforhouse.jsp" frameborder ="0">
                  </iframe>     
                        </div>
                        
                        
                    </div>
             
                </div>
                <!--右側內容-->
                <div class="col-4" id="right-site">
                    <!--價格簡述-->
                    <div class="info description">
                        <div class="fav">
                            <p>收藏</p><img src="<%=request.getContextPath()%>/resource/Mycol/images/star.svg" alt="" />
                        </div>
                        <div class="price">
                            <h4><%= vo.getHos_rentfee() %><i>元/月</i></h4>
                            
                        </div>
                        <ul class="full">
                            <li><span>坪數</span>
                                <p>10坪</p>
                            </li>
                            <li><span>樓層</span>
                                <p>4F/5F</p>
                            </li>
                            <li><span>型態</span>
                                <p>公寓</p>
                            </li>
                            <li><span>現況</span>
                                <p>獨立套房</p>
                            </li>
                        </ul>
                    </div>
                    <!--聯絡資訊-->
                    <div class="info contact">
                        <div class="person">
                            <div class="head"><img src="<%=request.getContextPath()%>/resource/Mycol/images/person_<%= vo.getLld_sex().equals("0") ? "women":"man" %>.png" alt="" /></div>
                            <p><%= vo.getLld_name() %><i>（歡迎來電詢問 預約看屋）</i></p>
                        </div>
                        <div class="phone"><a ><img src="<%=request.getContextPath()%>/resource/Mycol/images/phone.svg" alt="" />
                                <p><%= vo.getLld_mobile() %></p>
                            </a></div>
                        <div class="functions"><a class="blue blue-booking" href="#"><img src="<%=request.getContextPath()%>/resource/Mycol/images/tel.svg" alt="" />預約看屋</a>
                        <a href="#message"> <img src="<%=request.getContextPath()%>/resource/Mycol/images/comment.svg" alt="" />留言</a>
                        <a class="red" href="#" data-toggle="modal" data-target="#exampleModal"><img src="<%=request.getContextPath()%>/resource/Mycol/images/report.svg" alt="" />檢舉</a>
                    	   <a class="full select-live" href="#"><img src="<%=request.getContextPath()%>/resource/Mycol/images/home.svg" alt=""/>我要入住</a>
                        </div>
                    </div>
                    <!--提醒-->
                    <div class="info tips">
                        <p><img src="<%=request.getContextPath()%>/resource/Mycol/images/error.svg" alt="" />愛租網提醒您: 在簽訂線上租賃契約之前,請詳閱合約內容,以免上當受騙.</p>
                  </div>
                </div>
            </div>
        </div>
    </div>
   </body> 
    <div class="modal fade" id="exampleModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" id="close_btn">&times;</button>
					<br>
					<div id="myForm" class="myForm">
						<label for="name">您的名字:</label> <input class="rpth" type="text"
							name="tnt_name" value=<%= tntname %> id="iacc" readonly> 
							<label
							for="name">檢舉的房源:</label> <input class="rpth" type="text"
							name="hos_name" value=<%= vo.getHos_name() %> id="yacc" readonly>
						<div class="form-group">
							<label for="reason">檢舉原因:</label>
							<textarea id="reason" name="rpth_content" required></textarea>
						</div>
						<button id="demo">提交</button>
					</div>
					<button id="quick">阿姨，我不想努力了</button>
				</div>
			</div>
		</div>
	</div>


<div id="datepicker-container">
    <div class="form">
      <div class="content ">
        <p>請選擇您要入住以及退租的期間！</p>
        <p class="ps">注意：請務必選取入住以及退租的時間</p>
      </div>
      <button class="close"></button>
      <div class="input-field">
        <label for="start">入住日期</label>
        <input class="start date" id="start" type="text"/>
      </div>
      <div class="input-field">
        <label for="end">退租日期</label>
        <input class="start date" id="end" type="text" readonly="readonly"/>
      </div>
      <div class="input-field">
        <button class="btn btn-checkin" type="button">送出</button>
      </div>
    </div>
  </div>
 <style>
    .booking {
        padding-bottom: 50%;
    margin-bottom: 10px;
    position: relative;
    height: 656.2px;
    }
       .booking iframe{
      position: absolute;
    bottom: 0;
    top: 0;
    width: 100%;
    height: 100%;
    }
    #right-site{
    padding-left:0px;
    }
    #wrapper{
    padding-top:30px;}
            /* 以下為NAVBAR*/
    
    .btn-img {
            background-image: "https://www.flaticon.com/svg/static/icons/svg/236/236831.svg";
        }

        .bg-light {
            background-color: #D7C8B6 !important;
        }

        .navbar-light .navbar-nav .nav-link {
            color: #393939 !important;
            font-weight: bold;
        }

        .nav-item .member {
            display: flex;
            margin-left: 10px;
            margin-top:8px;
            color:#393939 !important;		
        }

        .nav-item .member .memberpic {
                width: 40px;
    			margin-right: 5px;
   				outline: none;
   				margin-top: 14px;
        }

        .nav-item .member .membername {
            float: right;
            align-self: center;
            display: block;
        }
        @media ( max-width :991px) {
        .navbar{
        height:auto;}}
        /* 以上為NAVBAR*/
    </style>

<script> 

var picnum = JSON.parse('${picnum}');


<%for (int i = 0; i < vo.getHos_pic().size(); i++) {%>		

$(".gallery-top .swiper-wrapper").append(
"<div class='swiper-slide'>"+

"<a href='<%=request.getContextPath()%>/hos/hosPic?housedet=<%= vo.getHos_pic().get(i) %>'" +
		
"data-fancybox='data-fancybox'>"+"<img src='<%=request.getContextPath()%>/hos/hosPic?housedet=<%= vo.getHos_pic().get(i) %>' "+
"alt='slide-1' /></a></div>"
	)
	
$(".gallery-thumbs .swiper-wrapper").append(
		"<div class='swiper-slide'>"+
		"<img src='<%=request.getContextPath()%>/hos/hosPic?housedet=<%= vo.getHos_pic().get(i) %>' alt='slide-1' />"+
		"</div>"
	)	
	<%}%>

	$(document).ready(function(){
	    $(function(){ $('.blue-booking').click(function(){ 
	        $('html,body').animate({scrollTop:$('.booking').offset().top}, 500);});  
	    }); 
	}); 
	   
	$(document).on("click", ".btn-checkin", function() {
		$.ajax({//存入資料庫階段
			  url:"<%=request.getContextPath()%>/apl/Con_aplServlet",
		 	  type:"POST",
		 	  data:{ 
		 		  action:"addfromhouse",
		 		 tnt_no:"<%= tntno %>",
		 		hos_no:"<%= hosno %>",
		 			apl_str:$("#start").val(),
		 			apl_end:$("#end").val()
		 	  },
		 	  success:function(data)
		 	  {	
				alert("申請入住成功，請等待回複");
				$('.close').click();

		 	  }//以上成功才執行
		 	  ,
		 	  error:function(data)
		 	  {
		 		 alert("申請入住失敗，伺服器忙碌中，請稍後再試")   
		 		 }
		  
		  })
	});

	
    $(document).on("click", ".description .fav", function() {
    	if($(".fav").hasClass("saved")){
    		$.ajax({//存入資料庫階段
    			  url:"<%=request.getContextPath()%>/collection/collectionServlet",
    		 	  type:"POST",
    		 	  data:{ action:"insert",
    		 		  tnt:"<%= tntno %>",
    		 		 hos:"<%= hosno %>"
    		 		   //JSON.stringify({})
    		 	  },
    		 	  success:function(data)
    		 	  {	
    		 	  }//以上成功才執行
    		 	  ,
    		 	  error:function(data)
    		 	  {
    		 		 alert("加入收藏清單失敗，伺服器忙碌中，請稍後再試")   
    		 		 }
    		  
    		  })
		
}else{
	$.ajax({//存入資料庫階段
		  url:"<%=request.getContextPath()%>/collection/collectionServlet",
	 	  type:"GET",
	 	  data:{action:"delete",
	 		 tnt:"<%= tntno %>",
	 		 hos:"<%= hosno %>"
	 		  },
	 	  success:function(data){//以上成功才執行
	 		  	}
	 	  ,
	 	  error:function(data)
	 	  {
		 		 alert("取消收藏失敗，伺服器忙碌中，請稍後再試")   
	 	  }			  
	  } )
	
}

	})
function initMap() {
            geocoder = new google.maps.Geocoder();
            map = new google.maps.Map(document.getElementById('map'), { //產生地圖
                center: { lat: <%=vo.getHos_lat()%>, lng: <%=vo.getHos_lng()%> }, //經緯度初始化
                zoom: 17,
                mapTypeControl: false
            });          
            marker = new google.maps.Marker({ //插上座標
                map: map,
                animation: google.maps.Animation.BOUNCE,
                position: {                	
                    lat: <%=vo.getHos_lat()%>,
                    lng: <%=vo.getHos_lng()%>
                }
            });
        }
    
console.log(picnum);

</script>


<!-- 	下面js韋恩需要	 -->
<script>
	$('#demo').click(function(){
		
		var rpth_content= $('#reason').val().trim()
		if(rpth_content==''){
		   swal("檢舉失敗!", "氣氣氣! 但內容還是要寫啦!", "error");
		}else{
		$.ajax({
			type:"POST",
			url:"<%=request.getContextPath()%>/front-end/rpth/RpthServlet",
			data:{
				action:"insert",
				tnt_no:"<%= tntno%>",
				hos_no:"<%=hosno %>",
			    rpth_content:rpth_content
			},
			 success:function(data)
		 	  {	
				 swal("檢舉成功!", "收到啦!不乖的交給我們就好", "success");
		 	  }//以上成功才執行
		 	  ,
		 	  error:function(data)
		 	  {
		 	  swal("檢舉失敗!", "鳩豆麻爹!我看看", "error");
		 	}
		  
		})}
		
		  $("#close_btn").trigger("click");
	});
	
	
	
	$('#quick').click(function(){
	    $('#reason').val('這我家啦，是誰放在這裡待租啦，夭壽喔!');	
	});
</script>	

 
<div id="notice">
    <p> </p>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
         <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDxL16LHes_Y4e96wJGKpsPGMXQJ_VlBL8&callback=initMap" async defer></script>
    <script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>
    
    <script src="<%=request.getContextPath()%>/resource/Mycol/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/Mycol/js/jquery.fancybox.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/Mycol/js/jquery.cookie.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/Mycol/js/materialize.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/Mycol/js/swiper.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/Mycol/js/app.min.js"></script>
    
    
    
   
</div>

</html>