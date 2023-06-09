<%@page import="mul.cam.a.dto.MemberDto" %>
<%@page import="mul.cam.a.dto.TripDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    TripDto dto = (TripDto) request.getAttribute("tripdto");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Insert title here</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

    <style type="text/css">

        .card-body {
            overflow: hidden;
            height: auto;
        }

        .card-body img {
            max-width: 100%;
        }

    </style>

    <%
        //login정보 얻어오기
        Object loginObject = session.getAttribute("login");
        //login이 null일 경우 오류나므로 login 변수를 null이 아닌 MemberDto인스턴스로 초기화
        MemberDto login = new MemberDto();
        boolean isLogin = false;	//isLogin 의 초기값은 false
        if (loginObject != null) {	//로그인이 되고나서야
            login = (MemberDto)session.getAttribute("login");	// 로그인 값을 얻어올 수 있다.
            isLogin = true;	//로그인이 되면 isLogin은 true로 바뀐다.
        }
        request.setAttribute("isLogin", isLogin);	//jsp에서 사용 가능하도록 isLogin 값 request객체에 저장
    %>

</head>
<body>

<div class="container">

    <div class="col-md-12">
        <div class="row">
            <div class="col-4">
                <div class="card-body">
                    <%=dto.getImage() %>
                </div>
            </div>
            <div class="col-8">
                <div class="card-body">
                    <h3 class="card-title"><%=dto.getSpot()%>
                    </h3>
                    <p class="card-text"><%=dto.getTitle()%>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-md-12">
            <br>
            <div class="card">
                <div class="card-header">
                    <h4><%=dto.getTitle() %>
                    </h4>
                    <div class="small text-muted">
                        작성자: <%=dto.getId() %>, 작성일: <%=dto.getWdate() %>, 조회수: <%=dto.getReadcount() %>
                    </div>
                </div>

                <div class="card-body">
                    <%=dto.getContent() %>
                </div>
            </div>
            <br>

        </div>
    </div>
</div>

<br>
</body>
</html>
