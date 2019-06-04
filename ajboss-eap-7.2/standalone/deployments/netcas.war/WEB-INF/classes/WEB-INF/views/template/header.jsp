<%@ include file="/WEB-INF/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>NetCAS</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="<c:url value="/resources/theme/img/telcel.ico" />" />
    <link rel="stylesheet" media="screen" href="<c:url value="/resources/theme/lib/bootstrap-3.3.7/css/bootstrap.min.css" />" />
    <link rel="stylesheet" media="screen" href="<c:url value="/resources/theme/lib/font-awesome-4.7.0/css/font-awesome.min.css" />" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/theme/lib/data-tables/datatables.min.css"  />" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/theme/lib/data-tables/data-tables-1.10.16/css/dataTables.bootstrap.min.css" />" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/theme/lib/data-tables/buttons-1.5.1/css/buttons.bootstrap.min.css" />" />

	<link href="<c:url value="/resources/theme/lib/bootstrap-3.3.7/css/bootstrap-switch.css" />" rel="stylesheet" media="screen">
	<link href="<c:url value="/resources/theme/lib/toastr/toastr.css" />" rel="stylesheet" media="screen">
	<link href="<c:url value="/resources/theme/lib/chosen/chosen.min.css" />" rel="stylesheet" media="screen">
	<link href="<c:url value="/resources/theme/lib/data-range-picker/css/daterangepicker.css" />" rel="stylesheet" media="screen">

    <link rel="stylesheet" media="screen" href="<c:url value="/resources/theme/css/application.css" />" />
    <link rel="stylesheet" media="screen" href="<c:url value="/resources/theme/lib/font-awesome-4.7.0/css/font-awesome.min.css" />" />
    <link rel="stylesheet" media="screen" href="<c:url value="/resources/theme/lib/tail.select-master/css/tail.select-default-blue.css" />" />

	<link rel="stylesheet" media="screen" href="<c:url value="/resources/theme/css/jquery.jscrollpane.css" />" />
	<link rel="stylesheet" media="screen" href="<c:url value="/resources/theme/css/jquery.jscrollpane.lozenge.css" />" />

    <script src="<c:url value="/resources/theme/lib/jquery-3.3.1/jquery-3.3.1.min.js" />"></script>
	<script>
		$(document).ready(function (){
			if ('${pageContext.response.locale}' == 'es'){	
				$("#langIco").attr('href', '?lang=en');
		   		$("#imgIco").attr("src","/netcas/resources/theme/img/uss.ico"); 			
		   	}else if('${pageContext.response.locale}' == 'en'){
		   		$("#langIco").attr('href', '?lang=es');
		   		$("#imgIco").attr("src","/netcas/resources/theme/img/mex.ico");
		   	}
	    });
	</script>
</head>

<body>
    <div id="wrapper">
        <!--Header-->
        <nav class="navbar navbar-default n-header" role="navigation">
            <a class="navbar-brand" href="#" style="padding-right: 5;"><spring:message code="name.system"/></a>
            <a class="StyleVersion"><spring:message code="name.system.version"/></a>
            <ul class="nav navbar-nav pull-right">
				<li id="thumbs">
					<a href="?lang=es" id="langIco" style="padding-right: 0;"><img id="imgIco" src="${pageContext.request.contextPath}/resources/theme/img/uss.ico" alt="Icono" width="25" height="20"/></a>
				</li>
           		<li class="dropdown user">
                    <a id="userProfileName" class="dropdown-toggle" data-toggle="dropdown" href="#" style="padding-left: 5;">
                        <i class="fa fa-user"></i> 
                        	<strong>
                        		${sessionScope.tUsuario.nombreCompleto}
                        	</strong> 
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a id="aEditUserProfile" onclick='getUserProfile()' href='#'><spring:message code="language.tags.0028"/></a></li>
                		<sec:authorize access="hasAuthority('${applicationScope.rol_Administrador}')">
	                        <li class='divider'></li>
	                        <li><a id="aCfgParams" onclick='getDataCParameters()' href='#'><spring:message code="language.tags.0029"/></a></li>
	                    </sec:authorize>
	                    <sec:authorize access="hasAuthority('${applicationScope.rol_Administrador}')">
	                        <li class="divider"></li>
	                        <li><a id="aCfgParams" href="${pageContext.request.contextPath}/administration/systemConfig.htm"><spring:message code="language.tags.0031"/></a></li>
	                    </sec:authorize>
                        <li class='divider'></li>
                        <li><a href="${pageContext.request.contextPath}/logout.htm"><spring:message code="language.tags.0030"/></a></li>
                    </ul>
                </li>
            </ul>
        </nav>
     
     	<div id="modalParameters" class="modal fade bd-example-modal-lg">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<a href="" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span></a>
						<h4 class="modal-title" id="allTitleeeee"><spring:message code="language.tags.0029.01"/></h4>
					</div>
					<div class="modal-body panel-body table-responsive">										
						<table id='tblParameters'class="table table-striped table-bordered table-hover table-full-width small">
							<thead>
								<tr> 										
									<th width="30%"><spring:message code="language.tags.0029.02"/></th> 
									<th width="60%"><spring:message code="language.tags.0029.03"/></th> 
									<th width="10%"><spring:message code="language.tags.0029.04"/></th>
								</tr> 
							</thead>
						</table>									
					</div>						
				</div>
			</div>
		</div>

		<!--  start: EDITAR PARAMETER -->
		<div class="modal fade" id="modalEditParametros" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<a href="" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span></a>
						<h4 class="modal-title" id="allTitlesss"><spring:message code="language.tags.0029.05"/></h4>
					</div>
					<form class="formParameter" id="formParameter">
						<div class="modal-body">
							<div class="form-content">
								<div class="form-group">
									<div class="row">
										<div class="form-group col-sm-6">
											<input type="hidden" id="idParameter">
											<label for="NombreParameter" class="control-label"><spring:message code="language.tags.0029.02"/>:</label>
											<input type="text" class="form-control" id="NombreParameter" maxlength="100" required 
											oninvalid='setCustomValidity("<spring:message code="language.tags.0029.07"/>")' oninput="setCustomValidity('')">
										</div>
										<div class="form-group col-sm-6">
											<label for="ValorParameter" class="control-label"><spring:message code="language.tags.0029.03"/>:</label>
											<input type="text" class="form-control" id="ValorParameter" maxlength="140" required 
											oninvalid='setCustomValidity("<spring:message code="language.tags.0029.08"/>")' oninput="setCustomValidity('')">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
								<button id="btnEditRow" type="submit" class="btn btn-primary"> <span class="glyphicon glyphicon-ok"></span> 
								<spring:message code="language.tags.0029.06"/> </button>
						</div>
					</form>
				</div>
			</div>			
		</div>		<!-- end: MODAL ALTA || EDITAR & ELIMINAR USUARIO -->
		