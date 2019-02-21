<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>购物+</title>
      <link href="${cp}/css/bootstrap.min.css" rel="stylesheet">
      <link href="${cp}/css/style.css" rel="stylesheet">

      <script src="${cp}/js/jquery.min.js" type="text/javascript"></script>
      <script src="${cp}/js/bootstrap.min.js" type="text/javascript"></script>
      <script src="${cp}/js/layer.js" type="text/javascript"></script>
    <!--[if lt IE 9]>
      <script src="${cp}/js/html5shiv.min.js"></script>
      <script src="${cp}/js/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <jsp:include page="include/newHead.jsp"/>
    <br>

    <div class="col-sm-offset-2 col-md-offest-2">
            <div  class="form-horizontal">
                <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 col-md-2 control-label">用户名</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="inputUserName" placeholder="请输入用户名"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 col-md-2 control-label">邮箱</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="email" class="form-control" id="inputEmail" placeholder="请输入正确的邮箱格式"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputNickname" class="col-sm-2 col-md-2 control-label">昵称</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="inputNickname" placeholder="宙帅" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 col-md-2 control-label">密码</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="password" class="form-control" id="inputPassword" placeholder="禁止输入非法字符" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPhoneNumber" class="col-sm-2 col-md-2 control-label">手机号码</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="inputPhoneNumber" placeholder="请输入手机号" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="man" class="col-sm-2 col-md-2 control-label">性别</label>
                    <div class="col-sm-6 col-md-6">
                    <!--  
                        <label class="radio-inline">
                            <input type="radio" id="man" value="option1"  checked  style="width: 20px;">男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="woman" value="option2" style="width: 20px;"> 女
                        </label>
                        -->
                        
                        <label class="radio-inline">
		<input type="radio" name="optionsRadiosinline" id="man" value="option1" style="width: 20px;" checked> 男
	</label>
	<label class="radio-inline">
		<input type="radio" name="optionsRadiosinline" id="woman"  value="option2" style="width: 20px;"> 女
	</label>
	
	
                    </div>
                </div>
                <br/>
                <div class="form-group">
                    <label for="address" class="col-sm-2 col-md-2 control-label">地址</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="address" placeholder="请输入寄送地址" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-6">
                        <button class="btn btn-lg btn-primary btn-block btn-success" type="submit" onclick="Register()">注册</button>
                    </div>
                </div>
            </div>
        </div>
        <br/>
    <jsp:include page="include/newFoot.jsp"/>
    <script type="text/javascript">
        function Register() {
            var loading = layer.load(0);
            var user = {};
            user.userName = document.getElementById("inputUserName").value;
            user.email = document.getElementById("inputEmail").value;
            user.nickName = document.getElementById("inputNickname").value;
            user.password = document.getElementById("inputPassword").value;
            user.phoneNumber = document.getElementById("inputPhoneNumber").value;
            user.address = document.getElementById("address").value;
            user.sex = 0;
            if(document.getElementById("man").checked)
                user.sex = 1;
            
            var reg = /^[0-9]*$/;
            if(user.userName == ''){
                layer.msg('用户名不能为空',{icon:2});
                layer.close(loading);
                return;
            }
            else if(user.userName.length >= 12){
                layer.msg('用户名长度不能超过12个字符',{icon:2});
                layer.close(loading);
                return;
            }
            else if(reg.test(user.userName)){
                layer.msg('用户名不能为纯数字',{icon:2});
                layer.close(loading);
                return;
            }
            
            var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
            if(user.email == ''){
                layer.msg('邮箱不能为空',{icon:2});
                layer.close(loading);
                return;
            }
            else if(!myreg.test(user.email)){
                layer.msg('请输入有效的Email',{icon:2});
                layer.close(loading);
                return;
            }
            
            if(user.nickName == ''){
                layer.msg('昵称不能为空',{icon:2});
                layer.close(loading);
                return;
            }
            else if(user.nickName.length >= 15){
                layer.msg('昵称长度不能超过15个字符',{icon:2});
                layer.close(loading);
                return;
            }
            else if(reg.test(user.nickName)){
                layer.msg('昵称不能为纯数字',{icon:2});
                layer.close(loading);
                return;
            }
            if(user.password == ''){
                layer.msg('密码不能为空',{icon:2});
                layer.close(loading);
                return;
            }
            else if(user.password.length>= 20){
                layer.msg('密码长度不能超过20个字符',{icon:2});
                layer.close(loading);
                return;
            }
            
            var phone =/^(1)+\d{10}$/;
            if(user.phoneNumber == ''){
                layer.msg('手机号码不能为空',{icon:2});
                layer.close(loading);
                return;
            }
            else if (!phone.test(user.phoneNumber)){
            	layer.msg('请输入有效的手机号码',{icon:2});
            	layer.close(loading);
                return;
            }
            
            if(user.address == ''){
                layer.msg('地址不能为空',{icon:2});
                layer.close(loading);
                return;
            }
            else if(reg.test(user.address)){
                layer.msg('请输入正确地址',{icon:2});
                layer.close(loading);
                return;
            }
            
            var registerResult = null;
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/doRegister',
                data : user,
                dataType : 'json',
                success : function(result) {
                    registerResult = result.result;
                },
                error : function(result) {
                    layer.alert('查询用户错误');
                    layer.close(loading);
                }
            });
            if(registerResult == 'success'){
                layer.close(loading);
                layer.msg('注册成功',{icon:1});
                window.location.href="${cp}/login";
            }
            else if(registerResult == 'nameExist'){
                layer.close(loading);
                layer.msg('这个用户名已经被占用啦！',{icon:2});
            }
            else if(registerResult == 'emailExist'){
                layer.close(loading);
                layer.msg('邮箱已注册过请换个邮箱！',{icon:2});
            }
            else if(registerResult == 'fail'){
                layer.close(loading);
                layer.msg('服务器异常',{icon:2});
            }
        }
    </script>
  </body>
</html>