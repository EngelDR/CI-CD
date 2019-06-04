<%@ include file="/WEB-INF/include.jsp"%>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<style>
			.n-body-content .page-wrapper {
			background-color: transparent;
			border-style: none;
		}
		</style>
		<div id="page1" class="container-fluid">
			<div class="row">
				<div class="col-xs-12 col-md-6">
					<div id="card1" class="col-12 n-card"></div>
				</div>
				<div class="col-xs-12 col-md-6">
					<div id="card2" class="col-12 n-card"></div>
				</div>
			</div>
			<div class="row"></div>
		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>
<script>
	$(document).ready(function() {
		getChartDataCrqByProcess();
		getChartDataCrqByType();
	});

	//Obtiene json con datos de los diferentes crq's a graficar 
	function getChartDataCrqByProcess() {
		var jsonResult;
		$.ajax({
			url : '${pageContext.request.contextPath}/consult/getJSONCountCrqByProcess',
			type : 'GET',
			success : function(data) {
				$.each(data, function(index, value) {
					value.color = '#' + Math.floor(Math.random() * 16777215).toString(16);
					data[index] = value;
				})
				chartConfig1(data);
				$.unblockUI();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				$.unblockUI();
			}
		});
		return jsonResult;
	}

	//Creacion de la grafica 2		
	function getChartDataCrqByType() {
		var jsonResult;
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : "${pageContext.request.contextPath}/consult/getJSONCountTcrqByType",
			success : function(result) {
				$.each(result, function(index, value) {
					value.color = '#' + Math.floor(Math.random() * 16777215).toString(16);
					result[index] = value;
				})
				chartConfig2(result);
				$.unblockUI();
			},
			error : function(xhr) { // if error occured
				$.unblockUI();
			},
		});
		return jsonResult;
	}

	//Configuración de la grafica 1: 
	function chartConfig1(dataprovider) {
		var chart = AmCharts.makeChart("card1", {
			"type" : "pie",
			"titles" : [ {
				"text" : '<spring:message code="language.tags.0044.03"/>',
				"size" : 16,
				"color" : "#2c3e50",
				"font-size" : "2em",
				"font-weight" : "bold"
			} ],
			"theme" : "none",
			"innerRadius" : "30%",
			"labelRadius": 0,
			"gradientRatio" : [ -0.4, -0.4, -0.4, -0.4, -0.4, -0.4, 0, 0.1,	0.2, 0.1, 0, -0.2, -0.5 ],
			"dataProvider" : dataprovider,
			"balloonText" : "[[value]]",
			"valueField" : "valor",
			"titleField" : "nombre",
			"colorField" : "color",
			"balloon" : {
				"drop" : true,
				"adjustBorderColor" : false,
				"fontSize" : 12
			},
			"legend" : {
				"enabled" : true,
				"align" : "center",
				"markerType" : "circle"
			},
			"export" : {
				"enabled" : true,
				"menu" : [ {
					"class" : "export-main",
					"menu" : [ {
						"label" : '<spring:message code="language.tags.0044.04"/>',
						"menu" : [ "PNG", "JPG", "CSV" ]
					} ]
				} ]
			}
		});
	}

	//Configuración de la grafica 2
	function chartConfig2(dataprovider) {
		var chart = AmCharts.makeChart("card2", {
			"type" : "serial",
			"titles" : [ {
				"text" : '<spring:message code="language.tags.0044.08"/>',
				"size" : 16,
				"color" : "#2c3e50",
				"font-size" : "2em",
				"font-weight" : "bold"
			} ],
			"dataProvider" : dataprovider,
			"startDuration" : 2,
			"valueAxes" : [ {
				"position" : "left",
				"axisAlpha" : 0,
				"gridAlpha" : 0
			} ],
			"graphs" : [ {
				"balloonText" : "[[category]]: <b>[[Cantidad]]</b>",
				"colorField" : "color",
				"fillAlphas" : 10.85,
				"lineAlpha" : 0.1,
				"type" : "column",
				"topRadius" : .50,
				"valueField" : "Cantidad"
			} ],
			"depth3D" : 60,
			"angle" : 10,
			"chartCursor" : {
				"categoryBalloonEnabled" : false,
				"cursorAlpha" : 0,
				"zoomable" : false
			},
			"categoryField" : "Nombre",
			"categoryAxis" : {
				"gridPosition" : "start",
				"axisAlpha" : 0,
				"gridAlpha" : 0

			},
			"balloon" : {
				"drop" : true,
				"adjustBorderColor" : false,
				"fontSize" : 12
			},
			"export" : {
				"enabled" : true,
				"menu" : [ {
					"class" : "export-main",
					"menu" : [ {
						"label" : '<spring:message code="language.tags.0044.04"/>',
						"menu" : [ "PNG", "JPG", "CSV" ]
					} ]
				} ]
			}
		});
	}
</script>