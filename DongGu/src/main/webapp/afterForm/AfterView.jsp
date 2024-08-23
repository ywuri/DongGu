<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DongGu.review.IdReviewDTO" %>
<%@ page import="com.DongGu.review.DongguReviewDTO" %>
<%@ page import="com.DongGu.review.IdReviewDAO" %>
<%@ page import="com.DongGu.review.DongguReviewDAO" %>

<jsp:useBean id="rdao" class="com.DongGu.review.IdReviewDAO"></jsp:useBean>
<jsp:useBean id="ddao" class="com.DongGu.review.DongguReviewDAO"></jsp:useBean>

<%!
    // 별점 이미지를 반환하는 메서드 정의
    String getStarImage(int r_star) {
        switch (r_star) {
            case 1:
                return "/DongGu/img/star_one.png";
            case 2:
                return "/DongGu/img/star_two.png";
            case 3:
                return "/DongGu/img/star_three.png";
            case 4:
                return "/DongGu/img/star_four.png";
            case 5:
                return "/DongGu/img/star.png";
            default:
                return "/DongGu/img/star.png"; // 기본 이미지
        }
    }
%>

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
    DongguReviewDTO dongguReview = null;
    try {
        review = rdao.getReviewByNum(reviewNum); // int로 변환된 값을 전달
        dongguReview = ddao.getReviewByNum(reviewNum); // int로 변환된 값을 전달
    } catch (Exception e) {
        // 예외 내용을 출력
        e.printStackTrace();
    }

    if (review == null) {
        out.println("해당 리뷰를 찾을 수 없습니다.");
    } else {
        // 이미지 경로가 null이거나 비어 있거나 "null"이라는 문자열인 경우 기본 이미지를 사용
        String imageUrl = (review.getR_img() != null && !review.getR_img().trim().equals("") && !"null".equalsIgnoreCase(review.getR_img())) ? review.getR_img() : "default.png";

        String profileImageUrl = (dongguReview.getP_img() != null && dongguReview.getP_img().trim().equals("") && !"null".equalsIgnoreCase(dongguReview.getP_img())) ? dongguReview.getP_img() : "profile1.png";

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
         <div class="animal_after">
            <div class="after_img">
               <img src="/DongGu/img/<%= imageUrl %>" alt="이미지" onerror="this.onerror=null; this.src='/DongGu/img/default.png';">
            	</div>
				<div class="after_txt">
					<div class="after_title">
					    <span class="name"><%= review.getAi_name() %>&nbsp;<b>·</b></span>
					    <span class="addr"><%= review.getAi_birth() %>살</span>
					    <span class="date">(<%= review.getR_date() %>)</span>
					</div>
					<img src="<%= getStarImage(review.getR_star()) %>" alt="별점">
					<p><%= review.getR_content() %></p>
				</div>
			</div>
			<div class="donggu_info">
				<div>
					<div class="donggu_info_box">
						<p class="donggu_info_p">담당 동구 정보<img src="/DongGu/img/magnifier.png"></p>
						
						<div class="info_box_detail">
							<div>
								<p style="text-align: right; margin-bottom: 10px; font-size: 20px; color: #333333; font-weight: 600; letter-spacing: -0.2px; line-height: 25px;"><%= dongguReview != null ? dongguReview.getP_nickname() : "알 수 없음" %></p>
								<div style="display: flex; flex-direction: row; align-items: flex-end; gap: 10px;">
									<p><a href="DongGu/member/MemberDetail.jsp"><%= dongguReview != null ? dongguReview.getG_name() + " 등급" : "등급 알 수 없음" %></a></p> | 
									<p><%= dongguReview != null ? dongguReview.getAvg_star() : "N/A" %></p> | 
									<p>후기 <%= dongguReview != null ? dongguReview.getReview_count() : "알 수 없음" %>개</p>
								</div>
							</div>

								<img src="/DongGu/img/petsitter_profile/<%= profileImageUrl %>" alt="프로필 이미지" onerror="this.onerror=null; this.src='/DongGu/img/petsitter_profile/profile1.png';"> <!-- DB에서 가져온 프로필 이미지 -->

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
<%
    }
%>
