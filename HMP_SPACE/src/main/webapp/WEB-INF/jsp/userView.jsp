<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<c:url value='/user/addUser'/>" method="post">
		<table border="1" width="100%">
			<th>主键</th>
			<th>用户名</th>
			<th>密码</th>
			<tr>
				<td><input type="text" name="id"></td>
				<td><input type="text" name="userName"></td>
				<td><input type="password" name="passworld"></td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit"></td>
			</tr>
		</table>
	</form>
</body>
</html>