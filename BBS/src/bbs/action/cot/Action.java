package bbs.action.cot;

import javax.servlet.http.*;

public interface Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
}
//�߻� �޼���� �ƹ��͵� ������ ActionForward execute��� �Լ��� �������̵��ؼ� ���� ������ �̸� ����� �а�