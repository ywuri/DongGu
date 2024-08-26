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
    String p_id = null;

    try {
        review = rdao.getReviewByNum(reviewNum);
        dongguReview = ddao.getReviewByNum(reviewNum);

        if (dongguReview != null && dongguReview.getP_nickname() != null) {
            p_id = rdao.getP_id(dongguReview.getP_nickname());  // p_nickname으로 p_id 가져오기
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    if (review == null) {
        out.println("해당 리뷰를 찾을 수 없습니다.");
    } else {

        //String imageUrl = "/DongGu/img/after/" + (review.getR_img() != null && !review.getR_img().trim().isEmpty() && !"null".equalsIgnoreCase(review.getR_img().trim()) ? review.getR_img() : "default.png");

        String profileImageUrl = (dongguReview != null && dongguReview.getP_img() != null && !dongguReview.getP_img().trim().equals("") && !"null".equalsIgnoreCase(dongguReview.getP_img())) ? dongguReview.getP_img() : "profile1.png";
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
             	 <img src="<%= (review.getR_img() != null && !review.getR_img().isEmpty() && !"null".equals(review.getR_img().trim())) 
						    ? "/DongGu/img/after/" + review.getR_img() 
						    : "/DongGu/img/default.png" %>" 
						    alt="이미지" 
						    onerror="this.onerror=null; this.src='/DongGu/img/default.png';">
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
						        <p style="text-align: right; margin-bottom: 10px; font-size: 20px; color: #333333; font-weight: 600; letter-spacing: -0.2px; line-height: 25px;">
						            <a href="/DongGu/member/MemberDetail.jsp?p_id=<%= p_id %>&usertype=1">
						                <%= dongguReview != null ? dongguReview.getP_nickname() : "알 수 없음" %>
						            </a>
						        </p>
						        <div style="display: flex; flex-direction: row; align-items: flex-end; gap: 10px;">
						            <p><%= dongguReview != null ? dongguReview.getG_name() + " 등급" : "등급 알 수 없음" %></p> | 
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

