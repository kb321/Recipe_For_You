<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- CSS -->
<!-- <link rel="stylesheet" type="text/css" href="./assets/css/main.css"> -->
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
            width: 100px;
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
		.td{
			line-height:46px;
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
        #consent{
            height : 20px;
            width : 20px;
            margin-top: 13px;
        }
        #showTOS{
            margin-right: 110px;
            line-height: 45px;
            float: right;
            color: #7FB292;
            
        }
        .greenBtn{
            background-color: #7FB292;
            color: white;
            border: 0px;
        }
        .Modal{
            top: 20%
        }
        .vBar{
            font-size: 16px;
            font-weight: 500;
        }
        #joinBtn:hover{
            color: black;
        }
        #ag{
        	line-height: 20px;
        }
   </style>

</head>
<body>
   <div id="innerContentWrapper">
        <form action="/member/memberJoin.do" method="post" id="joinForm">
            <div><div id="title">회원가입</div></div><br><br>
            
            <!--아이디-->
            <div class="th">아이디 </div>
            <div class="td">
                <input type="text" name="userId" placeholder=" 6자 이상의 영문 혹은 영문과 숫자 조합" maxlength="12" data-name="아이디">
                <button id="checkId" type="button">중복확인</button><br>
            </div>
            <div class="validation" style="display:none;"><div class="th"></div><span>6자 이상의 영문 혹은 영문과 숫자 조합</span></div><br>
            
            <!--비밀번호-->
            <div class="th">비밀번호 </div>
            <div class="td">
                <input type="password" name="userPwd" placeholder=" 비밀번호를 입력해주세요" maxlength="14" data-name="비밀번호">
            </div>
            <div class="validation" style="display:none;"><div class="th"></div><span>8자 이상의 영문, 숫자, 특수문자 조합</span></div><br>
            
            <!--비밀번호 확인-->
            <div class="th">비밀번호 확인</div>
            <div class="td">
                <input type="password" name="userPwd_re" placeholder=" 비밀번호를 한번 더 입력해주세요" maxlength="14" data-name="비밀번호 확인">
            </div>
            <div class="validation" style="display:none;"><div class="th"></div><span>비밀번호를 확인해주세요</span></div><br>

            <!--이름-->
            <div class="th">이름 </div>
            <div class="td">
            <input type="text" name="userName" placeholder=" 이름을 입력해주세요" data-name="이름" maxlength="10">
            </div>
            <div class="validation" style="display:none;"><div class="th"></div><span>2자 이상의 한글</span></div><br>

            <!--이메일-->
            <div class="th">이메일 </div>
            <div class="td">
            <input type="email" name="userEmail" placeholder=" 예: member@join.com" data-name="이메일">
            </div>
			<div class="validation" style="display:none;"><div class="th"></div><span>이메일 형식으로 작성</span></div><br>

            <!--전화번호-->
            <div class="th">전화번호 </div>
            <div class="td">
                <input type="text" name="userPhone" placeholder=" 숫자만 입력해주세요" maxlength="11" data-name="전화번호">
                <button id="checkPhone">인증하기</button><br>
            </div>
            <div class="validation" style="display:none;"><div class="th"></div><span>숫자만 입력</span></div><br>

            <!--이용약관동의-->
            <div class="th">이용약관 </div>
            <div class="td">
                <label><input type="checkbox" name="userConsent" id="consent" class="form-check-input" value="Y"> 동의</label>
                <a type="button" id="showTOS" data-bs-toggle="modal" data-bs-target="#tosModal">약관보기 &gt; </a>
            </div><br>
                 
            <br><br><br><br>
            <div class="th"></div><input type="button" value="회원가입" id="joinBtn" class="greenBtn">
        </form>
            <!-- 이용약관 Modal -->
            <div class="modal fade Modal" id="tosModal" tabindex="-1" aria-labelledby="tosModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-dialog-scrollable">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="tosModalLabel">이용약관</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    동의동의동의동의동의동의동의동의동의동의동의
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn greenBtn" data-bs-dismiss="modal">확인</button>
                  </div>
                </div>
              </div>
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
    </div>
    <script>
        //입력받은 값 유효성검사 호출
        $("input[name]").keyup(function() {
            var exp = "";
            
            //입력하고 있는 데이터에 맞는 정규식을 찾아 exp에 넣음
            if ($(this).attr("name") == "userId") { // 아이디
                exp = "^[a-z0-9]{6,12}$";
            } else if ($(this).attr("name") == "userPwd") { // 비밀번호
                exp = "^(?=.+[a-z])(?=.+[0-9])(?=.+[~!@#$%^&*-+]).{8,14}";
            } else if ($(this).attr("name") == "userPwd_re") {//비밀번호 확인    
                var pw=$("input[name=userPwd]").val();
               	if($(this).val()==pw){
                    $(this).parent().next().children().next().css("color", "green");
                    $(this).attr("vali","T");
                }else{
                    $(this).parent().next().children().next().css("color", "red");
                    $(this).attr("vali","F");
                }
                $(this).parent().next().css("display","block");
                return;
            } else if ($(this).attr("name") == "userName") {//이름 확인
            	exp = "^[가-힣]{2,10}$";
            } else if ($(this).attr("name") == "userEmail") {//이메일 확인
            	exp = ".+@.+";
            } else if ($(this).attr("name") == "userPhone") {//전화번호 확인
            	exp = "^[0-9]{10,11}$";
            }
                $(this).parent().next().css("display","block");
            
            //정규식 결과에 따라 span 태그에 있는 메시지를 보여줌
            var result = checkValidation($(this).val(), exp);
            if (result) {
                    $(this).parent().next().children().next().css("color", "green");
                    $(this).attr("vali","T");
            } else {
                    $(this).parent().next().children().next().css("color", "red");
                    $(this).attr("vali","F");
            }
            $(this).parent().next().css("display","block");
        });
        
        //입력값과 정규식을 매개변수로 받아 유효성 검사
        function checkValidation(value, exp) {
            var exp = new RegExp(exp);
            return exp.test(value);
        }

        // 아이디 중복 확인
        $("#checkId").click(function() {
            var userId = $("input[name=userId]").val();
            var exp = "^[a-z0-9]{6,12}$";
        	var $msg = $("#alertModalMSG");
        	var $modal = $("#alertModal");
            
            	//아이디체 중복확인전 다시한번 아이디 유효성 검사
            if(checkValidation(userId,exp)){
	            $.ajax({
	            	url : "/AjaxIdCheck.do",
	            	type : "post",
	            	data : {"userId":userId},
	            	success : function(idCheck){
	            		// idcheck값으로 1이 오면 중복된 아이디
	            		if(idCheck==0){
	            			$("input[name=userId]").attr("idcheck",userId) // userId 태그에 아이디 사용가능 표시로 속성을 추가
	            			$msg.html("사용가능한 아이디입니다.");
	            			$modal.modal("show");
	            		}else{
	            			$msg.html("이미 사용중인 아이디입니다.");
	            			$modal.modal("show");
	            		}	
	            	},
	            	error : function(){
	            		location.replace("/views/commons/error.jsp")
	            	}
	            })
            }else{
            	$msg.html("6자 이상의 영문 혹은 영문과 숫자 조합만 가능합니다.");
            	$modal.modal("show");
            };
        })
			// 회원가입 버튼을 클릭하여 폼태그 사항을 submit하기전 입력사항 검사
        $("#joinBtn").click(function(){
        	var $msg = $("#alertModalMSG");
        	var $modal = $("#alertModal");
        	var $form = $("#joinForm");
        	var $userId = $("input[name=userId]");

        	$.each($("input[name]:not(input[name=checkbox])"), function(index, item){
        			// 입력값이 없을 경우
        		if($(this).val()==""){
        				var dataName = $(this).attr("data-name");
        				$msg.html(dataName+"을(를) 입력해주세요.");
                    	$modal.modal("show");
                    	$form = "";
	                return false;
        		}
        			// 이용약관동의 체크를 하지 않았을 경우
	        	if(!$("#consent").prop("checked")){
	        		$msg.html("이용약관에 동의해주세요.");
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
        			// 아이디 중복확인을 하지 않았을 경우 
 	        	if($userId.attr("idCheck")!=$userId.val()){
 	        		$msg.html("아이디 중복확인을 해주세요");
 	        		$modal.modal("show");
	            	$form = "";
	            	return false;
 	        	}
        	})
        	if($form!=""){
        		$form.submit();
        	}
        })
    </script>    
</body>
</html>