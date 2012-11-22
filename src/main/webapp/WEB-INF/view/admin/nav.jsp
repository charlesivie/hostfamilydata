<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="#">Kingston Study Centre</a>
            <div class="nav-collapse collapse">
                <p class="navbar-text pull-right">
                    Logged in as <a href="#" class="navbar-link">Administrator</a>
                </p>
                <ul class="nav">
                    <li><a href="<c:url value="/hostFamily" />">host families</a></li>
                    <li><a href="<c:url value="/hostFamily/confirmed" />">show confirmed</a></li>
                    <li><a href="<c:url value="/search" />">search</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>
