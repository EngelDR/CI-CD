<%@ include file="/WEB-INF/include.jsp" %>
<%@page import="mx.com.telcel.oym.netcas.constante.EConstante"%>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<!-- start: DYNAMIC TABLE PANEL -->
		<div id="page2" class="panel panel-white">
			<h3 class="n-titles"><spring:message code="language.tags.0045.03.01"/></h3>
	      	<table class='table table-striped table-bordered table-hover table-full-width small' id="tblCrqAplazado">
				<thead>
					<tr>
						<th width="15%"><spring:message code="language.tags.0045.03.02"/></th>
						<th width="5%"><spring:message code="language.tags.0038.01.09"/></th>
						<th width="5%"><spring:message code="language.tags.0037.05"/></th>
						<th width="25%"><spring:message code="language.tags.0038.03.15"/></th>
						<th width="30%"><spring:message code="language.tags.0045.03.03"/></th>
						<th width="20%"><spring:message code="language.tags.0041.02"/></th>
					</tr>
				</thead>
			</table>
			<div class="modal-footer">
				<button id="btnCloseAll" class="btn btn-primary" onclick="fCerrarCRQ();" >
					<span class="glyphicon glyphicon-plus"></span> <spring:message code="language.tags.0045.03.04"/>					
				</button>
			</div>
		</div>
</tiles:putAttribute>
</tiles:insertDefinition>

<script>
    var tblCrqAplazado;
    var crqS = [];
    
    $(document).ready(function(){
       tblCrqAplazado = $('#tblCrqAplazado').DataTable(tblConfig());
       
      $.blockUI({
        message: '<span class="spinner"/>',
         css: {border:'none', backgroundColor:'transparent'}
           });
      $.ajax({
        type : "post",
        url : '${pageContext.request.contextPath}/administration/getcrqAplazado',
        dataType : "json",
        success : function(data) {
		$.each(data, function(x, itemx) {
			$.each(itemx, function(y, itemy) {
				tblCrqAplazado.row.add(itemy).draw().node();
				console.log("nuevo SQL  " + itemy[0] + " - " + itemy[6] + "...................");
				var obj = {'crq':itemy[0], 'id_cestatus':itemy[6]}
				crqS.push(obj);
			});
		});          
          console.log(crqS);
		$.unblockUI();
        },
        error : function(jqXHR, textStatus, errorThrown) {  
          $.unblockUI();
          if (textStatus === "timeout") {
            toastr.error('<spring:message code="language.tags.0020"/>');
          } else {
            toastr.error(jqXHR.responseText);
          }        
        }
      });
    });

    function fCerrarCRQ(){
        setCloseCrq(crqS);
    }
    
    function setCloseCrq(DataJson) {
        $.blockUI({
          message: '<span class="spinner"/>',
           css: {border:'none', backgroundColor:'transparent'}
             });
        $.ajax({
            url: '${pageContext.request.contextPath}/administration/setCloseCrq',
                 type: 'POST',
                 dataType : 'json',
              data: {DataJson:JSON.stringify(DataJson)},
                timeout: 15000,
                success: function (json) {
                 $.unblockUI();       
                var respuesta= json;
                 if(respuesta==1){
                    toastr.success('<spring:message code="language.tags.0045.03.05"/>');
                 }else if(respuesta==2){
                	 toastr.warning('<spring:message code="language.tags.0045.03.06"/>');
               	 }else{
               		 toastr.error('<spring:message code="language.tags.0045.03.07"/>');
               	 }

            },
            error: function(jqXHR, textStatus, errorThrown) {   
				$.unblockUI();
	                if(textStatus === "timeout") {
	                    toastr.error('<spring:message code="language.tags.0020"/>');                        
	                }else {
	                   toastr.error('<spring:message code="language.tags.0045.03.08"/>');
	                }
          	}
        });
      }
    
    function tblConfig(){
      var table_config = {  
          "responsive": true,
          "lengthChange": false,
          "info": false,
          "searching": true,
          "paginate": true,
          "retrieve": true,
          "oLanguage" : {
			"oPaginate" : {
				"sPrevious" : "<i class='fa fa-arrow-left'></i>",
				"sNext" : "<i class='fa fa-arrow-right'></i>"
			},
			"sEmptyTable" : '<spring:message code="language.tags.0029.20"/>',
			"sSearch" : '<spring:message code="language.tags.0029.12"/>',
			"sLengthMenu" : '<spring:message code="language.tags.0029.21"/>',
			"sZeroRecords": '<spring:message code="language.tags.0029.22"/>'
		},
          "columns" : [
            {className : "dataTables_empty", "orderable": true},
            {className : "dataTables_empty", "orderable": true},
            {className : "dataTables_empty", "orderable": true},
            {className : "dataTables_empty", "orderable": true},
            {className : "dataTables_empty", "orderable": true},
            {className : "dataTables_empty", "orderable": true}
          ],
      };
      return table_config;
    }
</script>

