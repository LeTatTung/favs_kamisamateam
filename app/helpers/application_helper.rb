module ApplicationHelper
  def full_title title
    title.empty? ? t("app_title") : title + " | " + t("app_title")
  end

  def set_btn_provider provider
    provider = "google" if provider == :google_oauth2
    provider
  end

  def avatar_profile user
    if user
      @avatar = user.avatar.url
      if user && @avatar
        @avatar
      else
        "profile.png"
      end
    end
  end

  def user_reply_comment comment
    if comment
      comment_reply = comment.reply
      if comment_reply && comment_reply.user != comment.user
        link_to comment_reply.user.name, comment_reply.user
      end
    end
  end
end
