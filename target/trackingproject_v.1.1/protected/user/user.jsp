<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--<user-tabs></user-tabs>--%>

<%--<div ng-controller="userController">
    <div ng-repeat="n in users">
        {{n}}
    </div>
</div>--%>

<div ng-controller="userController">
    <table class="table table-bordered">
        <thead>
        <th>Name</th>
        <th>Email</th>
        <th></th>
        <th ng-if="users.length > 0"></th>
        </thead>

        <!-- Add a row for each user present in the model layer -->
        <tbody ng-repeat="user in users" ng-switch on="user.state">

        <!-- Edit Mode Template -->
        <tr ng-switch-when="edit">
            <td>
                <input type="text" class="form-control" ng-model="user.name" />
            </td>
            <td>
                <input type="text" class="form-control" ng-model="user.email" />
            </td>
            <td>
                <input type="button" class="btn btn-success" ng-click="saveUser(user);" value="Save" />
            </td>
            <td>
                <input type="button" class="btn btn-danger" ng-click="cancelEdit(user);" value="Cancel" />
            </td>
        </tr>

        <!-- Deleted Mode Template -->
        <tr class="danger" ng-switch-when="deleted">
            <td>{{user.name}}</td>
            <td>{{user.email}}</td>
            <td>
                <input type="button" class="btn btn-danger" ng-click="deleteUser(user);" value="Delete Permanently" />
            </td>
            <td>
                <input type="button" class="btn btn-success" ng-click="undoDelete(user)" value="Undo"/>
            </td>
        </tr>

        <!-- Normal Mode Template -->
        <tr ng-switch-default>
            <td>{{user.name}} </td>
            <td>{{user.email}}</td>
            <td>
                <input type="button" class="btn btn-primary" ng-click="editUser(user);" value="Edit" />
            </td>
            <td>
                <input type="button" class="btn btn-danger" ng-click="deleteUser(user);" value="Delete"/>
            </td>
        </tr>
        </tbody>

        <!-- New User Form -->
        <tbody>
        <tr>
            <td>
                <input type="text" class="form-control" ng-model="newUser.name" />
            </td>
            <td>
                <input type="text" class="form-control" ng-model="newUser.email" />
            </td>
            <td>
                <input type="button" class="btn btn-primary" ng-click="addUser();" value="Add"/>
            </td>
        </tr>
        </tbody>
    </table>
</div>

<link href="<c:url value='/resources/css/sample.css'  />" rel="stylesheet"/>
<script src="<c:url value="/resources/js/controller/userControllers.js" />"></script>