<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        *{
            box-sizing: border-box;
        }
        #innerContentWrapper {
            margin: 0px auto;
            border: 1px solid black;
            width: 600px;
            height: 950px;
            padding: 20px;
        }
        #title{
            margin: auto;
            text-align: center;
            font-size: 23px;
            font-weight: 700;
            border-left: 1px solid black;
            border-right: 1px solid black;
            width: 150px;
            height: 20px;
            line-height: 20px;
        }
        .th {
            float: left;
            width: 100px;
            height : 48px;
            text-align: left;
            line-height: 48px;
            font-size: 16px;
        }
        input{
            height : 50px;
            width : 350px;
            border : 1px solid #707070;
            padding-left: 10px;
        }
        button{
            height : 50px;
            width : 100px;
            background-color: white;
            border: 1px solid #7FB292;
            color: #7FB292;
        }
        button:hover{
            font-weight: bolder;
        }
        .validation{
            width : 350px;
            height : 24px;
        }
        .greenBtn{
            background-color: #7FB292;
            color: white;
            border: 0px;
        }
        .vBar{
            font-size: 16px;
            font-weight: 500;
        }
        #submit:hover{
            color: black;
        }
        .textDiv{
            line-height: 45px;
        }
        .Modal{
            top: 20%
        }
    </style>
</head>
<body>
    <div id="innerContentWrapper">
        <form action="/member/memberUpdate.do" method="post" id="updateForm">
            <div><div id="title">개인정보 수정</div></div><br><br>
            
            <!--아이디-->
            <div class="th">아이디 </div>
            <div class="td">
                <div class="textDiv">"${sessionScope.member.userId }"</div>
            </div><br>
            <!--이름-->
            <div class="th">이름 </div>
            <div class="td">
            <div class="textDiv">"${sessionScope.member.userName }"</div>
            </div><br>
            <!--이메일-->
            <div class="th">이메일 </div>
            <div class="td">
            <input type="email" name="userEmail"  placeholder=" 예: member@join.com" data-name="이메일">
            </div><br>
            <!--전화번호-->
            <div class="th">전화번호 </div>
            <div class="td">
                <input type="text" name="userPhone" placeholder=" 숫자만 입력해주세요" data-name="전화번호">
                <button id="checkPhone">인증하기</button><br>
            </div>
            <br><br><br><br>
            <div class="th"></div><input type="button	`" value="개인정보 수정" id="update" class="greenBtn">
        </form><br />
        	<div class="th"></div><input type="button" value="회원탈퇴" id="withDraw" class="greenBtn">
    </div>
   		<!-- 알림 Modal -->
            <div class="modal fade Modal" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-dialog-scrollable">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="alertModalLabel">알림메세지</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body" id="alertModalMSG">
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn greenBtn" data-bs-dismiss="modal">확인</button>
                  </div>
                </div>
              </div>
            </div>    
    <script>
    	$(function(){
    		$("input[name=userEmail]").val("${sessionScope.member.userEmail }");
    		$("input[name=userPhone]").val("${sessionScope.member.userPhone }");
    	})
    	
    	$("input[placeholder]").blur(function(){
    		$(this).val($(this).val());
    	})
    	
	    			  //입력받은 값 유효성검사 호출
	    $("input[name]").keyup(function() {
	        var exp = "";
	       			 //입력하고 있는 데이터에 맞는 정규식을 찾아 exp에 넣음
	        if ($(this).attr("name") == "userEmail") {//이메일 확인
	        	exp = ".+@.+";
	        } else if ($(this).attr("name") == "userPhone") {//전화번호 확인
	        	exp = "^[0-9]{10,11}$";
	        }
    	
         			 //정규식 결과에 따라 span 태그에 있는 메시지를 보여줌
            var result = checkValidation($(this).val(), exp);
            if (result) {
                    $(this).attr("vali","T");
            } else {
                    $(this).attr("vali","F");
            }
	    })    
	        
    				// 개인정보수정 버튼을 클릭하여 폼태그 사항을 submit하기전 입력사항 검사
        $("#update").click(function(){
        	var $msg = $("#alertModalMSG");
        	var $modal = $("#alertModal");
        	var $form = $("#updateForm");

        	$.each($("input[name]"), function(index, item){
        			// 입력값이 없을 경우
        		if($(this).val()==""){
        				var dataName = $(this).attr("data-name");
        				$msg.html(dataName+"을(를) 입력해주세요.");
                    	$modal.modal("show");
                    	$form = "";
	                return false;
        		}
        			// 유효성 검사규칙에 맞지 않을 경우
 	        	if($(this).attr("vali")!="T"){
 	        		$msg.html("입력정보를 확인해주세요.");
 	        		$modal.modal("show");
	            	$form = "";
	            	return false;
    			}
        	})
        	if($form!=""){
        		$form.submit();
        	}
        })
    	
    	// 회원탈퇴
    	$("#withDraw").click(function(){
    		location.replace("/member/memberWithDraw.do");
    	})
    </script>
</body>
</html>