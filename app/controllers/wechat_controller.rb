require 'xmlsimple'

class WechatController < ApplicationController

  def greeting
    @echostr = params[:echostr]

    return render :text => @echostr
  end

  def talk
    p request.raw_post

    config = XmlSimple.xml_in('foo.xml')

    @toFromname = config['ToUserName'][0]
    @toUsername = config['FromUserName'][0]

    return render :template => "wechat/process_succeed.xml",
                  :formats => [:xml],
                  :content_type => 'application/xml'
  end

  def error

  end

end
