<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="zh-Hant">

<head>
    <title>Identify</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="<%=request.getContextPath()%>/front-end/index/tnt/images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front-end/index/tnt/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front-end/index/tnt/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front-end/index/tnt/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front-end/index/tnt/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front-end/index/tnt/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front-end/index/tnt/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front-end/index/tnt/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front-end/index/tnt/css/util.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front-end/index/tnt/css/main_login.css">
    <!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front-end/navbar/navbar.css"> 
</head>

<body class="landing">
<jsp:include page="/front-end/navbar/navbar.jsp"/>
<!--     Header -->
<!--     <header id="header"> -->
<!--         <h1> -->
<!--             <a href="index.html">愛租I-ZU</a> -->
<!--         </h1> -->
<!--         <nav id="nav"> -->
<!--             <ul> -->
<!--                 <li><a href="index.html">尋找房源</a></li> -->
<!--                 <li><a href="generic.html">地圖找房</a></li> -->
<!--                 <li><a href="elements.html">會員登入</a></li> -->
<!--                 <li><a href="#" class="special">註冊會員</a></li> -->
<!--             </ul> -->
<!--         </nav> -->
<!--     </header> -->
    <div class="limiter">
        <div class="container-login100">
            <div class="login100-form validate-form" id="login100-form-identify">
                <form id="registerform" enctype="multipart/form-data">
                    <span class="login100-form-title p-b-10"> 選擇註冊身份 </span>
                    <hr class="login100-form-title p-b-10">
                    <div class="identity-wrap">
                        <div class="identity-img-wrap m-r-10 m-l-10">
                            <img src="https://www.dd-room.com/_nuxt/img/2b7ea73.png" width="300">
                            <div class="container-login100-form-btn m-t-10">
                               <a href="/EA103G2/front-end/index/lld/register.jsp" class="login100-form-btn btnIdentify">我是房東</a>
                            </div>
                        </div>
                        <div class="identity-img-wrap m-r-10 m-l-10">
                            <img src="https://www.dd-room.com/_nuxt/img/78b1566.png" width="300">
                            <div class="container-login100-form-btn m-t-10">
                                <a href="/EA103G2/front-end/index/tnt/register.jsp" class="login100-form-btn btnIdentify">我是房客</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <!--login100-form-->
        </div>
    </div>
   
    <!--===============================================================================================-->
    <script src="<%=request.getContextPath()%>/front-end/index/tnt/vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="<%=request.getContextPath()%>/front-end/index/tnt/vendor/animsition/js/animsition.min.js"></script>
    <!--===============================================================================================-->
    <script src="<%=request.getContextPath()%>/front-end/index/tnt/vendor/bootstrap/js/popper.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/index/tnt/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="<%=request.getContextPath()%>/front-end/index/tnt/vendor/select2/select2.min.js"></script>
    <!--===============================================================================================-->
    <script src="<%=request.getContextPath()%>/front-end/index/tnt/vendor/daterangepicker/moment.min.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/index/tnt/vendor/daterangepicker/daterangepicker.js"></script>
    <!--===============================================================================================-->
    <script src="<%=request.getContextPath()%>/front-end/index/tnt/vendor/countdowntime/countdowntime.js"></script>
    <!--===============================================================================================-->
    <script src="<%=request.getContextPath()%>/front-end/index/tnt/js/jquery.js"></script>
    <!--===============================================================================================-->
    <script src="<%=request.getContextPath()%>/front-end/index/tnt/js/main_login.js"></script>
    <!--===============================================================================================-->
    
</body>

</html>