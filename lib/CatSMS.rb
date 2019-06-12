require 'CatSMS/version'

require 'CatSMS/THSMS'

module CatSMS
  class Error < StandardError; end
  # Your code goes here...

  class SMS
    attr_accessor :adapter
    attr_accessor :username
    attr_accessor :password

    def initialize(adapter, config)
      self.adapter = adapter

      if adapter == :thsms
        self.username = config[:username]
        self.password = config[:password]
      else
        raise StandardError.new 'Adapter type not found.'
      end
    end

    def send(from, message)
      if self.adapter == :thsms
        THSMS.send from, message, self.username, self.password
      end
    end

    def credit
      if self.adapter == :thsms
        THSMS.credit self.username, self.password
      end
    end
  end
end
