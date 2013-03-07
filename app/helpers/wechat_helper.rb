module WechatHelper

  def signup(user_id, contents)
    #generate random number
    p random = 1_000_000 + Random.rand(10_000_000 - 1_000_000)
    #save wechat id and random number to redis

    #send number to user
    Notifier.signup_email(contents[1], random).deliver
  end

end
