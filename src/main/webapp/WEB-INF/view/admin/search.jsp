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

            <form action="<c:url value='/search' />" class="well">

                <fieldset class="span8">
                    <input type="hidden" name="hostFamilyId" value="${hostFamily.id}">
                    <input name="queryString" class="span12" value="${queryString}"/>
                </fieldset>
                <button type="submit" class="btn span4">search</button>

            </form>

            <div class="well sidebar-nav">

                <ul class="nav nav-list">

                    <li class="nav-header">Host Families...</li>

                    <c:forEach items="${hostFamilies}" var="hostFamily">
                        <li>
                            <a href="<c:url value="/search/?hostFamilyId=${hostFamily.id}" />">
                                    ${hostFamily.firstName}, ${hostFamily.lastName}, ${hostFamily.phone}
                                - ${hostFamily.firstName2}, ${hostFamily.lastName2}, ${hostFamily.phone2}
                            </a>
                        </li>
                    </c:forEach>

                </ul>
            </div>
        </div>

        <c:if test="${hostFamily.id > 0}">

            <form:form commandName="hostFamily" cssClass="span8 well">
                <legend>${hostFamily.firstName} ${hostFamily.lastName}</legend>
                <fieldset>
                    <div class="span6">

                        <div class="span12">
                            <div>
                                <div class="span4">
                                    <form:label path="firstName">first name</form:label>
                                    <form:input cssClass="span12" path="firstName" label="firstName" disabled="true"/>
                                </div>
                                <div class="span4">
                                    <form:label path="lastName">last name</form:label>
                                    <form:input cssClass="span12" path="lastName" label="lastName" disabled="true"/>
                                </div>
                                <div class="span4">
                                    <form:label path="profession">profession</form:label>
                                    <form:input cssClass="span12" path="profession" label="profession" disabled="true"/>
                                </div>
                            </div>

                            <div>
                                <div class="span4">
                                    <form:input cssClass="span12" path="firstName2" label="firstName2" disabled="true"/>
                                </div>
                                <div class="span4">
                                    <form:input cssClass="span12" path="lastName2" label="lastName2" disabled="true"/>
                                </div>
                                <div class="span4">
                                    <form:input cssClass="span12" path="profession2" label="profession2"
                                                disabled="true"/>
                                </div>
                            </div>
                        </div>
                        <form:label path="address">Address</form:label>
                        <form:input cssClass="span12" path="address" label="address" disabled="true"/>
                        <form:input cssClass="span12" path="address2" label="address2" disabled="true"/>
                        <form:input cssClass="span12" path="address3" label="address3" disabled="true"/>

                        <form:label path="postCode">post code</form:label>
                        <form:input cssClass="span12" path="postCode" label="postCode" disabled="true"/>

                        <form:label path="phone">phone numbers</form:label>
                        <form:input cssClass="span12" path="phone" label="phone" disabled="true"/>
                        <form:input cssClass="span12" path="phone2" label="phone2" disabled="true"/>


                        <form:label path="numberOfStudents">number of students</form:label>
                        <form:input cssClass="span2" path="numberOfStudents" label="numberOfStudents" disabled="true"/>

                        <form:label path="notes">notes</form:label>
                        <form:textarea cssClass="span12" path="notes" label="notes" disabled="true"/>


                        <form:label path="email">email address</form:label>
                        <form:input cssClass="span12" path="email" label="email" disabled="true"/>

                        <form:label path="childrenAndTheirDOBs">children's details</form:label>
                        <form:textarea cssClass="span12" path="childrenAndTheirDOBs" label="childrenAndTheirDOBs"
                                       disabled="true"/>

                        <form:label path="students">student's details</form:label>
                        <form:textarea cssClass="span12" path="students" label="students" disabled="true"/>

                        <form:label path="whatToShow">what to show</form:label>
                        <form:input cssClass="span12" path="whatToShow" label="whatToShow" disabled="true"/>

                    </div>

                    <div id="map_canvas" class="span4" style="width: 350px; height: 300px"></div>


                </fieldset>
            </form:form>
        </c:if>

    </div>
    <!--/row-->

    <footer>
        <p>&copy; CIcodeRS 2012</p>
    </footer>

</div>

<div class="span8">

    <div id="mapModal" class="modal hide fade" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
                    aria-hidden="true">&times;</button>
            <h3 id="mapModalLabel">showing map
                for ${hostFamily.firstName} ${hostFamily.lastName} ${hostFamily.postCode}</h3>
        </div>


        <div class="modal-footer">
            <div class="span4">
                <button class="btn secondary" data-dismiss="modal">close</button>
            </div>
        </div>
    </div>

</div>

<!--/.fluid-container-->

<jsp:include page="footer.jsp"/>

</body>

</html>
