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
<style>
body {
  font-family: Arial;
  margin: 0;
}

* {
  box-sizing: border-box;
}

img {
  vertical-align: middle;
}

/* Position the image container (needed to position the left and right arrows) */
.container {
  position: relative;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Add a pointer when hovering over the thumbnail images */
.cursor {
  cursor: pointer;
}

/* Next & previous buttons */
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 40%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* Container for image text */
.caption-container {
  text-align: center;
  background-color: #222;
  padding: 2px 16px;
  color: white;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Six columns side by side */
.column {
  float: left;
  width: 16.66%;
}

/* Add a transparency effect for thumnbail images */
.demo {
  opacity: 0.6;
}

.active,
.demo:hover {
  opacity: 1;
}
</style>
<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}
</script>

</head>
<body>

 <h2 style="text-align:center">Slideshow Gallery</h2>

<div class="container">
  <div class="mySlides">
    <div class="numbertext">1 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/2.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">2 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/3.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">3 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/4.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">4 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/5.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">5 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/6.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">6 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/7.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">7 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/8.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">8 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/9.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">9 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/10.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">10 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/11.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">11 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/12.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">12 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/13.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">13 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/14.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">14 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/15.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">15 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/16.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">16 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/17.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">17 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/18.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">18 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/19.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">19 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/20.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">20 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/21.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">21 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/22.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">22 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/23.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">23 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/24.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">24 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/25.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">25 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/26.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">26 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/27.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">27 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/28.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">28 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/29.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">29 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/30.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">30 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/31.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">31 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/32.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">32 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/33.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">33 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/34.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">34 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/35.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">35 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/36.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">36 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/37.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">37 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/38.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">38 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/39.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">39 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/40.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">40 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/41.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">41 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/42.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">42 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/43.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">43 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/44.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">44 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/45.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">45 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/46.PNG" style="width:100%">
  </div>
  <div class="mySlides">
    <div class="numbertext">46 / 46</div>
    <img src="${path}/resources/kimkiseong/semi_photo/47.PNG" style="width:100%">
  </div>
   
  <a class="prev" onclick="plusSlides(-1)">❮</a>
  <a class="next" onclick="plusSlides(1)">❯</a>

  <div class="caption-container">
    <p id="caption"></p>
  </div>

  <div class="row">
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/2.PNG" style="width:100%" onclick="currentSlide(1)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/3.PNG" style="width:100%" onclick="currentSlide(2)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/4.PNG" style="width:100%" onclick="currentSlide(3)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/5.PNG" style="width:100%" onclick="currentSlide(4)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/6.PNG" style="width:100%" onclick="currentSlide(5)">
    </div>    
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/7.PNG" style="width:100%" onclick="currentSlide(7)">
    </div>
  <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/8.PNG" style="width:100%" onclick="currentSlide(8)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/9.PNG" style="width:100%" onclick="currentSlide(9)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/10.PNG" style="width:100%" onclick="currentSlide(10)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/11.PNG" style="width:100%" onclick="currentSlide(11)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/12.PNG" style="width:100%" onclick="currentSlide(12)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/13.PNG" style="width:100%" onclick="currentSlide(13)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/14.PNG" style="width:100%" onclick="currentSlide(14)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/15.PNG" style="width:100%" onclick="currentSlide(15)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/16.PNG" style="width:100%" onclick="currentSlide(16)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/17.PNG" style="width:100%" onclick="currentSlide(17)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/18.PNG" style="width:100%" onclick="currentSlide(18)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/19.PNG" style="width:100%" onclick="currentSlide(19)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/20.PNG" style="width:100%" onclick="currentSlide(20)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/21.PNG" style="width:100%" onclick="currentSlide(21)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/22.PNG" style="width:100%" onclick="currentSlide(22)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/23.PNG" style="width:100%" onclick="currentSlide(23)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/24.PNG" style="width:100%" onclick="currentSlide(24)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/25.PNG" style="width:100%" onclick="currentSlide(25)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/26.PNG" style="width:100%" onclick="currentSlide(26)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/27.PNG" style="width:100%" onclick="currentSlide(27)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/28.PNG" style="width:100%" onclick="currentSlide(28)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/29.PNG" style="width:100%" onclick="currentSlide(29)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/30.PNG" style="width:100%" onclick="currentSlide(30)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/31.PNG" style="width:100%" onclick="currentSlide(31)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/32.PNG" style="width:100%" onclick="currentSlide(32)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/33.PNG" style="width:100%" onclick="currentSlide(33)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/34.PNG" style="width:100%" onclick="currentSlide(34)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/35.PNG" style="width:100%" onclick="currentSlide(35)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/36.PNG" style="width:100%" onclick="currentSlide(36)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/37.PNG" style="width:100%" onclick="currentSlide(37)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/38.PNG" style="width:100%" onclick="currentSlide(38)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/39.PNG" style="width:100%" onclick="currentSlide(39)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/40.PNG" style="width:100%" onclick="currentSlide(40)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/41.PNG" style="width:100%" onclick="currentSlide(41)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/42.PNG" style="width:100%" onclick="currentSlide(42)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/43.PNG" style="width:100%" onclick="currentSlide(43)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/44.PNG" style="width:100%" onclick="currentSlide(44)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/45.PNG" style="width:100%" onclick="currentSlide(45)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/46.PNG" style="width:100%" onclick="currentSlide(46)">
    </div>
    <div class="column">
      <img class="demo cursor" src="${path}/resources/kimkiseong/semi_photo/7.PNG" style="width:100%" onclick="currentSlide(47)">
    </div>
        
  </div>
</div>
</body>
</html>