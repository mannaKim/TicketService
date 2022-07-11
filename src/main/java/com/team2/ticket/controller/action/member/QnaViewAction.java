package com.team2.ticket.controller.action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team2.ticket.controller.action.Action;
import com.team2.ticket.dao.QnaDao;
import com.team2.ticket.dto.MemberVO;
import com.team2.ticket.dto.QnaVO;


public class QnaViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "qna/qnaView.jsp";
		int qseq = Integer.parseInt( request.getParameter("qseq") );
		
		// QnaDao 에 추가될 메서드 이름 getQna
		HttpSession session = request.getSession();
	    MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
	    if (mvo == null) {
	        url = "ticket.do?command=loginForm";
	    } else {	
	    	QnaDao qdao = QnaDao.getInstance();
	    	QnaVO qvo = qdao.getQna( qseq );
	    	
			String [] kindList = { "0", "전시", "회원안내", "관람/예약", "굿즈", "기타"};
			int index = Integer.parseInt( qvo.getKind() ); 

			request.setAttribute("kind", kindList[index]);
	    	
	    	request.setAttribute("qnaVO", qvo);
	    }
		request.getRequestDispatcher(url).forward(request, response);

	}

}
