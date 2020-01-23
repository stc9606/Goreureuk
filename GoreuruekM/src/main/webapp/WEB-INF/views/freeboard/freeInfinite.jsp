<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@include file="/WEB-INF/views/includes/publicView/jstl.jsp" %>
<!DOCTYPE html>

<c:forEach var="list" items="${list}" varStatus="vs">
                <div class ="list-guestbook" data-no="${list.FB_CODE }">
                <div class="card gedf-card">
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="mr-2">
                                    <img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">
                                </div>
                                <div class="ml-2">
                                    <div class="h5 m-0">@${list.FB_MMID}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i>${list.FB_DATE}</div>
                        <a class="card-link" href="#">
                            <img src="..${list.FBC_CONTENT2}" style="width:1000px; height: auto"/>
                        </a>
                        <p class="card-text">
                            ${list.FBC_CONTENT}
                        </p>
                        <div class="badge badge-primary${vs.index}" id="tag${vs.index}">
                            
                        </div>
                    </div>
                    <div class="card-footer">
                        <a id="heart2${vs.index}"><img id="heart${vs.index}" src="" style="width: 25px"></a>
                        <span>좋아요 개수:${list.FB_LIKES }</span>
                        <a href="#" class="card-link"><i class="fa fa-comment"></i> 댓글작성</a>
                        <a href="#" class="card-link"><i class="fa fa-mail-forward"></i> 공유</a>
                        <sec:authorize access="isAuthenticated()">
                        <sec:authentication property="principal.username" var="username"/>
                        <c:if test="${username == list.FB_MMID}">                   
                        <a data-toggle="modal" href="#myModal${vs.index}" style="cursor: pointer;" class="card-link" id="freeUpdate" ><i class="fa fa-mail-forward"></i> (수정/삭제)</a>                                               
                        <p style="display: none">${list.FB_CODE }</p><p style="display: none">${list.FBC_FBCODE }</p>
                        <p style="display: none">${list.FBL_FBCODE }</p>                        
                        </c:if>
                        </sec:authorize>
                    </div>
                </div>
                </div>
                 <script type="text/javascript">
                $(".badge badge-primary${vs.index}").ready(function(){
       			 var tag = '${list.FBC_TAG}';	
                	var splitedArray  = tag.split(' ');
                	var linkedContent = '';
                	for(var word in splitedArray)
                	{
                	  word = splitedArray[word];
                	   if(word.indexOf("#") == 0)
                	   {	
                		   word = '<a class="badge badge-primary${vs.index}" style="text-decoration: underline;" href=\'링크\'>'+word+'</a>';
                	   }
                	   linkedContent += word+' ';
                	}
                	document.getElementById('tag${vs.index}').innerHTML = linkedContent;
       			 });
                
                $(function(){

        	        var heartval = ${list.boardlike};

        	        if(heartval>0) {
        	            $("#heart${vs.index}").prop("src", "${contextPath}/resources/heart/heart1.png");
        	            $("#heart2${vs.index}").prop('name',heartval)
        	        }
        	        else {
        	            $("#heart${vs.index}").prop("src", "${contextPath}/resources/heart/heart2.png");
        	            $("#heart2${vs.index}").prop('name',heartval)
        	        }

        	        $("#heart2${vs.index}").on("click", function () {

        	            var that = $("#heart2${vs.index}");

        	            var sendData = {'FB_CODE' : '${list.FB_CODE}','heart' : that.prop('name')};
        	            $.ajax({
        	                url :'${contextPath}/freeboard/heart?FBL_FBCODE=${list.FBL_FBCODE}&${_csrf.parameterName}=${_csrf.token}',
        	                type :'POST',
        	                data : sendData,
        	                success : function(data){
        	                    that.prop('name',data);
        	                    if(data==1) {
        	                        $('#heart${vs.index}').prop("src","${contextPath}/resources/heart/heart1.png");
        	                    }
        	                    else{
        	                        $('#heart${vs.index}').prop("src","${contextPath}/resources/heart/heart2.png");
        	                    }


        	                }
        	            });
        	        });
        	        
        	              	    
        	    });
                </script>
</c:forEach>

</html>