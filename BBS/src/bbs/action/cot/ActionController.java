package bbs.action.cot;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 public class ActionController
 	extends javax.servlet.http.HttpServlet //������ ��� ����
 	implements javax.servlet.Servlet {
	 protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
	 	throws ServletException, IOException {
		 
		 //url �˻� �� ���ϴ� ���� ���� ����
		 String RequestURI=request.getRequestURI(); //�곽 �ڵ����� �ڸ��Ⱑ �ȵǼ� http://localhost:8080/Model2-Board/BoardList.bo�� ������
		 String contextPath=request.getContextPath();// ��� http://localhost:8080/Model2-Board���� ���� �޾ƿ�
		 String command=RequestURI.substring(contextPath.length()); //http://localhost:8080/Model2-Board/BoardList.bo ���� http://localhost:8080/Model2-Board�̸�ŭ ���� BoardList.bo�� ����
		 //command ���� BoardList.bo �� ��
		 
		 ActionForward forward=null; //��� Ŭ���� ���۹��(������,���帮���̷�Ʈ)�� ����
		 Action action=null; 		//��� �������̽�
		   
		 
		 //db�Ȱ��� �κ��� ��Ƶ���
		   if(command.equals("/gomain.bo")){  //db�� �Ȱ�				 //����
			   forward=new ActionForward(); //
			   forward.setRedirect(false);  //������ ���
			   forward.setPath("./board/main.jsp"); // ���� ���� �ּ�
		   }
		   else if (command.equals("/gobbs.bo")) {					//�Խ���
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/bbs.jsp");			   
		   }
		   else if (command.equals("/gologin.bo")) {				//�α���ȭ��
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/login.jsp");			   
		   }
		   else if (command.equals("/gojoin.bo")) {					//ȸ������ȭ��
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/join.jsp");			   
		   }
		   else if (command.equals("/gowrite.bo")) {				//�۾��� ȭ��
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/write.jsp");			   
		   }
		   else if (command.equals("/goview.bo")) {					//�۳��� ȭ��
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/view.jsp");			   
		   }
		   else if (command.equals("/goupdate.bo")) {					//�۳��� ȭ��
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/update.jsp");			   
		   }
		   else if (command.equals("/golunch.bo")) {					//�Ĵ�ǥ ȭ��
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/lunch.jsp");			   
		   }
		   else if (command.equals("/goweather.bo")) {					//���� ȭ��
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/weather.jsp");			   
		   }
		   else if (command.equals("/gochat.bo")) {					//ä�� ȭ��
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/chat.jsp");			   
		   }
		   
		   
		   
		   //�׼� ����
		   else if (command.equals("/gologinAction.bo")) { 				//�α���
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/loginAction.jsp");
			   
		   }
		   else if (command.contentEquals("/gologoutAction.bo")) {		//�α׾ƿ�
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/logoutAction.jsp");
		   }
		   else if (command.contentEquals("/gojoinAction.bo")) {			//����
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/joinAction.jsp");
		   }
		   else if (command.contentEquals("/goupdateAction.bo")) {		//������Ʈ
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/updateAction.jsp");
		   }
		   else if (command.contentEquals("/godeleteAction.bo")) { 		//����Ʈ
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/deleteAction.jsp");
		   }
		   else if (command.contentEquals("/gowriteAction.bo")) {   //�۾���
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/writeAction.jsp");
		   }
		   else if (command.equals("/gotimerAction.bo")) {			//Ÿ�̸� ����
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/timerAction.jsp");			   
		   }
		   else if (command.equals("/golistAction.bo")) {			//Ÿ�̸� ����
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/listAction.jsp");			   
		   }
		   
		   

		   
		   
		   
		   
		   
		   //���� view������ �̵� �ڵ�
		   if(forward.isRedirect()){
			   response.sendRedirect(forward.getPath()); //���� �����̷�Ʈ ���
		   }else{
			   RequestDispatcher dispatcher=
				   request.getRequestDispatcher(forward.getPath()); //������ ���
			   dispatcher.forward(request, response);
		   }
	 }
	 @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) //�ٹ�� ���ٽ� ���ڴ�
		throws ServletException, IOException {
		doProcess(request,response);//13�ٷ� ��
	}  	
	 @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) //����Ʈ ������� ���ٽ� ���ڴ�
		throws ServletException, IOException {
		doProcess(request,response);
	}   	  	    
}