package com.book;

import javax.servlet.*;
import java.io.IOException;

public class encodingFilter  implements Filter  {

    private static String encoding = "utf-8";
    private boolean ignore=true;

    protected String getEncoding(){
        return this.encoding;
    }

    @Override
    public void destroy() {
        // TODO Auto-generated method stub

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        String pencoding="utf-8";
        if(ignore||null==request.getCharacterEncoding()){
            if(pencoding!=null){
                request.setCharacterEncoding(pencoding);
            }
        }
//      System.out.println("encoding===="+encoding);
        response.setContentType("text/html;charset="+pencoding);
//      do something here
        //当前工作全部完成后，将请求放开给过滤器链的下一filter
        chain.doFilter(request, response);

    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.encoding=filterConfig.getInitParameter("encoding");
        String value=filterConfig.getInitParameter("ignore");
        if(value==null){
            this.ignore=true;
        }else if(value.equalsIgnoreCase("true")){
            this.ignore=true;
        }else if(value.equalsIgnoreCase("yes")){
            this.ignore=true;
        }else{
            this.ignore=false;
        }
    }
}
