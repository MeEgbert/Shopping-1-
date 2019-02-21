<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>管理员登陆</title>
      <link href="${cp}/css/bootstrap.min.css" rel="stylesheet">
      <link href="${cp}/css/style.css" rel="stylesheet">

      <script src="${cp}/js/jquery.min.js" type="text/javascript"></script>
      <script src="${cp}/js/bootstrap.min.js" type="text/javascript"></script>
      <script src="${cp}/js/layer.js" type="text/javascript"></script>
    
  </head>
  <body>

    <jsp:include page="include/admin_login_Head.jsp"/>

    <div class="container-fluid" style="padding-top: 80px;padding-bottom: 80px" >

<br>
      

 <div class="container" >
 <div class="col-sm-offset-2 col-md-offest-6">

				   <div class="col-md-6 col-lg-9 col-sm-6 ">
						<div class="account-info">
								<div class="form-fields">
									<h2 class="title center">管理员登录</h2>
									<p>
										<label>
											用户名
											<span class="required">*</span>
										</label>
										<input type="text" class="form-control" id="inputEmail" placeholder="xxxxxx@xx.com">
									</p>
									<p>
										<label>
											密码
											<span class="required">*</span>
										</label>
										<input type="password" class="form-control" id="inputPassword" placeholder="禁止输入非法字符">
									</p>
								</div>
								<div class="form-action">								
									<button class="btn btn-lg btn-primary btn-block btn-success"  type="submit" onclick="startLogin()">登录</button>
								</div>								
						</div>
					</div>
					</div>

</div>
 <br/> <br/> <br/>

    <jsp:include page="include/newFoot.jsp"/>

    <script type="text/javascript">
        function startLogin() {
            var loading = layer.load(0);
            var user = {};
            var loginResult = "";
            user.userNameOrEmail = document.getElementById("inputEmail").value;
            user.password = document.getElementById("inputPassword").value;
            $.ajax({
                async : false,
                type : 'POST',
                url : '${cp}/admin_doLogin',
                data : user,
                dataType : 'json',
                success : function(result) {
                    loginResult = result.result;
                    layer.close(loading);
                },
                error : function(result) {
                    layer.alert('查询用户错误');
                }
            });

            if(loginResult == 'success'){
                layer.msg('登录成功',{icon:1});
                window.location.href = "${cp}/control";
            }
            else if(loginResult == 'unexist'){
                layer.msg('是不是用户名记错了？',{icon:2});
            }
            else if(loginResult == 'wrong'){
                layer.msg('密码不对哦，再想想~',{icon:2});
            }
            else if(loginResult == 'fail'){
                layer.msg('服务器异常',{icon:2});
            }

        }
    </script>

  </body>
</html>