<%@ include file="/WEB-INF/include.jsp" %>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<style>
			.n-body-content .page-wrapper {
				background-color: transparent;
				border-style: none;
			}
		</style>
		<!-- start: DYNAMIC TABLE PANEL -->
		<div class="col-sm-4" >
			
			<div class='panel panel-primary  table-responsive table table-striped  table-hover ' style='font-size: 85%; width: auto !important;'>
				<div class="panel-heading nopadding text-center">
					<h4 class="panel-title"><b><spring:message code="language.tags.0042.01.01"/></b></h4>
				</div>
				<table class="panel-body" style='margin-left: 10px; font-size: 85%; width: auto !important;'>
					<tr>
						<td>
							<h4>
								<small> <strong>Ing. Juan Israel Olvera Bernal</strong><br>
									<spring:message code="language.tags.0042.01.02"/><br> <a
									href="mailto:israel.olvera@telcel.com">israel.olvera@telcel.com</a><br>
									<spring:message code="language.tags.0042.01.03"/>: 5566
								</small>
							</h4>
						</td>
					</tr>
					<tr>
						<td><h4>
								<small><strong>Ing. Rodrigo Arias Hurtado</strong> <br>
									<spring:message code="language.tags.0042.01.04"/><br> <a
									href="mailto:rodrigo.arias@telcel.com">rodrigo.arias@telcel.com</a><br>
									<spring:message code="language.tags.0042.01.03"/>: 2899 </small>
							</h4>
						<td>
					</tr>
				</table>
			</div>
		</div>

		<div class="col-sm-5">
			<div class="panel panel-primary table-responsive  text-center">
				<div class="panel-heading nopadding">
					<h4 class="panel-title"><b><spring:message code="language.tags.0042.01.05"/></b></h4>
				</div>
				<div class="panel-body">
					<div class="row">
				        <div class="mnb col-sm-2"><b><spring:message code="language.tags.0042.01.06"/></b></div>
				        <div class="mnb col-sm-5"><b><spring:message code="language.tags.0042.01.07"/><br> <spring:message code="language.tags.0042.01.08"/></b></div>
				        <div class="mnb col-sm-5"><b><spring:message code="language.tags.0042.01.09"/></b></div>
				    </div>
				    <div class="row">
				        <div class="col-sm-2">
				        	<spring:message code="language.tags.0042.01.10"/><br>
				        	<spring:message code="language.tags.0042.01.11"/><br>
				        	<spring:message code="language.tags.0042.01.12"/><br><br>
				        	<spring:message code="language.tags.0042.01.13"/><br>
				        </div>
				        <div class="col-sm-5">
				        	8 hrs.<br>
				        	24 hrs.<br>
				        	36 hrs.<br><br>
				        	48 hrs.<br>
				        </div>
				        <div class="col-sm-5">
				        	7x24<br>
				        	7x24<br>
				        	<spring:message code="language.tags.0042.01.14"/> <br>09:00 - 18:00 hrs.<br>
				        	<spring:message code="language.tags.0042.01.14"/> <br>09:00 - 18:00 hrs.<br>
				        </div>
				    </div>
				</div>
			</div>
		</div>

		<div class="col-sm-3">
			<div class="panel panel-primary table-responsive">
				<div class="panel-heading text-center">
					<h4 class="panel-title"><b><spring:message code="language.tags.0042.01.15"/></b></h4>
				</div>
				<div class="panel-body">
					<p style='width: 100%'>
						<strong><spring:message code="language.tags.0042.01.16"/></strong><br>55-1010-4933<br>
						<!-- 													<a href="mailto:soporte.is@mail.telcel.com">soporte.is@mail.telcel.com</a> -->
					</p>
					<p>
						<strong><spring:message code="language.tags.0042.01.17"/></strong><br> <a
							href="mailto:soporte.ti@telcel.com">soporte.ti@telcel.com</a>
					</p>
				</div>
			</div>
		</div>
		<!-- end: DYNAMIC TABLE PANEL -->
	</tiles:putAttribute>
</tiles:insertDefinition>
