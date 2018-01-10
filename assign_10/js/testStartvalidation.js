$(document).ready(function(){
	var serverTime = new Date($('#nowTime').val()).getTime();
	var startTime = new Date($('#startTime').val()).getTime();
	var endTime = new Date($('#endTime').val()).getTime();
	var timer  = (endTime - serverTime)/1000 ;
	var t;
    timedCount();
    function timedCount()
	{
    	var hours = parseInt( timer / 3600 ) % 24;
    	var minutes = parseInt( timer / 60 ) % 60;
    	var seconds = timer % 60;
    	var result = (hours < 10 ? "0" + hours : hours) + ":" + (minutes < 10 ? "0" + minutes : minutes) + ":" + (seconds  < 10 ? "0" + seconds : seconds);       
    	$('#timer').html(result);
        if(timer == 0 )
		{
        	setConfirmUnload(false);
            $("#startTest").submit();
			window.location="tests.cfm?submitEnd";
		}
        timer = timer - 1;
        t = setTimeout(function()
		{
		 timedCount()
		},
		1000);
    }
//	setTimeOut();
//	function setTimeOut() {
//		if (serverTime >= startTime && serverTime <= endTime){
//			var timer  = endTime - serverTime;
//			setTimeout(function(){
//				onTimeOut();
//			},timer);
//		}
//		else {
//			onTimeOut();
//		}
//	}
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