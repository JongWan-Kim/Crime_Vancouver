package com.semifinal.vancouvercrime.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface ACommand {
	
	void exeute(SqlSession sqlSession, Model model);

}
