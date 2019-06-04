<%@ include file="/WEB-INF/include.jsp"%>
<tiles:insertAttribute name="header" />
<tiles:insertAttribute name="editUserProfile" />
<tiles:insertAttribute name="menu" />
<!--Wrapper body: contenedor principal-->
<div id="page-w" class="col-sm-11 page-wrapper table-responsive">
	<tiles:insertAttribute name="body"/>
</div>
<tiles:insertAttribute name="footer" />
