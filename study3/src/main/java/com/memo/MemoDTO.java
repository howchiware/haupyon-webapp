package com.memo;

public class MemoDTO {

	private long num;
	private String memo_date;
	private String content;
	private String reg_date;

	public long getNum() {
		return num;
	}

	public void setNum(long num) {
		this.num = num;
	}

	public String getMemo_date() {
		return memo_date;
	}

	public void setMemo_date(String memo_date) {
		this.memo_date = memo_date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

}
