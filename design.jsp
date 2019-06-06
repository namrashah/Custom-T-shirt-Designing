<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="shortcut icon" href="images/images_LOGO.jpg">

<style>
 #changed {
    margin: 0px ;
    padding :  0px;
    width:100%;
  }
  .img{

    height:685px;
    width:39.5%;
    float:right;
  }
  .data{

    height:100%;
    width:60%;
    float:left;
  }
  .font{
    color:Black;
    font-family:"Comic Sans MS";
  }
  .font2{
    color:Grey;
    font-family:"tahoma";
  }
  
  .bdy{
  	background-color: "#ebebeb";
  }
  
</style>
</head>
<body class = "bdy" >

	<%
	String str = (String)session.getAttribute("name");
	if(str.equals("yes")){
%>
	<c:import url="header.htm"></c:import>
 <%}else{ %>



<c:import url="finalHeader.htm"></c:import>
<%
}

%>

	
	<%-- <c:import url="canvastshirt.html"></c:import> --%>
	
	
	
	
	
	
	
	
	<div>
  <div class="data">
    <div>
<table style="float:left">
<tr>
<td colspan=2>
<h2 class="font2">Apply color:</h2></td></tr>
<tr>
<td><h3><font class="font" style="color:black;">Red</td>
<td><button type="button"  name = "red" style="background-color:red; height:18px" onclick="doRed()" ></button></font></h3></td></tr>
<tr>
<td><h3><font class="font" style="color:black;">Blue</td>
<td><button type="button"  name = "blue" style="background-color:aqua; height:18px" onclick="doBlue()"/></h3></td></tr>
<tr>
<td><h3><font class="font" style="color:black;"><h3>Green</td>
<td><button type="button"  name = "green"  style="background-color:#99ff33 ; height:18px"  onclick="doGreen()"/></h3></td></tr>
<tr>
<td><h3><font class="font" style="color:black;"><h3>Pink</td>
<td><button  type="button"  name = "pink"  style="background-color:Fuchsia  ; height:18px" onclick="doPink()"/></h3></td></tr>
<tr>
<td><h3><font class="font" style="color:black;"><h3>Maroon</td>
<td><button  type="button"  name = "maroon"  style="background-color:FireBrick   ; height:18px" onclick="doMaroon()"/></h3></td></tr>
<tr>
<td><h3><font class="font" style="color:black;"><h3>Violet</td>
<td><button  type="button"  name = "violet"  style="background-color:#b300ff   ; height:18px" onclick="doViolet()"/></h3></td></tr>
<tr>
<td><h3><font class="font" style="color:black;"><h3>Grey</td>
<td><button  type="button"  name = "gray" style="background-color:gray   ; height:18px"  onclick="doGray()"/></h3></td></tr>
<tr>
<td><h3><font class="font" style="color:black;"><h3>White</td>
<td><button  type="button"  name = "white" style="background-color:white   ; height:18px"  onclick="doWhite()"/></h3></td></tr>
</table></div>
<div><table style="float:right; clear:center;">
<tr>
<td colspan="3"><h2 class="font2">Enter text</h2></td></tr>
<tr>
<td colspan="3"><h4>(we recommend entering characters within a limit of 15):</h4></td></tr>
<tr>
<td><input type="text" id= "inp-text" value="Enter text"  maxlength="15"/></td></tr>
<tr>
<td><h3><font class="font"><h3>Apply to center</h3></td>
<td><button type="button"   value="center"   onclick="text()"/>center</td></tr>
<tr>
<td><h3><font class="font"><h3>Apply to top left</h3></td>
<td><button type="button"   value="top left"   onclick="texttl()"/>top left</td></tr>
<tr>
<td><h3><font class="font"><h3>Apply to top right</h3></td>
<td><button type="button"   value="top right"   onclick="texttr()"/>top right</td></tr>
<tr>
<td><h3><font class="font"><h3>Apply to bottom left</h3></td>
<td><button type="button"   value="bottom left"   onclick="textbl()"/>bottom left</td></tr>
<tr>
<td><h3><font class="font"><h3>Apply to bottom right</h3></td>
<td><button type="button"   value="bottom right"   onclick="textbr()"/>bottom right</td></tr>
<tr>
<td><h3><font class="font"><h3>Apply to bottom center</h3></td>
<td><button type="button"   value="bottom center"   onclick="textbc()"/>bottom center</td></tr>
<tr>
<td colspan=3>
<h2 class="font2">Upload image</h2></td></tr>
<tr>
<td><input type="file" accept="image/*" onchange="loadFile(event)"></td>
<td><img id="output" height=0 width=0/></td></tr>
<tr>
<td><button type="button" onclick="img(event)" value="try image"/>try image</td></tr>
</table>
</div>
  </div>
  <div class="img">
  <canvas id="changed" width="3200" height="3200"></canvas>
  </div>
<script type="text/javascript">

 var loadFile = function(event) {
    var output = document.getElementById('output');
    output.src = URL.createObjectURL(event.target.files[0]);
  };

var canvas = document.getElementById("changed");
var context=canvas.getContext("2d");

var imageObj = new Image();


imageObj.onload = function() {
    context.drawImage(imageObj, 10, 10 , 2600 , 2500);
};

imageObj.src = '/CustomDesigning/images/IMG-20170320-WA0002.jpg';

var txt = document.getElementById("inp-text");

function img(event){
  var img2 = new Image();
    img2.src = document.getElementById('output').src;
  context.drawImage(img2,950,950,700,700);
}

function text(){

        context.fillText(txt.value, canvas.width/2.5, canvas.height/4);
        context.font="200px Comic Sans MS";
        context.fillStyle = "black";
        context.textAlign = "center";

}

function texttl(){

        context.fillText(txt.value, canvas.width/4.75, canvas.height/4.5);
        context.font="200px Comic Sans MS";
        context.fillStyle = "black";
        context.textAlign = "center";

}
function texttr(){

        context.fillText(txt.value, canvas.width/1.75, canvas.height/4.5);
        context.font="200px Comic Sans MS";
        context.fillStyle = "black";
        context.textAlign = "center";

}
function textbl(){

        context.fillText(txt.value, canvas.width/4.25, canvas.height/1.75);
        context.font="200px Comic Sans MS";
        context.fillStyle = "black";
        context.textAlign = "center";

}
function textbr(){

        context.fillText(txt.value, canvas.width/1.75, canvas.height/1.75);
        context.font="200px Comic Sans MS";
        context.fillStyle = "black";
        context.textAlign = "center";

}


function textbc(){

        context.fillText(txt.value, canvas.width/2.5, canvas.height/1.68);
        context.font="200px Comic Sans MS";
        context.fillStyle = "black";
        context.textAlign = "center";

}


var element = document.getElementById("changed");

function doRed(){
    var filter = 'hue-rotate(500deg) saturate(350)   '; //sepia(50%)
    element.style['-webkit-filter'] = filter;
    element.style['filter'] = filter;

}


function doWhite(){
    var filter = 'hue-rotate(0deg) saturate(0)   '; //sepia(50%)
    element.style['-webkit-filter'] = filter;
    element.style['filter'] = filter;

}


function doGreen(){
    var filter = 'hue-rotate(240deg) saturate(350)   '; //sepia(50%) grayscale(80%)
    element.style['-webkit-filter'] = filter;
    element.style['filter'] = filter;

}


function doBlue(){
    var filter = 'hue-rotate(320deg) saturate(350) grayscale(50%)  '; //sepia(50%)
    element.style['-webkit-filter'] = filter;
    element.style['filter'] = filter;

}


function doMaroon(){
    var filter = 'hue-rotate(500deg) saturate(350) grayscale(50%)  '; //sepia(50%)
    element.style['-webkit-filter'] = filter;
    element.style['filter'] = filter;

}


function doGray(){
    var filter = 'hue-rotate(500deg) saturate(350) grayscale(100%)  '; //sepia(50%)
    element.style['-webkit-filter'] = filter;
    element.style['filter'] = filter;

}


function doPink(){
    var filter = 'hue-rotate(60deg) saturate(350)   '; //sepia(50%)
    element.style['-webkit-filter'] = filter;
    element.style['filter'] = filter;

}


function doViolet(){
    var filter = 'hue-rotate(60deg) saturate(200) grayscale(80%)  '; //sepia(50%)
    element.style['-webkit-filter'] = filter;
    element.style['filter'] = filter;

}
</script>
	
	
	
	
	
	
	
	
	<c:import url="finalFooter.htm"></c:import>
	

</body>
</html>