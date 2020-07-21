package bbs.action.cot;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 public class ActionController
 	extends javax.servlet.http.HttpServlet //서블릿을 상속 받음
 	implements javax.servlet.Servlet {
	 protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
	 	throws ServletException, IOException {
		 
		 //url 검색 및 원하는 정보 추출 구역
		 String RequestURI=request.getRequestURI(); //얘낸 자동으로 자르기가 안되서 http://localhost:8080/Model2-Board/BoardList.bo가 들어오면
		 String contextPath=request.getContextPath();// 얘는 http://localhost:8080/Model2-Board여기 까지 받아옴
		 String command=RequestURI.substring(contextPath.length()); //http://localhost:8080/Model2-Board/BoardList.bo 에서 http://localhost:8080/Model2-Board이만큼 뺴서 BoardList.bo만 남음
		 //command 값은 BoardList.bo 가 됨
		 
		 ActionForward forward=null; //얘는 클래스 전송방식(포워드,샌드리다이렉트)을 정함
		 Action action=null; 		//얘는 인터페이스
		   
		 
		 //db안가는 부분을 모아두자
		   if(command.equals("/gomain.bo")){  //db에 안감				 //메인
			   forward=new ActionForward(); //
			   forward.setRedirect(false);  //포워드 방식
			   forward.setPath("./board/main.jsp"); // 실제 가는 주소
		   }
		   else if (command.equals("/gobbs.bo")) {					//게시판
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/bbs.jsp");			   
		   }
		   else if (command.equals("/gologin.bo")) {				//로그인화면
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/login.jsp");			   
		   }
		   else if (command.equals("/gojoin.bo")) {					//회원가입화면
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/join.jsp");			   
		   }
		   else if (command.equals("/gowrite.bo")) {				//글쓰기 화면
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/write.jsp");			   
		   }
		   else if (command.equals("/goview.bo")) {					//글내용 화면
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/view.jsp");			   
		   }
		   else if (command.equals("/goupdate.bo")) {					//글내용 화면
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/update.jsp");			   
		   }
		   else if (command.equals("/golunch.bo")) {					//식단표 화면
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/lunch.jsp");			   
		   }
		   else if (command.equals("/goweather.bo")) {					//날씨 화면
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/weather.jsp");			   
		   }
		   else if (command.equals("/gochat.bo")) {					//채팅 화면
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/chat.jsp");			   
		   }
		   
		   
		   
		   //액션 모음
		   else if (command.equals("/gologinAction.bo")) { 				//로그인
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/loginAction.jsp");
			   
		   }
		   else if (command.contentEquals("/gologoutAction.bo")) {		//로그아웃
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/logoutAction.jsp");
		   }
		   else if (command.contentEquals("/gojoinAction.bo")) {			//조인
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/joinAction.jsp");
		   }
		   else if (command.contentEquals("/goupdateAction.bo")) {		//업데이트
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/updateAction.jsp");
		   }
		   else if (command.contentEquals("/godeleteAction.bo")) { 		//딜리트
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/deleteAction.jsp");
		   }
		   else if (command.contentEquals("/gowriteAction.bo")) {   //글쓰기
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/writeAction.jsp");
		   }
		   else if (command.equals("/gotimerAction.bo")) {			//타이머 저장
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/timerAction.jsp");			   
		   }
		   else if (command.equals("/golistAction.bo")) {			//타이머 저장
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./board/listAction.jsp");			   
		   }
		   
		   

		   
		   
		   
		   
		   
		   //실제 view페이지 이동 코드
		   if(forward.isRedirect()){
			   response.sendRedirect(forward.getPath()); //샌드 리다이렉트 방식
		   }else{
			   RequestDispatcher dispatcher=
				   request.getRequestDispatcher(forward.getPath()); //포워드 방식
			   dispatcher.forward(request, response);
		   }
	 }
	 @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) //겟방식 접근시 쓰겠다
		throws ServletException, IOException {
		doProcess(request,response);//13줄로 감
	}  	
	 @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) //포스트 방식으로 접근시 쓰겠다
		throws ServletException, IOException {
		doProcess(request,response);
	}   	  	    
}