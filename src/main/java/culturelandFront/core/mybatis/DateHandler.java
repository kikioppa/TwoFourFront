package culturelandFront.core.mybatis;

import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.Alias;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

import culturelandFront.core.util.NdnUtil;

@Alias("dateHandler")
public class DateHandler implements TypeHandler {

	@Override
	public String getResult(ResultSet rs, String arg1) throws SQLException {
		Date date = rs.getDate(arg1);
		return NdnUtil.getTimeStampString(date, "yyyy/MM/dd");
	}

	@Override
	public String getResult(ResultSet rs, int arg1) throws SQLException {
		Date date = rs.getDate(arg1);
		return NdnUtil.getTimeStampString(date, "yyyy/MM/dd");
	}

	@Override
	public Object getResult(CallableStatement arg0, int arg1) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setParameter(PreparedStatement arg0, int arg1, Object arg2, JdbcType arg3) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	
	
}
