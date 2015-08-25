module SMSApi
  module Validators
    class MessageBodyValidator
      DOUBLE_COST_CHARS = "\"^{}[]~\\|€\n".freeze
      BASIC_CHARS = "\n\f\r !\"\#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_abcdefghijklmnopqrstuvwxyz{|}~ ¡£¤¥§¿ÄÅÆÉÑÖØÜßàäåæçèéìñòöøùüΓΔΘΛΞΠΣΦΨΩ€".freeze

      BASIC_LIMIT = 918
      EXTRA_LIMIT = 402

      def self.valid_body?(body)
        new(body).valid?
      end

      attr_reader :body

      def initialize(body)
        @body = body
      end

      def valid?
        proper_length? && !body.empty?
      end

      def proper_length?
        if basic_charset?
          body_size <= BASIC_LIMIT
        else
          body_size <= EXTRA_LIMIT
        end
      end

      def body_codepoints
        @body_codepoints ||= body.codepoints
      end

      def body_size
        if basic_charset?
          double = body_codepoints.count { |codepoint| DOUBLE_COST_CHARS.codepoints.include?(codepoint) }
          body_codepoints.count + double
        else
          body_codepoints.count
        end
      end

      def basic_charset?
        @basic_charset ||= body_codepoints.all? { |c| BASIC_CHARS.codepoints.include?(c) }
      end
    end
  end
end
