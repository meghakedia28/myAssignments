$(document).ready(function(){
	$('#questions').DataTable({
		"searching": false,
		"paging": false,
		"ordering": false,
		"info": false
	});
	var serverTime = new Date($('#nowTime').val()).getTime();
	var startTime = new Date($('#startTime').val()).getTime();
	var endTime = new Date($('#endTime').val()).getTime();
	var timer  = (endTime - serverTime)/1000 ;
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
            window.location.replace("tests.cfm?submitEnd");
			
		}
        timer = timer - 1;
        setTimeout(function()
		{
		 timedCount()
		},
		1000);
    } 
    function setConfirmUnload(on) {
        window.onbeforeunload = (on) ? unloadMessage : null;
   }
    function unloadMessage() {
        return 'You have started giving the test. If you navigate away from this page the changes made will be lost.';
   }
    $(':input').bind(
            'change', function() { setConfirmUnload(true); 
    });
    $("#startTest").submit(function(event) {
		event.preventDefault();
	 	setConfirmUnload(false);
	 	 if(timer == 0 || confirm("Do you really want to submit the test?")){ 
			$.ajax({
				url : "../components/onTestSubmit.cfc?method=insertScore&"+$('#startTest').serialize(),
				data : {},
				success : function(result) {
					var obj = $.parseJSON(result);
					if (obj){
						location.replace("tests.cfm?submitEnd");
					}
					else{
						location.replace("tests.cfm?error");
					}
				}
			});
	 	 }
	 	 else
	 		 return false;
	});
});