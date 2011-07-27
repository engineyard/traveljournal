module HotelsHelper
  def day_today
    Date.today.strftime("%A")
  end

  def gravatar(email)
    require "digest/md5"
    hash = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{hash}?s=32"
  end
end
