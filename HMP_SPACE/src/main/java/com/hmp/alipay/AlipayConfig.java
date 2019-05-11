package com.hmp.alipay;

/**
 * 对接支付宝配置文件
 * 
 * @author NingCG
 *
 */
public class AlipayConfig {
	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数
	public static String return_url = "http://localhost:8080/HMP_SPACE/success.jsp";
	// 服务器异步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/HMP_SPACE/notify";
	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id ="2016100100638751";
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
	public static String alipay_public_key ="MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuL1CDGqneCfqSJYy03aL/rwXsQq+Za59yUPAmXe0I6VD9CHh3RNMj5s/k7qd8/vs+vWulpT2nPj9QWEb5Pr84phnR2xtNctwtfA0F09RLYrgA/r8ek3yjftksguIAY9gjvcDa0WGy+Bm1p17cjD8OPj+28kWAUfB2PcescVChKMOxsf9eU9NzBvsOQH/scctay03v8DJpbn/HVlAjfDs6S+XtHuz8u3DovetuZdbFfE+dC5p/xWl2xkZIT1MiLk5iBNK015iFLjO8SlnddWkfcr2sZM0EHbZ/tlVqWTlksfhQYPb38oMskG1qhPQX6nnHX091Pba+MBXuB49vgdQBQIDAQAB";
	// 商户私钥，您的PKCS8格式RSA2私钥
	public static String merchant_private_key ="MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC4vUIMaqd4J+pIljLTdov+vBexCr5lrn3JQ8CZd7QjpUP0IeHdE0yPmz+Tup3z++z69a6WlPac+P1BYRvk+vzimGdHbG01y3C18DQXT1EtiuAD+vx6TfKN+2SyC4gBj2CO9wNrRYbL4GbWnXtyMPw4+P7byRYBR8HY9x6xxUKEow7Gx/15T03MG+w5Af+xxy1rLTe/wMmluf8dWUCN8OzpL5e0e7Py7cOi9625l1sV8T50Lmn/FaXbGRkhPUyIuTmIE0rTXmIUuM7xKWd11aR9yvaxkzQQdtn+2VWpZOWSx+FBg9vfygyyQbWqE9BfqecdfT3U9tr4wFe4Hj2+B1AFAgMBAAECggEAAhJlTjxX+noAH6ZHlaWLtmSno12qevt0/6/Z1h7Ij2nIFFHY9aDEyAuGsAJ0yQq3Qq1Esv2ismn8dSJArNW/xk7NQbjOlL7eWbwC6YwDLg6TqpfDAyAiq0L5gyGr+dCA1bmheS+Dbn/qx1dmzgYMnhr0yMQ9kfAbFXLYDkhXEaO5n/PvoMcMw1q9hITJtCCTWl09YLfL9OmjmX75snczvq4yM3ErUyCcqPANY+fGcTTxtggrEfvSqws1HcWCuiL5VqkK7hqoPvUbYUmxuaCVZEwpdV3OQRyPmLRVXPaGAtaklil3LLv2sxDW9M70xxrWYaov1txdHtMEs/ZR578YoQKBgQDpDjnq7NHJXuWF64EJr5aO8kTkMgUI97UlcH58h+qj7CJGTxWGLmWuJmAgP477hp5y40A8xUXX/U1vOkia2tkTr3J4qUVnWHz0ppl63sFq8WtZzewXHQQHtVhfw3FXBuf4qOSS13gL2BKrjvvN78JK+15qimMoyCF6yyF3OWMCfQKBgQDK7U0WIayynA688GbC1o4k79HG2v69TEmimM0dYgK6kzCJmSqzaUyZTPmoqKWu+ncMAoSbPEl7Xaor0zuSzazIR/OCs3ijy2+hurBPvlROI7DaAYO3+RXtXK9CxOcG7pBZKjF0JuwmHCw+0lRo0N2wKONwW5KoXz6MebE9nQWyKQKBgBpJYH7+9yqfaYQRbByLkY/OA7c5bRf12JjAd4PUUMLsf3Euul7IHO/npC/++0GjjXun5jb0iUwzZeiFymqtBI8T2vWBIjLl6DIwGF+jgG1vjYwzjc2NmEbGTZF/mekW/lMtuZpWc1PiqzhuiDhSMrgCYkPiGA0hhaU0BDJOZryBAoGAXff9Vl5Jpnv1pzB7pYXNVPVo4vjONcJ55r1zXkPgl51JQK6Yw3PjcKnggmV2M8zwC7OuzGPicyowfxLV52kutZ/79248Uz0FeJMGyiaMy5JjdtB0umCx8rSUxAqCIQef+Go9dFgByrQJGR400ETII6cLiyAcjbNtN4eyt6Fa3eECgYEApQR8cjSrl5TJ7s3p0m8JtL2/dvD5czoStUg9TPnukkjpB7B/ebblqFSSKNZdcczyNPnGRz3H5sfYgi35MdrYRqGQ6aoKxNSnL+9DQEwX2542eXyAg06hmoEw7+0Le9vOYCE1cepldAquuk+CbjaCJ9fOX+LeOvkQYASGIaDqHA8=";
	// 签名方式
	public static String sign_type = "RSA2";
	// 字符编码格式
	public static String charset = "utf-8";
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
}
