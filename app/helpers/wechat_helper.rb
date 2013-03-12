module WechatHelper

  def signup(wechat_id, contents)
    #generate random number
    p random = 1_000_000 + Random.rand(10_000_000 - 1_000_000)

    #save wechat id and random number to redis
    User.pending_for_signup!(wechat_id, random)

    #send number to user
    Notifier.signup_email(username, random).deliver
    random
  end


  def verify_code(wechat_id, code)
    User.verify_code!(wechat_id, code)
  end

end
