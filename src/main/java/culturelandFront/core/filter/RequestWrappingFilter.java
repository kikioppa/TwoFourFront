package culturelandFront.core.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class RequestWrappingFilter implements Filter {

	public FilterConfig filterConfig;
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {

//		System.out.println("Request Wrappter Filter");
		chain.doFilter(new HttpXSSRequestWrapper((HttpServletRequest)req), res);

	}

	public void init(FilterConfig config) throws ServletException {
		this.filterConfig = config;
	}

	public void destroy(){
		this.filterConfig = null;
	}

}
