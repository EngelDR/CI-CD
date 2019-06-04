<%@ include file="/WEB-INF/include.jsp" %>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<style>
			.n-body-content .page-wrapper {
				background-color: transparent;
				border-style: none;
			}
			blockquote{
				background: none;
			}
		</style>
		<!-- start: DYNAMIC TABLE PANEL -->
		<div id="instrucciones" class="tab-pane active">
			<br>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4 class="panel-title"><b><spring:message code="language.tags.0042.02.01"/></b></h4>
				</div>
				<div class="panel-body">
					<blockquote>
						<p class="text-justify" style="font-size: 85%">
							<strong><spring:message code="language.tags.0042.02.02"/></strong>
						</p>
						<p class="text-justify">
							<small>
								<br> <spring:message code="language.tags.0042.02.03"/> 
								<br> <spring:message code="language.tags.0042.02.04"/>
								<br>&emsp;&emsp;&emsp;
								<a href="http://remedycontrol.oymcloud.americamovil.com:8080/MesaAyudaV2/" target="_blank">
									<button type="button" class="btn btn-success active"><spring:message code="language.tags.0042.02.05"/></button> <%-- <img src="${pageContext.request.contextPath}/resources/assets/images/mesaDeAyudaRemedy.png" alt="Ir a..." class="img-responsive center-block img-rounded"> --%>
								</a>
								<br> <spring:message code="language.tags.0042.02.06"/> 
								<br>&emsp;&emsp;&emsp;<spring:message code="language.tags.0042.02.07"/> <br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; 
														<spring:message code="language.tags.0042.02.08"/> <br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; 
														<spring:message code="language.tags.0042.02.09"/> 
								<br>&emsp;&emsp;&emsp;<spring:message code="language.tags.0042.02.10"/> 
								<br>&emsp;&emsp;&emsp;<spring:message code="language.tags.0042.02.11"/> 
								<br>&emsp;&emsp;&emsp;<spring:message code="language.tags.0042.02.12"/> 
								<br> <spring:message code="language.tags.0042.02.13"/> <br>
							</small>
						</p>
					</blockquote>
				</div>
			</div>
		</div>								
		<!-- end: DYNAMIC TABLE PANEL -->
	</tiles:putAttribute>
</tiles:insertDefinition>
