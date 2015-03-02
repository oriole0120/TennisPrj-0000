package com.htmtennis.prj.dao;

import java.util.List;

import com.htmtennis.prj.model.Photo;

public interface PhotoDao {

	public Photo getPhoto(String code);
	public Photo prevPhoto(String curCode);
	public Photo nextPhoto(String curCode);
	
	public List<Photo> getPhotos(int page, String query, String field);
	/*public List<Photo> getPhotos(int page, String query);
	public List<Photo> getPhotos(int page);*/

//	public int insert(Photo photo);
	public int update(Photo photo);
	public int delete(String code);
	
	public int getSize(String query, String field);
//	public int getSize(String query);
	public String lastCode();

}
