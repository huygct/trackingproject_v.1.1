<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<div ng-controller="userController">
    <table class="table table-bordered">
        <thead>
        <th>Name</th>
        <th>Email</th>
        <security:authorize ifAnyGranted="ROLE_ADMIN">
            <th></th>
            <th ng-if="users.length > 0"></th>
        </security:authorize>
        </thead>

        <!-- Add a row for each user present in the model layer -->
        <tbody ng-repeat="user in users" ng-switch on="user.state">

        <security:authorize ifAnyGranted="ROLE_ADMIN">
            <!-- Edit Mode Template -->
            <tr ng-switch-when="edit">
                <input type="hidden" ng-model="user.id" />
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
                <input type="hidden" ng-model="user.id" />
                <td>{{user.name}}</td>
                <td>{{user.email}}</td>
                <td>
                    <input type="button" class="btn btn-danger" ng-click="deleteUser(user);" value="Delete Permanently" />
                </td>
                <td>
                    <input type="button" class="btn btn-success" ng-click="undoDelete(user)" value="Undo"/>
                </td>
            </tr>
        </security:authorize>
        <!-- Normal Mode Template -->
        <tr ng-switch-default>
            <input type="hidden" value="{{user.id}}" />
            <td>{{user.name}} </td>
            <td>{{user.email}}</td>
            <security:authorize ifAnyGranted="ROLE_ADMIN">
                <td>
                    <input type="button" class="btn btn-primary" ng-click="editUser(user);" value="Edit" />
                </td>
                <td>
                    <input type="button" class="btn btn-danger" ng-click="deleteUser(user);" value="Delete"/>
                </td>
            </security:authorize>
        </tr>
        </tbody>

        <security:authorize ifAnyGranted="ROLE_ADMIN">
            <!-- New User Form -->
            <tbody>
            <tr>
                <input type="hidden" ng-model="newUser.id" />
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
        </security:authorize>
    </table>
</div>

<link href="<c:url value='/resources/css/sample.css'  />" rel="stylesheet"/>
<script src="<c:url value="/resources/js/controller/userControllers.js" />"></script>