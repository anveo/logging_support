require 'time'

module LoggingSupport
  module Formatters
    class DefaultFormatter < Logger::Formatter
      def call(severity, time, progname, msg)
        # run filters
        LoggingSupport.filters.each do |filter|
          msg = filter.call(msg)
        end

        super(severity, time, progname, msg)
      end

      def self.call(severity, time, progname, msg)
        new.call(severity, time, progname, msg)
      end
    end
  end
end

