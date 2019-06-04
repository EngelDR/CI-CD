	var nTextAreaConfig = {
			defaultText: "Inserte un valor",
			defaultId : "nTexAreaElementsList",
			defautlRegexp: /,/g,
			splited: true,
			separator: ",",
			size: 0,
			allTextArea: {},
	};
	function nTextArea(textArea){
		var currentId = textArea[0].id + "NList";
		textArea.before("<div id='"+currentId+ "' class='n-crq-list'></div>");
		textArea.before("<textarea id='"+textArea[0].id+"NInput' class='n-crq-text' placeholder='" + textArea[0].placeholder + "'></textarea>");
		textArea.hide();
		
		var listContainer = $("#"+currentId);
		
		nTextAreaConfig.size = nTextAreaConfig.size + 1;
		nTextAreaConfig.allTextArea[currentId] = {};
		nTextAreaConfig.allTextArea[currentId].countKeyUp = 0;
		nTextAreaConfig.allTextArea[currentId].textArea = $("#"+textArea[0].id+"NInput");
		nTextAreaConfig.allTextArea[currentId].textArea.keydown(function (event) {
			if (event.which == 13) {
				event.preventDefault();
				nTextAreaConfig.allTextArea[currentId].countKeyUp = 0;
				var inputText = nTextAreaConfig.allTextArea[currentId].textArea.val().toUpperCase();
				var matches;
				if(nTextAreaConfig.splited){
					matches = inputText.split(nTextAreaConfig.defautlRegexp);
				}else{
					matches = inputText.match(nTextAreaConfig.defautlRegexp);
				}				
				$.each(matches, function(index, value){
					addCrq(value, nTextAreaConfig.allTextArea[currentId].textArea, listContainer, textArea);
				});												
			}else if(event.which == 38){
				event.preventDefault();
				var list = $("#"+currentId + " > button");
				if(list.length>0 && nTextAreaConfig.allTextArea[currentId].countKeyUp>=0 && nTextAreaConfig.allTextArea[currentId].countKeyUp <list.length){
					nTextAreaConfig.allTextArea[currentId].countKeyUp++;				
					nTextAreaConfig.allTextArea[currentId].textArea.val(list[list.length -nTextAreaConfig.allTextArea[currentId].countKeyUp ].innerText);
				}else if(list.length == 0){
					nTextAreaConfig.allTextArea[currentId].textArea.val(nTextAreaConfig.defaultText);
				}
			}else if(event.which == 40){
				event.preventDefault();
				var list = $("#"+currentId + " > button");
				if(list.length>0 && nTextAreaConfig.allTextArea[currentId].countKeyUp>1 && nTextAreaConfig.allTextArea[currentId].countKeyUp <=list.length){
					nTextAreaConfig.allTextArea[currentId].countKeyUp--;
					nTextAreaConfig.allTextArea[currentId].textArea.val(list[list.length -nTextAreaConfig.allTextArea[currentId].countKeyUp ].innerText);
				}
			}		
		});
	}
	
	
	function addCrq(newValue, textArea, listContainer, originalTextArea){
		var message = validation(newValue);
		if(!message){
			textArea.css("color", "black").val("");
			listContainer.append("<button title='quitar' onclick = 'this.remove(); updateTextArea(\""+originalTextArea[0].id+"\");'>" + newValue + "<i class='fa fa-remove'><i/>" + "</button>");
			originalTextArea.val(getValues(originalTextArea, nTextAreaConfig.separator));
		}
		return message;
	}
	
	function updateTextArea(id){
		ta = $("#"+id);
		ta.val(getValues(ta, nTextAreaConfig.separator));		
	}
	
	function validation(newValue){
		var msg = "";
		if(!newValue){
			msg = "El valor no debe estar vacio";
		}
		return msg;
	}
	
	function getValues(textArea, separator){
		var s = "";
		$.each($("#" + textArea[0].id + "NList>button"), function (index, value) {
			if(index == 0){
				s += value.innerText;
			}else{
				s += separator + value.innerText;
			}
		});
		return s;
	}