package com.hmp.userInforMation.entity;

/**
 * 省实体类
 * 
 * @author NingCG
 *
 */

public class Province {
	private Integer ShengDM;// 主键
	private String ShengMC;// 省名称
	private String ShengDH;// 省代号

	public Integer getShengDM() {
		return ShengDM;
	}

	public void setShengDM(Integer shengDM) {
		ShengDM = shengDM;
	}

	public String getShengMC() {
		return ShengMC;
	}

	public void setShengMC(String shengMC) {
		ShengMC = shengMC;
	}

	public String getShengDH() {
		return ShengDH;
	}

	public void setShengDH(String shengDH) {
		ShengDH = shengDH;
	}

	@Override
	public String toString() {
		return "Province [ShengDM=" + ShengDM + ", ShengMC=" + ShengMC + ", ShengDH=" + ShengDH + "]";
	}

}
