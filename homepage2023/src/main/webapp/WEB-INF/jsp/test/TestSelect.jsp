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
<title>테스트 게시판</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

<!-- BBS style -->
<link href="/asset/BBSTMP_0000000000001/style.css" rel="stylesheet"/>
<!-- 공통 style -->
<link href="/asset/LYTTMP_0000000000000/style.css" rel="stylesheet"/>

<c:url var ="_BASE_PARAM" value="">

	
	<c:if test="${not empty searchVO.searchCondition}"><c:param name="searchConition" value="${searchVO.searchCondition}"/></c:if>
	<c:if test="${not empty searchVO.searchKeyword}"><c:param name="searchKeyword" value="${searchVO.searchKeyword}"/></c:if>
</c:url>
	
	접속계정 : <c:out value="${USER_INFO.id}"/>

<div class="container">
	<div id="contents">
	<div id="bbs_wrap">
		<div class="board_view">
			<dl class="tit_view">
				<dt>제목</dt>
				<dd><c:out value="${result.sj}"/></dd>
			</dl>
			<dl class="info_view2">
				<dt>작성자ID</dt>
				<dd><c:out value="${result.frstRegisterId}"/></dd>
				<dt>작성일</dt>
				<dd><fmt:formatDate value="${result.frstRegistPnttm}" pattern="yyyy-MM-dd"/></dd>				
			</dl>
		<div class="view_cont">
				<c:out value="${result.cn}" escapeXml="false"/>
			</div>
	</div>
		<div class="btn-cont ar">
			<c:choose>
				<c:when test="${not empty searchVO.testId}">
					<c:url var="uptUrl" value="/test/testRegist.do${_BASE_PARAM}">
						<c:param name="testId" value="${result.testId}"/>
					</c:url>
					<a href="${uptUrl}" class="btn">수정</a>
					
					<c:url var="delUrl" value="/test/delete.do${_BASE_PARAM}">
						<c:param name="testId" value="${result.testId}"/>
					</c:url>
					<a href="${delUrl}" id="btn-del" class="btn"><i class="ico-del"></i>삭제</a>
				</c:when>
				<c:otherwise>
					<a href="#none" id="btn-reg" class="btn spot">등록</a>
				</c:otherwise>
			</c:choose>
			<c:url var="listUrl" value="/test/selectList.do${_BASE_PARAM}"/>
			<a href="${listUrl}" class="btn">목록</a>		
		</div>
	</div>
	</div>
</div>

<script>
$(document).ready(function(){
	//게시글삭제
	$("#btn-del").click(function(){
		if(!confirm("삭제하시겠습니까?")){
			return false;
		}
	});
});

</script>
</body>
</html>