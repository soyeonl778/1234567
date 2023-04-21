<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.common.model.vo.PageInfo, java.util.ArrayList, com.kh.qna.model.vo.Qna" %>
<%
	// 필요한 데이터 뽑기
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int maxPage = pi.getMaxPage();
	int endPage = pi.getEndPage();

	
	
%>
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
      
         /* 문의글 리스트 부분 */
    .list-area {
      width: 1000px;
      height: 200px;
      border: 1px solid gray;
      margin: auto;
      text-align:center;
    }
    .list-area>tbody>tr:hover {
      background-color: rgb(239, 239, 239);
      cursor: pointer;
    }
    
    /* 답변 부분 */
    .list-area .answer {
    	display : none;
    }
      
</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>

</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	<%@ include file="../common/myPageNavbar.jsp" %>
	
	
	 <section id="container">
    <% if(loginUser != null) { %>
    <div align="right" style="width : 850px">
	    <a href="<%= contextPath %>/questionForm.qna" class="ask1">1:1 문의하기 </a>
		<br><br>
    </div>
    <% } %>
    <div class="outer">

        
        <table align="center" class="list-area">
            <thead>
                <tr>
                    <th width="70">글번호</th>
                    <th width="70">문의유형</th>
                    <th width="200">제목</th>
                    <th width="300">문의내용</th>
                    <th width="100">작성자</th>
                    <th width="100">작성일</th>
                </tr>
            </thead>
            <tbody>
            
            	<% if(list.isEmpty()) {%>
                    <tr>
                        <td colspan="6">
                                                             조회된 리스트가 없습니다.
                        </td>
                    </tr>
                    <% } else { %>
                    	<% for(Qna q : list) { %>
                    	
	                        <tr>
	                            <td><%= q.getAskNo() %></td>
	                            <td><%= q.getAskType() %></td>
	                            <td><%= q.getAskTitle() %></td>
	                            <td><%= q.getAskContent() %></td>
	                            <td><%= q.getMemberNo() %></td>
	                            <td><%= q.getAskDate() %></td>
	                            <td><button><a href="<%= contextPath %>/updateForm.ask?ano=<%= q.getAskNo() %>" class="updateAsk">수정하기</a></button></td>
	                            <td><button><a href="<%= contextPath %>/delete.ask?ano=<%= q.getAskNo() %>" class="deleteAsk">삭제하기</a></button></td>
	                         </tr>
	                         
	                         <form id="answer-form" style="display:none;">
	                            <label for="answer-content">답변 내용:</label><br>
	                            <textarea id="answer-content" name="answer-content"></textarea><br>
	                            <label for="answer-date">답변 일자</label>
	                            <button type="submit">답변전송</button>
                         	 </form>
	                         
							<!--  
		                    <% if(q.getAnswerContent() == null && q.getAnswerDate() == null) { %>
		                    	<tr class="answer"> 클릭 시 보여지게, 다시클릭 시 사라지게
		                    		<td colspan="6" align="center">답변 대기중입니다.</td>
		                    	</tr>
		                    <% } else { %>
		                        <tr class="answer">
		                        	<td colspan="5">
		                        		<%= q.getAnswerContent() %>
		                        	</td> 여기에 답변 출력
		                        	<td>
		                        		<%= q.getAnswerDate() %>
		                        	</td> 여기에 답변일출력
		                        </tr> 
		                     <% } %> 
	                     
                      <% } %> -->
                   <% } %>
                        
            </tbody>
        </table>
        <br><br>
        
         <!-- 페이징바 -->
        <div align="center" class="paging">
          
          <% if(currentPage != 1) { %>
          <button onclick="location.href = '<%= contextPath %>/list.ask?currentPage=<%= currentPage - 1 %>';">&lt;</button>
          <% } %>
          
          
          <% for(int p = startPage; p <= endPage; p++) { %>
          		<% if (p != currentPage) { %>
				<button onclick="location.href = '<%= contextPath %>/list.ask?currentPage=<%= p %>';">
				<%= p %>
				</button>
				<% } else { %>
				<!-- 현재 내가 보고있는 페이지일 경우에는 클릭이 안되게 -->
				<button disable><%= p %></button>
				<% } %>
		  <% } %>
		  
		  <% if(currentPage != maxPage) { %>
		  <button onclick="location.href = '<%= contextPath %>/list.ask?currentPage=<%= currentPage + 1 %>';">&gt;</button>
		  <% } %>
        </div>
    </div>
    
    <!-- 관리자쪽 1:1문의 답변 ajax -->
    <script>
      $(document).ready(function() {
          // 1:1문의 클릭 시 이벤트 처리
          $('tbody tr').on('click', function(event) {
            event.preventDefault();
            
            // 선택한 문의의 ID 값을 가져옴
            var memberId = $(this).data('member-id');
            
            // 해당 문의의 세부 정보 조회
            $.ajax({
              url: '',
              method: 'POST',
              data: { memberId: memberId },
              dataType: 'json',
              async : true,
              success: function(result) {
            	  
                // 세부 정보를 HTML로 구성하여 출력
                var inquiryDetails = '<h2>' + '관리자 답변' + '</h2>';
                inquiryDetails += '<p>' + '답변 내용' + '</p>';
                inquiryDetails += '<form id="answer-form" method="POST">';
                inquiryDetails += '<input type="hidden" name="memberId" value="' + memberId + '">';
                inquiryDetails += '<textarea name="answerContent" placeholder="답변을 입력하세요"></textarea>';
                inquiryDetails += '<button type="submit">답변 제출</button>';
                inquiryDetails += '</form>';
                
                // 세부 정보를 모달 창에 출력
                $('.modal-content').html(inquiryDetails);
                $('.modal').css('display', 'block');
                
                // 답변 제출 폼 제출 시 이벤트 처리
                $('#answer-form').on('submit', function(event) {
                  event.preventDefault();
                  
                  // 답변 제출 처리
                  $.ajax({
                    url: 'adAnswer.ask',
                    method: 'POST',
                    data: $(this).serialize(),
                    dataType: 'json',
                    async : true,
                    success: function(result) {
                      // 답변 제출 결과 처리
                      if (answer.success) {
                        alert('답변이 제출되었습니다.');
                        $('.modal').css('display', 'none');
                      } else {
                        alert('답변 제출에 실패했습니다.');
                      }
                    },
                    error: function() {
                      alert('서버와의 통신에 실패했습니다.');
                    }
                  });
                });
              },
              error: function() {
                alert('서버와의 통신에 실패했습니다.');
              }
            });
          });
        });
      </script>
    
    
  </section>
  
                         

</body>
</html>