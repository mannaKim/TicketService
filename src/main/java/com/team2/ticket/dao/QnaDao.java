package com.team2.ticket.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.team2.ticket.dto.QnaVO;
import com.team2.ticket.util.Dbman;


public class QnaDao {
	
	private QnaDao() { }
	private static QnaDao ist = new QnaDao();
	public static QnaDao getInstance() { 	return ist;	}
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	public void insertQna(QnaVO qvo) {
		
		String sql = "insert into qna (qseq, subject, content, id) "
				+ " values(qna_seq.nextval , ? , ? , ? )";
		con = Dbman.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, qvo.getSubject());
		    pstmt.setString(2, qvo.getContent());
		    pstmt.setString(3, qvo.getId());
		    pstmt.executeUpdate();  
		} catch (SQLException e) {e.printStackTrace();
		} finally {  Dbman.close(con, pstmt, rs);  }
		
	}
}
