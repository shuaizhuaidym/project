<%@tag pageEncoding="UTF-8"%>
<%-- <%@ attribute name="page" type="org.springframework.data.domain.Page" required="true"%> --%>
<%@ attribute name="page" type="java.util.List" required="true"%>
<%@ attribute name="paginationSize" type="java.lang.Integer" required="true"%>
<%@ attribute name="currentPage" type="java.lang.Integer" required="true"%>
<%@ attribute name="totalPages" type="java.lang.Integer" required="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
$(document).ready(function(){
	 $(".changePage").click(function(){
		 var checkedIdStr = $("#idsdiv").val();
		 $.cookie("checkedIdStr",checkedIdStr);
		 
		 var statString = "";
		 $.each($(":checkbox:gt(1):checked"),function(i,n){
			var idstr = n.value;
			var lockStat = 	$("#datadiv").data(idstr);
			var authStat =  $("#datadiv2").data(idstr);
			statString += ";" + idstr+":"+lockStat + "," + authStat ;
		 });
		 if($.cookie("checkedStatStr")==null){
			 $.cookie("checkedStatStr",statString);
		 }else{
			 var oldStatStr = $.cookie("checkedStatStr");
			 $.cookie("checkedStatStr",oldStatStr + statString);
		 }

		 var params = $(this).attr("href");
		 params = params.substring(params.indexOf("?"));
		 $("#loading").show();
		 $("#main").load("${ctx}/user/listsearch"+params);
		 return false;
	 });
});
	
</script>

<%
int current =  currentPage;
int begin = Math.max(1, current - paginationSize/2);
int end = Math.min(begin + (paginationSize - 1), totalPages);

/* System.out.println("current----"+current);
System.out.println("begin-----"+begin);
System.out.println("end----"+end);
System.out.println("totalPages-----"+totalPages); */

request.setAttribute("current", current);
request.setAttribute("begin", begin);
request.setAttribute("end", end);
%>

<div class="pagination">
	<ul>
		 <% if ((current-1)>0){%>
		 		<li><a class="changePage" id="firstPage" href="?page=1&sortType=${sortType}">&lt;&lt;</a></li>
                <li><a class="changePage" id="prePage" href="?page=${current-1}&sortType=${sortType}">&lt;</a></li>
               	
         <%}else{%>
                <li class="disabled"><a >&lt;&lt;</a></li>
                <li class="disabled"><a >&lt;</a></li>
         <%} %>
 
		<c:forEach var="i" begin="${begin}" end="${end}">
            <c:choose>
                <c:when test="${i == current}">
                    <li class="active"><a id="curPage">${i}</a></li>
                </c:when>
                <c:otherwise>
                    <li><a class="changePage" id="numPage" href="?page=${i}&sortType=${sortType}">${i}</a></li>
                </c:otherwise>
            </c:choose>
            
        </c:forEach>
	  
	  	 <% if (current<=totalPages-1){%>
               	<li><a class="changePage" id="nextPage" href="?page=${current+1}&sortType=${sortType}">&gt;</a></li>
                <li><a class="changePage" id="lastPage" href="?page=${totalPages}&sortType=${sortType}">&gt;&gt;</a></li>
                
         <%}else{%>
                <li class="disabled"><a >&gt;</a></li>
                <li class="disabled"><a >&gt;&gt;</a></li>
         <%} %>

	</ul>
</div>