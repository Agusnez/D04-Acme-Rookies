<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags" %>
<jsp:useBean id="now" class="java.util.Date" />


<display:table name="positions" id="row" requestURI="${requestURI }" pagesize="${pagesize }">
	
	
	<acme:column property="ticker" titleKey="position.ticker" value= "${row.ticker}: "/>
	
	<acme:column property="company.commercialName" titleKey="position.company" value= "${row.company.commercialName}: "/>
	
	<acme:column property="title" titleKey="position.title" value= "${row.title} "/>
	
	<acme:column property="description" titleKey="position.description" value="${row.description }" />
	
	<acme:dateFormat titleKey="position.deadline" value="${row.deadline }" pattern="yyyy/MM/dd" />
	
	<acme:column property="profile" titleKey="position.profile" value= "${row.profile}: "/>
	
	<acme:column property="skills" titleKey="position.skills" value= "${row.skills}: "/>
	
	<acme:column property="technologies" titleKey="position.technologies" value= "${row.technologies}: "/>
	
	<acme:column property="offeredSalary" titleKey="position.offeredSalary" value= "${row.offeredSalary}: "/>

	<security:authorize access="hasRole('AUDITOR')">
		<jstl:if test="${assigned==false}">
			<acme:url href="position/auditor/select.do?positionId=${row.id }" code="position.select" />
		</jstl:if>
	</security:authorize> 
	
	
</display:table>

	<acme:button name="back" code="position.back" onclick="javascript: relativeRedir('welcome/index.do');" />
	