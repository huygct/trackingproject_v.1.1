<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<div ng-controller="userController">--%>
<%--<div ng-repeat="n in users">--%>
<%--{{n}}--%>
<%--</div>--%>
<%--</div>--%>

<div class="container" ng-controller="homeController">
    <div id="fui-button" class="pbl"></div>

    <div class="demo-row">

        <div class="alert alert-info" style="width:400px;margin-left:100px;" ng-show="userProfile == null">
            No user profile entry found
        </div>
        <table class="table table-bordered table-striped" ng-show="userProfile != null">
            <tr>
                <th>Badge Id</th>
                <th>{{userProfile.badgeId}}</th>
            </tr>
            <tr>
                <th>Badge Id Of Mentor</th>
                <th>{{userProfile.badgeIdMentor}}</th>
            </tr>
            <tr>
                <th>School</th>
                <th>{{userProfile.school}}</th>
            </tr>
            <tr>
                <th>Degree</th>
                <th>{{userProfile.degree}}</th>
            </tr>
            <tr>
                <th>Graduate Date</th>
                <th>{{userProfile.graduateDate}}</th>
            </tr>
            <tr>
                <th>Final Study Result</th>
                <th>{{userProfile.finalStudyResult}}</th>
            </tr>
            <tr>
                <th>Toeic</th>
                <th>{{userProfile.toeic}}</th>
            </tr>
            <tr>
                <th>Join Date</th>
                <th>{{userProfile.joinDate}}</th>
            </tr>
            <tr>
                <th>Work Role</th>
                <th>{{userProfile.workRole}}</th>
            </tr>
            <tr>
                <th>Experience Years</th>
                <th>{{userProfile.experienceYears}}</th>
            </tr>
            <tr>
                <th>Experience Years In Current Role</th>
                <th>{{userProfile.experienceYearsInCurrentRole}}</th>
            </tr>
            <tr>
                <th>Professional Certification</th>
                <th>{{userProfile.professionalCertification}}</th>
            </tr>
            <tr>
                <th>Oversea Working Experience</th>
                <th>{{userProfile.overseaWorkingExperience}}</th>
            </tr>
            <tr>
                <th>Police Clearance Status</th>
                <th>{{userProfile.policeClearanceStatus}}</th>
            </tr>
            <tr>
                <th>CV</th>
                <th>{{userProfile.cvUrl}}</th>
            </tr>
            <tr>
                <th>Image User</th>
                <th>{{userProfile.imageUser}}</th>
            </tr>
            <tr>
                <th>CV</th>
                <th>{{userProfile.place}}</th>
            </tr>
            <tr>
                <th>Gender</th>
                <th>{{userProfile.gender}}</th>
            </tr>
            <tr>
                <th>Need Tracking</th>
                <th>{{userProfile.needTracking}}</th>
            </tr>
            <tr>
                <th>Skype Id</th>
                <th>{{userProfile.skypeId}}</th>
            </tr>
            <tr>
                <th>Ip Address</th>
                <th>{{userProfile.ipAddress}}</th>
            </tr>
            <tr>
                <th>General Status</th>
                <th>{{userProfile.generalStatus}}</th>
            </tr>
        </table>

        <button class="btn btn-mini btn-danger" ng-click="editUserProfile(userProfile)">Update</button>

        <div class="demo-title">
            User Profile
        </div>
        <div class="demo-content">
            <div class="alert alert-error" ng-show="error">{{errorMessage}}</div>
            <div class="row">
                <form ng-submit="addUserProfile(ab)">
                    ab.badgeId = 0;
                    ab.badgeIdMentor = 0;

                    <div class="col-lg-8">
                        <input class="form-control" placeholder="Enter Badge Id" type="text" ng-model="ab.badgeId" value="0" required min="1" /><br>
                        <input class="form-control" placeholder="Enter Badge Id of mentor" type="text" ng-model="ab.badgeIdMentor" value="0" required min="1" /><br>
                        <input class="form-control" placeholder="Enter Phone" type="text" ng-model="ab.school" required min="1" /><br>
                        <input class="form-control" placeholder="Enter Email" type="text" ng-model="ab.degree" required min="1" /><br>

                        <input class="form-control" placeholder="Enter Graduate Date" type="text" ng-model="ab.graduateDate" value="2007-09-23 10:10:10.0" required min="1" /><br>
                        <input class="form-control" placeholder="Enter Last Name" type="text" ng-model="ab.finalStudyResult" value="0" required min="1" /><br>
                        <input class="form-control" placeholder="Enter Phone" type="text" ng-model="ab.toeic" value="0" required min="1" /><br>
                        <input class="form-control" placeholder="Enter Join Date" type="text" ng-model="ab.joinDate" value="2007-09-23 10:10:10.0" required min="1" /><br>
                        <input class="form-control" placeholder="Enter First Name" type="text" ng-model="ab.workRole" required min="1" /><br>
                        <input class="form-control" placeholder="Enter Last Name" type="text" ng-model="ab.experienceYears" value="0" required min="1" /><br>
                        <input class="form-control" placeholder="Enter Phone" type="text" ng-model="ab.experienceYearsInCurrentRole" value="0" required min="1" /><br>

                        <input class="form-control" placeholder="Enter 111111111" type="text" ng-model="ab.professionalCertification" value="false" required min="1" /><br>
                        <input class="form-control" placeholder="Enter 111111111" type="text" ng-model="ab.overseaWorkingExperience" value="false" required min="1" /><br>
                        <input class="form-control" placeholder="Enter Last Name" type="text" ng-model="ab.policeClearanceStatus" required min="1" /><br>
                        <input class="form-control" placeholder="Enter Phone" type="text" ng-model="ab.cvUrl" required min="1" /><br>
                        <input class="form-control" placeholder="Enter Email" type="text" ng-model="ab.imageab" required min="1" /><br>
                        <input class="form-control" placeholder="Enter First Name" type="text" ng-model="ab.place" required min="1" /><br>

                        <input class="form-control" placeholder="Enter 11111111111" type="text" ng-model="ab.gender" value="false" required min="1" /><br>
                        <input class="form-control" placeholder="Enter 111111111" type="text" ng-model="ab.needTracking" value="false" required min="1" /><br>
                        <input class="form-control" placeholder="Enter Email" type="text" ng-model="ab.skypeId" required min="1" /><br>
                        <input class="form-control" placeholder="Enter First Name" type="text" ng-model="ab.ipAddress" required min="1" /><br>
                        <input class="form-control" placeholder="Enter Last Name" type="text" ng-model="ab.generalStatus" required min="1" /><br>
                    </div>
                </form>

                <button class="btn btn-primary" ng-disabled="!ab" ng-hide="editMode" ng-click="addUserProfile(ab)">Add Entry</button>
                <button type="btn btn-primary" class="btn btn-primary"
                        ng-disabled="!ab" ng-show="editMode"
                        ng-click="updateAddressBook(ab)">Save</button>
                <button type="btn btn-primary" class="btn btn-primary" ng-click="resetAddressBookField()">Reset</button>
            </div>
            <hr />

            <div class="row">
                <div class="col-lg-8">
                    <div class="form-group">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search" id="search-query-3" ng-model="searchAddressBook">
                  <span class="input-group-btn">
                    <button type="submit" class="btn"><span class="fui-search"></span></button>
                  </span>
                        </div>
                    </div>
                </div>
            </div>
            <hr />

            <button class="btn btn-danger"  ng-show="addressBooks.length >= 1" ng-click="deleteAllAddressBook()">Delete All Address Book</button>
        </div> <!-- /.demo-content -->
    </div> <!-- /.demo-row -->
</div><!-- /.container -->

<div id="tabs" ng-controller="homeController">
    <ul>
        <li class="tabs" ng-repeat="tab in tabs"
            ng-class="{active:isActiveTab(tab.url)}"
            ng-click="onClickTab(tab)">{{tab.title}}
        </li>
    </ul>
    <div id="mainView">
        <div ng-include="currentTab"></div>
    </div>
</div>
<script type="text/ng-template" id="one.tpl.html">
    <div id="viewOne">
        <h1>View One</h1>

        <p>Praesent id metus massa, ut blandit odio. Proin quis tortor orci. Etiam at risus et justo dignissim congue.
            Donec congue lacinia dui, a porttitor lectus condimentum laoreet. Nunc.</p>
    </div>
</script>

<script type="text/ng-template" id="two.tpl.html">
    <div id="viewTwo">
        <h1>View Two</h1>

        <p>Curabitur vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante, ac egestas est urna sit amet
            arcu. Class aptent taciti sociosqu.</p>
    </div>
</script>

<script type="text/ng-template" id="three.tpl.html">
    <div id="viewThree">
        <h1>View Three</h1>

        <p>In pellentesque faucibus vestibulum. Nulla at nulla justo, eget luctus tortor. Nulla facilisi. Duis aliquet
            egestas purus in blandit. Curabitur vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante,
            ac egestas est urna sit amet arcu. Class aptent taciti sociosqu.</p>
    </div>
</script>

<link href="<c:url value='/resources/css/tabs.css'/>" rel="stylesheet"/>
<script src="<c:url value="/resources/js/controller/homeControllers.js" />"></script>