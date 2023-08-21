import {promptBubble} from "./common.js"

function refreshCheckCode() {
  const randomId = $("#randomId").val()
  $("#image").attr("src", "/captcha/" + randomId)
}

$(() => {
  // 每隔2min调用一次
  setInterval(() => refreshCheckCode(), 2 * 60 * 1000)
  $('.yaz_code').click(() => {
    const phone = $('#sso_mobile').val()
    // 正则校验
    const regExp = /0?(13|14|15|18|17)[0-9]{9}/
    if (phone === '') {
      promptBubble(false, "请先输入手机号~")
      return
    }
    if (!regExp.test(phone)) {
      promptBubble(false, "手机号输入有误~")
      return
    }
    $.post('/code', {'phone': phone}, (res) => {
      const flag = res.code === '200';
      promptBubble(flag, flag ? "短信发送成功~" : res.msg)
    }, "JSON")
    updateButtonStatus();
  })
  $('#submitBtn').click(() => {
    $('#sjRegForm').onsubmit()
  })
})

const updateButtonStatus = () => {
  $('.yaz_code').css('display', 'none')
  $('.dis_time').css('display', 'inline-block')
  let time = 10;
  // 开启定时器
  let interval = setInterval(() => {
    if (time === 0) {
      // 清除定时器
      clearInterval(interval);
      $('.yaz_code').css('display', 'inline-block')
      $('.dis_time').css('display', 'none')
    } else {
      $('.dis_time').children().text(`${time--}s`);
    }
  }, 1000);
}