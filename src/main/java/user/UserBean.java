package user;

import java.io.Serializable;

@SuppressWarnings("serial")
public class UserBean implements Serializable {
	private String uname, upass, ufname, ulname, uadd, umail, uphone;

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpass() {
		return upass;
	}

	public void setUpass(String upass) {
		this.upass = upass;
	}

	public String getUfname() {
		return ufname;
	}

	public void setUfname(String ufname) {
		this.ufname = ufname;
	}

	public String getUlname() {
		return ulname;
	}

	public void setUlname(String ulname) {
		this.ulname = ulname;
	}

	public String getUadd() {
		return uadd;
	}

	public void setUadd(String uadd) {
		this.uadd = uadd;
	}

	public String getUmail() {
		return umail;
	}

	public void setUmail(String umail) {
		this.umail = umail;
	}

	public String getUphone() {
		return uphone;
	}

	public void setUphone(String uphone) {
		this.uphone = uphone;
	}

	public UserBean() {

	}

	@Override
	public String toString() {
		return "UserBean [uname=" + uname + ", upass=" + upass + ", ufname=" + ufname + ", ulname=" + ulname + ", uadd="
				+ uadd + ", umail=" + umail + ", uphone=" + uphone + "]";
	}

}
