<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="itcast" uri="http://itcast.cn/common/"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 	<link href="${pageContext.request.contextPath}/res/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/res/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/res/jqPaginator.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/res/myPage.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    function loadData(num) {
        $("#PageCount").val("89");
    }
    </script>
</head>
<body>
	 <form id="form1" runat="server">
	 <table border="1" width="100%">
		<th>用户名</th>
		<th>密码</th>
		<div>
		<c:forEach items="${page}" var="p">
			<tr>
				<td><c:out value="${p.userName}"/></td>
				<td><c:out value="${p.passworld}"/></td>
			</tr>
		</c:forEach>
		</div>
		<div>
	        <ul class="pagination" id="pagination">
	        </ul>
	       		<itcast:page url="${pageContext.request.contextPath }/user/list" />
   		</div>
   		</table>
   		<script src="${pageContext.request.contextPath}/res/myPage.js" type="text/javascript"></script>
	</form>
</body>
</html>