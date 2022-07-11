package com.team2.ticket.controller;

import com.team2.ticket.controller.action.Action;
import com.team2.ticket.controller.action.IndexAction;
import com.team2.ticket.controller.action.QnaAction;
import com.team2.ticket.controller.action.QnaWriteAction;
import com.team2.ticket.controller.action.QnaWriteFormAction;
import com.team2.ticket.controller.action.member.IdCheckFormAction;
import com.team2.ticket.controller.action.member.JoinFormAction;
import com.team2.ticket.controller.action.member.LoginAction;
import com.team2.ticket.controller.action.member.LoginFormAction;
import com.team2.ticket.controller.action.member.LogoutAction;
import com.team2.ticket.controller.action.member.QnaViewAction;
import com.team2.ticket.controller.action.member.ShowTermAction;
import com.team2.ticket.controller.action.member.TermsAndConditionsAction;
import com.team2.ticket.controller.action.review.ReviewAction;
import com.team2.ticket.controller.action.review.ReviewViewAction;
import com.team2.ticket.controller.action.review.ReviewWriteAction;
import com.team2.ticket.controller.action.review.ReviewWriteFormAction;

public class ActionFactory {
	
	//Singleton Pattern
	private ActionFactory() {}
	private static ActionFactory itc = new ActionFactory();
	public static ActionFactory getInstance() {return itc;}
	
	//command 값에 따라 Action 객체 변화
	public Action getAction(String command) {
		Action ac = null;
		
		if(command.equals("index")) ac = new IndexAction();
		else if(command.equals("loginForm")) ac = new LoginFormAction();
		else if(command.equals("login")) ac = new LoginAction();
		else if(command.equals("logout")) ac = new LogoutAction();
		else if(command.equals("termsAndConditions")) ac = new TermsAndConditionsAction();
		else if(command.equals("showTerm")) ac = new ShowTermAction();
		else if(command.equals("joinForm")) ac = new JoinFormAction();
		else if(command.equals("idCheckForm")) ac = new IdCheckFormAction();
		
		else if(command.equals("qna")) ac = new QnaAction();
		else if(command.equals("qnaWriteForm")) ac = new QnaWriteFormAction();
		else if(command.equals("qnaWrite")) ac = new QnaWriteAction();
		else if(command.equals("qnaView")) ac = new QnaViewAction();
		
		else if(command.equals("reviewWriteForm")) ac = new ReviewWriteFormAction();
		else if(command.equals("reviewWrite")) ac = new ReviewWriteAction();
		else if(command.equals("review")) ac = new ReviewAction();
		else if(command.equals("reviewView")) ac = new ReviewViewAction();
		
		return ac;
	}
}
