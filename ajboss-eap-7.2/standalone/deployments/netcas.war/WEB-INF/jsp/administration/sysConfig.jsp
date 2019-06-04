<%@ include file="/WEB-INF/include.jsp"%>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<h3 class="n-titles"><spring:message code="language.tags.0031.01"/></h3>
		<div class="panel-body table-responsive">
			<table id="tblConfig" class="table table-striped table-bordered table-hover  table-full-width small" cellspacing="0" width="100%" style="border-style: solid; border-width: 1px; border-radius: 5px;">
				<thead>
					<tr>
						<th><spring:message code="language.tags.0031.02"/></th>
						<th><spring:message code="language.tags.0031.03"/></th>
						<th></th>
					</tr>
				</thead>
			</table>
		</div>			
		<div class="modal-footer">	
			<button  class="btn btn-primary" onclick="updateConfig()"> <span class="glyphicon glyphicon-ok-circle"></span><spring:message code="language.tags.0031.04"/></button>
		</div>
		
	</tiles:putAttribute>
</tiles:insertDefinition>

<script>
	var tblConfig;
	var jsonConfig;	
	var tblConfigData;
	
	$(document).ready(function(){
		$.blockUI({
			message: '<span class="spinner"/>',
 			css: {border:'none', backgroundColor:'transparent'},
			baseZ: 2000
       	});
		
		loadTblConfig();
		jsonConfig = getJSONConfig();
		tblConfigData = getTblConfigData(jsonConfig);
		loadTblByData(tblConfigData);
		addDetailControl(jsonConfig);
		addDetailEvent();
		
		$.unblockUI();
	});
	
	function loadTblConfig(){
		tblConfig = $("#tblConfig").DataTable( {
	        "columns": [
	            { "data" : "descripcion",
	           	  "orderable" : false},
	            { "data" : "valor" ,
	              "orderable" : false},
	            {
	                "data" : null,
	                "defaultContent" : "",
	                "width" : "5%"
	            }
	        ],
	        "ordering" : false,
	        "info" : false,
	        "paginate": false,
	        "search": false,
	    });
	}
	function getJSONConfig(){
		var jsonConfig;
		$.ajax({
		    type: "GET",
		    async: false,
		    url: '${pageContext.request.contextPath}/administration/currentConfig', 
		    dataType: "json",
		    success: function(data){
		    	jsonConfig = data;
		    },
		    error: function(xhr) {
		    	toastr.error(xhr.statusText + xhr.responseText);
		    }
		});
		return jsonConfig;
	}
	function getTblConfigData(myJson){
	    var arrayTableData = [];	    
	    var type;
	    for(var item in myJson){
	        var tableData = {};
	        type = typeof myJson[item];
	        tableData.descripcion = item;
	        if( type == "string" || type =="boolean" || type == "number" ){
	            tableData.valor =  myJson[item];
	        }else if(myJson[item]["nombre"] != null){
	            tableData.valor = myJson[item]["nombre"];
	        }else{
	            tableData.valor = "ver detalle";
	        }
	        arrayTableData.push(tableData);
	    }
	    return arrayTableData;
	}
	
	function loadTblByData(dataSource){
		tblConfig.clear();
		tblConfig.rows.add(dataSource);
		tblConfig.draw();
	}
	
	function addDetailControl( myJson){
	    var i = 0;
	    for(var item in myJson){
	        if(typeof myJson[item] == "object"){
	            var cell = tblConfig.column(2).nodes()[i];
	            $(cell).addClass('details-control-angle');
	        }
	        i++;
	    }
	}

	
	function addDetailEvent(){
		 $('#tblConfig').on('click', 'td.details-control-angle', function () {
	          var tr = $(this).closest('tr');
	          var row = tblConfig.row(tr);
	          if (row.child.isShown()) {
	              row.child.hide();
	              tr.removeClass( 'details-angle' );
	          } else {
	              row.child(format(jsonConfig[row.data()["descripcion"]])).show();
	              tr.addClass('details-angle');
	          }
	      });
	}
	function format (dataSource) {
	    var html = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';
	    if(typeof dataSource == "object"){
	        for (var key in dataSource){
	            html += '<tr>'+
	                       '<td  style="border-style: hidden; padding: 2px 10px;"> <b>' + key             +':</b></td>'+
	                       '<td  style="border-style: hidden; padding: 2px 10px;">' + dataSource[key] +'</td>'+
	                    '</tr>';
	        } 
	    }else{
	        html += '<tr> </tr>'
	    }
	    return html += '</table>';  
	}
	
	function updateConfig(){
		$.blockUI({
			message: '<span class="spinner"/>',
 			css: {border:'none', backgroundColor:'transparent'},
			baseZ: 2000
       	});
		$.ajax({
		    type: "GET",
		    url: '${pageContext.request.contextPath}/administration/updateConfig', 
		    dataType: "json",
		    success: function(data){
		    	console.log(data);
		    	if(data){
		    		jsonConfig = getJSONConfig();
		    		tblConfigData = getTblConfigData(jsonConfig);
		    		loadTblByData(tblConfigData);
		    		addDetailControl(jsonConfig);
		    		toastr.success('Parametros actualizados');
		    	}else {
		    		toastr.error('Hay procesos en ejecución... intente mas tarde');
		    	}
		    	$.unblockUI();
		    },
		    error: function(xhr) {
		    	toastr.error(xhr.statusText + xhr.responseText);
		    	$.unblockUI();
		    }
		});
	}
</script>