<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="/import/head" />
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body class="left-menu">
	<c:import url="/import/menu" />
	<div id="wrapper">
		<form method="post">

			<label>제목</label> ${view.title}<br /> <label>작성자</label>${view.writer}<br />

			<label>내용</label><br /> ${view.content}<br />

			<!--  <button type="submit">작성</button>-->
			<a href="/board/modify?bno=${view.bno}">게시물 수정</a>, <a
				href="/board/delete?bno=${view.bno}">게시물 삭제</a>, <a
				href="/board/list">게시물 목록</a><br />

		</form>

		<hr />


		<ul>
			<!--<li>
		<div>
			<p>첫번째 댓글 작성자</p>
			<p>첫번째 댓글</p>
		</div>
	</li>
	<li>
		<div>
			<p>두번째 댓글 작성자</p>
			<p>두번째 댓글</p>
		</div>
	</li>
	<li>
		<div>
			<p>세번째 댓글 작성자</p>
			<p>세번째 댓글</p>
		</div>
	</li>-->
			<c:forEach items="${reply}" var="reply">
				<li>
					<div>
						<p>${reply.writer}/${reply.regDate}</p>
						<p>${reply.content }</p>
					</div>
				</li>
			</c:forEach>
		</ul>


		<div>

			<form method="post" action="/reply/write">

				<p>
					<label>댓글 작성자</label> <input type="text" name="writer">
				</p>
				<p>
					<textarea rows="5" cols="50" name="content"></textarea>
				</p>
				<p>
					<input type="hidden" name="bno" value="${view.bno}">
					<button type="submit">댓글 작성</button>

				</p>
			</form>
		</div>
	</div>

</body>
</html>