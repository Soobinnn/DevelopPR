<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 포맷 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 컨택스트  패스-->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>SemiProject</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.mySlides {display:none}

.w3-container{
font-size:30px;
font-color:mint;
text-align:center;
}
</style>
<body>

<div class="w3-container">
Project Name : MUSED
</div>

<div class="w3-content" style="max-width:800px">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/2.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/3.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/4.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/5.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/6.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/7.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/8.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/9.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/10.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/11.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/12.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/13.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/14.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/15.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/16.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/17.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/18.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/19.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/20.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/21.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/22.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/23.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/24.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/25.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/26.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/27.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/28.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/29.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/30.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/31.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/32.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/33.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/34.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/35.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/36.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/37.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/38.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/39.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/40.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/41.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/42.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/43.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/44.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/45.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/46.PNG" style="width:100%">
  <img class="mySlides" src="${path}/resources/kimkiseong/semi_photo/47.PNG" style="width:100%">
</div>

<div class="w3-center">
  <div class="w3-section">
    <button class="w3-button w3-light-grey" onclick="plusDivs(-1)">❮ Prev</button>
    <button class="w3-button w3-light-grey" onclick="plusDivs(1)">Next ❯</button>
  </div>
  <button class="w3-button demo" onclick="currentDiv(1)">1</button> 
  <button class="w3-button demo" onclick="currentDiv(2)">2</button> 
  <button class="w3-button demo" onclick="currentDiv(3)">3</button> 
  <button class="w3-button demo" onclick="currentDiv(4)">4</button>
  <button class="w3-button demo" onclick="currentDiv(5)">5</button>
  <button class="w3-button demo" onclick="currentDiv(6)">6</button>
  <button class="w3-button demo" onclick="currentDiv(7)">7</button>
  <button class="w3-button demo" onclick="currentDiv(8)">8</button>
  <button class="w3-button demo" onclick="currentDiv(9)">9</button>
  <button class="w3-button demo" onclick="currentDiv(10)">10</button>
  <button class="w3-button demo" onclick="currentDiv(11)">11</button> 
  <button class="w3-button demo" onclick="currentDiv(12)">12</button> 
  <button class="w3-button demo" onclick="currentDiv(13)">13</button> 
  <button class="w3-button demo" onclick="currentDiv(14)">14</button>
  <button class="w3-button demo" onclick="currentDiv(15)">15</button>
  <button class="w3-button demo" onclick="currentDiv(16)">16</button>
  <button class="w3-button demo" onclick="currentDiv(17)">17</button>
  <button class="w3-button demo" onclick="currentDiv(18)">18</button>
  <button class="w3-button demo" onclick="currentDiv(19)">19</button>
  <button class="w3-button demo" onclick="currentDiv(20)">20</button>
  <button class="w3-button demo" onclick="currentDiv(21)">21</button> 
  <button class="w3-button demo" onclick="currentDiv(22)">22</button> 
  <button class="w3-button demo" onclick="currentDiv(23)">23</button> 
  <button class="w3-button demo" onclick="currentDiv(24)">24</button>
  <button class="w3-button demo" onclick="currentDiv(25)">25</button>
  <button class="w3-button demo" onclick="currentDiv(26)">26</button>
  <button class="w3-button demo" onclick="currentDiv(27)">27</button>
  <button class="w3-button demo" onclick="currentDiv(28)">28</button>
  <button class="w3-button demo" onclick="currentDiv(29)">29</button>
  <button class="w3-button demo" onclick="currentDiv(30)">30</button>
  <button class="w3-button demo" onclick="currentDiv(31)">31</button> 
  <button class="w3-button demo" onclick="currentDiv(32)">32</button> 
  <button class="w3-button demo" onclick="currentDiv(33)">33</button> 
  <button class="w3-button demo" onclick="currentDiv(34)">34</button>
  <button class="w3-button demo" onclick="currentDiv(35)">35</button>
  <button class="w3-button demo" onclick="currentDiv(36)">36</button>
  <button class="w3-button demo" onclick="currentDiv(37)">37</button>
  <button class="w3-button demo" onclick="currentDiv(38)">38</button>
  <button class="w3-button demo" onclick="currentDiv(39)">39</button>
  <button class="w3-button demo" onclick="currentDiv(40)">40</button>
  <button class="w3-button demo" onclick="currentDiv(41)">41</button> 
  <button class="w3-button demo" onclick="currentDiv(42)">42</button> 
  <button class="w3-button demo" onclick="currentDiv(43)">43</button> 
  <button class="w3-button demo" onclick="currentDiv(44)">44</button>
  <button class="w3-button demo" onclick="currentDiv(45)">45</button>
  <button class="w3-button demo" onclick="currentDiv(46)">46</button>
  
 
</div>

<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" w3-red", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-red";
}
</script>

</body>
</html>