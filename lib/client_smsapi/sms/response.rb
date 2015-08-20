module SMSApi
  module SMS
    class Response
      attr_reader :status, :id, :points

      def initialize(status, id, points)
        @id     = id.to_i
        @status = status
        @points = points.to_f
      end
    end
  end
end
