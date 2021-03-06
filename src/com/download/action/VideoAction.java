package com.download.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.*;

import javax.annotation.Resource;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.download.dao.VideoDao;
import com.download.dao.VideoTypeDao;
import com.download.model.Video;
import com.download.model.Videotype;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller @Scope("prototype")
public class VideoAction extends ActionSupport{
	@Resource VideoDao videoDao;
	@Resource VideoTypeDao videoTypeDao;
	private Video video;
	private static final long serialVersionUID = 1L;
	public File videoPhoto;
	 public String videoPhotoFileName;
	 public String videoPhotoContentType;
	 
//    public File videoFile;
//	public String videoFileName;
//	public String videoFileContentType;
//	
	public Video getVideo() {
		return video;
	}
	public void setVideo(Video video) {
		this.video = video;
	}
	private List<Video> videoList;
	
	public List<Video> getVideoList() {
		return videoList;
	}
	public void setVideoList(List<Video> videoList) {
		this.videoList = videoList;
	}

	 public void setVideoFile(File videoPhoto) {
			this.videoPhoto = videoPhoto;
		}
		public String getVideoFileFileName() {
			return videoPhotoFileName;
		}
		public void setVideoFileFileName(String videoPhotoFileName) {
			this.videoPhotoFileName = videoPhotoFileName;
		}
		public String getVideoFileContentType() {
			return videoPhotoContentType;
		}
		public void setVideoFileContentType(String videoPhotoContentType) {
			this.videoPhotoContentType = videoPhotoContentType;
		}
	public String addVideo() throws Exception{
		 ActionContext ctx = ActionContext.getContext();
		String path=ServletActionContext.getServletContext().getRealPath("/upload");
		String videoPhotoFileName="";
		if(videoPhoto!=null){
			InputStream is=new FileInputStream(videoPhoto);
			String fileContentType=this.getVideoFileContentType();
			System.out.println(fileContentType);
			if(fileContentType.equals("image/jpeg")||fileContentType.equals("image/pjepg"))
				 videoPhotoFileName=UUID.randomUUID().toString()+".jpg";
			else if(fileContentType.equals("image/gif"))
				videoPhotoFileName=UUID.randomUUID().toString()+".gif";
			else if(fileContentType.equals("image/png"))
				videoPhotoFileName=UUID.randomUUID().toString()+".png";
			
			File file=new File(path,videoPhotoFileName);
			OutputStream os=new FileOutputStream(file);
			byte[] b=new byte[1024];
			int bs=0;
			while((bs=is.read(b))>0){
				os.write(b, 0, bs);
			}
			is.close();
			os.close();
		}
		if(videoPhoto!=null)
			video.setPath("upload/"+videoPhotoFileName);
		
		else
			video.setPath("upload/NoImage.jpg");
		
		
//		String video_path=ServletActionContext.getServletContext().getRealPath("/videos");
//		String videoFileName="";
//		if(videoFile!=null){
//			InputStream is=new FileInputStream(videoFile);
//			String videofileContentType=this.getVideoFileContentType();
//			System.out.println(videofileContentType);
//			if(videofileContentType.equals("video/flv"))
//   				videoFileName = UUID.randomUUID().toString() +  ".jpg";
//   			else if(videofileContentType.equals("video/rmvb"))
//   				videoFileName = UUID.randomUUID().toString() +  ".rmvb";
//   			else if(videofileContentType.equals("video/mkv"))
//   				videoFileName = UUID.randomUUID().toString() +  ".mkv";
//   			else if(videofileContentType.equals("video/mp4"))
//   				videoFileName = UUID.randomUUID().toString() +  ".mp4";
//			File video_file=new File(video_path,videoFileName);
//			OutputStream os=new FileOutputStream(video_file);
//			byte[] b=new byte[1024];
//			int bs=0;
//			while((bs=is.read(b))>0){
//				os.write(b, 0, bs);
//			}
//			is.close();
//			os.close();
//		}
//		if(videoFile!=null)
//			video.setPath("upload/"+videoFileName);
//		 
		videoDao.addVideo(video);
		return "message";
		}
	
	public String showVideo(){
		videoList=videoDao.QueryAllVideoInfo();
		return "show_view";
	}
	public String showDetail(){
		video = videoDao.GetVideoById(video.getVideoId());
		return "detail_view";
	}
	
	public String showEdit() throws Exception{
		video = videoDao.GetVideoById(video.getVideoId());
		return "edit_view";
	}
	
	public String editVideo() throws Exception{
		String path = ServletActionContext.getServletContext().getRealPath("/upload"); 
        /*处理图片上传*/
      String videoPhotoFileName = ""; 
   	 	if(videoPhoto!= null) {
   	 		InputStream is = new FileInputStream(videoPhoto);
   			String fileContentType = this.getVideoFileContentType();
   			System.out.println(fileContentType);
   			if(fileContentType.equals("image/jpeg")  || fileContentType.equals("image/pjpeg"))
   				videoPhotoFileName = UUID.randomUUID().toString() +  ".jpg";
   			else if(fileContentType.equals("image/gif"))
   				videoPhotoFileName = UUID.randomUUID().toString() +  ".gif";
   			else if(fileContentType.equals("image/png"))
   				videoPhotoFileName = UUID.randomUUID().toString() +  ".png";

   			File file = new File(path, videoPhotoFileName);
   			OutputStream os = new FileOutputStream(file);
   			byte[] b = new byte[1024];
   			int bs = 0;
   			while ((bs = is.read(b)) > 0) {
   				os.write(b, 0, bs);
   			}
   			is.close();
   			os.close();
   	 	}
        if(videoPhoto != null)
        	video.setPath("upload/" + videoPhotoFileName);
        else
        	video.setPath("upload/NoImage.jpg");
		videoDao.updateVideo(video);
		return "edit_message";
	}
	
	
	//删除video
	public String deleteVideo() throws Exception{
		videoDao.deleteVideo(video.getVideoId());
		return "delete_message";
	}
	
//	@SuppressWarnings("deprecation")
//   public String addVideo1() throws Exception{
//		String path = ServletActionContext.getServletContext().getRealPath("/upload"); 
//        /*处理图片上传*/
//        String foodPhotoFileName = ""; 
//   	 	if(videoPhoto!= null) {
//   	 		InputStream is = new FileInputStream(videoPhoto);
//   			String fileContentType = this.getVideoFileContentType();
//   			System.out.println(fileContentType);
//   			if(fileContentType.equals("image/jpeg")  || fileContentType.equals("image/pjpeg"))
//   				foodPhotoFileName = UUID.randomUUID().toString() +  ".jpg";
//   			else if(fileContentType.equals("image/gif"))
//   				foodPhotoFileName = UUID.randomUUID().toString() +  ".gif";
//   			else if(fileContentType.equals("image/png"))
//   				foodPhotoFileName = UUID.randomUUID().toString() +  ".png";
//
//   			File file = new File(path, foodPhotoFileName);
//   			OutputStream os = new FileOutputStream(file);
//   			byte[] b = new byte[1024];
//   			int bs = 0;
//   			while ((bs = is.read(b)) > 0) {
//   				os.write(b, 0, bs);
//   			}
//   			is.close();
//   			os.close();
//   	 	}
//        if(videoPhoto != null)
//        	video.setPath("upload/" + videoPhotoFileName);
//        else
//        	video.setPath("upload/NoImage.jpg");
//        
//        videoDao.addVideo(video);
//		return "message";
//		
//	}
	
	private String keyWords;
	public String getKeyWords() {
		return keyWords;
	}
	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}
	//查询video
	public String queryVideo() throws Exception{
		videoList = videoDao.QueryVideoInfo(keyWords);
		return "show_view";
	}
	public Videotype videoType;


	public Videotype getVideoType() {
		return videoType;
	}
	public void setVideoType(Videotype videoType) {
		this.videoType = videoType;
	}
//	public String getVideoFileName() {
//		return videoFileName;
//	}
//	public void setVideoFileName(String videoFileName) {
//		this.videoFileName = videoFileName;
//	}
//	public File getVideoFile() {
//		return videoFile;
//	}
	
}