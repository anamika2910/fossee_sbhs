<%-- 
    Document   : add
    Created on : 3 Jun, 2016, 4:05:09 PM
    Author     : root
--%>

<%@page import="org.scilab.modules.javasci.Scilab"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<head>
        <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
        <title>SCILAB</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <style type="text/css">
      #slider {
    margin: 10px;
}
    #slider1 {
    margin: 10px;
}
    .ui-slider .ui-slider-handle {
    height: 15px;
    width: 5px;
    padding-left: 5px;
}
    .ui-slider-horizontal {
    height: 8px;
    width: 200px;
}
  </style>
  <script>
   function start(){
        var eventSource = new EventSource("ser1");
          var no1= $("#no1").val();
          var no2 = $("#no2").val();
          $.ajax({
                url: "ser1",
                type: 'GET',   
                dataType: 'text',
                data: {
                    mypostvar: no1,
                    mypostvar1: no2
                },
                
                success: function (data) {
        if(data){
            if(data.split(":")[1]!==0.0)
                   document.getElementById('msg').innerHTML=data.split(":")[1];
               }
                }
                
            });    
      
       
    }
   
            
</script>
  
  
    </head>
    <body>
         <h1>ADDITION VIA SCILAB</h1>
         <form method="post" >
             NO1:<input id ="no1"><div id="slider"></div>
              NO2:  <input id="no2"> <div id="slider1"></div>
              
         </form>
         
        <h2 id="msg" ></h2>
         

<script>
  $(function() {
    $( "#slider" ).slider({
     orientation: "horizontal",
    max: 100,
    step: 1,
    change: function(event, ui) {
      $('#no1').attr('value', ui.value);
    },
    min: 0
    });
  });
  $(function() {
    $( "#slider1" ).slider({
     orientation: "horizontal",
    max: 100,
     change: function(event, ui) {
      $('#no2').attr('value', ui.value);
    },
    min: 0
    });
    
  });
  
  </script>
         <script type="text/javascript">
            
           $(document).ready(function(){ 
               
              $( "#slider" ).on( "slidechange", function( event,ui) {
                  document.getElementById("no1").innerHTML= ui.value;
                  
              });
              // document.getElementById("msg").innerHTML=document.getElementById("msg").value;
           $( "#slider1" ).on( "slidechange", function( event,ui) {
               
                  document.getElementById("no2").innerHTML= ui.value;
                  
              });
             
        });
        
        </script>
        <%
            Scilab sci=new Scilab();
            session=request.getSession(true);
            session.setAttribute("sci",sci);
            
            %>
        <script>
            setInterval(start,1000);
        </script>
        <script>
     window.onbeforeunload = function (event) {
    if (event) {
        //event.returnValue = message;
        alert('session ends');
        <%
            Scilab scidead=(Scilab)(session.getAttribute("sci"));
            
            if(scidead!=null)
            scidead.close();
            session.invalidate();
            
            
            %>
    }
};   
        </script>
        
    </body>
</html>
