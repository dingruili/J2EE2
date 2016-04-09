package com.download.action;

import java.util.*;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.download.dao.CustomerDao;
import com.download.dao.VideoDao;
import com.download.dao.VideoTypeDao;
import com.download.model.Customer;
import com.download.model.Video;
import com.download.model.Videotype;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller @Scope("prototype")
public class VideoTypeAction extends ActionSupport{
	@Resource VideoTypeDao videoTypeDao;

	private Videotype videoType;
	
	public String addvideoType() throws Exception{
		videoTypeDao.addVideotype(videotype);
		return "message";
	}
	public String showvideoType(){
		videotypeList=videoTypeDao.QueryAllVideotype();
		return "show_view";
	}
	public String deleteVideotype() throws Exception{
		videoTypeDao.deleteVideotype(videotype.getVideoTypeId());
		return "delete_message";
	}
	public String showEdit() throws Exception{
		videotype = videoTypeDao.GetVideotypeByNum(videotype.getVideoTypeName());
		return "edit_view";
	}
	
	public String editVideoType() throws Exception{
		videoTypeDao.updateVideotype(videotype);
		return "edit_message";
	}
	private Videotype videotype;
	public Videotype getVideotype() {
		return videotype;
	}
	public void setVideotype(Videotype videotype) {
		this.videotype = videotype;
	}
	
	private List<Videotype> videotypeList;
	public List<Videotype> getVideotypeList() {
		return videotypeList;
	}
	public void setVideotypeList(List<Videotype> videotypeList) {
		this.videotypeList = videotypeList;
	}
	
	 
//	
//    /*添加BookType信息*/
//    @SuppressWarnings("deprecation")
//    public String AddVideoType() {
//        ActionContext ctx = ActionContext.getContext();
//        try {
//            videoTypeDao.addVideotype(videotype);
//            ctx.put("message",  java.net.URLEncoder.encode("VideoType添加成功!"));
//            return "addvt_succ";
//        } catch (Exception e) {
//            e.printStackTrace();
//            ctx.put("error",  java.net.URLEncoder.encode("VideoType添加失败!"));
//            return "error";
//        }
//    }

    /*查询BookType信息*/
    public String QueryVideoType() {
        ActionContext ctx = ActionContext.getContext();
        ctx.put("videotypeList",  videotypeList);
        return "queryvt_view";
    }

}
