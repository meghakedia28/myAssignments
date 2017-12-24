$(document).ready(function(){
	var serverTime = new Date($('#nowTime').val()).getTime();
	var startTime = new Date($('#startTime').val()).getTime();
	var endTime = new Date($('#endTime').val()).getTime();
	setTimeOut();
	function setTimeOut() {
		if (serverTime >= startTime && serverTime <= endTime){
			var timer  = endTime - serverTime;
			setTimeout(function(){
				onTimeOut();
			},timer);
		}
		else {
			onTimeOut();
		}
	}
	$("#startTest").submit(function(event) {
		event.preventDefault();
		$.ajax({
			url : "../components/onTestSubmit.cfc?method=insertScore&"+$('#startTest').serialize(),
			data : {},
			success : function(result) {
				var obj = $.parseJSON(result);
				if (obj == true){
				window.location.replace("tests.cfm?submitEnd");
				}
				else
					window.location.replace("tests.cfm?error");
			}
		});
		
	});
	
	function onTimeOut() {		
		window.location.replace("tests.cfm?endTest");
		
	}
});