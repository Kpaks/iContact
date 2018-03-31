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
    <script src="https://code.jquery.com/jquery.js"></script>

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
	                          <li><a href="<c:url value="/"/>">Logout</a></li>
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
                    <li><a href="#"><i class="glyphicon glyphicon-calendar"></i> Insert Contact</a></li>
                </ul>
             </div>
		  </div>
		  <div class="col-md-10">
		  	<div class="row">
		  	  <div class="col-md-12">
		  			<ol class="breadcrumb">
					  <li><a href="/iContact/index">Dashboard</a></li>
					 <c:if test="${contact.company.id != null}">
					  <li><a href="/iContact/contacts?cm=${contact.company.id}">Contacts</a></li>
					 </c:if>
					  <li class="active">Form</li>
					</ol>
			  </div>

		  		<div class="col-md-12">
		  			<div class="row">
		  				<div class="col-md-12">
		  					<div class="content-box-header">
			  					<div class="panel-title">iContact Form</div>
								
								<div class="panel-options">
									<a href="#" data-rel="collapse"><i class="glyphicon glyphicon-refresh"></i></a>
									<a href="#" data-rel="reload"><i class="glyphicon glyphicon-cog"></i></a>
								</div>
				  			</div>
				  			<div class="content-box-large box-with-header">
				  				<form action="insert" method="POST" modelAttribute="company">
				  						<div class="row">
				  						<input class="hidden" type="text" id="id" name="id"  value="${contact.id}">
				  					  <div class="form-group col-lg-2">
									    <label>Choose Company: </label>
									    <div class="input-group">
									    	<span class="input-group-addon"><i class="fa fa-industry"></i></span>
										    <select class="form-control" id="company" name="company.id">
										    <c:forEach items="${companies}" var="company">
					  						
					  							<option <c:if test="${contact.company.id == company.id}">selected="selected"</c:if>
					  							value="${company.id}">${company.name}
					  							
					  							</option>
					  							
					  						</c:forEach>
										    
										    </select>
									    </div>
									  </div>	
				  						</div>
									  <div class="form-group">
									    <label for="name">Contact Name: </label>
									    
									    <div class="input-group">
				                                    <span class="input-group-addon"><i class="fa fa-user"></i></span> 
									    			<input type="text" class="form-control"  name="name" placeholder="Enter name" value="${contact.name}">
		                                </div>
									    <small id="emailHelp" class="form-text text-muted">We'll never share your name with anyone else.</small>
									  </div>
									  
									  <div class="form-group">
									    <label for="area">Area: </label>
									  	<div class="input-group">
									  	<span class="input-group-addon"><i class="fa fa-briefcase"></i></span> 
									    <input type="text" class="form-control" id="area" name="area" placeholder="Enter Area" value="${contact.area}">
									    </div>
									  </div>
									  <!-- <div class="form-group">
									    <label for="exampleSelect1">Example select</label>
									    <select class="form-control" id="exampleSelect1">
									      <option>1</option>
									      <option>2</option>
									      <option>3</option>
									      <option>4</option>
									      <option>5</option>
									    </select>
									  </div> -->
									  <!-- <div class="form-group">
									    <label for="exampleTextarea">Example textarea</label>
									    <textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
									  </div>
									  <div class="form-group">
									    <label for="exampleInputFile">File input</label>
									    <input type="file" class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp">
									    <small id="fileHelp" class="form-text text-muted">This is some placeholder block-level help text for the above input. It's a bit lighter and easily wraps to a new line.</small>
									  </div>
									  <fieldset class="form-group">
									    <legend>Radio buttons</legend>
									    <div class="form-check">
									      <label class="form-check-label">
									        <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios1" value="option1" checked>
									        Option one is this and that&mdash;be sure to include why it's great
									      </label>
									    </div>
									    <div class="form-check">
									    <label class="form-check-label">
									        <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios2" value="option2">
									        Option two can be something else and selecting it will deselect option one
									      </label>
									    </div>
									    <div class="form-check disabled">
									    <label class="form-check-label">
									        <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios3" value="option3" disabled>
									        Option three is disabled
									      </label>
									    </div>
									  </fieldset>
									  <div class="form-check">
									    <label class="form-check-label">
									      <input type="checkbox" class="form-check-input">
									      Check me out
									    </label>
									  </div> -->
									  <button type="submit" class="btn btn-primary">Submit</button>
									</form>
							</div>
		  				</div>
		  			</div>
		  		</div>
		  	</div>
		  	
		  </div>
		</div>
    </div>
	<script>
		
	
	$(document).ready(function() {
	
		
	});
	
	</script>
	
    <script src="https://code.jquery.com/jquery.js"></script>
    <script src="<c:url value="/static/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/static/js/custom.js" />"></script>
    
  </body>
</html>