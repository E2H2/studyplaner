package timer;
//자바 빈즈 (타이머 기록용)
public class Timer {

	private String userID;
	private String time; //데이터 베이스에선 날짜지만 여기선 문자열
	private String timerdate;
	
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTimerdate() {
		return timerdate;
	}
	public void setTimerdate(String timerdate) {
		this.timerdate = timerdate;
	}
	
	
	
	
	
}
