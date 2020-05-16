package board;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

public class BoardDAO {
	//싱글턴패턴으로 instance 생성
	private static BoardDAO instance = new BoardDAO();
	private BoardDAO(){}
	public static BoardDAO getInstance() {return instance;}
	
	public String filePath ="";
	String fileName = "board.txt";
	
	ArrayList<Board> boardList = new ArrayList<Board>();
	Random ran = new Random();
	
	public void loadData() {
		File file = new File(filePath+fileName);
		FileReader fr = null;
		BufferedReader br = null;
		
		try {
			if(file.exists()) {
				fr = new FileReader(file);
				br = new BufferedReader(fr);
				
				while(true) {
					String line = br.readLine();
					if(line==null)break;
					
					String[] info = line.split("/");
					Board board = new Board(Integer.parseInt(info[0]),info[1], info[2], info[3], info[4], info[5], info[6],Integer.parseInt(info[7]),Integer.parseInt(info[8]),Integer.parseInt(info[9]),Integer.parseInt(info[10]));
					boardList.add(board);
				}
				System.out.println("파일로드 완료!");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(fr!=null) {try{fr.close();}catch(IOException e) {}};
			if(br!=null) {try{br.close();}catch(IOException e) {}};			
		}
	}
	public void saveData() {
		sortBoard();
		String data="";
		for(int i=0;i<boardList.size();i++) {
			Board board = boardList.get(i);
			data += board.getNum();
			data += "/";
			data += board.getWriter();
			data += "/";
			data += board.getEmail();
			data += "/";
			data += board.getSubject();
			data += "/";
			data += board.getContent();
			data += "/";
			data += board.getPassword();
			data += "/";
			data += board.getRegDate();
			data += "/";
			data += board.getReadcount();
			data += "/";
			data += board.getRef();
			data += "/";
			data += board.getReStep();
			data += "/";
			data += board.getReLevel();
			if(i!=boardList.size()-1) {
				data += "\n";
			}
		}
		FileWriter fw = null;
		try {
			fw = new FileWriter(filePath+fileName);
			fw.write(data);
			System.out.println("파일 저장 완료!");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(fw!=null) {try{fw.close();}catch(IOException e) {}}
		}
		
		System.out.println("번호\t제목\t조회수\tref\treStep\treLevel");
		for(int i=0;i<boardList.size();i++) {
			System.out.println("----------------------------------------------------");
			System.out.println(boardList.get(i).toString());
	}
	public void insertBoard(Board board) {
		int maxNum=0;
		for(int i=0;i<boardList.size();i++) {
			if(boardList.get(i).getNum()>maxNum) {
				maxNum=boardList.get(i).getNum();
			}
		}
		
		int maxRef=0;
		for(int i=0;i<boardList.size();i++) {
			if(boardList.get(i).getRef()>maxRef) {
				maxRef=boardList.get(i).getRef();
			}
		}
		
		board.setNum(maxNum+1);
		board.setRef(maxRef+1);
		board.setReStep(1);
		board.setReLevel(1);
		board.setReadcount(0);
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		board.setRegDate(sdf.format(date));
		
		boardList.add(board);
		
		saveData();
	}
	public void insertDummy() {
		Board board = new Board();
		String[] a  
		String[] b
		String[] c
		
		String temp ="";
		
		int r =0;
		for(int i=0;i<3;i++) {
			r = ran.nextInt(a.length);
			temp += a[r];
			r = ran.nextInt(b.length);
			temp += b[r];
			r = ran.nextInt(c.length);
			temp += c[r];
		}
		board.setWriter(temp);
		
		temp="";
		r=ran.nextInt(a.length);
		temp += a[r];
		temp += "@";
		r=ran.nextInt(b.length);
		temp += b[r];
		board.setEmail(temp);
		
		temp="";		
		for(int i=0;i<2;i++) {
			r=ran.nextInt(a.length);
			temp += a[r];
			r=ran.nextInt(b.length);
			temp += b[r];
		}
		board.setSubject(temp);
		
		temp="";		
		for(int i=0;i<4;i++) {
			r=ran.nextInt(a.length);
			temp += a[r];
			r=ran.nextInt(b.length);
			temp += b[r];
		}
		board.setContent(temp);
		board.setPassword("1234");
		insertBoard(board);
		
		saveData();
		

	}
	public int getAllCount() {
		return boardList.size();
	}
	public void sortBoard() {
		
		//ref의 정렬
		for(int i=0;i<boardList.size();i++) {
			Board temp = boardList.get(i);
			for(int j=i;j<boardList.size();j++) {
				if(temp.getRef()<boardList.get(j).getRef()) {
					temp = boardList.get(i);
					
					Board info = boardList.get(i);
					boardList.set(i, boardList.get(j));
					boardList.set(j, info);
				}
			}
		}
		
		for(int i=0;i<boardList.size();i++) {
			Board temp = boardList.get(i);
			for(int j=i;j<boardList.size();j++) {
				if(temp.getRef()==boardList.get(j).getRef()) {
					if(temp.getReLevel()>boardList.get(j).getReLevel()) {
						temp=boardList.get(i);
						
						Board info = boardList.get(i);
						boardList.set(i, boardList.get(j));
						boardList.set(j, info);
						
					}
				}
			}
		}
		System.out.println("번호\t제목\t\t\t조회수\tref\treStep\treLevel");
		for(int i=0;i<boardList.size();i++) {
			System.out.println("----------------------------------------");
			System.out.println(boardList.get(i).toString());
		}
	}
	public int checkNum(int num) {
		int index=-1;
		for(int i=0;i<boardList.size();i++) {
			if(num==boardList.get(i).getNum()) {
				index=i;
			}
		}
		return index;
	}
	
	public ArrayList<Board> getAllBaord(int startRow, int endRow){
		ArrayList<Board> temp = new ArrayList<Board>();
		for(int i=startRow;i<endRow;i++) {
			temp.add(boardList.get(i));
		}
		return temp;
	}
	public Board getOneBoard() {
		
	}
	public Board getOneUpdateBoard() {
		
	}
	public boolean checkPassword(int password) {
		
		return 		
	}
	public void updateBoard() {
	
	}
	public void deleteBaord() {
		
	}
	public void reWriteBorad() {
		
	}
}

// 파일,마이리스드, 랜덤
//.. 메소드
// .로드 .저장 .삽입 .더미데이타 .전체개수 .정렬 .숫자체크 .보드가져오기 .비밀번호체크 .업데이트 .삭제 .수정 
