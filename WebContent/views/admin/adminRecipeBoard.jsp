<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<!-- BootStrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="/assets/css/adminRecipeBoard.css">

<title>냉장고를 부탁해</title>

</head>
<body>
	<div id="wrapper">
		<div id="header"></div>
		<div id="navigation">
			<%@include file="/views/commons/adminNavigation.jsp" %>
		</div>
		<div id="content">
			<div class="page_section">
				<div class="head_article">
					<h2 class="tit">레시피 조회 및 관리</h2>
				</div>
				<form>
					<div class="search-type">
						<select name="type" id="searchTypeSelect">
							<option value="writer">작성자</option>
							<option value="subject">제목</option>
						</select>
					</div>
					<div class="search-bar">
						<input type="text" size="30" name="keyword" class="search-input"/>
						<label for="searchSubmit" style="cursor: pointer;"><i class="fas fa-search search-icon">
						</i></label>
						<input type="submit" id="searchSubmit" style="display:none;"/>
					</div>
					<div id="abminBtn">
						<button id="blackBtn" type="button">블랙리스트 등록</button>
						&nbsp;
						<button id="delBtn" type="button">삭제</button>
					</div>
				</form>
				<form name="frmList">
					<table>
						<thead>
							<tr>
								<th><input type="checkbox" id="allCheckBox"></th>
								<th>번호</th>
								<th><select id="recipeCode" class="filter">
										<option value>카테고리</option>
										<option value="Recipe_01">한식</option>
										<option value="Recipe_02">양식</option>
										<option value="Recipe_03">일식</option>
										<option value="Recipe_04">중식</option>
										<option value="Recipe_05">분식</option>
										<option value="Recipe_06">채식</option>
										<option value="Recipe_07">다이어트</option>
										<option value="Recipe_08">밑반찬</option>
										<option value="Recipe_09">안주</option>
								</select></th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox" name="postNo"
									value="DB에서boardNo가져오기" /></td>
								<td>1</td>
								<td>한식</td>
								<td>맵고 짭짤하고 무지하게 맛있는 겉절이</td>
								<td>기먼필</td>
								<td>2021-12-19</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="postNo"
									value="DB에서boardNo가져오기" /></td>
								<td>2</td>
								<td>양식</td>
								<td>라자냐</td>
								<td>배계린</td>
								<td>2021-12-19</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="postNo"
									value="DB에서boardNo가져오기" /></td>
								<td>3</td>
								<td>양식</td>
								<td>둘이 먹다 하나 죽어도 모를 리조또</td>
								<td>김셩</td>
								<td>2021-12-19</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="postNo"
									value="DB에서boardNo가져오기" /></td>
								<td>4</td>
								<td>안주</td>
								<td>타코야끼볼</td>
								<td>서현진</td>
								<td>2021-12-19</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="postNo"
									value="DB에서boardNo가져오기" /></td>
								<td>5</td>
								<td>다이어트</td>
								<td>먹어도 배가 하나도 안부른 샐러드</td>
								<td>숀리</td>
								<td>2021-12-19</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="postNo"
									value="DB에서boardNo가져오기" /></td>
								<td>6</td>
								<td>분식</td>
								<td>엽X 뺨치는 매콤한 떡볶이</td>
								<td>떡복퀸</td>
								<td>2021-12-19</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="postNo"
									value="DB에서boardNo가져오기" /></td>
								<td>7</td>
								<td>중식</td>
								<td>어향가지</td>
								<td>두반장</td>
								<td>2021-12-19</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="postNo"
									value="DB에서boardNo가져오기" /></td>
								<td>8</td>
								<td>일식</td>
								<td>폭신폭신 오코노미야끼</td>
								<td>다꽝</td>
								<td>2021-12-19</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="postNo"
									value="DB에서boardNo가져오기" /></td>
								<td>9</td>
								<td>채식</td>
								<td>월남쌈</td>
								<td>숑숑</td>
								<td>2021-12-19</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="postNo"
									value="DB에서boardNo가져오기" /></td>
								<td>10</td>
								<td>밑반찬</td>
								<td>세상 제일가는 밥도둑 진미채</td>
								<td>밥경찰</td>
								<td>2021-12-19</td>
							</tr>
						</tbody>
					</table>
					<div class="layout-pagination">
						<div class="page-navi">
							<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center mt-5">
								<li class="page-item"><a class="page-link text-dark"
									href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<li class="page-item"><a class="page-link text-dark"
									href="#">1</a></li>
								<li class="page-item"><a class="page-link text-dark"
									href="#">2</a></li>
								<li class="page-item"><a class="page-link text-dark"
									href="#">3</a></li>
								<li class="page-item"><a class="page-link text-dark"
									href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
							</nav>
						</div>
					</div>
				</form>
			</div>
		</div>

		<script>
			$('#allCheckBox').click(function() {
				if ($(this).prop('checked')) {
					$('input[name=postNo]').prop('checked', true);
				} else {
					$('input[name=postNo]').prop('checked', false);
				}
			});
		</script>


		<div id="footer"></div>
	</div>
</body>
</html>