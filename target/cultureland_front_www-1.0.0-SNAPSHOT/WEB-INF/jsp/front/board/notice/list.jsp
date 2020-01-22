<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="section">
    <div class="section-main notice-pg service-list">
      <h2>공지사항</h2>
      <div>
        <ul class="search-type">
          <li class="list1 on"><a href="#">전체</a></li>
          <li class="list2"><a href="#">서비스</a></li>
          <li class="list3"><a href="#">점검</a></li>
          <li class="list4"><a href="#">뉴스</a></li>
          <li class="list5"><a href="#">기타</a></li>
        </ul>
        <div class="search-box">
          <select name="" id="">
    <option value="">제목</option>
    <option value="">내용</option>
</select>
          <div class="select_arrow"><img src="${web_server_url}/images/front/select_arrow.png" alt=""></div>
          <div class="search">
            <input type="text"><button><img src="${web_server_url}/images/front/search.png" alt="돋보기 이미지"></button>
          </div>
        </div>
      </div>
      <ul class="list-title">
        <li class="number">NO</li>
        <li class="class">분류</li>
        <li class="title">제목</li>
        <li class="date">작성일</li>
      </ul>
      <div class="list list1-con">
        <ul class="urgent">
          <!-- urgent는 긴급공지때 사용된 css 클래스명-->
          <li class="number">공지</li>
          <li class="class">서비스</li>
          <li class="title"><a href="#">서비스 변경에 대한 공지사항입니다.<img src="${web_server_url}/images/front/Forma.png" alt="파일첨부 클립 이미지"></a></li>
          <li class="date">2019.11.30</li>
        </ul>
        <ul class="urgent">
          <!-- urgent는 긴급공지때 사용된 css 클래스명-->
          <li class="number">공지</li>
          <li class="class">점검</li>
          <li class="title"><a href="#">긴급점검</a></li>
          <li class="date">2019.11.30</li>
        </ul>
        <ul>
          <li class="number">50</li>
          <li class="class">서비스</li>
          <li class="title"><a href="#">사이트 이용에 관련된 공지사항입니다.사이트 이용에 관련된 공지사항입니다.사이트 이용에 관련된 공지사항입니다.사이트 이용에 관련된 공지사항입니다.사이트 이용에 관련된 공지사항입니다.사이트 이용에 관련된 공지사항입니다.사이트 이용에 관련된 공지사항입니다.사이트 이용에 관련된 공지사항입니다.사이트 이용에 관련된 공지사항입니다.사이트 이용에 관련된 공지사항입니다.사이트 이용에 관련된 공지사항입니다.사이트 이용에 관련된 공지사항입니다.사이트 이용에 관련된 공지사항입니다.사이트 이용에 관련된 공지사항입니다.사이트 이용에 관련된 공지사항입니다.</a></li>
          <li class="date">2019.11.30</li>
        </ul>
        <ul>
          <li class="number">49</li>
          <li class="class">기타</li>
          <li class="title"><a href="#">기타 관련된 공지사항입니다.</a></li>
          <li class="date">2019.11.30</li>
        </ul>
        <ul>
          <li class="number">48</li>
          <li class="class">기타</li>
          <li class="title"><a href="#">기타 관련된 공지사항입니다.</a></li>
          <li class="date">2019.11.30</li>
        </ul>
        <ul>
          <li class="number">47</li>
          <li class="class">뉴스</li>
          <li class="title"><a href="#">뉴스 관련된 공지사항입니다.</a></li>
          <li class="date">2019.11.30</li>
        </ul>
        <ul>
          <li class="number">46</li>
          <li class="class">뉴스</li>
          <li class="title"><a href="#">뉴스 관련된 공지사항입니다.</a></li>
          <li class="date">2019.11.30</li>
        </ul>
        <ul>
          <li class="number">45</li>
          <li class="class">기타</li>
          <li class="title"><a href="#">기타 관련된 공지사항입니다.</a></li>
          <li class="date">2019.11.30</li>
        </ul>
        <ul>
          <li class="number">44</li>
          <li class="class">서비스</li>
          <li class="title"><a href="#">서비스 관련된 공지사항입니다.</a></li>
          <li class="date">2019.11.30</li>
        </ul>
        <ul>
          <li class="number">43</li>
          <li class="class">서비스</li>
          <li class="title"><a href="#">서비스 관련된 공지사항입니다.</a></li>
          <li class="date">2019.11.30</li>
        </ul>
      </div>
      <!--list2-->
      <div class="list list2-con">
        <ul>
          <li class="number">1</li>
          <li class="class">서비스</li>
          <li class="title"><a href="#">서비스 관련된 공지사항입니다.</a></li>
          <li class="date">2019.11.30</li>
        </ul>
      </div>
      <!--list3-->
      <div class="list list3-con">
        <ul>
          <li class="number">1</li>
          <li class="class">점검</li>
          <li class="title"><a href="#">점검 관련 공지사항입니다.</a></li>
          <li class="date">2019.11.30</li>
        </ul>
      </div>
      <!--list4-->
      <div class="list list4-con">
        <ul>
          <li class="number">1</li>
          <li class="class">뉴스</li>
          <li class="title"><a href="#">뉴스 관련 공지사항입니다.</a></li>
          <li class="date">2019.11.30</li>
        </ul>
      </div>
      <!--list5-->
      <div class="list list5-con">
        <ul>
          <li class="number">1</li>
          <li class="class">기타</li>
          <li class="title"><a href="#">기타 관련 공지사항입니다.</a></li>
          <li class="date">2019.11.30</li>
        </ul>
      </div>
      <div class="paging">
        <div>
          <p class="fiste">
            <a href="#"><img src="${web_server_url}/images/front/first.png" alt="페이징 화살표 이미지"></a>
          </p>
          <p class="prev">
            <a href="#"><img src="${web_server_url}/images/front/prev2.png" alt="페이징 화살표 이미지"></a>
          </p>
        </div>
        <div class="page-number">
          <ul>
            <li class="num1 on"><a href="#">1</a></li>
            <li class="num2"><a href="#">2</a></li>
            <li class="num3"><a href="#">3</a></li>
            <li class="num4"><a href="#">4</a></li>
            <li class="num5"><a href="#">5</a></li>
          </ul>
        </div>
        <div>
          <p class="next">
            <a href="#"><img src="${web_server_url}/images/front/next2.png" alt="페이징 화살표 이미지"></a>
          </p>
          <p class="last">
            <a href="#"><img src="${web_server_url}/images/front/last.png" alt="페이징 화살표 이미지"></a>
          </p>
        </div>
      </div>
    </div>
  </div>
</body>
</html>