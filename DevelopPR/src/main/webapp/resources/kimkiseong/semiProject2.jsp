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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/css/swiper.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/js/swiper.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/js/swiper.min.js"></script>
<meta charset="utf-8">
<title>SemiProject</title>
<style>
html, body {
      position: relative;
      height: 100%;
    }
    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color:#000;
      margin: 0;
      padding: 0;
    }
    .swiper-container {
      width: 700px;
      height: 700px;
    }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
}
</style>
<script>
$(document).ready(function () {
    //initialize swiper when document ready
    var mySwiper = new Swiper ('.swiper-container', {
      // Optional parameters
      direction: 'vertical',
      loop: true
    })
  });
var mySwiper = new Swiper ('.swiper-container', {
    // Optional parameters
    direction: 'vertical',
    loop: true,

    // If we need pagination
    pagination: {
      el: '.swiper-pagination',
    },

    // Navigation arrows
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },

    // And if we need scrollbar
    scrollbar: {
      el: '.swiper-scrollbar',
    },
  })
</script>

</head>
<body>

 <!-- Swiper -->
  <div class="swiper-container">
    <div class="swiper-wrapper">
      <div class="swiper-slide"><img src="${path}/resources/kimkiseong/semi_photo/2.PNG">Slide 1</div>
      <div class="swiper-slide"><img src="${path}/resources/kimkiseong/semi_photo/3.PNG">Slide 2</div>
      <div class="swiper-slide"><img src="${path}/resources/kimkiseong/semi_photo/4.PNG">Slide 3</div>
      <div class="swiper-slide"><img src="${path}/resources/kimkiseong/semi_photo/5.PNG">Slide 4</div>
      <div class="swiper-slide">Slide 5</div>
      <div class="swiper-slide">Slide 6</div>
      <div class="swiper-slide">Slide 7</div>
      <div class="swiper-slide">Slide 8</div>
      <div class="swiper-slide">Slide 9</div>
      <div class="swiper-slide">Slide 10</div>
        <div class="swiper-slide">Slide 11</div>
      <div class="swiper-slide">Slide 12</div>
      <div class="swiper-slide">Slide 13</div>
      <div class="swiper-slide">Slide 14</div>
      <div class="swiper-slide">Slide 15</div>
      <div class="swiper-slide">Slide 16</div>
      <div class="swiper-slide">Slide 17</div>
      <div class="swiper-slide">Slide 18</div>
      <div class="swiper-slide">Slide 19</div>
      <div class="swiper-slide">Slide 20</div>
        <div class="swiper-slide">Slide 21</div>
      <div class="swiper-slide">Slide 22</div>
      <div class="swiper-slide">Slide 23</div>
      <div class="swiper-slide">Slide 24</div>
      <div class="swiper-slide">Slide 25</div>
      <div class="swiper-slide">Slide 26</div>
      <div class="swiper-slide">Slide 27</div>
      <div class="swiper-slide">Slide 28</div>
      <div class="swiper-slide">Slide 29</div>
      <div class="swiper-slide">Slide 30</div>
        <div class="swiper-slide">Slide 31</div>
      <div class="swiper-slide">Slide 32</div>
      <div class="swiper-slide">Slide 33</div>
      <div class="swiper-slide">Slide 34</div>
      <div class="swiper-slide">Slide 35</div>
      <div class="swiper-slide">Slide 36</div>
      <div class="swiper-slide">Slide 37</div>
      <div class="swiper-slide">Slide 38</div>
      <div class="swiper-slide">Slide 39</div>
      <div class="swiper-slide">Slide 40</div>
        <div class="swiper-slide">Slide 41</div>
      <div class="swiper-slide">Slide 42</div>
      <div class="swiper-slide">Slide 43</div>
      <div class="swiper-slide">Slide 44</div>
      <div class="swiper-slide">Slide 45</div>
      <div class="swiper-slide">Slide 46</div>
      <div class="swiper-slide">Slide 47</div>
      
    </div>
    <!-- Add Pagination -->
    <div class="swiper-pagination"></div>
    <!-- Add Arrows -->
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
  </div>
 
 
 
 
 <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container', {
      pagination: {
        el: '.swiper-pagination',
        type: 'fraction',
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  </script>
</body>
</html>