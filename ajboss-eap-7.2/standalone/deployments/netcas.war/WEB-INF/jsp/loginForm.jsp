<%@ include file="/WEB-INF/include.jsp"%>
<!DOCTYPE html>
<html class='no-js'>
<head>
<title>NetCAS</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta content='IE=edge,chrome=1' http-equiv='X-UA-Compatible'>
<link rel="shortcut icon" href="<c:url value="/resources/theme/img/telcel.ico" />" />
<link rel="stylesheet" media="screen" href="<c:url value="/resources/theme/lib/toastr/toastr.css" />">
<link rel="stylesheet" media="screen" href="<c:url value="/resources/theme/lib/bootstrap-3.3.7/css/bootstrapValidator.min.css" />">
<link rel="stylesheet" media="screen" href="<c:url value="/resources/theme/css/particles.css" />">
<link rel="stylesheet" media="screen" href="<c:url value="/resources/theme/css/login.css" />">
<link rel="stylesheet" media="screen" href="<c:url value="/resources/theme/lib/font-awesome-4.7.0/css/font-awesome.min.css" />" />
</head>
<body class='login'>
	<div class='wrapper'>
		<div class='row'>
			<div class='col-lg-12'>
				<div class='brand text-center'>
					<h1>
						<div class="logo-icon">
							NetCAS
						</div>
					</h1>
				</div>
			</div>
		</div>

		<div class='row'>
			<div class='col-lg-12'>
				<form id="loginForm">
					<fieldset class='text-center'>
						<legend> <spring:message code="name.system.description" /> </legend>
						<div class='form-group'>
							<input class="form-control" name="username" id="username" placeholder='<spring:message code="language.tags.0001"/>' 
							style="text-transform: uppercase;" onkeyup='"javascript:this.value=this.value.toUpperCase();"' type='text' autofocus>
						</div>
						<div class='form-group'>
							<input class="form-control" name="password" placeholder="<spring:message code="language.tags.0002"/>" type="password">
						</div>
						<div class='text-center'>
							<input type="submit" value="<spring:message code="language.tags.0003"/>" id='btnEntrar' class="btn btn-default"> <br>
							<div>
								<FONT SIZE="1"><label style="color: #C0392B;">${msj}</label></FONT>
							</div>
							<a href="#" id='tFPassword'><spring:message code="language.tags.0004"/></a>
						</div>
						<br>
						<div class='row'>
							<div class='col-lg-12'>
								<a href="?lang=es"><img src="${pageContext.request.contextPath}/resources/theme/img/mex.ico" alt="Icono" width="25" height="20"/></a> | 
								<a href="?lang=en"><img src="${pageContext.request.contextPath}/resources/theme/img/uss.ico" alt="Icono" width="25" height="20"/></a>
							</div>
						</div>
					</fieldset>
				</form>


			</div>
		</div>
	</div>

	<!--  start: MODAL EMAIL DE RECUPERACIÓN -->
	<div id="modal-fPassword" class="modal fade">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"><spring:message code="language.tags.0008"/></h4>
				</div>
				<form class="modal-content" id="form-fPassword">
					<div class="modal-body">
						<div class="form-content">
							<div class="form-group">
								<div class="row">
									<div class="form-group col-sm-12">
										<label for="recoveryEmail" class="control-label"><spring:message code="language.tags.0009"/></label>
											<input type="email" class="form-control"
											id="recoveryEmail" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" 
											placeholder='<spring:message code="language.tags.0010"/>' maxlength="80" required
											oninvalid='setCustomValidity("<spring:message code="language.tags.0011"/>")' oninput="setCustomValidity('')">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button id="nuevoUserSubmit" type="submit" class="btn btn-primary">
							<span class="glyphicon glyphicon-ok"></span><spring:message code="language.tags.0012"/>
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- end: MODAL EMAIL DE RECUPERACIÓN -->

	<div id="particles-js"></div>

	<!-- Scripts -->
	<script src="<c:url value="/resources/theme/lib/jquery-3.3.1/jquery-3.3.1.min.js" />"></script>
	<script src="<c:url value="/resources/theme/lib/jquery-3.3.1/jquery.blockUI.js" />"></script>
	<script src="<c:url value="/resources/theme/js/particles.min.js" />"></script>
	<script src="<c:url value="/resources/theme/js/modernizr.js" />"></script>
	<script src="<c:url value="/resources/theme/lib/bootstrap-3.3.7/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/theme/lib/bootstrap-3.3.7/js/bootstrapValidator.min.js" />"></script>
	<script src="<c:url value="/resources/theme/lib/bootstrap-3.3.7/js/bootbox.min.js" />"></script>
	<script src="<c:url value="/resources/theme/lib/toastr/toastr.min.js" />"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			document.oncontextmenu = function() {
				return false
			}
			$.ajaxSetup({
				cache : false
			});
			$("#tFPassword").click(function() {
				$("#modal-fPassword").modal('show');
			});

			$("#form-fPassword").submit(function(e) {
				e.preventDefault();
				var email = $("#recoveryEmail").val();
				bootbox.confirm({
					message : '<spring:message code="language.tags.0013"/>: <b>' + email + '</b>',
					size : 'small',
					buttons : {
						cancel : {
							label : '<spring:message code="language.tags.0014"/>',
							className : 'btn btn-secondary'
						},
						confirm : {
							label : '<spring:message code="language.tags.0015"/>',
							className : 'btn btn-primary'
						}
					},
					callback : function(result) {
						if (result == true) {
							$.blockUI({
								message: '<span class="spinner"/>',
					 			css: {border:'none', backgroundColor:'transparent'}
							});
							$.ajax({
								url : '${pageContext.request.contextPath}/restore/forgot',
								type : 'POST',
								data : {email : email},
								timeout : 20000,
								success : function(json) {
									$.unblockUI();
									var respuesta = json;
									if (respuesta == 1) {
										toastr.success('<spring:message code="language.tags.0016"/>');
										$("#modal-fPassword").modal('hide');
									} else if (respuesta == 2) {
										toastr.warning('<spring:message code="language.tags.0017"/>');
									} else if (respuesta == 3) {
										toastr.warning('<spring:message code="language.tags.0018"/>');
									} else {
										toastr.error('<spring:message code="language.tags.0019"/>');
									}
								},
								error : function(jqXHR, textStatus, errorThrown) {
									$.unblockUI();
									if (textStatus === "timeout") {
										toastr.error('<spring:message code="language.tags.0020"/>');
									} else {
										toastr.error('<spring:message code="language.tags.0019"/>');
									}
								}
							});
						} else {
							$.unblockUI();
						}
					}
				});
			});
		});

		function display(data) {
			var json = "<h4>Ajax Response</h4><pre>" + JSON.stringify(data, null, 4) + "</pre>";
// 			$('#feedback').html(json);
		console.log(json);
		}
		
		$(".msj").change(function() {
			$('#ib').text(" ");
		});

		$('#loginForm').bootstrapValidator({
			message : '<spring:message code="language.tags.0005"/>',
			fields : {
				username : {
					validators : {
						notEmpty : {
							message : '<spring:message code="language.tags.0006"/>'
						},
					}
				},
				password : {
					validators : {
						notEmpty : {
							message : '<spring:message code="language.tags.0007"/>'
						}
					}
				}
			}
		})
		.on('success.form.bv', function(e) {
			e.preventDefault();
			var formLogin = this;
			var logged = false;
			$.ajax({
				type : "post",
				url : '${pageContext.request.contextPath}/login/isSomeOneLogged',
				success : function(data) {
					console.log("Success "+ data.principal);
					if (data.principal == $("#username").val()) {
						$(location).attr('href','${pageContext.request.contextPath}/welcome');
					} else if (data.principal == undefined || data.principal == "anonymousUser") {
						formLogin.action = "${pageContext.request.contextPath}/j_spring_security_check";
						formLogin.method = "post";
						formLogin.submit();
					} else {
						bootbox.confirm({
							message : '<spring:message code="language.tags.0021"/>: <b>' + data.principal + '</b></br><spring:message code="language.tags.0022"/>',
							size : 'small',
							buttons : {
								cancel : {
									label : '<spring:message code="language.tags.0014"/>',
									className : 'btn btn-secondary'
								},
								confirm : {
									label : '<spring:message code="language.tags.0023"/>',
									className : 'btn btn-primary'
								}
							},
							callback : function(result) {
								if (result == true) {
									$.ajax({
										type : 'GET',
										async : false,
										url : '${pageContext.request.contextPath}/logout?newSession=true',
									});
									formLogin.action = "${pageContext.request.contextPath}/j_spring_security_check";
									formLogin.method = "post";
									formLogin.submit();
								} else {
								//do anyting  if the user does not close his sesion and not opening other;
								}
							}
						});
					}
				},
				error : function(e) {
					console.log("ERROR: ", e);
					display(e);
				},
			});
		});
	</script>

</body>
</html>
