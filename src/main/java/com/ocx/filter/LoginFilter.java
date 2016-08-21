package com.ocx.filter;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

public class LoginFilter implements Filter {
	
	protected final Logger log = LoggerFactory.getLogger(this.getClass());
	private final List<String> urlList = new ArrayList<String>();

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		String urlautoPath = config.getInitParameter("urlautopath");
		Properties pps = new Properties();
		InputStream in = null;
		try {
			ResourceLoader loader = new DefaultResourceLoader();
			Resource resource = loader.getResource(urlautoPath);
			in = resource.getInputStream();
			pps.load(in);
			
			String urls = pps.getProperty("urlfilter");
			if (null != urls) {
				String urlau[] = urls.split("\\,");
				for (String s : urlau) {
					urlList.add(s);
				}
			}
			
			System.out.println(urlList + "============================================");
			
		} catch (Exception e) {
			e.printStackTrace();
			log.error("读取访问控制文件出错", e);
		} finally {
			if (null != in) {
				try {
					in.close();
				} catch (IOException e) {
				}
			} 
		}
		
		
	}

}
