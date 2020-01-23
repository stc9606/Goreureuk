<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">

<title>꼬르륵</title>
</head>
<body>
<%@include file="/WEB-INF/views/includes/publicView/aside.jsp" %>

	<div id="fh5co-main">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<form name="form1" method="post"
						action="${contextPath}/qna/qnaMain">
						<div class="input-group">
							<!-- USE TWITTER TYPEAHEAD JSON WITH API TO SEARCH -->

							<input class="form-control" id="system-search" name="keyword"
								value="${qmap.keyword }" placeholder="Search for" required>
							<span class="input-group-btn">
								<button type="submit" class="btn btn-default">Search</button>
							</span>
						</div>
					</form>
				</div>
				<div class="col-sm-11">
					<table class="table table-list-search">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${qmap.list}" var="qna">
								<tr>
									<td>${qna.qna_code}</td>
									<td><a
										href="${contextPath}/qna/qnaBoardView?qna_code=${qna.qna_code}&curPage=${qmap.qnaPager.curPage}&searchOption=${qmap.searchOption}&keyword=${qmap.keyword}">${qna.qna_title}</a></td>
									<td>${qna.qna_mmid}</td>
									<td><fmt:formatDate value="${qna.qna_date}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
								</tr>
							</c:forEach>

							<tr>
								<td colspan="4"><c:if test="${qmap.qnaPager.curBlock > 1}">
										<a href="javascript:qlist('1')">[처음]</a>
									</c:if> <c:if test="${qmap.qnaPager.curBlock > 1}">
										<a href="javascript:qlist('${qmap.qnaPager.prevPage}')">[이전]</a>
									</c:if> <c:forEach var="num" begin="${qmap.qnaPager.blockBegin}"
										end="${qmap.qnaPager.blockEnd}">
										<c:choose>
											<c:when test="${num == qmap.qnaPager.curPage}">
												<span style="color: blue">${num}</span>&nbsp;
											</c:when>
											<c:otherwise>
												<a href="javascript:qlist('${num}')">${num}</a>&nbsp;
											</c:otherwise>
										</c:choose>
									</c:forEach> 
									<c:if test="${qmap.qnaPager.curBlock <= qmap.qnaPager.totBlock}">
										<a href="javascript:qlist('${qmap.qnaPager.nextPage}')">[다음]</a>
									</c:if> 
									<c:if test="${qmap.qnaPager.curPage <= qmap.qnaPager.totPage}">
										<a href="javascript:qlist('${qmap.qnaPager.totPage}')">[끝]</a>
									</c:if>
								
										<button type="button" class="optionbtn-write" id="qnaWrite">글쓰기</button>
									
									
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<th colspan="4" class="massageTitle">건의사항</th>
							</tr>
							<tr>
								<td colspan="4">
									 <form name="form1" method="post" action="${contextPath}/message/msInsert?${_csrf.parameterName}=${_csrf.token}">
							         	<div>
							         		<input  type="hidden" id="ms_mmcode" name="ms_mmcode" value="m0008"/>
							                <input type="hidden" id="ms_mmid" name="ms_mmid" value="k1">
							            </div>
							            <div >
							                <textarea class="message" id="ms_content" name="ms_content" placeholder="내용을 입력해 주세요"></textarea>
							                <input type="submit" class="btn-red" id="btnSend" value="전송">
							               	
							                	<button type="button" class="btn-red" id="msMain">문의내역</button>
							               
							        	</div>
									</form>
									
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>
</html>

