// A $( document ).ready() block.
$( document ).ready(function() {
    console.log( "ready!" );
    $.ajax({
    	type: 'Get',
        // url: 'http://cvyhj3a27:8181/penetration/getchart?cType=MP',
    	
    	
        //url: 'http://localhost:8181/webreport/getchart?cType=LHP',
        url: 'http://localhost:8181/penetration/getchart?cType=MP',
        dataType: "json",
        success: function(data) {
        	console.log(data);
        	var month_arr = [];
        	var sales_arr = [];
        	var pen_arr = [];
        	//var ca_arr = [];
        	
        
        	var month_val = "";
        	var sales_val = "";
        	var pen_val = "";
         
        	
        	for (var i in data) {
        		console.log("*** I:" +  i);
        		console.log("*** month" + data[i].month);
        		console.log("^^^ sales:" + data[i].sales);
        		console.log("*** pen:" + data[i].pen);
        		//console.log("creditapproval:" + data[i].creditapproval);
        		 
        		
        		month_arr.push(data[i].month)
        		sales_arr.push(data[i].sales)
        		pen_arr.push(data[i].pen)
        		//ca_arr.push(data[i].creditapproval)
        		
        		
        		sales_val = data[i].sales;
        		/* 
        		os_val = data[i].Order_Submitted;
        		dr_val = data[i].Docs_Received;
        		mi_val = data[i].Doc_Missing_Info;
        		*/
        		
        		
        		
        		//ca_val = data[i].Need_Credit_Approval;
        		console.log("^^^^^ Sales:" + sales_val);
        		//console.log("^^^^^ dr:" + dr_val);
        		//console.log("^^^^^ mi:" + mi_val);
        		//console.log("********** DR:" + data[i].Docs_Received);
        		//console.log("***********OS:" + data[i].Order_Submitted);
        		
        	}
        	var month = sales_arr[0];
        	var sales = pen_arr[0];
        	 var color_arr = [
        		 "#0000FF",    "#0000FF",   "#0000FF",  "#0000FF",   "#0000FF",   "#0000FF",   "#0000FF",   "#0000FF",  "#0000FF",   "#0000FF",   "#0000FF",   "#0000FF"     ];     	 
        	 var color_arr2 = [
        		  "#ba1ece",    "#ba1ece",   "#ba1ece",   "#ba1ece",   "#ba1ece",  "#ba1ece",   "#ba1ece",   "#ba1ece",   "#ba1ece",   "#ba1ece",  "#ba1ece",   "#ba1ece" ];

        	 
 	 
/******************************************************************************************************************************************************************/
     var config = {
      	  type: 'bar',
      	
   
      	data: {	 
  		  labels: month_arr,  
  	    datasets: [	 	    	
  	        {
  	        	type: 'line',
	            	//backgroundColor:color_arr2,	
	            	fill: true,
	            	backgroundColor: "rgba(255, 255, 153, 0.8)",
	      	      label: 'Penetration',
	      	      yAxisID: 'B',      	    
	      	    // data: [pen_arr[0],  pen_arr[1], pen_arr[2], pen_arr[3],  pen_arr[4], pen_arr[5]  ]
	      	     data: pen_arr  
	      	    
	      	    },
	            
	            {	   
	            	backgroundColor:color_arr,
	            	label: 'Dollars',	 
		      	      yAxisID: 'A',
		      	     // data: [sales_arr[0], pen_arr[0]]	 
		      	     //data: [sales_arr[0],  sales_arr[1],     sales_arr[2],   sales_arr[3], sales_arr[4], sales_arr[5]  ]
	            data:  sales_arr   
	            }     
	          ]	    
  	  },
    	
    	  options: {
    	 
    		   
    		  title: {
                  display: true,
                  text: 'Penetration Report'
              },
    	    scales: {
  	    	 
    	      yAxes: [
  
    	    	  {       
    	    		  id: 'A',
    	    			title: "Dollars",
                		titleFontSize: 16,
                		position: 'right',
                            display: true,
                            ticks: {
                                beginAtZero: true,
                                //max: 1000000000,
               	        	 	//min: -1000000000,
               	        	 	//stepSize: 1000,
                                
                                
                                callback: function(value, index, values) {
                                    if(parseInt(value) >= 1000){
                                      return '$' + value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                    } else {
                                      return '$' + value;
                                    }
                                },
                                //steps: 10,
                                //stepValue: 5,
                                 //max:  100000000000,
                                 //min: -100000000000,
                            }
    	    	  
    	      }, 
    	      
    	      
    	      
    	      {
    	        id: 'B',
    	        title: "Penetration",
    	        type: 'linear',
    	        position: 'left',
    					ticks : {
    						beginAtZero: true,
    	        	max: 100,
    	        	min: 0,
    	          stepSize: 10,
    	          
    	          
    	          
    	        }
    	      
    	      
    	      
    	      
    	      }]
    	  
    	    }
    	  
    	  }
        	
     }      	
/******************************************************************************************************************************************************************/
        	
        	  var ctx = document.getElementById("mycanvasMP").getContext("2d");
              new Chart(ctx, config);
        	
        	//console.log("************** OS: " + os_arr[0] );
        	//console.log("************** DR: " + dr_arr[0] );
        }, // end ajax success
        error:	function(data) {
        	console.log(data);
        },  // end ajax error
        
    }); // end ajax
  
});