<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:forEach var="list" items="${map.list}" varStatus="vs">
<!DOCTYPE html>
<script>
$(function(){
	$("#modalReport${vs.index}").click(function(){
		var reason = $("#BL_REASON${vs.index}").val();
		
		if(reason==""){
			alert("내용을 추가해주세요");
			return;
		}
		$("#form3${vs.index}").submit();
		
	});
});
</script>
<div class="modal fade" id="myModal2${vs.index}" role="dialog">

    <div class="modal-dialog">
 	
        <!-- Modal content-->
        <form name="form3" id="form3${vs.index}" method="post" action="${contextPath }/freeboard/report?${_csrf.parameterName}=${_csrf.token}">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 id="modal-title${vs.index}" class="modal-title" style="color: red">신고</h4>
            </div>
            <div class="modal-body">
                <table class="table">
                    <tr>
                        <td>신고아이디</td>
                        <td>
                        	<input class="form-control" id="userName2${vs.index}" type="text" readonly="readonly" value="${list.FB_MMID }" style="width: 100%"/>
                        	<input type="hidden" id="BL_CODE${vs.index}" name="BL_CODE" value="${list.FB_CODE }"/>
                        	<input type="hidden" id="BL_MMID${vs.index}" name="BL_MMID" value="${list.FB_MMID }"/>
                        </td>
                    </tr>
       
                    <tr>
                        <td>신고내용</td>
                        <td><textarea class="form-control" id="BL_REASON${vs.index}" name="BL_REASON" rows="5" style="width: 100%"></textarea></td>
                    </tr>                  
                </table>
            </div>
            <div class="modal-footer">
                <button id="modalReport${vs.index}"  type="button" class="btn btn-success" style="background-color: red">신고하기</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
            </div>
        </div>
        </form>
    </div>
</div>
</c:forEach>
</html>