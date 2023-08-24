<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko">
<meta http-equiv="X-UA-Compatible" content="IE-edge"/>
<meta name="viewport" content=width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>테스트용게시판</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.tiny.cloud/1/shyeqry1yl36ksy24ckkyz9xablvkcj1ir2w26jcgdzh0avm/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
<script>
$(function(){
    var plugins = [
        "advlist", "autolink", "lists", "link", "image", "charmap", "print", "preview", "anchor",
        "searchreplace", "visualblocks", "code", "fullscreen", "insertdatetime", "media", "table",
        "paste", "code", "help", "wordcount", "save"
    ];
    var edit_toolbar = 'formatselect fontselect fontsizeselect |'
               + ' forecolor backcolor |'
               + ' bold italic underline strikethrough |'
               + ' alignjustify alignleft aligncenter alignright |'
               + ' bullist numlist |'
               + ' table tabledelete |'
               + ' link image';

    tinymce.init({
    language: "ko_KR", //한글판으로 변경
        selector: '#cn',
        height: 500,
        menubar: false,
        plugins: plugins,
        toolbar: edit_toolbar,
        
        /*** image upload ***/
        image_title: true,
        /* enable automatic uploads of images represented by blob or data URIs*/
        automatic_uploads: true,
        /*
            URL of our upload handler (for more details check: https://www.tiny.cloud/docs/configure/file-image-upload/#images_upload_url)
            images_upload_url: 'postAcceptor.php',
            here we add custom filepicker only to Image dialog
        */
        file_picker_types: 'image',
        /* and here's our custom image picker*/
        file_picker_callback: function (cb, value, meta) {
            var input = document.createElement('input');
            input.setAttribute('type', 'file');
            input.setAttribute('accept', 'image/*');

            /*
            Note: In modern browsers input[type="file"] is functional without
            even adding it to the DOM, but that might not be the case in some older
            or quirky browsers like IE, so you might want to add it to the DOM
            just in case, and visually hide it. And do not forget do remove it
            once you do not need it anymore.
            */
            input.onchange = function () {
                var file = this.files[0];

                var reader = new FileReader();
                reader.onload = function () {
                    /*
                    Note: Now we need to register the blob in TinyMCEs image blob
                    registry. In the next release this part hopefully won't be
                    necessary, as we are looking to handle it internally.
                    */
                    var id = 'blobid' + (new Date()).getTime();
                    var blobCache =  tinymce.activeEditor.editorUpload.blobCache;
                    var base64 = reader.result.split(',')[1];
                    var blobInfo = blobCache.create(id, file, base64);
                    blobCache.add(blobInfo);

                    /* call the callback and populate the Title field with the file name */
                    cb(blobInfo.blobUri(), { title: file.name });
                };
                reader.readAsDataURL(file);
            };
            input.click();
        },
        /*** image upload ***/
        
        content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
    });
});
</script>
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
<c:choose>
	<c:when test ="${not empty result.testId }">
		<c:set var="actionUrl" value="/test/update.do"/>
	</c:when>
	<c:otherwise>
			<c:set var="actionUrl" value="/test/insert.do"/>
	</c:otherwise>
</c:choose>

<div class="container">
	<div id="contents">
		<form action="${actionUrl}" method="post" id="frm" name="frm" onsubmit="return regist()" enctype="multipart/form-data">
			<input type="hidden" name="testId" value="${result.testId}"/>
						
			<table class="chart2">
				<caption>게시글 작성</caption>
				<colgroup>
					<col style="width:120px"/>
					<col />
					</colgroup>
					<tbody>
					<tr>
					<th scope="row">제목</th>
					<td>
						<input type="text" id="sj" name="sj" title="제목입력" class="q3" value="<c:out value="${result.sj}"/>"/>
					</td>
					</tr>
					<tr>
					<th scope="row">작성자ID</th>
					<td>
						<c:out value="${USER_INFO.id}"/>
					</td>
					</tr>
					<tr>
					<th scope="row">내용</th>
					<td>
						<textarea id="cn" name="cn" rows="15" title="내용입력"><c:out value="${result.cn}"/></textarea>
					</td>
					</tr>
				</tbody>
		</table>
		
<div class="btn-cont ar">
	<c:choose>
		<c:when test="${not empty searchVO.testId}">
				<c:url var="uptUrl" value="/test/update.do">
					<c:param name="testId" value="${result.testId}"/>
				</c:url>
				<a href="${uptUrl}" id="btn-reg" class="btn">수정</a>
				
				<c:url var="delUrl" value="/test/delete.do">
					<c:param name="testId" value="${result.testId}"/>
				</c:url>
				<a href="${delUrl}" id="btn-del" class="btn"><i class="ico-del"></i>삭제</a>
			</c:when>
			
				<c:otherwise>
					<a href="#none" id="btn-reg" class="btn spot">등록</a> 
				</c:otherwise>
	 </c:choose>
			<c:url var="listUrl" value="/test/selectList.do${_BASE_PARAM}"/>
			<a href="${listUrl}" class="btn">취소</a>
		</div>
		</form>
		</div>
		</div>
		<script>
$(document).ready(function(){
	//게시글등록
	$("#btn-reg").click(function(){
		$("#frm").submit();
		return false;
	});
	//게시글삭제
	$("#btn-del").click(function(){
		if(!confirm("삭제하시겠습니까?")){
			return false;
		}
	});
});

function regist(){
	if(!$("#sj").val()){
 		alert("제목을 입력해주세요.");
		$("#sj").focus();
		return false;
	}

}
</script>
</body>
</html>