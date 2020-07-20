package bbs.action.cot;

import javax.servlet.http.*;

public interface Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
}
//추상 메서드라서 아무것도 없지만 ActionForward execute라는 함수를 오버라이드해서 쓰기 때문에 미리 만들어 둔것