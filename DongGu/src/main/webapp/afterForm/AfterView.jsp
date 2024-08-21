<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
<style>
.view_after {width: 100%; display: flex; padding: 200px 0 100px 0; flex-direction: column; align-items: center; justify-content: space-around;}
.after_box {display: flex; position: relative; flex-direction: column; vertical-align: top; align-items: flex-end; width: 640px; padding: 30px 40px;
    border-radius: 10px; box-shadow: 0px 2px 12px rgba(0, 0, 0, 0.09); border-radius: 20px; overflow: hidden;}
.after_box .after_img {width:100%; height: 350px; overflow:hidden;}
.after_box .after_img img {width:100%;}
.after_box .after_txt {padding: 35px 0 55px;}
.after_box .after_title {display: flex; flex-direction: row; gap: 10px;}
.after_box .after_txt .after_title span{font-size: 20px; line-height: 23px; font-weight: 600; color: #393C47; margin-bottom: 10px;  display: flex; align-items: center; letter-spacing: -0.2px;}
.after_box .after_txt img {width:100px; margin-bottom: 30px;}
.after_box .after_txt p {font-size: 15px; color: #4D5055; word-break: keep-all; text-align: left; word-wrap: break-word;  line-height: 24px; white-space: pre-line;}
.donggu_info {background-color: #FAFAFC; width: 100%; display: flex; justify-content: flex-end;}
.donggu_info .donggu_info_box .info_box_detail {display: flex; align-items: center; gap: 10px; margin-right: 15px;}
.donggu_info .donggu_info_box {padding: 20px 30px 20px 20px;}
.donggu_info .donggu_info_box .donggu_info_p {text-align: right; margin-bottom: 30px; font-size: 17px; color: #393C47; font-weight: 500; line-height: 25px;}
.donggu_info .donggu_info_box .info_box_detail img {width: 76px; height: 76px; border-radius: 50%; object-fit: cover; box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.16);} 
.donggu_info .donggu_info_box .donggu_info_p img {width: 15px; margin-left: 5px;}

</style>
</head>
<body>
<%@include file="/SubHeader.jsp" %>
<section class="view_after">
	<div>
		<div class="after_box">
			<div class="animal_after">
				<div class="after_img">
					<img src="/DongGu/img/rivew_img02.png">
				</div>
				<div class="after_txt">
					<div class="after_title">
						<span class="name">초코&nbsp;<b>·</b></span>
						<span class="addr">13살</span>
						<span class="date">(경북 구미시)</span>
					</div>
					<img src="/DongGu/img/star.png">
					<p>노견이라서 걱정 많이 했는데 우리 초코가 조금 활력을 찾은 것 같아서 기뻐요!
					 예전에는 간식 던져주면 잘 받아먹고 그랬는데 요즘은 머리에 통 떨어져도 모르고 속상했거든요..
					 나이가 들어 어쩔 수 없지만 그래도 다른쪽으로 초코에게 도움을 줄 수 있어서 행복했어요!
					 훈련사님 정말 짱짱걸 이십니다. 앞으로도 잘 부탁드릴게요 감사합니다!</p>
				</div>
			</div>
			<div class="donggu_info">
				<div>
					<div class="donggu_info_box">
						<p class="donggu_info_p">담당 동구 정보<img src="/DongGu/img/magnifier.png"></p>
						
						<div  class="info_box_detail">
							<div >
								<p style="text-align: right; margin-bottom: 10px; font-size: 20px; color: #333333; font-weight: 600; letter-spacing: -0.2px; line-height: 25px;">신 유</p>
								<div style="display: flex; flex-direction: row; align-items: flex-end; gap: 10px;">
									<p>새싹 등급</p> | <p>5.0</p> | <p>후기 50개</p>
								</div>
							</div>
							<img src="/DongGu/img/sinyou.jpg">
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