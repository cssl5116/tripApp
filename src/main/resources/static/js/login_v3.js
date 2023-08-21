(function () {
  $(document).ready(function () {
    //引入md5加密算法,使用document.write()引入可能出现白屏
    function b(a,b){var c=(65535&a)+(65535&b),d=(a>>16)+(b>>16)+(c>>16);return d<<16|65535&c}function c(a,b){return a<<b|a>>>32-b}function d(a,d,e,f,g,h){return b(c(b(b(d,a),b(f,h)),g),e)}function e(a,b,c,e,f,g,h){return d(b&c|~b&e,a,b,f,g,h)}function f(a,b,c,e,f,g,h){return d(b&e|c&~e,a,b,f,g,h)}function g(a,b,c,e,f,g,h){return d(b^c^e,a,b,f,g,h)}function h(a,b,c,e,f,g,h){return d(c^(b|~e),a,b,f,g,h)}function i(a,c){a[c>>5]|=128<<c%32,a[(c+64>>>9<<4)+14]=c;var d,i,j,k,l,m=1732584193,n=-271733879,o=-1732584194,p=271733878;for(d=0;d<a.length;d+=16)i=m,j=n,k=o,l=p,m=e(m,n,o,p,a[d],7,-680876936),p=e(p,m,n,o,a[d+1],12,-389564586),o=e(o,p,m,n,a[d+2],17,606105819),n=e(n,o,p,m,a[d+3],22,-1044525330),m=e(m,n,o,p,a[d+4],7,-176418897),p=e(p,m,n,o,a[d+5],12,1200080426),o=e(o,p,m,n,a[d+6],17,-1473231341),n=e(n,o,p,m,a[d+7],22,-45705983),m=e(m,n,o,p,a[d+8],7,1770035416),p=e(p,m,n,o,a[d+9],12,-1958414417),o=e(o,p,m,n,a[d+10],17,-42063),n=e(n,o,p,m,a[d+11],22,-1990404162),m=e(m,n,o,p,a[d+12],7,1804603682),p=e(p,m,n,o,a[d+13],12,-40341101),o=e(o,p,m,n,a[d+14],17,-1502002290),n=e(n,o,p,m,a[d+15],22,1236535329),m=f(m,n,o,p,a[d+1],5,-165796510),p=f(p,m,n,o,a[d+6],9,-1069501632),o=f(o,p,m,n,a[d+11],14,643717713),n=f(n,o,p,m,a[d],20,-373897302),m=f(m,n,o,p,a[d+5],5,-701558691),p=f(p,m,n,o,a[d+10],9,38016083),o=f(o,p,m,n,a[d+15],14,-660478335),n=f(n,o,p,m,a[d+4],20,-405537848),m=f(m,n,o,p,a[d+9],5,568446438),p=f(p,m,n,o,a[d+14],9,-1019803690),o=f(o,p,m,n,a[d+3],14,-187363961),n=f(n,o,p,m,a[d+8],20,1163531501),m=f(m,n,o,p,a[d+13],5,-1444681467),p=f(p,m,n,o,a[d+2],9,-51403784),o=f(o,p,m,n,a[d+7],14,1735328473),n=f(n,o,p,m,a[d+12],20,-1926607734),m=g(m,n,o,p,a[d+5],4,-378558),p=g(p,m,n,o,a[d+8],11,-2022574463),o=g(o,p,m,n,a[d+11],16,1839030562),n=g(n,o,p,m,a[d+14],23,-35309556),m=g(m,n,o,p,a[d+1],4,-1530992060),p=g(p,m,n,o,a[d+4],11,1272893353),o=g(o,p,m,n,a[d+7],16,-155497632),n=g(n,o,p,m,a[d+10],23,-1094730640),m=g(m,n,o,p,a[d+13],4,681279174),p=g(p,m,n,o,a[d],11,-358537222),o=g(o,p,m,n,a[d+3],16,-722521979),n=g(n,o,p,m,a[d+6],23,76029189),m=g(m,n,o,p,a[d+9],4,-640364487),p=g(p,m,n,o,a[d+12],11,-421815835),o=g(o,p,m,n,a[d+15],16,530742520),n=g(n,o,p,m,a[d+2],23,-995338651),m=h(m,n,o,p,a[d],6,-198630844),p=h(p,m,n,o,a[d+7],10,1126891415),o=h(o,p,m,n,a[d+14],15,-1416354905),n=h(n,o,p,m,a[d+5],21,-57434055),m=h(m,n,o,p,a[d+12],6,1700485571),p=h(p,m,n,o,a[d+3],10,-1894986606),o=h(o,p,m,n,a[d+10],15,-1051523),n=h(n,o,p,m,a[d+1],21,-2054922799),m=h(m,n,o,p,a[d+8],6,1873313359),p=h(p,m,n,o,a[d+15],10,-30611744),o=h(o,p,m,n,a[d+6],15,-1560198380),n=h(n,o,p,m,a[d+13],21,1309151649),m=h(m,n,o,p,a[d+4],6,-145523070),p=h(p,m,n,o,a[d+11],10,-1120210379),o=h(o,p,m,n,a[d+2],15,718787259),n=h(n,o,p,m,a[d+9],21,-343485551),m=b(m,i),n=b(n,j),o=b(o,k),p=b(p,l);return[m,n,o,p]}function j(a){var b,c="";for(b=0;b<32*a.length;b+=8)c+=String.fromCharCode(a[b>>5]>>>b%32&255);return c}function k(a){var b,c=[];for(c[(a.length>>2)-1]=void 0,b=0;b<c.length;b+=1)c[b]=0;for(b=0;b<8*a.length;b+=8)c[b>>5]|=(255&a.charCodeAt(b/8))<<b%32;return c}function l(a){return j(i(k(a),8*a.length))}function m(a,b){var c,d,e=k(a),f=[],g=[];for(f[15]=g[15]=void 0,e.length>16&&(e=i(e,8*a.length)),c=0;16>c;c+=1)f[c]=909522486^e[c],g[c]=1549556828^e[c];return d=i(f.concat(k(b)),512+8*b.length),j(i(g.concat(d),640))}function n(a){var b,c,d="0123456789abcdef",e="";for(c=0;c<a.length;c+=1)b=a.charCodeAt(c),e+=d.charAt(b>>>4&15)+d.charAt(15&b);return e}function o(a){return unescape(encodeURIComponent(a))}function p(a){return l(o(a))}function q(a){return n(p(a))}function r(a,b){return m(o(a),o(b))}function s(a,b){return n(r(a,b))}function md5(a,b,c){return b?c?r(b,a):s(b,a):c?p(a):q(a)}
    //切换Tab
    $('.tab li').click(function () {
      var _num = $(this).index();
      loginTab(_num);
    });

    //帐号密码提示
    $('.user-ipt').each(function () {
      if (!$(this).val() == '') {
        $(this).siblings('p').hide().css({'background-image': 'none'});
      } else {
        $(this).siblings('p').show();
      }
      ;
      $(this).focus(function () {
        $(this).siblings('p').hide();
      });
      $(this).blur(function () {
        if (!$(this).val() == '') {
          $(this).siblings('p').hide();
        } else {
          $(this).siblings('p').show();
        }
        ;
      });
    });

    $('#usernameOrNum').bind('input propertychange', function () {
      $('#passwordNum').siblings('p').hide();
    });

    $(".ipt-box p").click(function () {
      $(this).prev().focus();
    });

    //是否需要手机验证码
    function isNeedMobileCaptcha() {
      var _mobile = $("#mobileLoginText").val();
      var _verifycode = $("#mobileVerifyCode").val();
      var _isView = 'true';
      //设置同步处理
      $.ajaxSettings.async = false;
      $.getJSON(SERVER_NAME + "/nsso/ajax/captcha/checkIsNeedMobileCaptcha.do?jsoncallback=?",
          {mobile: _mobile, verifycode: _verifycode},
          function (response) {
            if (response.success) {
              _isView = response.result;
            }
          });
      //恢复异步
      $.ajaxSettings.async = true;
      return _isView;
    }

    // 默认调用倒计时
    var timer = null,
        countdown = $('#countdown'),
        timestart = countdown.text(),
        time = timestart;

    //发送短信
    $('.code').click(function () {
      var This = $(this);
      if (MOBILE_REGX.test($("#mobileLoginText").val())) {
        //是否需要验证码
        var _isNeedMobileCaptcha = isNeedMobileCaptcha();
        if (_isNeedMobileCaptcha == 'true') {
          $("#_mobileCaptcha").show();
        } else {
          $("#_mobileCaptcha").hide();
        }
        //如果显示图形验证码，并且值为空时
        var _mobileVerifyCode = $("#mobileVerifyCode").val();
        if (_isNeedMobileCaptcha == 'true' && $.trim(_mobileVerifyCode) == '') {
          error_tip('#errorMobileCode', '#errorMobileCodeDiv', "请输入验证码");
          //动态验证码error隐藏
          $('#dynaPWdDiv').hide();
          return;
        }
        //图形验证码error隐藏
        $('#errorMobileCodeDiv').hide();
        //动态验证码error隐藏
        $('#dynaPWdDiv').hide();

        $.getJSON(SERVER_NAME + "/nsso/ajax/message/mobileLogByPC/sendMobileCode.do?jsoncallback=?",
            {mobileOrEMail: $("#mobileLoginText").val(), verifycode: $("#mobileVerifyCode").val()},
            function (data) {
              if (data.success) {
                $('.code').hide().siblings('.time').show();//显示倒计时
                $('#errorMobileCodeDiv').hide();//图形验证码error隐藏
                timer = setInterval(function () {
                  time--;
                  if (time == 0) {
                    clearTimeout(timer);
                    This.show().siblings('a').hide();//隐藏获取动态验证码
                    time = timestart;
                    countdown.text(time);
                  }
                  countdown.text(time);
                }, 1000);
              } else {
                var errorTips = '';
                if (data.errorText == 'errorVerifycode') {
                  errorTips = '验证码输入错误';
                  error_tip('#errorMobileCode', '#errorMobileCodeDiv', errorTips);
                  return;
                } else if (data.errorText == 'vcodeWarning') {
                  errorTips = '您当前短信验证码已失效，请重新发送验证码';
                } else if (data.errorText == 'phoneWarning') {
                  errorTips = '已超过每日发送上限，请于次日再试';
                } else if (data.errorText == 'ipLimit') {
                  errorTips = '当前IP发送频率过快，请稍后重试';
                } else if (data.errorText == 'waiting') {
                  errorTips = '发送频率过快，请稍后重试';
                } else {
                  errorTips = data.errorText;
                }
                error_tip('#dynaPWd', '#dynaPWdDiv', errorTips);
              }
            });
      } else {
        error_tip('#moblieError', '#moblieErrorDiv', "请输入正确的手机号");
      }
    });

    //判断输入框是否为空
    function login_yz() {
      var useript = $('.user-ipt');
      useript.siblings('.validateErrorTip').hide();
      for (var i = 0; i < useript.length; i++) {
        var inputText = useript.eq(i).val();
        if (inputText == "" && useript.eq(i).is(':visible')) {
          useript.eq(i).siblings('.validateErrorTip').show();
          useript.eq(i).addClass('error');
          return false;
        } else {
          useript.eq(i).siblings('.validateErrorTip').hide();
          useript.eq(i).removeClass('error');
        }
      }
      return true;
    }

    //普通登陆
    $('#loginButton').click(function () {
      //空校验
      if (!login_yz()) {
        return;
      }
      //登陆验证
      var _submit = true;
      $.ajax({
        type: "POST",
        url: "/nsso/geetest/login/validateNormalLogin.do",
        async: false,
        data: {
          userName: $("#usernameOrNum").val(),
          password: md5($("#passwordNum").val()),
          verifyCode: $("#verifycode").val()
        },
        dataType: "json",
        success: function (response) {
          var _errorCode = response.errorCode;
          var _errorMsg = response.errorMsg;
          var _securityCode = response.securityCode;
          $('#securityCode').val(_securityCode);
          if (response.success == true) {
            if (_errorCode == 1) {//风险手机
              $('#_normalGeetestCaptcha').show();
              $('#_loginButton').hide();
              _submit = false;
            } else if (_errorCode != 0) {
              //图形验证码错误
              if (_errorCode == 102 || _errorCode == 103) {
                checkIsNeedCaptcha();
              }
              error_tip('#userNameOrPwd', '#userNameOrPwdDiv', _errorMsg);
              _submit = false;
            }
          } else {
            $('#_normalGeetestCaptcha').show();
            $('#_loginButton').hide();
            _submit = false;
          }
        }
      });
      if (_submit) {
        var form = $("#loginform");
        var pw = form[0].password.value;
        form[0].password.value = md5(pw);
        form.submit();
      }
    });

    //手机验证码登陆
    $('#loginMobileButton').click(function () {
      //空校验
      if (!login_yz()) {
        return;
      }
      //手机正则校验
      var _mobile = $("#mobileLoginText").val();
      if (!MOBILE_REGX.test(_mobile)) {
        error_tip('#moblieError', '#moblieErrorDiv', "请输入正确的手机号");
        return;
      }
      //登陆验证
      var _submit = true;
      $.ajax({
        type: "POST",
        url: "/nsso/geetest/login/validateMobileLogin.do",
        async: false,
        data: {
          mobileNo: _mobile
        },
        dataType: "json",
        success: function (response) {
          if (response.success == true) {
            var _errorCode = response.errorCode;
            var _errorMsg = response.errorMsg;
            if (_errorCode == 101) {//手机号不正确
              error_tip('#moblieError', '#moblieErrorDiv', _errorMsg);
              _submit = false;
            } else if (_errorCode == 102) {//风险手机
              $('#_mobileGeetestCaptcha').show();
              $('#_loginMobileButton').hide();
              _submit = false;
            }
          } else {
            $('#_mobileGeetestCaptcha').show();
            $('#_loginMobileButton').hide();
            _submit = false;
          }
        }
      });
      if (_submit) {
        $("#mobileLoginSumbit").submit();
      }
    });

    //手机登陆接入极验
    var handlerMobilePopup = function (captchaObj) {

      captchaObj.onSuccess(function () {
        var validate = captchaObj.getValidate();
        $('#mobile_geetest_challenge').val(validate.geetest_challenge);
        $('#mobile_geetest_validate').val(validate.geetest_validate);
        $('#mobile_geetest_seccode').val(validate.geetest_seccode);
        $("#mobileLoginSumbit").submit();
      });

      //绑定手机登陆极验
      captchaObj.appendTo("#mobile-embed-captcha");

      captchaObj.onReady(function () {
        $("#mobile-embed-captcha-wait")[0].className = "hide";
      });

    };

    $.ajax({
      // 获取id，challenge，success（是否启用failback）
      url: "/nsso/geetest/startCaptcha.do?t=" + (new Date()).getTime(), // 加随机数防止缓存（IE下的问题）
      type: "get",
      dataType: "json",
      success: function (data) {

        // 使用initGeetest接口
        // 参数1：配置参数
        // 参数2：回调，回调的第一个参数验证码对象，之后可以使用它做appendTo之类的事件
        initGeetest({
          gt: data.gt,
          challenge: data.challenge,
          product: "float", // 产品形式，包括：float，embed，popup。注意只对PC版验证码有效
          offline: !data.success // 表示用户后台检测极验服务器是否宕机，一般不需要关注
        }, handlerMobilePopup);
      }
    });

    //普通登陆接入极验
    var handlerNormalPopup = function (captchaObj) {

      captchaObj.onSuccess(function () {
        var validate = captchaObj.getValidate();
        $('#normal_geetest_challenge').val(validate.geetest_challenge);
        $('#normal_geetest_validate').val(validate.geetest_validate);
        $('#normal_geetest_seccode').val(validate.geetest_seccode);
        $("#loginform").submit();
      });

      //绑定普通登陆极验
      captchaObj.appendTo("#normal-embed-captcha");

      captchaObj.onReady(function () {
        $("#normal-embed-captcha-wait")[0].className = "hide";
      });

    };

    $.ajax({
      // 获取id，challenge，success（是否启用failback）
      url: "/nsso/geetest/startCaptcha.do?t=" + (new Date()).getTime(), // 加随机数防止缓存（IE下的问题）
      type: "get",
      dataType: "json",
      success: function (data) {

        // 使用initGeetest接口
        // 参数1：配置参数
        // 参数2：回调，回调的第一个参数验证码对象，之后可以使用它做appendTo之类的事件
        initGeetest({
          gt: data.gt,
          challenge: data.challenge,
          product: "float", // 产品形式，包括：float，embed，popup。注意只对PC版验证码有效
          offline: !data.success // 表示用户后台检测极验服务器是否宕机，一般不需要关注
        }, handlerNormalPopup);
      }
    });

  });

})();

//页面Tab控制
function loginTab(num) {
  var tabLi = $('.tab li');
  tabLi.eq(num).addClass('active').siblings().removeClass('active');
  tabLi.parent().siblings('.content').eq(num).show().siblings('.content').hide();
}

//验证是否为合格的手机号
var MOBILE_REGX = /^(1)\d{10}$/;
var SERVER_NAME = ('https:' == document.location.protocol ? 'https://' : 'http://') + "login.lvmama.com";

//动态密码登陆手机号框移开事件
function mobileRegisterOnBlur(fieldId) {
  var mobile = $("#" + fieldId).val();
  if ($("#" + fieldId).val() != '') {
    if (MOBILE_REGX.test($("#" + fieldId).val())) {
      $('#moblieErrorDiv').hide();
      return true;
    } else {
      error_tip('#moblieError', '#moblieErrorDiv', "请输入正确的手机号");
      return false;
    }
  }
}

//错误提示
function error_tip(elt, eltDiv, msg) {
  $(elt).html(msg);
  $(eltDiv).show();
}

//检测是否需要验证码
function checkIsNeedCaptcha() {
  var _userName = $("#usernameOrNum").val();
  if (_userName != null && $.trim(_userName).length > 0) {
    $.getJSON(SERVER_NAME + "/nsso/ajax/captcha/checkIsNeedCaptcha.do?jsoncallback=?", {
      userName: _userName

    }, function (json) {
      if (json.success == true) {
        var decision = json.result;
        if (decision == 'hide') {
          $("#_captcha").hide();
        } else {
          setImageCaptcha(decision);
          $("#_captcha").show();
        }
      } else {
        $("#_captcha").hide();

      }
    });
  }
}

//绑定鼠标事件
$("#usernameOrNum").blur(function () {
  checkIsNeedCaptcha();
});
