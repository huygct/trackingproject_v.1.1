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

<div class="container-fluid" ng-controller="reportController">
    <h2 class="sub-header">Summary</h2>

    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Total number</th>
                <th>Male</th>
                <th>Female</th>
                <th>Female/Male (%)</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>{{information.size}}</td>
                <td>{{information.male}}</td>
                <td>{{information.female}}</td>
                <td>{{((information.female/information.male)*100)/information.size}}%</td>
            </tr>
            </tbody>
        </table>
    </div>
    <!-- pie chart canvas element : Gender -->
    <div>
        <center><canvas id="gender" width="600" height="200"></canvas></center>
        <center>Gender chart</center>
    </div>

    <!-- Experience-------------------------------------------->
    <h2 class="sub-header">Experience</h2>

    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <th><0.5</th>
                <th>0.5-1 year</th>
                <th>1-2 years</th>
                <th>2-3 years</th>
                <th>3-5 years</th>
                <th>5+ years</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>{{information.yearExperiences_0}}</td>
                <td>{{information.yearExperiences_1}}</td>
                <td>{{information.yearExperiences_2}}</td>
                <td>{{information.yearExperiences_3}}</td>
                <td>{{information.yearExperiences_4}}</td>
                <td>{{information.yearExperiences_5}}</td>
            </tr>
            </tbody>
        </table>
    </div>
    <!-- pie chart canvas element : experience -->
    <div>
        <center><canvas id="experience" width="600" height="200"></canvas></center>
        <center>Experience chart</center>
    </div>

    <!-- Month report-------------------------------------------->
    <h2 class="sub-header">Monthly Report</h2>
    <div class="col-xs-6">
        Month:
        <select class="form-control" ng-model="date.choiceMonth" ng-options="opt for opt in options.months"></select>
        Year:
        <select class="form-control" ng-model="date.choiceYear" ng-options="opt for opt in options.years"></select>
        <button type="btn btn-primary" class="btn btn-primary" ng-click="viewInformationByMonth()">View</button>
    </div>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Pool size</th>
                <th>In</th>
                <th>Out</th>
                <th>Male</th>
                <th>Female</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>{{information.size}}</td>
                <td>{{informationByMonth.inByMonth}}</td>
                <td>{{informationByMonth.outByMonth}}</td>
                <td>{{informationByMonth.numberMaleByMonth}}</td>
                <td>{{informationByMonth.numberFemaleByMonth}}</td>
            </tr>
            </tbody>
        </table>
    </div>

</div>



<script src="<c:url value="/resources/js/controller/reportController.js" />"></script>
<script src="<c:url value="/resources/chart/Chart.js" />"></script>
<script src="<c:url value="/resources/chart/Chart.min.js" />"></script>