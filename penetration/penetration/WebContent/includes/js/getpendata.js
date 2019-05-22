$(document).ready(function() {
	$('#userName').blur(function() {
		$.ajax({
			type: 'Get',
			url : 'http://localhost:8181/penetration/getchart?cType=ENT',
			data : form_data,
			success : function(response) {
			    		
				 console.log(response);
				    var json_obj = $.parseJSON(response);//parse JSON
            
            var output="<ul>";
            for (var i in json_obj) {
             
                output+="<li>" + json_obj[i].Language + ",  " + json_obj[i].ID + "</li>";
                alert("ID"+ json_obj[i].ID);
            }
            output+="</ul>";
            
            //$('span').html(output);
				
				
			},
			
			dataType: "json"//set to JSON    
		});
	});
});