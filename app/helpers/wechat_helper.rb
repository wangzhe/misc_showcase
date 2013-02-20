require 'xmlsimple'

module WechatHelper

  def parseit
    config = XmlSimple.xml_in('foo.xml')
  end

end
