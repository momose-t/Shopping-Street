module ApplicationHelper
  def devise_error_messages
    # エラーメッセージがゼロか？
    return "" if resource.errors.empty?
    # エラーイメージを入れる

    # エラーメッセージの表示
    html = ""

    messages = resource.errors.full_messages.each do |errmsg|
      html += <<-EOF
        <div class="bb">
          <p class="errmsg">#{errmsg}</p>
        </div>
      EOF
    end
    # エスケープしない
    html.html_safe
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end

end