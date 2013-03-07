require 'xmlsimple'

class WechatController < ApplicationController

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
    #"signup username"
    Notifier.signup_email(contents[1]).deliver if contents[0] == "signup" && contents[1] != nil



    return render :template => "wechat/process_news.xml",
                  :formats => [:xml],
                  :content_type => 'application/xml'
  end

  def error

  end

end
