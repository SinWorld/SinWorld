package com.hmp.userInforMation.entity;

/**
 * 市实体类
 * 
 * @author NingCG
 *
 */
public class City {
	private Integer ShiDM;// 主键
	private Integer ShengDM;// 省主键 外键关联
	private String ShiMC;// 市名称
	private String ShiDH;// 市代号

	public Integer getShiDM() {
		return ShiDM;
	}

	public void setShiDM(Integer shiDM) {
		ShiDM = shiDM;
	}

	public Integer getShengDM() {
		return ShengDM;
	}

	public void setShengDM(Integer shengDM) {
		ShengDM = shengDM;
	}

	public String getShiMC() {
		return ShiMC;
	}

	public void setShiMC(String shiMC) {
		ShiMC = shiMC;
	}

	public String getShiDH() {
		return ShiDH;
	}

	public void setShiDH(String shiDH) {
		ShiDH = shiDH;
	}

	@Override
	public String toString() {
		return "City [ShiDM=" + ShiDM + ", ShengDM=" + ShengDM + ", ShiMC=" + ShiMC + ", ShiDH=" + ShiDH + "]";
	}
}
