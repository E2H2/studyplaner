package bbs.action.cot;

public class ActionForward {  // ���۹���� �����ϴ� Ŭ����  ������ ���, ���
	private boolean isRedirect=false;	//������ ���
	private String path=null;			//���
	
	public boolean isRedirect(){
		return isRedirect;
	}
	
	public String getPath(){
		return path;
	}
	
	public void setRedirect(boolean b){
		isRedirect=b;
	}
	
	public void setPath(String string){  //String�� �޾Ƽ� �н��� �ٲ�
		path=string;
	}
}