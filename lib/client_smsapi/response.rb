require_relative 'response/error'
require_relative 'response/regular'

module SMSApi
  class Response
    InvalidStatus = Class.new(StandardError)

    attr_reader :status

    ALLOWED_STATUSES = [:ok, :error]

    def initialize(status)
      fail InvalidStatus unless ALLOWED_STATUSES.include?(status)
      @status = status
    end
  end
end
