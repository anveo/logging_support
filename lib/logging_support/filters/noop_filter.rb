module LoggingSupport
  module Filters
    class NoopFilter
      def self.call(data)
        data
      end
    end
  end
end
