<%@ include file="/WEB-INF/include.jsp" %>

<style>
.b {
	position: absolute !important;
	right: 10px;
}

@media screen and (max-width: 767px) {
	.b {
		position: relative !important;
		right: 0px;
	}
}

i.fa.fa-plug.fa-2x.f {
	font-size: 1.5em;
}
</style>
<!--Contenedor Primario-->
        <div class="container-fluid n-c-primary">
            <!--Toggle button-->
            <nav class="row n-toggle"><div id="n-toggle-button" class="fa fa-bars fa-2x "></div></nav>

            <!--Menï¿½ superior-->
            <nav class="row n-top-content">
                <div class="col-sm-11 n-top-menu">
                    <ul class="nav navbar-nav">
                        <sec:authorize access="hasAnyAuthority('${applicationScope.rol_AdminCor}','${applicationScope.rol_AdminRi}')">
            				<li><a href="${pageContext.request.contextPath}/users.htm"><spring:message code="language.tags.0037"/></a></li>
		 				</sec:authorize>

						<sec:authorize access="hasAuthority('${applicationScope.rol_AdminCor}')">
			            	<li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#">
	                                <spring:message code="language.tags.0038"/> <b class='caret'></b>
	                            </a>
	                            <ul class="dropdown-menu">
	                            	</sec:authorize>
	                            	<sec:authorize access="hasAuthority('${applicationScope.rol_Administrador}')">
	                            	<li><a href="${pageContext.request.contextPath}/cor/admin/dashboard.htm"><spring:message code="language.tags.0044"/></a></li>
	                            	<li class="divider"></li>
	                            	</sec:authorize>
	                            	<sec:authorize access="hasAuthority('${applicationScope.rol_AdminCor}')">
	                                <li><a href="${pageContext.request.contextPath}/cor/admin/platforms.htm"><spring:message code="language.tags.0038.01"/></a></li>
	                                <li class="divider"></li>
	                                <li><a href="${pageContext.request.contextPath}/cor/admin/standar.htm"> <spring:message code="language.tags.0038.02"/></a></li>
	                            </ul>
	                        </li>
				 		</sec:authorize>
		 		
                        <sec:authorize access="hasAuthority('${applicationScope.rol_AdminRi}')">
			            	<li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#">
	                                <spring:message code="language.tags.0039"/>  <b class='caret'></b>
	                            </a>
	                            <ul class="dropdown-menu">
	                            </sec:authorize>
	                            	<sec:authorize access="hasAuthority('${applicationScope.rol_Administrador}')">
	                            	<li><a href="${pageContext.request.contextPath}/ri/admin/dashboard.htm"><spring:message code="language.tags.0044"/></a></li>
	                            	<li class="divider"></li>
	                            	</sec:authorize>
	                            	<sec:authorize access="hasAuthority('${applicationScope.rol_AdminRi}')">
	                                <li><a href="${pageContext.request.contextPath}/ri/admin/platforms.htm"> <spring:message code="language.tags.0039.01"/></a></li>
	                                <li class="divider"></li>
	                                <li><a href="${pageContext.request.contextPath}/ri/admin/standar.htm"> <spring:message code="language.tags.0039.02"/></a></li>
	                            </ul>
	                        </li>
				 		</sec:authorize>
                        
                        <sec:authorize access="hasAuthority('${applicationScope.rol_Administrador}')">
			            <li><a href="${pageContext.request.contextPath}/administration/remedy.htm"><spring:message code="language.tags.0040"/></a></li>
				        </sec:authorize>
				        <sec:authorize access="hasAnyAuthority('${applicationScope.rol_AdminCor}','${applicationScope.rol_AdminRi}')">
				        <li><a href="${pageContext.request.contextPath}/report.htm"><spring:message code="language.tags.0038.03"/></a></li>
				        <li><a href="${pageContext.request.contextPath}/activityLog.htm"><spring:message code="language.tags.0041"/></a></li>
				        <li><a href="${pageContext.request.contextPath}/graphics.htm"><spring:message code="language.tags.0048"/></a></li>
				 		</sec:authorize>
				 		                
		                <sec:authorize access="permitAll">
		                <li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <spring:message code="language.tags.0042"/>  <b class='caret'></b>
                            </a>
                            <ul class="dropdown-menu">
								<sec:authorize access="hasAuthority('${applicationScope.rol_AdminCor}')">                            	
	                            	<li><a href='javascript:manual("cor")'><spring:message code="language.tags.0042.03"/></a></li>
	                                <li class="divider"></li>
				 				</sec:authorize>
                            	<sec:authorize access="hasAuthority('${applicationScope.rol_AdminRi}')">
                            		<li><a href='javascript:manual("ri")'><spring:message code="language.tags.0042.04"/></a></li>
                                	<li class="divider"></li>
                                </sec:authorize>
                                <li><a href="${pageContext.request.contextPath}/support.htm"><spring:message code="language.tags.0042.01"/></a></li>
                                <li class="divider"></li>
                                <li><a href="${pageContext.request.contextPath}/incidence.htm"><spring:message code="language.tags.0042.02"/></a></li>
                            </ul>
                        </li>
				 		</sec:authorize>	
				 		<sec:authorize access="hasAuthority('${applicationScope.rol_Administrador}')">
				 			<li class="b"><a href='javascript:showConexion()'><i class="fa fa-plug fa-2x f"></i></a></li>
		 				</sec:authorize>			 	
                    </ul>
                </div>
            </nav>
            <!--Contenedor secundario-->
            <div class="row row-eq-height n-body-content">

                <!--Menú lateral-->
                <div class="col-sm-1 sidenav">
                    <ul class="nav nav-pills nav-stacked">
                    	<sec:authorize access="hasAnyAuthority('${applicationScope.rol_ConsultCor}','${applicationScope.rol_ConsultRi}')">
                    	<div class="dividerv"></div>
						<li id="menu1"><a href="${pageContext.request.contextPath}/dashboard.htm"><i class="fa fa-tachometer"></i><p><spring:message code="language.tags.0044"/></p></a></li>
						</sec:authorize>
	                    
						<div class="dividerv"></div>
						<li id="menu2" class="dropdown">
	                    	<a class="dropdown-toggle" data-toggle="dropdown" href="#">
	                        	<i class="fa fa-file-text-o"></i><p><spring:message code="language.tags.0045"/></p><b class='caret'></b>
	                        </a>
	                        <ul class="dropdown-menu">
	                        	<sec:authorize access="hasAnyAuthority('${applicationScope.rol_Tester}','${applicationScope.rol_AdminCor}','${applicationScope.rol_AdminRi}')">
	                            	<li><a href="${pageContext.request.contextPath}/consultCrq.htm"> <spring:message code="language.tags.0045.01"/></a></li>
	                            </sec:authorize>
	                            <sec:authorize access="hasAnyAuthority('${applicationScope.rol_AdminCor}')">
		                        	<li class="divider"></li>
		                            <li><a href="${pageContext.request.contextPath}/crqExecutionSA.htm"> <spring:message code="language.tags.0045.02"/></a></li>
									<li class="divider"></li>
		                            <li><a href="${pageContext.request.contextPath}/crqAplazado.htm"> <spring:message code="language.tags.0045.03"/></a></li>
	                            </sec:authorize>
	                        </ul>
	                    <li>

						<sec:authorize access="hasAuthority('${applicationScope.rol_Administrador}')">
						<div class="dividerv"></div>
						<li id="menu3"><a href="${pageContext.request.contextPath}/notificationCrq.htm"><i class="fa fa-bell"></i><p><spring:message code="language.tags.0046"/></p></a></li>
		            	</sec:authorize>
				
						<sec:authorize access="hasAuthority('${applicationScope.rol_AdminCor}')">
						<div class="dividerv"></div>
			            <li id="menu4" class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <i class="fa fa-stack-overflow"></i><p><spring:message code="language.tags.0047"/></p><b class='caret'></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="${pageContext.request.contextPath}/test.htm"><spring:message code="language.tags.0047.01"/></a></li>
                            </ul>
                        <li>
						</sec:authorize>
                    </ul>
                </div>
                
           <div id="modalName" class="modal fade">			
			<div class="modal-dialog modal-sm" >
				<div class="modal-content">
					<div class="modal-header">
						<a class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span></a>
						<h4 class="modal-title"><spring:message code="language.tags.0043"/></h4>
					</div>					
					<div class="modal-body">
						<div class="row">
							<div class="col-md-12 form-group">
								<label class="control-label"><spring:message code="language.tags.0043.01.01"/> :</label> 
								    ${nameServerWEB}
							</div>	
						</div>	
						<div class="row">
							<div class="col-md-12 form-group">
								<label class="control-label"><spring:message code="language.tags.0043.01.02"/> :</label> 	
									${nameServerDB} 
							</div>
						</div>
					</div>
					<div class="modal-footer">		
				
					</div>
				</div>
			</div>			
		</div>	
		
	<script type="text/javascript">
		function showConexion() {
			$("#modalName").modal('show');  
		}

		function manual(psArea){
			if('cor'== psArea){
			 	location.href="${pageContext.request.contextPath}/consult/downloadAttachment?idCRQ=manuals&fileName=ManualUsuarioCOR.docx&All=False";
			}else if('ri'==psArea){
				location.href="${pageContext.request.contextPath}/consult/downloadAttachment?idCRQ=manuals&fileName=ManualUsuarioRI.docx&All=False";
			}
		}
	</script>