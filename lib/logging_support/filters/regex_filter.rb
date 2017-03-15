module LoggingSupport
  module Filters
    class RegexFilter
      def initialze(regexes)
        @cached_regexes = []
      end

      def call(data)
        data
      end
    end
  end
end

