<%@ include file="/WEB-INF/include.jsp" %>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<h3 class=n-titles><spring:message code="language.tags.0041"/></h3>
		<div class="panel-body table-responsive">
			<table class='table table-striped table-bordered table-hover table-full-width small' id=tblBitacora>
				<thead>
					<tr> 
						<th width="15%"> <spring:message code="language.tags.0041.01"/></th> 
						<th width="15%"> <spring:message code="language.tags.0041.02"/></th>
						<th width="15%"> <spring:message code="language.tags.0028.07"/></th>
						<th width="15%"> <spring:message code="language.tags.0041.03"/></th>
						<th width="20%"> <spring:message code="language.tags.0029.03"/></th>
						<th width="10%"> <spring:message code="language.tags.0041.04"/></th> 
						<th width="10%"> <spring:message code="language.tags.0041.05"/></th> 
					</tr> 
				</thead>
			</table>
		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>

<script>
	$(document).ready(function(){
 		$.blockUI({
 			message: '<span class="spinner" />',
 			css: {border:'none', backgroundColor:'transparent'}
	   	}); 
		var table1 = $('#tblBitacora').css("width","100%").DataTable({
		    buttons: [ 'copy', 'excel', 'pdf', 'colvis' ],
    		"columns" : [{className : "dt-body-center","width" : "15%"},
    		             {className : "dt-body-center","width" : "18%"},
    		             {className : "dt-body-center","width" : "10%"},
    		             {className : "dt-body-center","width" : "15%"},
    		             {className : "dt-body-center","width" : "22%"},
    		             {className : "dt-body-center","width" : "10%"},
    		             {className : "dt-body-center","width" : "10%"}
    		             ],
    		"aaSorting": [[ 1, "desc" ]],
    		"bAutoWidth" : true,
			"info" : false,
			"retrieve" : true,
			"bFilter" : true,
			"bLengthChange" : false,
			"oLanguage" : {
				"oPaginate" : {
					"sPrevious" : "<i class='fa fa-arrow-left'></i>",
					"sNext" : "<i class='fa fa-arrow-right'></i>"
				},
				"sEmptyTable" : '<spring:message code="language.tags.0029.20"/>',
				"sSearch" : '<spring:message code="language.tags.0029.12"/>',
				"sLengthMenu" : '<spring:message code="language.tags.0029.21"/>',
				"sZeroRecords": '<spring:message code="language.tags.0029.22"/>'
			}
	    }).ajax.url('${pageContext.request.contextPath}/getJSONListTBitacora.htm').load().on( 'draw.dt', function (){ $.unblockUI();});
		table1.buttons().container().appendTo( '#tblBitacora_wrapper .col-sm-6:eq(0)' );
	});
</script>