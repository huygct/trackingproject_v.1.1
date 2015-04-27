<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<div ng-controller="userController">--%>
    <%--<div ng-repeat="n in users">--%>
        <%--{{n}}--%>
    <%--</div>--%>
<%--</div>--%>
<div class="container" ng-controller="userController">
    <div id="fui-button" class="pbl"></div>

    <div class="demo-row">
        <div class="demo-title">
            Dynamic Tabs
        </div>
        <div class="demo-content">
            <tabset>
                <tab heading="Static title">Static content</tab>
                <tab ng-repeat="tab in tabs" heading="{{tab.title}}" active="tab.active" disabled="tab.disabled">
                    {{tab.content}}
                </tab>
                <tab select="alertMe()">
                    <tab-heading>
                        <i class="glyphicon glyphicon-bell"></i> Alert!
                    </tab-heading>
                    I've got an HTML heading, and a select callback. Pretty cool!
                </tab>
            </tabset>
        </div> <!-- /.demo-content -->
    </div> <!-- /.demo-row -->
</div><!-- /.container -->

<script src="<c:url value="/resources/js/controller/homeControllers.js" />"></script>