module SMSApi
  class Response
    class Regular < SMSApi::Response
      attr_reader :id, :points

      def initialize(id, points)
        @id     = id.to_i
        @points = points.to_f

        super(:ok)
      end
    end
  end
end
