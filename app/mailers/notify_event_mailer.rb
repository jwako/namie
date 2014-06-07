# -*- encoding: UTF-8 -*-

class NotifyEventMailer < ActionMailer::Base

  def notify_user(work)
  	@work = work
  	@user = work.user
    mail(
    	:from => INFO_MAIL,
      :subject => "イベント開始のお知らせ",
      :to => @user.email
    )
  end

  def notify_supporter(work)
  	@work = work
  	@supporter = work.supporter
    mail(
    	:from => INFO_MAIL,
      :subject => "イベント開始のお知らせ",
      :to => @supporter.email
    )
  end

end