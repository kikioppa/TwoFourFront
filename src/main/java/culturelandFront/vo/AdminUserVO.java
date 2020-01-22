package culturelandFront.vo;

import java.util.Arrays;

//import javax.validation.constraints.AssertTrue;





import org.apache.ibatis.type.Alias;
//import org.hibernate.validator.constraints.NotEmpty;





import culturelandFront.core.abstr.NdnAbstractVO;
import culturelandFront.core.util.NdnUtil;

@Alias("adminUserVO")
public class AdminUserVO extends NdnAbstractVO {

	private int seq;
	
//	@NotEmpty
	private String id;
	
//	@NotEmpty
	private String pw;
	
	private String name;
	
	private String auth;
	
	private String authLevel;
	
	private String frst_date;
	
	private String tel;
	
	private String cellphone;
	
	private String email;
	
	private String position;
	
	private int[] auths;
	
//	@AssertTrue
	private boolean success=true;
	
	

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public String getAuthLevel() {
		return authLevel;
	}

	public void setAuthLevel(String authLevel) {
		this.authLevel = authLevel;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getFrst_date() {
		return frst_date;
	}

	public void setFrst_date(String frst_date) {
		this.frst_date = frst_date;
	}

	
	public int[] getAuths() {
		return auths;
	}

	public void setAuths(int[] auths) {
		this.auths = auths;
	}

	public void setForm() {
		this.auths = new int[45];
		if( NdnUtil.isNotEmpty(this.auth) ) {
			String[] authAry = NdnUtil.singleChars(this.auth);
			for(int i = 0 ; i < authAry.length ; i++ ) {
				int value = Integer.parseInt(authAry[i]);
				this.auths[i] = value;
			}
		} 	
	}
	
	public void setDB() {
		String auth = "";
/*		for(int i = 0; i < 45; i ++ ) {
			boolean isExit = false;
			for(int j = 0; j < this.auths.length; j++ ) {
				if( i == this.auths[j] ) { 
					isExit = true;
				} 
			}
			if( isExit )
				auth += "1";
			else
				auth += "0";
		}*/
		for(int j = 0; j < this.auths.length; j++ ) {
			auth += this.auths[j];
			if(j != this.auths.length - 1){
				auth += ",";
			}
		}
		System.out.println(">>>:"+auth);
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "AdminUserVO [seq=" + seq + ", id=" + id + ", pw=" + pw + ", name=" + name + ", auth=" + auth
				+ ", authLevel=" + authLevel + ", frst_date=" + frst_date + ", auths=" + Arrays.toString(auths) + "]";
	}
	
}
