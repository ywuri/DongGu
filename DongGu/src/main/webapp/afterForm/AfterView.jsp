<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DongGu.review.IdReviewDTO" %>
<%@ page import="com.DongGu.review.IdReviewDAO" %>

<jsp:useBean id="rdao" class="com.DongGu.review.IdReviewDAO"></jsp:useBean>
<%
    String reviewNumStr = request.getParameter("r_num");
    int reviewNum = 0;

    if (reviewNumStr == null || reviewNumStr.isEmpty()) {
        out.println("r_num 파라미터가 전달되지 않았습니다.");
        return;  // 파라미터가 없으면 더 이상 처리하지 않음
    }

    try {
        reviewNum = Integer.parseInt(reviewNumStr);  // 문자열을 int로 변환
    } catch (NumberFormatException e) {
        out.println("Invalid review number: " + reviewNumStr);
        return;  // 변환 실패 시 더 이상 처리하지 않음
    }

    IdReviewDTO review = null;
    try {
        review = rdao.getReviewByNum(reviewNum); // int로 변환된 값을 전달
    } catch (Exception e) {
        //e.printStackTrace(out);  // 예외 내용을 출력
    }

    if (review == null) {
        out.println("해당 리뷰를 찾을 수 없습니다.");
    } else {
        out.println("받은 r_num 파라미터: " + reviewNumStr);
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 상세보기</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
</head>
<body>
<%@include file="/SubHeader.jsp" %>

<section class="view_after">
	<div>
		<div class="after_box">
            <%
                if (review != null) {
            %>
			<div class="animal_after">
				<div class="after_img">
					<img src="<%= review.getR_img() != null && !review.getR_img().isEmpty() ? review.getR_img() : "/DongGu/img/default.png" %>">
				</div>
				<div class="after_txt">
					<div class="after_title">
					    <span class="name"><%= review.getAi_name() %>&nbsp;<b>·</b></span>
					    <span class="addr"><%= review.getAi_birth() %>살</span>
					    <span class="date">(<%= review.getR_date() %>)</span>
					</div>
					<img src="/DongGu/img/star.png">
					<p><%= review.getR_content() %></p>
				</div>
			</div>
            <% } else { %>
            <div class="error-message">
                <p>해당 리뷰를 찾을 수 없습니다.</p>
            </div>
            <% } %>
			<div class="donggu_info">
				<div>
					<div class="donggu_info_box">
						<p class="donggu_info_p">담당 동구 정보<img src="/DongGu/img/magnifier.png"></p>
						
						<div class="info_box_detail">
							<div>
								<p style="text-align: right; margin-bottom: 10px; font-size: 20px; color: #333333; font-weight: 600; letter-spacing: -0.2px; line-height: 25px;"><%= review != null ? review.getNickname() : "알 수 없음" %></p>
								<div style="display: flex; flex-direction: row; align-items: flex-end; gap: 10px;">
									<p>새싹 등급</p> | <p>5.0</p> | <p>후기 50개</p> <!-- 이 부분은 수정해야함 -->
								</div>
							</div>
							<img src="/DongGu/img/sinyou.jpg"> <!-- 실제 프로필 이미지를 DB에서 가져오도록 수정해야함 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@include file="../Footer.jsp" %>
</body>
</html>
