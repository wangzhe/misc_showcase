class WechatController < ApplicationController
  include WechatHelper

  def greeting
    @echostr = params[:echostr]

    return render :text => @echostr
  end

  def talk
    config = params[:xml]

    @toFromname = config['ToUserName']
    @toUsername = config['FromUserName']
    @time = config['CreateTime']

    @content = config['Content']

    contents = @content.split(" ")
    response_template = ""

    case contents[0]
      when "signup"
        response_template = signup_step_one(contents)
      when "verify"
        response_template = signup_step_two(contents)
      else
        response_template = services(contents)
    end

    return render :template => response_template,
                  :formats => [:xml],
                  :content_type => 'application/xml'
  end

  def services(contents)
    "wechat/process_news.xml"
  end

  def signup_step_two(contents)
    isVerified = verify_code(@toUsername, contents[1]) if contents[1] != nil
    if isVerified
      @content = t(:signup_success)
      return "wechat/simple_text.xml"
    end
    raise error
  end

  def signup_step_one(contents)
    random = signup(@toUsername, contents) if contents[1] != nil
    @content = t(:signup_verify) << random.to_s
    "wechat/simple_text.xml"
  end

  def error
    return render :template => "wechat/error.xml",
                  :formats => [:xml],
                  :content_type => 'application/xml'
  end

end
