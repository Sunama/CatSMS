require 'typhoeus'
require 'nokogiri'

module CatSMS
  class THSMS
    def self.send(from, telephone, message, username, password)
      response = Typhoeus.post 'http://www.thsms.com/api/rest', body: {
        method: 'send',
        username: username,
        password: password,
        from: from,
        to: telephone,
        message: message
      }

      if response.code == 200
        xml = Nokogiri::XML(response.body)

        if xml.xpath("//status")[0].text == 'success'
          true
        else
          false
        end
      else
        false
      end
    end

    def self.credit(username, password)
      response = Typhoeus.post 'http://www.thsms.com/api/rest', body: {
        method: 'credit',
        username: username,
        password: password
      }

      if response.code == 200
        xml = Nokogiri::XML(response.body)

        if xml.xpath("//status")[0].text == 'success'
          {
            success: true,
            credit: xml.xpath("//amount")[0].text
          }
        else
          { success: false }
        end
      else
        { success: false }
      end
    end
  end
end