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

  def notify_register_user(work)
    @work = work
    @user = work.user
    mail(
      :from => INFO_MAIL,
      :subject => "訪問依頼登録完了のお知らせ",
      :to => @user.email
    )
  end

  def notify_register_supporter(work)
    @work = work
    @supporter = work.supporter
    mail(
      :from => INFO_MAIL,
      :subject => "訪問依頼が作成されました",
      :to => @supporter.email
    )
  end

  def notify_complete_user(work)
    @work = work
    @user = work.user
    mail(
      :from => INFO_MAIL,
      :subject => "訪問完了のお知らせ",
      :to => @user.email
    )
  end

  def notify_complete_supporter(work)
    @work = work
    @supporter = work.supporter
    mail(
      :from => INFO_MAIL,
      :subject => "訪問完了のお知らせ",
      :to => @supporter.email
    )
  end

end
