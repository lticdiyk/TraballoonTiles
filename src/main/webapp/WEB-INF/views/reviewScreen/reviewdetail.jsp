<%@page import="mul.cam.a.dto.MemberDto" %>
<%@page import="mul.cam.a.dto.ReviewComment" %>
<%@page import="mul.cam.a.dto.ReviewDto" %>
<%@page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SemiProject</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

</head>

<body>
<%
    ReviewDto dto = (ReviewDto) request.getAttribute("dto");
    
	
	Object loginObj = session.getAttribute("login");	//dto에 안담겨있을 수도 있으므로
	MemberDto login = new MemberDto(); //초기화해주기
	
	boolean isS = false;
	if(loginObj == null){
		%>
		<script>
			alert('로그인 해 주십시오');
			location.href = "login.do";
		</script>
		<%
		} else {
			login = (MemberDto)session.getAttribute("login");
			isS = true;
		}
		request.setAttribute("isS", isS);
%>


<div class="container">
    <!-- 		<img src="images/beach.jpg" class="img-fluid " alt="Responsive image"> -->
    <div class="row justify-content-center">
        <div class="col-md-12">
            <br>
            <div class="card">
                <div class="card-header">
                    <h4><%=dto.getTitle()%>
                    </h4>
                    <div class="small text-muted">
                        작성자: <%=dto.getId()%>,
                        작성일: <%=dto.getWdate()%>,
                        조회수: <%=dto.getReadcount()%>
                    </div>
                </div>
                <div class="card-body">
                    <%
                        for (int i = 1; i <= 11; i++) {
                            if (dto.getSeq() == i) {
                    %>
                    <img src="images/review/<%=i%>.jpg" class="d-block w-100">
                    <%
                            }
                        }
                    %>
                    <%=dto.getContent()%>
                </div>
            </div>
            <br>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-md-12">
            <!-- 수정, 삭제는 로그인한 본인한테만 보이게 -->
            <%
                if (dto.getId().equals(login.getId())) {
            %>
            <div class="d-flex justify-content-end">
                <button type="submit" class="btn btn-secondary mr-3"
                        onclick="reviewUpdate(<%=dto.getSeq()%>)">수정
                </button>
                <button type="submit" class="btn btn-secondary"
                        onclick="reviewDelete(<%=dto.getSeq()%>)">삭제
                </button>
                <%
                    }
                %>
            </div>
            <br>
        </div>
    </div>

</div>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <form action="reviewCommentWrite.do" method="get">
                <!-- 	<input type="hidden" name="board_id" value="글번호"> -->
                <input type="hidden" name="seq" value="<%=dto.getSeq()%>">
                <input type="hidden" name="id" value="<%=login.getId()%>">
                <div class="form-group">
						<textarea class="form-control" id="comment_content" name="content"
                                  rows="3"></textarea>
                </div>
                <button type="submit" class="btn btn-secondary">댓글 등록</button>
            </form>
            <br>
        </div>
    </div>


    <div class="row justify-content-center">
        <div class="col-md-12">
            <div id="li">
            </div>
        </div>
    </div>

</div>

<script type="text/javascript">
    function reviewUpdate(seq) {
        location.href = "reviewUpdate.do?seq=" + seq;
    }

    function reviewDelete(seq) {
        location.href = "reviewDelete.do?seq=" + seq;  // update del=1
    }
</script>

<script type="text/javascript">
    $(document).ready(function () {
        $.ajax({
            url: "reviewCommentList.do",
            type: "get",
            data: {"seq":<%=dto.getSeq() %>},
            success: function (list) {
                // alert('success');
                // alert(JSON.stringify(list));

                $("#li").html("");

                $.each(list, function (index, item) {
                    let str = "<div class='card mt-1'>"
                        + 			"<div class='card-header'>" + item.id + "</div>"
                        + 			"<div class='card-body'>"
                        + 				"<ul class='list-unstyled'>"
                        + 					"<li>"
                        + 					"<div>" + item.content + "</div>"
                        + 					"<br>"
                        + 					"<div>작성일: " + item.wdate + "</div>"
                        + 					"</li>"
                        + 				"</ul>"
                        + 			"</div>"
                        + 	"</div>"
                        + 	"<br>"
                    $("#li").append(str);

                });
            },
            error: function () {
                alert('error');
            }
        });
    });
</script>

</body>
</html>
