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
    </style>
</head>
<body>
    <div id="innerContentWrapper">
        <form action="/member/memberPwdChange.do" method="post" id="pwdChangeForm">
            <div><div id="title">???????????? ??????</div></div><br><br>
            
            <!--????????????-->
            <div class="th">???????????? </div>
            <div class="td">
                <input type="password" name="userPwd" placeholder=" ??????????????? ??????????????????">
            </div>
            <div class="validation" style="display:none;"><div class="th"></div><span>8??? ????????? ??????, ??????, ???????????? ??????</span></div><br>
            <!--???????????? ??????-->
            <div class="th">???????????? ??????</div>
            <div class="td">
                <input type="password" name="userPwd_re" placeholder=" ??????????????? ?????? ??? ??????????????????">
            </div>
            <div class="validation" style="display:none;"><div class="th"></div><span>??????????????? ??????????????????</span></div><br>
 
            <br>
            <div class="th"></div><input type="submit" value="????????????" id="submit" class="greenBtn">
        </form>
    </div>
    
    <script>
        
    		// ???????????? ????????? ??????
    	$("input[name=userPwd]").keyup(function(){
    		var pwd = $(this).val();
    		var number = pwd.search(/\d/);
    		var alphabet = pwd.search(/[a-z]/ig);
    		var special = pwd.search(/\W/);
    		var blank = pwd.search(/\s/);
    			
    		
    		if(pwd.length<8 || number == -1 || alphabet == -1 || special == -1 || blank != -1){
    			$(this).parent().next().children().next().css("color", "red");
    			$(this).attr("vali","F");
    		}else{
    			$(this).parent().next().children().next().css("color", "green");
    			$(this).attr("vali","T");
    		}
    		$(this).parent().next().css("display","block");
    	})
    	
    		//???????????? ??????
    	$("input[name=userPwd_re]").keyup(function(){
    		var pwd_re = $(this).val();
    		var pwd = $("input[name=userPwd]").val();

    		if(pwd!=pwd_re){
    			$(this).parent().next().children().next().css("color", "red");
    			$(this).attr("vali","F");
    		}else{
    			$(this).parent().next().children().next().css("color", "green");
    			$(this).attr("vali","T");
    		}
    		$(this).parent().next().css("display","block");
    	})
    	
    		// ????????? ??? ?????? ?????? ??????
		$("#update").click(function(){
        	var $msg = $("#alertModalMSG");
        	var $modal = $("#alertModal");
        	var $form = $("#pwdChangeForm");

       		if($(this).val()==""){
 				var dataName = $(this).attr("data-name");
 				$msg.html(dataName+"???(???) ??????????????????.");
             	$modal.modal("show");
             	$form = "";
                return false;
       		}
       		
      			// ????????? ??????????????? ?????? ?????? ??????
        	if($(this).attr("vali")!="T"){
	       		$msg.html("??????????????? ??????????????????.");
	       		$modal.modal("show");
	           	$form = "";
	           	return false;
  			}
      			
        	if($form!=""){
        		$form.submit();
        	}
        })

    </script>
</body>
</html>