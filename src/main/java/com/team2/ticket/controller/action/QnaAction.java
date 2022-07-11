package com.team2.ticket.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team2.ticket.dao.QnaDao;
import com.team2.ticket.dto.MemberVO;
import com.team2.ticket.dto.QnaVO;
import com.team2.ticket.util.Paging;

public class QnaAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "qna/qnaList.jsp";
		// 로그인 체크
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
		if(mvo == null) {
			url = "shop.do?command=loginForm";
		} else {
			// 로그인한 아이디로 qna 목록을 조회하고 리턴받습니다 (메서드 이름 listQna)
			QnaDao qdao = QnaDao.getInstance();

			Paging paging = new Paging();
			
			int page=1;
			if(request.getParameter("page")!=null)
				page = Integer.parseInt(request.getParameter("page"));
			
			paging.setPage(page);
			
			int count = qdao.getAllCount(mvo.getId());
			paging.setTotalCount(count);
			
			ArrayList<QnaVO> list = qdao.listQna(mvo.getId(), paging);
			request.setAttribute("qnalist", list);
			request.setAttribute("paging", paging);
		}
		
		// 리턴 받은 리스트를 리퀘스트에 담습니다
		request.getRequestDispatcher(url).forward(request, response);
		// 목적지로 이동합니다.
		
		
	}

}
