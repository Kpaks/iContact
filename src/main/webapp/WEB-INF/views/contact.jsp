<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <title>iContact - Your Web Contacts</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet">
    <!-- styles -->
    <link href="<c:url value="/static/css/font-awesome.min.css" />" rel="stylesheet">
    <link href="<c:url value="/static/css/styles.css" />" rel="stylesheet">

  </head>
  <body>
  	<div class="header">
	     <div class="container">
	        <div class="row">
	           <div class="col-md-5">
	              <!-- Logo -->
	              <div class="logo">
	                 <h1><a href="index.html">iContact</a></h1>
	              </div>
	           </div>
	           <div class="col-md-5">
	              <div class="row">
	                <div class="col-lg-12">
	                  <div class="input-group form">
	                       <input type="text" class="form-control" placeholder="Search...">
	                       <span class="input-group-btn">
	                         <button class="btn btn-primary" type="button">Search</button>
	                       </span>
	                  </div>
	                </div>
	              </div>
	           </div>
	           <div class="col-md-2">
	              <div class="navbar navbar-inverse" role="banner">
	                  <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
	                    <ul class="nav navbar-nav">
	                      <li class="dropdown">
	                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">My Account <b class="caret"></b></a>
	                        <ul class="dropdown-menu animated fadeInUp">
	                          <li><a href="profile.html">Profile</a></li>
	                          <li><a href="login.html">Logout</a></li>
	                        </ul>
	                      </li>
	                    </ul>
	                  </nav>
	              </div>
	           </div>
	        </div>
	     </div>
	</div>

    <div class="page-content">
    	<div class="row">
		  <div class="col-md-2">
		  	<div class="sidebar content-box" style="display: block;">
                <ul class="nav">
                    <!-- Main menu -->
                    <li class="current"><a href="<c:url value="/index"/>"><i class="glyphicon glyphicon-home"></i> Dashboard</a></li>
                    <li><a href="<c:url value="/form-contact"/>"><i class="glyphicon glyphicon-calendar"></i> Calendar</a></li>
                </ul>
             </div>
		  </div>
		  <div class="col-md-10">
		  	<div class="row">

		  		<div class="col-md-12">
		  			<div class="row">
		  			<div class="col-md-12">
		  			<ol class="breadcrumb">
					  <li><a href="/iContact/index">Dashboard</a></li>
					  <li class="active">Contacts</li>
					</ol>
					</div>
		  				<div class="col-md-12">
		  					<div class="content-box-header">
			  					<div class="panel-title">Contacts Table - ${company.name}</div>
								
								<div class="panel-options">
									<a href="#" data-rel="collapse"><i class="glyphicon glyphicon-refresh"></i></a>
									<a href="#" data-rel="reload"><i class="glyphicon glyphicon-cog"></i></a>
								</div>
				  			</div>
				  			<div class="content-box-large box-with-header">
				  				<table border=1>
				  				<thead>
				  					<tr>
				  						<th>NAME</th>
				  						<th>AREA</th>
				  						<th>Action</th>
				  					</tr>
				  				</thead>
				  				<tbody>
				  					 <c:forEach items="${company.contacts}" var="contact">
				  						
				  						<tr>
				  							<td >${contact.name}</td>
				  							<td>${contact.area}</td>
				  							<td>
				  								<input class="btn btn-primary btn-sm" type="button" onclick="location.href='form-contact?id=${contact.id}';" value="Edit" />
				  								<input class="btn btn-danger btn-sm" type="button" onclick="location.href='contact-delete?id=${contact.id}&companyId=${contact.company.id}';" value="Delete" />
				  							</td>
				  						</tr>
				  					</c:forEach>
				  					
				  				</tbody>
				  			</table>
							</div>
		  				</div>
		  			</div>
		  		</div>
		  	</div>
		  	
		  </div>
		</div>
    </div>
	<script>
	
	</script>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value="/static/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/static/js/custom.js" />"></script>
  </body>
</html>