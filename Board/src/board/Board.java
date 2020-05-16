package board;

public class Board {
	private int num; //갯수  
	private String writer; //작성자 
	private String email; // 이메일
	private String subject; //제목
	private String content; //콘텐츠
	private String password; //비밀번호
	private String regDate;  //데이트
	private int readcount;  //읽은횟수
	private int ref; 
	private int reStep;
	private int reLevel;
	
	public Board() {};
	
	public Board(int num, String writer, String email, String subject, String content, String password, String regDate, int readcount, int ref, int reStep, int reLevel ) {
		this.num = num;
		this.writer = writer;
		this.email = email;
		this.subject = subject;
		this.content = content;
		this.password = password;
		this.regDate = regDate;
		this.ref = ref;
		this.reStep =reStep;
		this.reLevel = reLevel;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getReStep() {
		return reStep;
	}

	public void setReStep(int reStep) {
		this.reStep = reStep;
	}

	public int getReLevel() {
		return reLevel;
	}

	public void setReLevel(int reLevel) {
		this.reLevel = reLevel;
	}
	
	@Override
	public String toString() {
		return num+"\t"+subject+"\t\t"+readcount+"\t"+ref+"\t"+reLevel;
	}
}
