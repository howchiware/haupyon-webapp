<%@ page contentType="text/xml; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%

	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String content = request.getParameter("content");

%>

<guest>
	<dataCount>5</dataCount>
	<% for(int n=1; n <= 5; n++) { %>
		<record num="<%=n %>">
			<name><%= (char)(64+n) + "-" + name %></name>
			<content><![CDATA[<%= (char)(64+n) + "-" + content %>]]></content> <!-- !CDATA를 작성하면 <>를 입력했을 때 태드가 아님을 명시한다 -->
		</record>
	<% } %>
</guest>