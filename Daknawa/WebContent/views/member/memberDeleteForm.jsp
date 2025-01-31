<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<style>
    .h1 {
    	text-align : center;
    	font-size : 50px;	
    	font-weight : 900;
    }

	.h4 {
		text-align : center;
    	font-size : 20px;
	}

    .input, .button {
        width : 400px;
        height : 45px;
        border-style : solid;
        border-width : 2px;
        font-size : 14px;
    }

    .input {
        box-sizing : border-box;
        margin : 50px 0px 50px 0px;
    }

    .button {
        background-color : black;
        color : white;
        margin : 5px 0px 5px 0px;
    }

    .button:hover {
        background-color : gray;
        cursor : pointer;
    }
    
    .div1 {
        width : 400px;
        margin : auto;
    }
    
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<%@ include file="../common/myPageNavbar.jsp" %>
	
	<form id="delete-member" action="<%= contextPath %>/delete.me" method="post">

        <br><br><br><br>
        
        <h1 class="h1">회원 탈퇴</h1>
        
        <br><br>

        <h4 class="h4">탈퇴하시려면 현재 비밀번호를 입력해주세요.</h4>

        <div class="div1">

            <table>
                <tr>
                    <td><input type="password" name="userPwd" class="input" minlength="8" maxlength="15" required></td>
                </tr>
                <tr>
                    <td><button type="submit" class="button">탈퇴하기</button></td>
                </tr>
            </table>

        </div>

    </form>
    
</body>
</html>