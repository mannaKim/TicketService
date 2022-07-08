<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

	<script src="member/member.js"></script>
<article>
<h2> 1:1 문의 </h2>
<form method="post">
<table id="">
	<tr>	<th>번호</th><th>제목</th><th>등록일</th><th>답변 여부</th></tr>
	<c:forEach items="${qnaList}"  var="qnaVO">
		<tr ><td> ${qnaVO.qseq}</td>    
    		<td><a href="shop.do?command=qnaView&qseq=${qnaVO.qseq}">${qnaVO.kind} &nbsp; ${qnaVO.subject}</a></td>      
       		<td><fmt:formatDate value="${qnaVO.indate}" type="date"/></td>
       		<td><c:choose>
				<c:when test="${qnaVO.rep==1}"> no </c:when>
				<c:when test="${qnaVO.rep==2}"> yes </c:when>
			</c:choose></td>    
   		</tr>
  	</c:forEach>
</table>
<div class="clear"></div>

<div id="paging" >
	<c:url var="action" value="shop.do?command=qnaList" />
	<c:if test="${paging.prev}">
		<a href="${action}&page=${paging.beginPage-1}">◀</a>&nbsp;
	</c:if>
	<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
		<c:choose>
			<c:when test="${paging.page==index}">
				<span style="color:red">${index}&nbsp;</span>
			</c:when>
			<c:otherwise>
				<a href="${action}&page=${index}">${index}</a>&nbsp;
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.next}">
		<a href="${action}&page=${paging.endPage+1}">▶</a>&nbsp;
	</c:if>
</div>
<div  class="clear"></div><br>

<div id="buttons">
	<input type="button"  value="1:1 문의하기"  class="submit" onClick="go_form();"> 
</div>
<div  class="clear"></div><br>
</form>


</article>

