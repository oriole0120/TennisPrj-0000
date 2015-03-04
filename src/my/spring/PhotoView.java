package my.spring;

import java.util.List;

import com.htmtennis.prj.dao.PhotoDao;
/*import com.htmtennis.prj.dao.jdbc.JdbcPhotoDao;*/
import com.htmtennis.prj.model.Photo;

public class PhotoView {
	private PhotoDao photoDao;
	
	public void setPhotoDao(PhotoDao photoDao) {
		this.photoDao = photoDao;
	}
	public PhotoView() {
		//photoDao = new JdbcPhotoDao();
	}
	public void print() {
		List<Photo> list = photoDao.getPhotos(1, "", "TITLE");
		for(Photo ph : list)
			System.out.printf("title : %s\n", ph.getTitle());
	}
}
