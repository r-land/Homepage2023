<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Language" content="ko">
<meta http-equiv="X-UA-Compatible" content="IE-edge"/>
<meta name="viewport" content=width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>테스트 게시판</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<!-- BBS style -->
<link href="/asset/BBSTMP_0000000000001/style.css" rel="stylesheet"/>
<!-- 공통 style -->
<link href="/asset/LYTTMP_0000000000000/style.css" rel="stylesheet"/>

<%--기본 URL --%>
<c:url var ="_BASE_PARAM" value="">
	<c:if test="${not empty searchVO.searchCondition}"><c:param name="searchConition" value="${searchVO.searchCondition}"/></c:if>
	<c:if test="${not empty searchVO.searchKeyword}"><c:param name="searchKeyword" value="${searchVO.searchKeyword}"/></c:if>
</c:url>
	
	접속계정 : <c:out value="${USER_INFO.id}"/>
	<div class="container">
	<div id="contents">
	<%--목록영역 --%>
	<div id="bbs_wrap">
		<div class="total">
			총 게시물
			<strong><c:out value="${paginationInfo.totalRecordCount}"/></strong>건 |
			현재페이지<strong><c:out value="${paginationInfo.currentPageNo}"/></strong>/
			<c:out value="${paginationInfo.totalPageCount}"/>
		</div>
		
		<div class="bss_list">
			<table class="list_table">
				<thead>
					<tr>
						<td class="num" scope="col">번호</th>
						<td class="tit" scope="col">제목</th>
						<td class="writer" scope="col">작성자</th>
						<td class="date" scope="col">작성일</th>
						<td class="date" scope="col">수정일</th>
						<td class="tit" scope="col">관리</th>
					</tr>
				</thead>
				<tbody>
			
			<c:forEach var="result" items="${resultList}"> 
				<tr>	
					<td>
						<c:out value="${result.testId}"/>
					</td> 
					<td>
					<c:url var="viewUrl" value="/test/select.do${_BASE_PARAM}">
							<c:param name="testId" value = "${result.testId}"/>
						</c:url>
						<a href="${viewUrl}"><c:out value="${result.sj}"/></a>
					</td>
					<td><c:out value="${USER_INFO.id}"/></td>
					<td><c:out value="${result.frstRegistPnttm}"/></td>
					<td><c:out value="${result.lastUpdtPnttm}"/></td>
					<td>
						<c:url var="delUrl" value="/test/delete.do">
							<c:param name="testId" value = "${result.testId}"/>
						</c:url>
						<a href="${delUrl}" class="btn-del">삭제</a>
					</td>
				</tr>
			</c:forEach>
					

					</tbody>
					</table>
		</div>
			

			<div id ="paging">
				<c:url var="pageUrl" value="/test/selectList.do${_BASE_PARAM}"/>
				<c:set var="pagingParam"><c:out value="${pageUrl}"/></c:set>
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="${pagingParam}"/>
			</div>
		</div>
			<div class="btn-cont ar">
				<c:url var="regUrl" value="/test/testRegist.do${_BASE_PARAM}"/>
				<a href="${regUrl}" class="btn spot"><i class="ico-check-spot"></i>글쓰기</a>
			</div>
			</div>
			</div>

			
<script>
$(document).ready(function(){
	//등록하기
	$("#btn-reg").click(function(){
		location.href = $(this).data("href");
	});
	
	$("#btn-del").click(function(){
		if(!confirm("삭제하시겠습니까?")){
			return false;
		}
	});
});
</script>
</body>
</html>