<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>  

<article>
<h2> 1:1 문의 </h2>

<form name="formm" method="post"	action="ticket.do">
	<input type="hidden" name="command" value="qnaWrite">

		<table id="write">
			<tr>
				<th>문의종류</th>
				<td colspan="5">
					<select name="kind">
						<c:forEach items="${kindList}" var="kind" varStatus="status">
							<c:choose>
								<c:when test="${productVO.kind==status.count}">
									<option value="${status.count }" selected="selected">${kind}</option>
								</c:when>
							<c:otherwise><option value="${status.count}">${kind}</option></c:otherwise>
							</c:choose>
						</c:forEach>
						</select>
					</td>
					</tr>
					<tr><th>제목</th>
					<td>
						<input type="text" name="name" >
					</td>
				</tr>
				<tr><th>문의내용</th><td colspan="5">
					<textarea name="content" ></textarea></td></tr>
		</table>
		<input class="btn" type="button" value="작성" onClick="q_write()">
		<input class="btn" type="button" value="취소" 
			onClick="location.href='ticket.do?command=qna'">
		
</form>
</article>



   
