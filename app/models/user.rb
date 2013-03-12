class User < ActiveRecord::Base

  # user signup - first step
  def self.pending_for_signup!(wechatid, code)
    $redis.setex(code, 600, wechatid)
  end

  def self.verify_code!(wechat_id, code)
    userid = $redis.get(code)
    approved(wechat_id, code) if userid == wechat_id
  end

  def self.approved(id, code)
    $redis.del(code)
    true
    #save into persist database
  end


  # unfollow a user
  def remove_pending_user!()
    $redis.multi do
      $redis.srem(self.redis_key(:following), user.id)
      $redis.srem(user.redis_key(:followers), self.id)
    end
  end

  # unfollow a user
  def remove_user!()
    $redis.multi do
      $redis.srem(self.redis_key(:following), user.id)
      $redis.srem(user.redis_key(:followers), self.id)
    end
  end

  # unfollow a user
  def signup_user!()
    $redis.multi do
      $redis.srem(self.redis_key(:following), user.id)
      $redis.srem(user.redis_key(:followers), self.id)
    end
  end

end
