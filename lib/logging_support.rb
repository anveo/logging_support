require 'logger'
require 'active_support/configurable'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/core_ext/module/introspection'

require_relative './logging_support/filters/noop_filter'
require_relative './logging_support/filters/kv_filter'
require_relative './logging_support/filters/regex_filter'
require_relative './logging_support/formatters/default_formatter'

module LoggingSupport
  include ActiveSupport::Configurable

  mattr_accessor :formatter
  mattr_accessor :filters

  def self.included(base)
    base.extend(ClassMethods)
    base.send :define_method, :logger do
      base.logger
    end

    @@formatter = Formatters::DefaultFormatter
    @@filters   = [Filters::NoopFilter]
  end

  module ClassMethods
    def logger
      @logger ||= default_logger
    end

    def logger_config
      yield @logger if block_given?
    end

    def default_logger
      Logger.new($stdout).tap do |l|
        l.formatter = LoggingSupport.formatter
        l.level     = Logger::INFO
      end
    end
  end
end

