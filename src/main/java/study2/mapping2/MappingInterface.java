package study2.mapping2;

import java.io.IOException;
import java.rmi.ServerException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MappingInterface {
	//request response 넣기																											던지다			
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
