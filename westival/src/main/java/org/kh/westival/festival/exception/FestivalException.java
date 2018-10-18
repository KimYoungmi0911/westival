package org.kh.westival.festival.exception;

public class FestivalException extends RuntimeException {
	private static final long serialVersionUID = 19L;
	
	public FestivalException(){}
	
	public FestivalException(String message){
		super("회원 서비스 에러 : " + message);
	}

}
