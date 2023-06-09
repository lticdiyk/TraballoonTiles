<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!doctype HTML>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="css/login.css">
    <script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900" rel="stylesheet">
    <!-- BootStrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    
    <style type="text/css">
    	 .toggle.ios, .toggle-on.ios, .toggle-off.ios { border-radius: 20px; }
  		.toggle.ios .toggle-handle { border-radius: 20px; }
  		
        header h1 {
            font-size: 50px;
            color: white;
        }
        body{
			/* background:var(--body-background-color); */
			/* 배경 꽉차게 */
			background: linear-gradient(rgba(0, 0, 0, 0.3),rgba(0, 0, 0, 0.3)),
							url('./pageimage/image01.jpg')
							no-repeat center fixed;
			-webkit-background-size: cover;
			-moz-background-size: cover;
			-o-background-size: cover;
			background-size: cover;
		}
		.form-check-label {
			width: 465px;
			height: 52px;
			font-size: 15px;
			color: white;
			align-items: center;
			justify-content: flex-start;
/* 	 		border-bottom: solid 1px var(--border-gray-color); */
		}
		a {
			text-decoration: none;
		}
		
		a:hover {
			text-decoration: underline;
			color:#666;
        }
  
        
        .login-button-wrap:hover {
        	--green-color:#666;
			--green-border-color: #666;
        }
		
        .blog-header-logo {
            font-family: "Playfair Display", Georgia, "Times New Roman", serif;
            font-size: 3.5rem;
            color: white;
            text-shadow: 0 2px 20px rgba(0,0,0,0);
        }b 
        
        
        
        .main-container {
        	margin-top:20%;
        }
        
         /* 화면 넓어졌을때 */
        @media (min-width: 1000px) {
        	.main-container {
        		margin-top: none;
        	}
        }
    </style>
</head>
<body>
<div class="main-container">
    <header class="blog-header py-3">
         <div class="col-4 text-center">
                <a class="blog-header-logo" href="maintraballoon.do">Traballoon</a>
         </div>
    </header>
    <form action="loginAf.do" method="post" class="login-input-section-wrap">
        <div class="login-input-wrap">
            <input id="id" name="id" placeholder="Username" type="text"></input>
        </div>
        <div class="login-input-wrap password-wrap">
            <input id="pwd" name="pwd" placeholder="Password" type="password"></input>
        </div>
        <div class="login-button-wrap">
            <button type="submit">Sign in</button>
        </div>
        <br>
        <div class="form-check form-switch" style="padding-left: 20%;">
            <input class="form-check-input" type="checkbox" role="switch" value="" class="chk_save_id" id="flexSwitchCheckDefault"></input>
            <label class="form-check-label" for="flexSwitchCheckDefault">remember id, password</label>
        </div>
    </form>
    <section class="Easy-sgin-in-wrap">
        <a href="" class="forget-msg">Forgot your Username or Password?</a>
        <a href="#" onclick="account()" class="forget-msg">Sign up</a>
    </section>
    <footer>
        <div class="copyright-wrap">
            <span>Thank you for visiting Multicampus Team Four's website!</span>
        	<br>
        	<p style="font-size: 12px;">Designed and developed by | 권하나, 김동민, 김영권, 백다연, 심재훈 | © 2023 All Rights Reserved</p>
        </div>
    </footer>
</div>


<script type="text/javascript">
    function account() {
        location.href = "regi.do";
    }

    let user_id = $.cookie("user_id");

    if (user_id != null) {	// 저장한 id가 있음
        $("#id").val(user_id);
        $(".chk_save_id").prop("checked", true);
    }

    $(".chk_save_id").click(function () {

        if ($(".chk_save_id").is(":checked") == true) {

            if ($("#id").val().trim() == "") {
                alert('id를 입력해 주십시오');
                $(".chk_save_id").prop("checked", false);
            } else {
                // cookie를 저장
                $.cookie("user_id", $("#id").val().trim(), {expires: 7, path: './'});
            }

        } else {
            $.removeCookie("user_id", {path: './'});
        }
    });

</script>

</body>
</html>