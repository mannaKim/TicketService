package com.team2.ticket.controller;

import com.team2.ticket.controller.action.Action;
import com.team2.ticket.controller.action.IndexAction;

public class ActionFactory {
	
	//Singleton Pattern
	private ActionFactory() {}
	private static ActionFactory itc = new ActionFactory();
	public static ActionFactory getInstance() {return itc;}
	
	//command 값에 따라 Action 객체 변화
	public Action getAction(String command) {
		Action ac = null;
		
		if(command.equals("index")) ac = new IndexAction();
		
		return ac;
	}
}
