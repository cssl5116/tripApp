let timeout = null;
/**
 * 生成弹窗
 * @param flag 正否
 * @param message 提示消息
 */
const promptBubble = (flag, message) => {
  clearTimeout(timeout);
  $(".promptBubble").remove();
  let scrollTop = $(document).scrollTop();
  $("body").append(`
    <div class="promptBubble" style="top: ${scrollTop + 50}px">
      <div class="promptBubble_content">
        <img src="img/${flag}.png" alt="" width="20" height="20">
        <span class='message-${flag}'>${message}</span>
      </div>
    </div>
  `)
  timeout = setTimeout(() => {
    $(".promptBubble").remove();
  }, 3000);
}

export {
  promptBubble
}