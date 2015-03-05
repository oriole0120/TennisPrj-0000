package my.spring;

import java.util.List;




import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;


public class ExamManager {
	
	private List<Exam> exams;
	
	@Autowired
	@Resource(name="exams")
	public void setExams(List<Exam> exams) {
		this.exams = exams;
	}

	public ExamManager() {
		
	}
	
	public ExamManager(List<Exam> exams) {
		this.exams = exams;
	}
	
	public void print() {
		for(Exam e : exams)
			System.out.printf("total : %d  %d  %d\n", e.getKor(), e.getEng(), e.getMath());
	}
}
