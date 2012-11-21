<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<jsp:include page="head.jsp"/>
<body>
<jsp:include page="nav.jsp"/>


<div class="container-fluid">
    <div class="row-fluid">

        <div class="span3">

            <div style="padding-bottom: 24px;">
                <a href="<c:url value="/hostFamily"/>" class="btn btn-primary btn-large">new Host Family</a>
            </div>
            <div class="well sidebar-nav">

                <ul class="nav nav-list">

                    <li class="nav-header">Host Families...</li>

                    <c:forEach items="${hostFamilies}" var="hostFamily">
                        <li><a href="<c:url value="/admin/hostFamily/${hostFamily.id}" />">${hostFamily.name}</a></li>
                    </c:forEach>

                </ul>
            </div>
        </div>

        <form:form commandName="hostFamily" method="" cssClass="span9 well" enctype="multipart/form-data">
            <legend>${hostFamily.id>0?'Edit ':'Insert New '} ${hostFamily.name}</legend>
            <fieldset>
                <div class="span4">

                    <form:hidden path="id"/>

                    <div>
                        <a data-toggle="modal" href="#mapModal" class="btn secondary btn-large">show map</a>
                    </div>

                    <form:label path="firstName">first name</form:label>
                    <form:input cssClass="span12" path="firstName" label="firstName"/>

                    <form:label path="lastName">last name</form:label>
                    <form:input cssClass="span12" path="lastName" label="lastName"/>

                    <form:label path="profession">profession</form:label>
                    <form:input cssClass="span12" path="profession" label="profession"/>

                    <form:label path="firstName2">first name</form:label>
                    <form:input cssClass="span12" path="firstName2" label="firstName2"/>

                    <form:label path="lastName2">last name</form:label>
                    <form:input cssClass="span12" path="lastName2" label="lastName2"/>

                    <form:label path="profession2">profession</form:label>
                    <form:input cssClass="span12" path="profession2" label="profession2"/>

                    <form:label path="address">Address</form:label>
                    <form:input cssClass="span12" path="address" label="address"/>

                    <form:label path="address2">&nbsp;</form:label>
                    <form:input cssClass="span12" path="address2" label="address2"/>

                    <form:label path="address3">&nbsp;</form:label>
                    <form:input cssClass="span12" path="address3" label="address3"/>

                    <form:label path="postCode">post code</form:label>
                    <form:input cssClass="span12" path="postCode" label="postCode"/>

                    <form:label path="phone">phone numbers</form:label>
                    <form:input cssClass="span12" path="phone" label="phone"/>

                    <form:label path="phone2">&nbsp;</form:label>
                    <form:input cssClass="span12" path="phone2" label="phone2"/>

                    <form:label path="numberOfStudents">number of students</form:label>
                    <form:input cssClass="span12" path="numberOfStudents" label="numberOfStudents"/>

                    <form:label path="notes">notes</form:label>
                    <form:textarea cssClass="span12" path="notes" label="notes"/>

                    <form:label path="confirmed">confirmed?</form:label>
                    <form:checkbox cssClass="span12" path="confirmed" label="confirmed"/>

                    <form:label path="email">email address</form:label>
                    <form:input cssClass="span12" path="email" label="email"/>

                    <form:label path="email">email address</form:label>
                    <form:input cssClass="span12" path="email" label="email"/>

                    <form:label path="childrenAndTheirDOBs">children's details</form:label>
                    <form:textarea cssClass="span12" path="childrenAndTheirDOBs" label="childrenAndTheirDOBs"/>

                    <form:label path="students">student's details</form:label>
                    <form:textarea cssClass="span12" path="students" label="students"/>

                    <form:label path="whatToShow">what to show</form:label>
                    <form:input cssClass="span12" path="whatToShow" label="whatToShow"/>

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
            <h3 id="deleteModalLabel">deleting host family ${hostFamily.firstName} ${hostFamily.secondName} ${hostFamily.firstName2} ${hostFamily.secondName2}</h3>
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


<div class="span8">

    <div id="mapModal" class="modal hide fade" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
                    aria-hidden="true">&times;</button>
            <h3 id="mapModalLabel">showing map for ${hostFamily.firstName} ${hostFamily.secondName} ${hostFamily.postCode}</h3>
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
