<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Login Page with Background Image Example</title>
  <link rel="stylesheet" href="css/style.css">

</head>
<body>

<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
<!-- partial:index.partial.html -->
<div id="bg"></div>

<form method="post" action="Login" class="register-form">
  <div class="form-field">
    <input type="text" placeholder="Username" required name="username" id="username"/>
  </div>
  
  <div class="form-field">
    <input type="password" placeholder="Password" required name="password" id="password"/>                         </div>
  
  <div class="form-field">
    <button class="btn" type="submit">Log in</button>
  </div>
</form>
<!-- partial -->
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

<script type="text/javascript">

var status = document.getElementById("status").value;
if(status == "failed"){
	
	swal("sorry","Wrong Username Or Password","error")
	
	}
</script>
</body>
</html>
