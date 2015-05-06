<%--
  Created by IntelliJ IDEA.
  User: thuynghi
  Date: 5/4/2015
  Time: 10:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div ng-controller="reportController">
    {{information}}
</div>


<script src="<c:url value="/resources/js/controller/reportController.js" />"></script>