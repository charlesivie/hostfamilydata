<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<jsp:include page="head.jsp"/>

<c:set var="onloadScript">onload="initialize('${hostFamily.postCode}')"</c:set>

<body ${fn:length(hostFamily.postCode)>0?onloadScript:''}>

<jsp:include page="nav.jsp"/>


<div class="container-fluid">
    <div class="row-fluid">

        <div class="span4">

            <c:if test="${hostFamily.id > 0}">
                <div style="padding-bottom: 24px;">
                    <a href="<c:url value="/"/>" class="btn btn-primary btn-large">new host family</a>
                </div>
            </c:if>
            <div class="well sidebar-nav">

                <ul class="nav nav-list">

                    <li class="nav-header">Host Families...</li>

                    <c:forEach items="${hostFamilies}" var="hostFamily">
                        <li>
                            <a href="<c:url value="/hostFamily/${hostFamily.id}" />">
                                    ${hostFamily.firstName2}, ${hostFamily.firstName}, ${hostFamily.lastName2}, ${hostFamily.lastName}- ${hostFamily.phone}, ${hostFamily.phone2}
                            </a>
                        </li>
                    </c:forEach>

                </ul>
            </div>
        </div>

        <form:form commandName="hostFamily" cssClass="span8 well">
            <legend>
                    ${hostFamily.id>0?'Edit ':'Insert New '} ${hostFamily.firstName} ${hostFamily.firstName2}
            </legend>
            <fieldset>

                <form:hidden path="id"/>

                <div class="span6">

                    <div class="span12">
                        <div>
                            <div class="span4">
                                <form:label path="firstName">first name</form:label>
                                <form:input cssClass="span12" path="firstName" label="firstName"/>
                            </div>
                            <div class="span4">
                                <form:label path="lastName">last name</form:label>
                                <form:input cssClass="span12" path="firstName2" label="firstName2"/>
                            </div>
                            <div class="span4">
                                <form:label path="profession">profession</form:label>
                                <form:input cssClass="span12" path="profession" label="profession"/>
                            </div>
                        </div>

                        <div>
                            <div class="span4">
                                <form:input cssClass="span12" path="lastName" label="lastName"/>
                            </div>
                            <div class="span4">
                                <form:input cssClass="span12" path="lastName2" label="lastName2"/>
                            </div>
                            <div class="span4">
                                <form:input cssClass="span12" path="profession2" label="profession2"/>
                            </div>
                        </div>
                    </div>
                    <form:label path="address">Address</form:label>
                    <form:input cssClass="span12" path="address" label="address"/>
                    <form:input cssClass="span12" path="address2" label="address2"/>
                    <form:input cssClass="span12" path="address3" label="address3"/>

                    <form:label path="postCode">post code</form:label>
                    <form:input cssClass="span12" path="postCode" label="postCode"/>

                    <form:label path="phone">phone numbers</form:label>
                    <form:input cssClass="span12" path="phone" label="phone"/>
                    <form:input cssClass="span12" path="phone2" label="phone2"/>


                    <form:label path="numberOfStudents">number of students</form:label>
                    <form:input cssClass="span2" path="numberOfStudents" label="numberOfStudents"/>

                    <form:label path="notes">notes</form:label>
                    <form:textarea cssClass="span12" path="notes" label="notes"/>


                    <form:label path="email">email address</form:label>
                    <form:input cssClass="span12" path="email" label="email"/>

                    <form:label path="childrenAndTheirDOBs">children's details</form:label>
                    <form:textarea cssClass="span12" path="childrenAndTheirDOBs" label="childrenAndTheirDOBs"/>

                    <form:label path="students">student's details</form:label>
                    <form:textarea cssClass="span12" path="students" label="students"/>

                    <form:label path="whatToShow">what to show</form:label>
                    <form:input cssClass="span12" path="whatToShow" label="whatToShow"/>

                </div>

                <div class="span4">
                    <form:label path="confirmed" cssClass="checkbox"><form:checkbox
                            path="confirmed"/> confirmed?</form:label>
                    <div id="map_canvas" style="margin-top:20px; width: 350px; height: 300px"></div>
                </div>


            </fieldset>


            <div class="form-actions">
                <div class="span3">
                    <button type="submit" class="btn btn-primary btn-large">save</button>
                </div>
                <c:if test="${hostFamily.id>0}">
                    <div>
                        <a data-toggle="modal" href="#deleteModal" class="btn secondary btn-large">delete</a>
                    </div>
                </c:if>
            </div>

        </form:form>

    </div>
    <!--/row-->

    <footer>
        <p>&copy; CIcodeRS 2012</p>
    </footer>

</div>

<div class="span8">

    <div id="deleteModal" class="modal hide fade" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
                    aria-hidden="true">&times;</button>
            <h3 id="deleteModalLabel">deleting host
                family ${hostFamily.firstName} ${hostFamily.firstName2} ${hostFamily.lastName} ${hostFamily.lastName2}</h3>
        </div>
        <div class="modal-body">
            are you sure? this cannot be un-done.
        </div>
        <div class="modal-footer">
            <div class="span4">

                <button class="btn secondary" data-dismiss="modal">cancel</button>
            </div>
            <div class="span1">
                <form id="deleteMe" name="deleteMe" action="/hostFamily/${hostFamily.id}" method="post">
                    <input type="hidden" name="_method" value="DELETE"/>
                    <button type="submit" class="btn btn-primary">delete</button>
                </form>
            </div>
        </div>
    </div>

</div>

<!--/.fluid-container-->

<jsp:include page="footer.jsp"/>

</body>

</html>
