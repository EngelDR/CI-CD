<%@ include file="/WEB-INF/include.jsp" %>
<!--  start: MODAL EDITAR USUARIO -->
<div>
	<div id="modalEditProfile" class="modal fade">			
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<a  class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" ></span></a>
					<h4 class="modal-title"><spring:message code="language.tags.0028"/></h4>
				</div>	
					<ul class="nav nav-tabs" role="tablist">
								<li role="presentation" id="p1" class="active"><a href="#form1" aria-controls="form1" role="tab" data-toggle="tab"><spring:message code="language.tags.0028.19"/></a></li>
								<li style="color: #148f77"role="presentation" id="p2"><a href="#form2" aria-controls="form2" role="tab" data-toggle="tab"><spring:message code="language.tags.0028.20"/></a></li>
							</ul>
							<br>
				<!-- Tab panes -->
				<div class="tab-content">		
				<!-- FORM 1-->
				<div role="tabpanel" class="tab-pane active" id="form1">		
				<form class="form-editUser"  id="form-editUserProfile">
					<div class="modal-body">							
						<div class="form-content">
							<div class="form-group">
									<div class="row">
										<div class="form-group col-sm-6">
												<label for="nombre" class="control-label"><spring:message code="language.tags.0029.02"/>:</label>
												<input type="text" class="form-control" id="nombreSession" pattern="^[A-z]{1,15}\s{0,1}[A-z]{0,15}$" placeholder='<spring:message code="language.tags.0028.01"/>' required oninvalid="setCustomValidity('<spring:message code="language.tags.0028.02"/>')" oninput="setCustomValidity('')">
										</div>
										<div class="form-group col-sm-6">
										 		<label for="apellidoP" class="control-label"><spring:message code="language.tags.0028.03"/>:</label>
												<input type="text"  class="form-control" id="apellidoPSession" pattern="[A-z]{1,15}" placeholder='<spring:message code="language.tags.0028.03"/>' maxlength="15" required oninvalid="setCustomValidity('<spring:message code="language.tags.0028.04"/>')" oninput="setCustomValidity('')">
										</div>
										<div class="form-group col-sm-6">
								                <label for="apellidoM" class="control-label"><spring:message code="language.tags.0028.05"/>:</label>
								                <input type="text"   class="form-control" id="apellidoMSession" pattern="[A-z]{1,15}" placeholder='<spring:message code="language.tags.0028.05"/>' maxlength="12" required oninvalid="setCustomValidity('<spring:message code="language.tags.0028.06"/>')" oninput="setCustomValidity('')">
							            </div>
							            <div class="form-group col-sm-6">
								                <label for="correo" class="control-label"><spring:message code="language.tags.0010"/>:</label>
												<input type="email" class="form-control" id="correoSession" placeholder='<spring:message code="language.tags.0010"/>' maxlength="30" required oninvalid="setCustomValidity('<spring:message code="language.tags.0011"/>')" oninput="setCustomValidity('')">
							            </div>
							            <div class="form-group col-sm-6">
								                <label for="user" class="control-label"><spring:message code="language.tags.0028.07"/>:</label>
								                <input type="text"  class="form-control" id="userSession" placeholder='<spring:message code="language.tags.0028.08"/>' onkeyup="javascript:this.value=this.value.toUpperCase();" maxlength="10" required oninvalid="setCustomValidity('<spring:message code="language.tags.0006"/>')" oninput="setCustomValidity('')">
							            </div>		
							            <div class="form-group col-sm-6">
								                <label for="tel" class="control-label"><spring:message code="language.tags.0028.10"/>:</label>
								                <input type="text" pattern="\d*"   maxlength="10" class="form-control" id="telSession" placeholder='<spring:message code="language.tags.0028.11"/>' required oninvalid="setCustomValidity('<spring:message code="language.tags.0028.12"/>')" oninput="setCustomValidity('')">
							            </div>	
								</div>
							</div>
						</div>
					</div>					
					<div class="modal-footer">		
						<button id="modalEditProfileAceptBtn" type="submit" class="btn btn-primary"> <span class="glyphicon glyphicon-ok"></span><spring:message code="language.tags.0028.13"/></button>		
					</div>
				</form>	
				</div>
				<!-- FORM 2-->
				<div role="tabpanel" class="tab-pane" id="form2">		
				<form class="form-changePassword"  id="form-changePasswordProfile">
					<div class="modal-body">							
						<div class="form-content">
							<div class="form-group">
									<div class="row">
										<div class="form-group col-sm-3"></div>
							            <div class="form-group col-sm-6">
								                <label for="passBeforeSession" class="control-label"><spring:message code="language.tags.0028.21"/>:</label>
								                <input type="password" class="form-control" id="passBeforeSession" placeholder='<spring:message code="language.tags.0028.21"/>' disabled="disabled">
							            </div>
							            <div class="form-group col-sm-3"></div>
							        </div>    
							        <div class="row">    
							        	<div class="form-group col-sm-3"></div>
							            <div class="form-group col-sm-6">
								                <label for="password1" class="control-label"><spring:message code="language.tags.0028.22"/>:</label>
								                <input type="password" class="form-control" id="password1" placeholder='<spring:message code="language.tags.0028.22"/>'>
								                <div class='text-left'>
								              	  <FONT SIZE="1"><label style="text-align: left; color: #C0392B; line-height: 10pt;"id="msj1"></label></FONT>
								              	</div>  
							            </div>	
							            <div class="form-group col-sm-3"></div>
							        </div>    	
							        <div class="row">   
							        	<div class="form-group col-sm-3"></div> 			            
							            <div class="form-group col-sm-6">
								                <label for="password2" class="control-label"><spring:message code="language.tags.0028.23"/>:</label>
								                <input type="password" class="form-control" id="password2" placeholder='<spring:message code="language.tags.0028.23"/>'>
								                <div class='text-left'>
													<FONT SIZE="1"><label style="color: #C0392B; line-height: 10pt;" id="msj2"></label></FONT>
												</div>
							            </div>
							            <div class="form-group col-sm-3"></div>
								</div>
							</div>
						</div>
					</div>					
					<div class="modal-footer">		
						<button id="modalChangePasswordAceptBtn" type="submit" class="btn btn-primary"> <span class="glyphicon glyphicon-ok"></span><spring:message code="language.tags.0028.13"/></button>		
					</div>
				</form>	
				</div>
				</div>			
			</div>
		</div>			
	</div>	
	</div>
<!-- end: MODAL EDITAR USUARIO -->
		
<script>
	$("#form-changePasswordProfile").submit(function(e) {			
		e.preventDefault();			
		$("#msj2").html("");
		$("#msj1").html("");		
		var mensaje1 = validaPassword();
		if (mensaje1.length == 0) {
			var mensaje2 = passwordMatch();
			if (mensaje2.length == 0) {
				$.blockUI({
					message: '<span class="spinner"/>',
		 			css: {border:'none', backgroundColor:'transparent'}
				});
				var newpassword = $("#password2").val();
				var id = "${sessionScope.tUsuario.id}";
				changePasswordProfile(id,newpassword);
			} else {
				$("#msj2").html(mensaje2);
				$("#password1").focus();
			}
		} 
		else {
			$("#password1").focus();
			if(mensaje1 != 1){
				$("#msj1").html("Su contraseña no cumple con almenos" +mensaje1+".");
			}
		}

	});

	function changePasswordProfile(id, newpassword) {
			$.ajaxSetup({
				cache : false
			});	
			$.ajax({
				url : '${pageContext.request.contextPath}/editProfile/changePass',
				type : 'POST',
				data : {
					id : id,
					newpassword : newpassword
				},
				success : function(json) {
					if (json == 1) {
						toastr.success('Su contraseña ha sido cambiada.');
						$("#password1").prop("disabled", true);
						$("#password2").prop("disabled", true);
					}else{
						var val = json;
						validationPasswordBack(val);
					}
					
					$.unblockUI();
				},
				error : function(jqXHR, textStatus, errorThrown) {
					if (textStatus === "timeout") {
						toastr
								.error('Error... tiempo de consulta ha excedido. Favor de intentar más tarde.');
					} else {
						toastr
								.error('Ha ocurrido un error. Favor de intentar más tarde.');
					}
					$.unblockUI();
				}
			});
		;
	}

</script>