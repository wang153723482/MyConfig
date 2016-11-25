<%@ page import="java.io.File"%>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<html>   <head><title>jmeter logs</title></head>
<body>
<%
String resultPath = "/results";//与WEB-INF目录同级的results目录，即jmeter生成的html的目录
%>

<%!
    public   void travelDirectory(String directory,JspWriter out,String r) throws IOException {
        File dir = new File(directory);
        if(dir.isFile())            //判断是否是文件，如果是文件则返回。
            return;
        File[] files=dir.listFiles();        //列出当前目录下的所有文件和目录
        List fileNameList = new ArrayList();
        // TODO: 两次循环，需要优化。 
        //TODO: 按日期倒序
        //循环了两次，第一次循环得到所有的目录名放到数组里进行排序，第二次循环数组显示。
        for(int i=0;i<files.length;i++){
            if(files[i].isDirectory()) {       //如果是目录，则继续遍历该目录
                String dirName = files[i].getName();
                System.out.println(dirName);
                fileNameList.add(dirName);
            }
        }
        
        Object[] fileNameArray = fileNameList.toArray();
        Arrays.sort(fileNameArray);
        for(int i=0; i<fileNameArray.length; i++){
            String oName =  (String)fileNameArray[i];
            out.println("<a href='"+r+"/"+oName+"/index.html'>"+oName+"</a><br/>");    //输出该目录或者文件的名字
        }
    } 
    %>

<%
    //将当前web程序目录结构输出到控制台
    String dir=pageContext.getServletContext().getRealPath(resultPath);
    out.println("--------------------------------<br/>");
    travelDirectory(dir,out,resultPath);
    out.println("--------------------------------<br/>");
%>
</body>
</html>