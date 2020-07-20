package bbs.action.cot;

public class ActionForward {  // 전송방식을 결정하는 클래스  보내는 방식, 경로
	private boolean isRedirect=false;	//보내는 방식
	private String path=null;			//경로
	
	public boolean isRedirect(){
		return isRedirect;
	}
	
	public String getPath(){
		return path;
	}
	
	public void setRedirect(boolean b){
		isRedirect=b;
	}
	
	public void setPath(String string){  //String을 받아서 패스로 바꿈
		path=string;
	}
}