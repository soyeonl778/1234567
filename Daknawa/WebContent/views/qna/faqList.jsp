<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
        /* MY PAGE 타이틀 부분 */
        #container .title {
        padding-top: 80px;
        height: 200px;
        position: relative;
        min-width: 1000px;
      }
      #container .sub_title {
        font-size: 44px;
        line-height: 54px;
        color: #000;
        margin-bottom: 0px;
        text-align: center;
        text-transform: uppercase;
      }
      h2 {
        margin:0;
        font-weight: normal;
        display: block;
      }
      #mini_title {
        width: 100%;
        text-align: center;
        margin-bottom: 44px;
        position: absolute;
        top: 134px;
        left: 0;
      }
      ol {
        list-style: none;
        margin: 0;
        padding: 0;
        display: block;
      }
      li {
        display: inline-block;
        margin: 0;
        padding: 0;
        list-style: none;

        text-transform: uppercase;
      }
      a {
        text-decoration: none;
        color: #000;
      }

      /* 메뉴바 부분 */
      #mnb {
        width: 100%;
        min-width: 1000px;
        border-bottom: 1px solid #888686;
        background-color: #fff;
        margin-bottom: 60px;
      }

      #mnb .mnb_header {
        width: 100%;
        min-width: 1000px;
        background-color: #fff;
        border-top: 1px solid #9d9d9d;
      }

      #mnb .mnb_header>ul {
        width: 1000px;
        margin: 0 auto;
        padding: 0;
        display: block;
        list-style-type: disc;
      }
      #mnb_sub ul {
        width: 250px;
        margin: 0 auto;
        padding: 0;
        display: block;
        list-style-type: disc;
      }
      .menubar { height : 38px; }

      #mnb.menubar .mnb_header ul li {
        /* width: 25%; ------------------------- */ 
      }
      #mnb .mnb_header ul li {
        text-align: center;
        /* float: left; */
        position: relative;
      }
      b .mnb_header ul li a {
        font-size: 14px;
        vertical-align: middle;
      }

    /* 서브 메뉴바 부분 */
    #mnb_sub {
            list-style-type : none;
            /*
                p 태그와 마찬가지로 ul 태그 또한 위, 아래로 기본 margin 이 잡혀있음
                또한 ul 태그는 padding 이 왼쪽에 기본적으로 존재함
                => margin : 0px; 과 padding : 0px; 으로 margin 과 padding 을 없애기
            */
            /*
            margin : 0px;
            padding : 0px; /* padding 값 조정으로 메뉴 가운데 배치 가능 */
           /* height : 100%; */

            width: 25%;
            height : 36px;
            margin: 0 auto;
            padding: 0;
            display: block;
        }

        /* 메인 메뉴를 나타내는 li 태그들 */
        #mnb_sub>li {
            float : left;
            height : 100%;
            background-color: #fff;
            display: block;
        }

        /* 메뉴 문구를 나타내는 a 태그들 */
        #mnb a {
            
            color : black;
            text-decoration : none;
            font-size : 14px;
            /*
                a 태그는 인라인요소이기 때문에
                width, height 속성이 적용되지 않음
                => display : block; 으로 블럭요소화 시켜줄것임
            */
            width : 250px;
            height : 100%;
            display : block;
            text-align : center;
            /* vertical-align : middle; vertical-align 은 블럭요소에서 적용되지 않음 */
            line-height : 36px;
            /*
                line-height 속성은 블럭요소에 대한 장평조절 속성
                보통은 블럭요소의 세로길이만큼 주면 알아서 가운데로 옴
            */
        }

        /* 메뉴에 마우스가 올라갔을 때 추가적인 속성 */
        #mnb_sub a:hover {
            color: #888686;
            font-size: 15px;
        }

        /* 서브메뉴에 해당되는 ul 에 대한 스타일 */
        #mnb_sub>li>ul {
            list-style-type : none;
            padding : 0px;
            display : none !important; /* 평소에는 안보여지게끔 숨김 처리 */
        }

        /* 메인 메뉴에 마우스가 올라가는 순간 서브메뉴가 보여지게끔 스타일 부여 */
        #mnb_sub>li:hover>ul {
            display : block !important;
        }
        /* 혹시 몰라서 서브메뉴 자체에도 효과 부여 */
        #mnb_sub>li>ul:hover {
            display : block !important;
        }

        #mnb .mnb_header ul li.active {
        background-color: #000;
      }
      #mnb .mnb_header ul li.active a {
        background-color: #000;
        color: #ffffff;
      }

	div {
	    text-align: center;
	    margin-bottom: 4%;
	}
	.accordion-item {
	    width: 700px;
	}
	
	.ask1 {
	    width: 150px;
	    height: 50px;
	    text-align: center;
	    background-color: white;
	    border: 2px solid;
}
</style>

	<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>

</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	<%@ include file="../common/myPageNavbar.jsp" %>
	
    <div class="div1" style="width: 700px; margin:auto;">
        <h1><b>고객센터</b></h1> <br>
        <h3><b>FAQ</b></h3> <br>
        <h5>자주 찾는 질문</h5> <br>


    </div>
    <div class="accordion" id="accordionPanelsStayOpenExample" style="width: 940px; margin:auto; padding: 10%;"> 
        <div class="accordion-item">
          <h2 class="accordion-header" id="panelsStayOpen-headingOne">
            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
              회원 등급 안내
            </button>
          </h2>
          <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
            <div class="accordion-body">
              <strong>회원등급 안내 사항은 고객센터 FAQ 를 참고 해주세요.</strong>
            </div>
          </div>
        </div>
        <div class="accordion-item">
          <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
              이벤트 안내
            </button>
          </h2>
          <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
            <div class="accordion-body">
              <strong>이벤트 안내 사항은 고객센터 FAQ 를 참고 해주세요.</strong> 
            </div>
          </div>
        </div>
        <div class="accordion-item">
          <h2 class="accordion-header" id="panelsStayOpen-headingThree">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
              사이트 이용 안내
            </button>
          </h2>
          <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
            <div class="accordion-body">
              <strong>사이트 이용 안내 사항은 고객센터 FAQ 를 참고 해주세요.</strong> 
            </div>
          </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="panelsStayOpen-headingFour">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFour" aria-expanded="false" aria-controls="panelsStayOpen-collapseFour">
                기타 안내
              </button>
            </h2>
            <div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingFour">
              <div class="accordion-body">
                <strong>기타 안내 사항은 고객센터 FAQ 를 참고 해주세요.</strong>
             </div>
            </div>
          </div>
      </div>


    <div class="div3" style="width: 700px; margin:auto;">
    <h2><b>문의가 해결되지 않으신가요?</b></h2> <br><br>
    <h5>자세한 문의는 1:1 문의 게시판을 이용하세요.</h5> <br><br>
    <button class="ask1" onclick="location.href='<%= contextPath %>/questionForm.qna';">1:1 문의하기 ></button>
    </div>

	
	

</body>
</html>