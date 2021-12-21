<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Roboto:ital,wght@0,100;1,100&display=swap" rel="stylesheet">
    <title>header</title>
    <link rel="stylesheet" type="text/css" href="/assets/css/myRecipeContent.css">
    <link rel="stylesheet" type="text/css" href="/assets/css/myRecipeTop.css">
   <link rel="stylesheet" type="text/css" href="/assets/css/recipeHeaderFooter.css">


<style>
div {
    box-sizing: border-box;
}
#wrapper {
    width: 100%;
    background-color: #fff;

}


</style>


</head>
<body>
	
   <div id="wrapper">
        <div class="header fixed-top">
            <div class="top">
                <div class=top-img><img src="/assets/common/images/topicon.png" alt="" width="18px" height="25px"></div>
                <span class="top1 align">마이냉장고에 나만의 식재료를 등록하고 레시피를 추천 받아 보세요!</span>
            </div>
            <div class="header1">
                <a href="" class="logo">
                    <img src="/assets/common/images//main%20logo.png" alt="">
                </a>
                <div class="box-user">
                   <a href="" class="mypage">
                    <img src="/assets/common/images//headericon1.png" alt="" width="23px" height="28px">
                </a>
                <a href="" class="login">
                    <img src="/assets/common/images//headericon2.png" alt="" width="80px" height="30px">
                </a>
                </div>
                
            </div>

            <div class="navibar container-fluid">
                <nav class="navbar navbar-expand-lg nav-distance">
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active nav-about" href="#">ABOUT</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active nav-recipe" href="#">레시피</a>
                                <ul class="submenu">
                                    <li><a href="">모두보기</a></li>
                                    <li><a href="">한식</a></li>
                                    <li><a href="">양식</a></li>
                                    <li><a href="">일식</a></li>
                                    <li><a href="">중식</a></li>
                                    <li><a href="">분식</a></li>
                                    <li><a href="">채식</a></li>
                                    <li><a href="">다이어트</a></li>
                                    <li><a href="">밑반찬</a></li>
                                    <li><a href="">안주</a></li>
                                </ul>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link active nav-info" href="#">고객센터</a>
                                <ul class="submenu">
                                    <li><a href="">공지사항</a></li>
                                    <li><a href="">자주하는질문</a></li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active nav-mypage" href="#">마이냉장고</a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <div class=" box-search d-flex justify-content-center h-100">
                    <div class="searchbar">
                        <input class="search_input" type="text" name="" placeholder="">
                        <a href="" class="search_icon"><i class="fas fa-search"></i></a>
                    </div>
                </div>

            </div>
        </div>
        
        <div class="contents">
           <div id=menuNavi_wrapper>
            <div id="menu_content1"></div>
            <div id="menu_content2">
                <H3 style=text-align:center>|  My RECIPE  |</H3>
                <H6>내가 등록한 레시피를 확인 할 수 있어요</H6>
            </div>
            
        </div>  
                  <div id="content_wrapper">
          
           <div id="recipe_search">
              <form action=" " method="">
                   <select>
                       <option value="latest_desc">최신순</option>
                       <option value="like_desc">추천순</option>
                       <option value="level_asc">난이도</option>
                       <option value="time_asc">조리시간</option>
                   </select>
                </form>               
           </div>
            <div id="content_recipe_wrapper">
                     <div class="content_recipe" id="recipe1">
               
                        <div class="recipe_content" id="content1">
                            <div class="image" ></div>
                            <div class="subtitle" ></div>
                            <div class="title" ></div>
                            <div class="menu" >
                                <div class="menu_level"> 
                                <img src="/WebContent/css/image/Level.png" alt="" width="20px" height="20px" class="img">
                                <span>초급</span>
                                </div>
                                <div class="menu_time">
                                    <img src="/WebContent/css/image/clock_time.png" alt="" width="20px" height="20px" class="img">
                                    <span>40분</span>
                                </div>
                            </div>
                            <div class="empty" ></div>
                        </div>
                        <div class="recipe_content" id="content2">
                              <div class="image" ></div>
                            <div class="subtitle" ></div>
                            <div class="title"></div>
                            <div class="menu" >
                                <div class="menu_level"> 
                                <img src="/WebContent/css/image/Level.png" alt="" width="20px" height="20px" class="img">
                                 <span>초급</span>
                                </div>
                                <div class="menu_time">
                                    <img src="/WebContent/css/image/clock_time.png" alt="" width="20px" height="20px" class="img">
                                     <span>40분</span>
                                </div>
                            </div>
                            <div class="empty"></div>
                            
                        </div>
                        <div class="recipe_content" id="content3">
                            <div class="image" ></div>
                            <div class="subtitle" ></div>
                            <div class="title"></div>
                            <div class="menu" >
                                <div class="menu_level"> 
                                <img src="/WebContent/css/image/Level.png" alt="" width="20px" height="20px" class="img">
                                <span>초급</span>
                                </div>
                                <div class="menu_time">
                                    <img src="/WebContent/css/image/clock_time.png" alt="" width="20px" height="20px" class="img">
                                     <span>40분</span>
                                </div>
                            </div>
                            <div class="empty" ></div>
                        </div>
                        <div class="recipe_content" id="content4">
                           <div class="image" ></div>
                            <div class="subtitle" ></div>
                            <div class="title"></div>
                            <div class="menu" >
                                <div class="menu_level"> 
                                <img src="/WebContent/css/image/Level.png" alt="" width="20px" height="20px" class="img">
                                <span>초급</span>
                                </div>
                                <div class="menu_time">
                                    <img src="/WebContent/css/image/clock_time.png" alt="" width="20px" height="20px" class="img">
                                     <span>40분</span>
                                </div>
                            </div>
                            <div class="empty"></div>
                        </div>
                    </div>
            
            <div class="content_recipe" id="recipe2" id="content5">
                            <div class="recipe_content">
                            <div class="image" ></div>
                            <div class="subtitle" ></div>
                            <div class="title" ></div>
                            <div class="menu" >
                                <div class="menu_level"> 
                                <img src="/WebContent/css/image/Level.png" alt="" width="20px" height="20px" class="img">
                                <span>초급</span>
                                </div>
                                <div class="menu_time">
                                    <img src="/WebContent/css/image/clock_time.png" alt="" width="20px" height="20px" class="img">
                                    <span>40분</span>
                                </div>
                            </div>
                            <div class="empty" ></div>
                        </div>
                        <div class="recipe_content" id="content6">
                              <div class="image" ></div>
                            <div class="subtitle" ></div>
                            <div class="title"></div>
                            <div class="menu" >
                                <div class="menu_level"> 
                                <img src="/WebContent/css/image/Level.png" alt="" width="20px" height="20px" class="img">
                                 <span>초급</span>
                                </div>
                                <div class="menu_time">
                                    <img src="/WebContent/css/image/clock_time.png" alt="" width="20px" height="20px" class="img">
                                     <span>40분</span>
                                </div>
                            </div>
                            <div class="empty"></div>
                            
                        </div>
                        <div class="recipe_content" id="content7">
                            <div class="image" ></div>
                            <div class="subtitle" ></div>
                            <div class="title"></div>
                            <div class="menu" >
                                <div class="menu_level"> 
                                <img src="/WebContent/css/image/Level.png" alt="" width="20px" height="20px" class="img">
                                <span>초급</span>
                                </div>
                                <div class="menu_time">
                                    <img src="/WebContent/css/image/clock_time.png" alt="" width="20px" height="20px" class="img">
                                     <span>40분</span>
                                </div>
                            </div>
                            <div class="empty" ></div>
                        </div>
                        <div class="recipe_content" id="content8">
                            <div class="image" ></div>
                            <div class="subtitle" ></div>
                            <div class="title"></div>
                            <div class="menu" >
                                <div class="menu_level"> 
                                <img src="/WebContent/css/image/Level.png" alt="" width="20px" height="20px" class="img">
                                <span>초급</span>
                                </div>
                                <div class="menu_time">
                                    <img src="/WebContent/css/image/clock_time.png" alt="" width="20px" height="20px" class="img">
                                    <span>40분</span>
                                </div>
                            </div>
                            <div class="empty"></div>
                        </div>
                
            </div>
            <div class="content_recipe" id="recipe3">
                            <div class="recipe_content" id="content9">
                            <div class="image" id="content1_image"></div>
                            <div class="subtitle" id="content1_subtitle"></div>
                            <div class="title" id="content1_title"></div>
                            <div class="menu" id="content1_menu">
                                <div class="menu_level"> 
                                <img src="/WebContent/css/image/Level.png" alt="" width="20px" height="20px" class="img">
                                <span>초급</span>
                                </div>
                                <div class="menu_time">
                                    <img src="/WebContent/css/image/clock_time.png" alt="" width="20px" height="20px" class="img">
                                     <span>40분</span>
                                </div>
                            </div>
                            <div class="empty" ></div>
                        </div>
                        <div class="recipe_content" id="content10">
                              <div class="image" ></div>
                            <div class="subtitle" ></div>
                            <div class="title"></div>
                            <div class="menu" >
                                <div class="menu_level"> 
                                <img src="/WebContent/css/image/Level.png" alt="" width="20px" height="20px" class="img">
                                <span>초급</span>
                                </div>
                                <div class="menu_time">
                                    <img src="/WebContent/css/image/clock_time.png" alt="" width="20px" height="20px" class="img">
                                     <span>40분</span>
                                </div>
                            </div>
                            <div class="empty" ></div>
                            
                        </div>
                        <div class="recipe_content" id="content11">
                            <div class="image" ></div>
                            <div class="subtitle" ></div>
                            <div class="title"></div>
                            <div class="menu" >
                                <div class="menu_level"> 
                                <img src="/WebContent/css/image/Level.png" alt="" width="20px" height="20px" class="img">
                                 <span>초급</span>
                                </div>
                                <div class="menu_time">
                                    <img src="/WebContent/css/image/clock_time.png" alt="" width="20px" height="20px" class="img">
                                     <span>40분</span>
                                </div>
                            </div>
                            <div class="empty" ></div>
                        </div>
                        <div class="recipe_content" id="content12">
                            <div class="image" ></div>
                            <div class="subtitle" ></div>
                            <div class="title"></div>
                            <div class="menu" >
                                <div class="menu_level"> 
                                <img src="/WebContent/css/image/Level.png" alt="" width="20px" height="20px" class="img">
                                 <span>초급</span>
                                </div>
                                <div class="menu_time">
                                    <img src="/WebContent/css/image/clock_time.png" alt="" width="20px" height="20px" class="img">
                                     <span>40분</span>
                                </div>
                            </div>
                            <div class="empty"></div>
                        </div>
                
            </div>

        </div>
        </div>
        
        <div id="content_fotter">
            <div id="page_navi"></div>
        </div>  
            
              
            <%--컨텐츠 </div>--%>     
        </div>
        
        <div class="footer">
            <div class="footer1 container">
            <pre>
(주)컬쳐히어로
            
            
상호:(주)컬쳐히어로   대표자:양준규  개인정보관리책임자:장호진  사업자 등록번호:144-81-35400
            
통신판매업 신고:제 2015-경기성남-1940호  전화:1833-8307  팩스:031-8017-1800
            
주소:(13487) 경기도 성남시 분당구 삼평동625 판교세븐벤처밸리1단지 제3동 1001호 이메일:commerce@culturehero.net
            </pre>
            </div>
            <div class="footer-bottom">
               <div id="footer-word">
                <pre>      이용약관   개인정보처리방침   공지사항   자주묻는질문   광고/제휴문의:contact@culturehero.net</pre>
                </div>
            </div>
        </div>
    </div>



    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
	




</body>
</html>