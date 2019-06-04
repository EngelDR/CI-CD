<%@ include file="/WEB-INF/include.jsp" %>

<tiles:insertDefinition name="defaultTemplate">
<tiles:putAttribute name="body">

<head>
<style>

#chartReport{
	min-height: 500px;
}
</style>
</head>
		<!-- start: DYNAMIC TABLE PANEL -->
		<div class="panel panel-white">
<!-- 			<div class="panel-heading"> -->
				<h3 class="n-titles"><spring:message code="language.tags.0039.03.01"/></h3>												
<!-- 			</div> -->
			<div class="table-responsive">
				<table id="tblCRQsWelcome" class="table table-striped table-bordered table-hover table-full-width small">
					<thead>
						<tr>
							<th rowspan="2"><spring:message code="language.tags.0038.03.02"/></th>
							<th rowspan="2"><spring:message code="language.tags.0038.03.03"/></th>
							<th colspan="3"><spring:message code="language.tags.0038.03.04"/></th>
							<th rowspan="2"><spring:message code="language.tags.0038.03.05"/></th>
							<th rowspan="2"><spring:message code="language.tags.0038.03.06"/></th>
							<th rowspan="2"><spring:message code="language.tags.0038.03.07"/></th>
						</tr>
						<tr>
							<th><spring:message code="language.tags.0038.03.08"/></th>
							<th><spring:message code="language.tags.0038.03.09"/></th>
							<th><spring:message code="language.tags.0038.03.10"/></th>
						</tr>
					</thead>
				</table>
				<div id="chartReport" class="n-chart-report"></div>
			</div>
		</div>

		<!-- end: DYNAMIC TABLE PANEL -->
		
				<div class='modal fade' id='VerDetalles' tabindex='-1'>
						<div class='modal-dialog modal-lg'>
							<div class='modal-content panel-primary'
								style="font-size: x-small;">
								<div class='modal-header'>
									<button type='button' class='close' data-dismiss='modal'
										aria-label='Close'>
										<span aria-hidden='true'>&times;</span>
									</button>
									<h3 class='panel-title'>
										<spring:message code="language.tags.0038.03.11"/>
									</h3>
								</div>
								<div class='modal-body panel-body table-responsive'>
									<table id='tblCRQByC01Tipo'
										class='table table-striped table-bordered table-hover   display table-full-width'
										style='width: 100%'>
										<thead>
											<tr> 
											<th><spring:message code="language.tags.0029.02"/></th> 
											<th><spring:message code="language.tags.0038.03.12"/></th> 
											<th><spring:message code="language.tags.0038.03.13"/></th>
											<th><spring:message code="language.tags.0038.03.14"/></th>
											<th><spring:message code="language.tags.0037.05"/></th>
											<th><spring:message code="language.tags.0038.01"/></th> 
											<th><spring:message code="language.tags.0038.03.15"/></th> 
										</tr> 
										</thead>
									</table>									
								</div>
							</div>
						</div>
					</div>
		
		
		
	</tiles:putAttribute>
	</tiles:insertDefinition>	
	<script>
	var table;
	$(document).ready(function(){
		$.blockUI({
			message: '<span class="spinner"/>',
 			css: {border:'none', backgroundColor:'transparent'}
       	});
		
		var Role = 'AdminRi';
		table=$('#tblCRQsWelcome').DataTable({	
    		"columns" : [
    		             {className : "dt-body-center","width" : "5%", "orderable": false},
    		             {className : "dt-body-center","width" : "5%", "orderable": false},
    		             {className : "dt-body-center","width" : "5%", "orderable": false},
    		             {className : "dt-body-center","width" : "5%", "orderable": false},
    		             {className : "dt-body-center","width" : "5%", "orderable": false},
    		             {className : "dt-body-center","width" : "20%", "orderable": false},
    		             {className : "dt-body-center","width" : "20%", "orderable": false},
    		             {className : "dt-body-center","width" : "5%", "orderable": false}
    		             ],              		             
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
				"sEmptyTable" : '<spring:message code="language.tags.0029.23"/>',
				"sSearch" : '<spring:message code="language.tags.0029.12"/>',
				"sLengthMenu" : '<spring:message code="language.tags.0029.21"/>',
				"sZeroRecords": '<spring:message code="language.tags.0029.22"/>'
			}
	    }).ajax.url('${pageContext.request.contextPath}/getJSONListStatisticalReport?Role='+Role).load().on( 'draw.dt', function (){
	    	$.unblockUI();
	    	activaGrafica();	    				
	    });
	});
	
	function CRQByC01tipo(idc01tipo){
		$.blockUI({
			message: '<span class="spinner"/>',
 			css: {border:'none', backgroundColor:'transparent'}
       	});
		var table =  $('#tblCRQByC01Tipo').DataTable({	
    		"columns" : [{className : "dt-body-center","width" : "25%"},
    		             {className : "dt-body-center","width" : "20%"},
    		             {className : "dt-body-center","width" : "25%"},
    		             {className : "dt-body-center","width" : "15%"},
    		             {className : "dt-body-center","width" : "20%"},
    		             {className : "dt-body-center","width" : "25%"},
    		             {className : "dt-body-center","width" : "15%"}
    		             ],
    		"bAutoWidth" : true,
    		"ordering": false,
			"info" : false,
			"retrieve" : true,
			"bFilter" : true,
			"bLengthChange" : false,
			"oLanguage" : {
				"oPaginate" : {
					"sPrevious" : "<i class='fa fa-arrow-left'></i>",
					"sNext" : "<i class='fa fa-arrow-right'></i>"
				},
				"sEmptyTable" : '<spring:message code="language.tags.0029.23"/>',
				"sSearch" : '<spring:message code="language.tags.0029.12"/>',
				"sLengthMenu" : '<spring:message code="language.tags.0029.21"/>',
				"sZeroRecords": '<spring:message code="language.tags.0029.22"/>'
			}
	    }).ajax.url('${pageContext.request.contextPath}/consult/getJSONListCRQsByC01tipo?idc01tipo='+idc01tipo).load().on( 'draw.dt', function (json){
	    	$.unblockUI();
	    });
	}
	
	function activaGrafica(){
		var dataProvider = [];
		$.each(table.data(), function (index, value) {
			var currentData = {nombre: value[1],
								valor: value[5].match(/[0-9]+.+[0-9]/)[0],
								color: '#'+Math.floor(Math.random()*16777215).toString(16)};			
			dataProvider[index] = currentData;
		});
		chartReportConfig(dataProvider);
	}
	
	function chartReportConfig(dataprovider){
		var chart = AmCharts.makeChart("chartReport", {
		    "theme": "light",
		    "type": "serial",
		    "startDuration": 2,
		    "dataProvider": dataprovider,
		    "valueAxes": [{
		        "position": "left",
		        "title": '<spring:message code="language.tags.0038.03.16"/>'
		    }],
		    "graphs": [{
		        "balloonText": "[[category]]: <b>[[value]] <spring:message code='language.tags.0038.03.17'/> </b>",
		        "colorField": "color",
		        "fillAlphas": 0.85,
		        "lineAlpha": 0.1,
		        "type": "column",
		        "topRadius":0.7,
		        "valueField": "valor"
		    }],
		    "depth3D": 40,
			"angle": 30,
		    "chartCursor": {
		        "categoryBalloonEnabled": false,
		        "cursorAlpha": 0,
		        "zoomable": false
		    },
		    "categoryField": "nombre",
		    "categoryAxis": {
		        "gridPosition": "start",
		        "labelRotation": 45

		    },
		    "export": {
		    	"enabled": true
		     }

		}, 0);
		
		/* var chart = AmCharts.makeChart("chartReport1", {
		    "type": "serial",
			"startDuration": 2,
		    "dataProvider": dataprovider,
		    "valueAxes": [{
		        "position": "left",
		        "title": "Tiempo promedio de ejecución"
		    }],
		    "graphs": [{
		        "balloonText": "[[category]]: <b>[[value]] minutos.</b>",
		        "fillAlphas": 1,
		        "lineAlpha": 0.1,
		        "type": "column",
		        "valueField": "valor"
		    }],
		    "depth3D": 20,
			"angle": 30,
		    "chartCursor": {
		        "categoryBalloonEnabled": false,
		        "cursorAlpha": 0,
		        "zoomable": false
		    },
		    "categoryField": "nombre",
		    "categoryAxis": {
		        "gridPosition": "start",
		        "labelRotation": 90
		    },
		    "export": {
		    	"enabled": true
		     }

		}); */
    }
	
	

	</script>
	
	


