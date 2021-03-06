package my.spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.htmtennis.prj.dao.mybatis.MyBatisMain;

/*import com.htmtennis.prj.dao.PhotoDao;
import com.htmtennis.prj.dao.jdbc.JdbcPhotoDao;*/

public class Program {

	public static void main(String[] args) {
		/*PhotoDao photoDao = new JdbcPhotoDao();
		PhotoView view = new PhotoView();
		view.setPhotoDao(photoDao);*/
		
		//MyBatisMain.start();
		
		ApplicationContext context = 
				new ClassPathXmlApplicationContext("my/spring/spring-context.xml");
		
/*		PhotoView view = (PhotoView) context.getBean("view");
		view.print();
*/		
		Exam exam = (Exam) context.getBean("exam");
		ExamManager mng = (ExamManager) context.getBean("mng");
		
		/*System.out.println("kor - " + exam.getKor());
		System.out.println("eng - " + exam.getEng());
		System.out.println("math - " + exam.getMath());
		System.out.println("total : " + exam.total());*/
		
		mng.print();
		
	}
}
