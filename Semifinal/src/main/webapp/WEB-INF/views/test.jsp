<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
      <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
      <title>Crime in Vancouver</title>
      <meta name="description" content="Simple Effects for Drop-Down Lists" />
      <meta name="keywords" content="drop-down, select, jquery, plugin, fallback, transition, transform, 3d, css3" />
      <meta name="author" content="Codrops" />
      <link rel="shortcut icon" href="../favicon.ico">
      <!-- <link rel="stylesheet" href="/webjars/bootstrap/4.1.0/css/bootstrap.min.css"> -->
      <!-- <link rel="stylesheet" type="text/css" href="css/style1.css" /> -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style1.css" />
      <script src="js/modernizr.custom.63321.js"></script>
   </head>
   <body>
      <div class="container">   
         <!-- Codrops top bar -->
         <div class="codrops-top clearfix">
            <a href="http://tympanus.net/Development/Calendario/">

            </a>
            <span class="right">

               <a href="http://tympanus.net/codrops/?p=12452">

               </a>
            </span>
         </div><!--/ Codrops top bar -->         
         <header class="clearfix">         
            <h1>Crime<span>in Vancouver</span></h1>
            <nav class="codrops-demos">
               <a class="current-demo" href="Machine_Learning">Criminal Prediction</a>
               <a href="Vancouver_info">For Vancouver</a>
               <a href="Graph">Graph</a>
               <a href="Map">A Crime Map</a>
               <a href="WordCloud">Word Cloud</a>
            </nav>            
         </header>
         <section class="main clearfix">
            <div class="fleft">
               <p>In this example we use a gutter of 5 and stack the items with a slight offset</p>
            </div>
            <div class="fleft">
               <select id="cd-dropdown" name="cd-dropdown" class="cd-select">
                  <option value="-1" selected>Content</option>
                  <option value="1" class="icon-monkey">Monkey</option>
                  <option value="2" class="icon-bear">Bear</option>
                  <option value="3" class="icon-squirrel">Squirrel</option>
                  <option value="4" class="icon-elephant">Elephant</option>
               </select>
            </div>
         </section>
      </div><!-- /container -->
      <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
      <script type="text/javascript" src="js/jquery.dropdown.js"></script>
      <script type="text/javascript">
         
         $( function() {
            
            $( '#cd-dropdown' ).dropdown( {
               gutter : 5
            } );

         });

      </script>
      
      <%=session.getAttribute("Search") %>
      
       <script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
 
  



      
   </body>
</html>
