
 <%@page language="java" contentType="application/x-msdownload"    pageEncoding="utf-8"%>
 <%@page import="java.io.File"%>
 <%@page import="java.util.*"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>

 <%
      //关于文件下载时采用文件流输出的方式处理：
      //加上response.reset()，并且所有的％>后面不要换行，包括最后一个；

      response.reset();//可以加也可以不加
      response.setContentType("application/x-download");
      String filedownload = "video";
      String filedisplay = "room.mp4";
      filedisplay = URLEncoder.encode(filedisplay,"UTF-8");
      response.addHeader("Content-Disposition","attachment;filename=" + filedisplay);

      OutputStream outp = null;
      FileInputStream in = null;
      try
      {
          outp = response.getOutputStream();
          in = new FileInputStream(filedownload);

          byte[] b = new byte[1024];
          int i = 0;

          while((i = in.read(b)) > 0)
          {
              outp.write(b, 0, i);
          }
          outp.flush();
      }
      catch(Exception e)
      {
          System.out.println("Error!");
          e.printStackTrace();
      }
      finally
      {
          if(in != null)
          {
              in.close();
              in = null;
          }
          if(outp != null)
          {
              outp.close();
              outp = null;
          }
      }
%>