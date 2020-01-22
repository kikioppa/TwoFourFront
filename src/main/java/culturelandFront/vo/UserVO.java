package culturelandFront.vo;

import java.util.Arrays;

//import javax.validation.constraints.AssertTrue;





import org.apache.ibatis.type.Alias;
//import org.hibernate.validator.constraints.NotEmpty;





import culturelandFront.core.abstr.NdnAbstractVO;
import culturelandFront.core.util.NdnUtil;

@Alias("userVO")
public class UserVO extends NdnAbstractVO {

	private int memberNo;
	
//	@NotEmpty
	private String id;
	
//	@NotEmpty
	private String pw;
	
	private String name;
	
	private String frstDate;
	
	private String lastDate;
	
	private String cellphone;
	
	private String email;
	
	private String smsYn;
	
	private String mailYn;
	
	private String memberStat;
	
//	@AssertTrue
	private boolean success=true;
	
	

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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

	public String getFrstDate() {
		return frstDate;
	}

	public void setFrstDate(String frstDate) {
		this.frstDate = frstDate;
	}

	public String getLastDate() {
		return lastDate;
	}

	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
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

	public String getSmsYn() {
		return smsYn;
	}

	public void setSmsYn(String smsYn) {
		this.smsYn = smsYn;
	}

	public String getMailYn() {
		return mailYn;
	}

	public void setMailYn(String mailYn) {
		this.mailYn = mailYn;
	}

	public String getMemberStat() {
		return memberStat;
	}

	public void setMemberStat(String memberStat) {
		this.memberStat = memberStat;
	}

	@Override
	public String toString() {
		return "UserVO [memberNo=" + memberNo + ", id=" + id + ", pw=" + pw
				+ ", name=" + name + ", frstDate=" + frstDate + ", lastDate="
				+ lastDate + ", cellphone=" + cellphone + ", email=" + email
				+ ", smsYn=" + smsYn + ", mailYn=" + mailYn + ", memberStat="
				+ memberStat + ", success=" + success + "]";
	}

	
	
}