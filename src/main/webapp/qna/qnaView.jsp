<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>  

<article>
<h2> 1:1 문의 </h2>
<form>
<table>
	<tr><th>제목</th><td width="500">${qnaVO.subject}</td></tr>
	<tr><th>등록일</th><td align="left" >
		<fmt:formatDate value="${qnaVO.indate}" type="date"/></td></tr>
	<tr><th>질문내용</th><td align="left" style="text-align:left;font-size:115%;">
		<pre>${qnaVO.content}</pre></td></tr>
	<tr><th>답변 내용</th><td align="left" style="text-align:left;color:white;">${qnaVO.reply}</tr>
</table><div class="clear"></div>
<div id="buttons" style="float:right">
<input type="button"  value="목록" class="submit" onclick="location.href='ticket.do?command=qna'">

</div>
</form>
</article>
