<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////
<%@ page import="java.util.List"  %>
<%@ page import="com.model2.mvc.service.domain.Product" %>
<%@ page import="com.model2.mvc.common.Search" %>
<%@page import="com.model2.mvc.common.Page"%>
<%@page import="com.model2.mvc.common.util.CommonUtil"%>

<%
    List<Product> list= (List<Product>)request.getAttribute("list");
    Page resultPage=(Page)request.getAttribute("resultPage");

	Search search=(Search)request.getAttribute("search");
	
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
	
	String menu= (String)request.getAttribute("menu");
%>  /////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>

<html>
<head>
<title>��ǰ����</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">

	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
	function fncGetUserList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
	   	document.detailForm.submit();		
	}

</script>

</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">
<!-- /////////////////////////////////////////////////////////////////////////////
<form name="detailForm" action="/listProduct.do?menu=${menu}" method="post">
///////////////////////////////////////////////////////////////////////////////////////// -->
<form name="detailForm" action="/product/listProduct?menu=${menu}" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					
					<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////
							<% if(menu.equals("manage")){ %>
					
							   ��ǰ����
							<%}else if(menu.equals("search")){ %>
							   ��ǰ �����ȸ
							<%} %>
					/////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>
					
				<c:choose>
				  <c:when test="${menu eq 'manage'}">��ǰ����</c:when>
				  <c:when test="${menu eq 'search'}">��ǰ �����ȸ</c:when>
				</c:choose>
					
					
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		
		<td align="right">
         <select name="searchCondition" class="ct_input_g" style="width:80px">
            <%-- /////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////
            <option value="0" <%= (searchCondition.equals("0") ? "selected" : "")%>>��ǰ��ȣ</option>
            <option value="1" <%= (searchCondition.equals("1") ? "selected" : "")%>>��ǰ��</option>
            <option value="2" <%= (searchCondition.equals("2") ? "selected" : "")%>>��ǰ����</option>
            /////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>
            <option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
			<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
			<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ����</option>
         </select>
         <%--<input type="text" name="searchKeyword" value="<%= searchKeyword %>"  class="ct_input_g" 
                     style="width:200px; height:20px" >--%>
          <input type="text" name="searchKeyword" 
						value="${! empty search.searchKeyword ? search.searchKeyword : ""}"  
						class="ct_input_g" style="width:200px; height:20px" > 
      </td>


		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetUserList('1');">�˻�</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<%--<td colspan="11" >��ü  <%= resultPage.getTotalCount()%> �Ǽ�, ���� <%=resultPage.getCurrentPage() %> ������</td>--%>
	    <td colspan="11" > ��ü  ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage}  ������
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////
	<% 	
	    System.out.println("listproduct.jsp menu:"+menu);

		for(int i=0; i<list.size(); i++) {
			Product vo = list.get(i);
	%>
		
	<tr class="ct_list_pop">
		<td align="center"><%= i + 1 %></td>
		<td></td>

				<td align="left"><a href="/getProduct.do?prodNo=<%= vo.getProdNo() %>&menu=<%=menu%>"><%= vo.getProdName() %></a></td>
		

		<td></td>
		<td align="left"><%= vo.getPrice() %></td>
		<td></td>
		<td align="left"><%= vo.getManuDate() %></td>
		<td></td>
		<td align="left">
		
			<%if(menu.equals("manage")){ %>
		<%    if(vo.getProTranCode()==null){ %>
		        
		        �Ǹ���
		<%    }else if(vo.getProTranCode().trim().equals("2")){ %>
			    
			    ���ſϷ�
		
					<a href="/updateTranCode.do?prodNo=<%=vo.getProdNo() %>&tranCode=3">����ϱ�</a>
	    <%    }else if(vo.getProTranCode().trim().equals("3")){ %>
			
			    �����
			
			        <a href="/updateTranCode.do?prodNo=<%=vo.getProdNo() %>&tranCode=4">��ۿϷ�</a>
	    <%    }else if(vo.getProTranCode().trim().equals("4")){ %>
			        
	    	    ��ۿϷ�
	    	    
	    <%     } %>
		<%}else if(menu.equals("search")){ %>
		<%     
		      if(vo.getProTranCode()!=null){
		    	  if(vo.getProTranCode().trim().equals("2")||vo.getProTranCode().trim().equals("3")||vo.getProTranCode().trim().equals("4")){%>
		            ������
		          <%} %>
		<%    }else{ %>
			    �Ǹ���
        <%    } %>
        <%} %>
		 
		</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	<% } %>
	
%>/////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>

<c:set var="i" value="0" />
	<c:forEach var="pro" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			<td></td>
			<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////
			<td align="left"><a href="/getProduct.do?prodNo=${pro.prodNo}&menu=${menu}">${pro.prodName}</a></td>
			////////////////////////////////////////////////////////////////////////////////////////////////////// -->
			<td align="left"><a href="/product/getProduct?prodNo=${pro.prodNo}&menu=${menu}">${pro.prodName}</a></td>
			<td></td>
			<td align="left">${pro.price}</td>
			<td></td>
			<td align="left">${pro.manuDate}</td>		
			<td></td>
		<td align="left">
		
		<c:choose>
		
		  <c:when test="${menu eq 'manage'}">
		    <c:choose>
		      <c:when test="${pro.proTranCode eq '0'}">�Ǹ���</c:when>
		      <c:when test="${pro.proTranCode eq '2'}">
		      ���ſϷ�
		      <!-- ////////////////////////////////////////////////////////////////////////////////////////////////////
		      <a href="/updateTranCode.do?prodNo=${pro.prodNo}&tranCode=3">����ϱ�</a>
		      ////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		      <a href="/product/updateTranCode?prodNo=${pro.prodNo}&tranCode=3">����ϱ�</a>
		      </c:when>
		      <c:when test="${pro.proTranCode eq '3'}">
		      �����
		      </c:when>
		      <c:when test="${pro.proTranCode eq '4'}">��ۿϷ�</c:when>
		    </c:choose> 
		  </c:when>
		  
		  <c:when test="${menu eq 'search'}">
		    <c:choose>
		      <c:when test="${pro.proTranCode eq '0'}">�Ǹ���</c:when>
		      <c:otherwise>������</c:otherwise>
		    </c:choose>
		  </c:when>
		  
		</c:choose>
		 
		</td>	
		</tr>
		<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>
	
	</table>


<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
	<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// 		   
	<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
			�� ����
	<% }else{ %>
			<a href="javascript:fncGetUserList('<%=resultPage.getCurrentPage()-1%>')">�� ����</a>
	<% } %>

	<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
			<a href="javascript:fncGetUserList('<%=i %>');"><%=i %></a>
	<% 	}  %>
	
	<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
			���� ��
	<% }else{ %>
			<a href="javascript:fncGetUserList('<%=resultPage.getEndUnitPage()+1%>')">���� ��</a>
	<% } %>
	 /////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>
	
		<jsp:include page="../common/pageNavigator.jsp"/>	
			
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->

</form>

</div>
</body>
</html>
