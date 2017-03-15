require_relative './lib/logging_support'

module App
  include LoggingSupport

  def self.setup
    LoggingSupport.filters = [
      LoggingSupport::Filters::DefaultFilter,
      LoggingSupport::Filters::KvFilter.new([
        :identity
      ]),
      LoggingSupport::Filters::RegexFilter.new([
        /\w$/ => '[FILTERED]'
      ])
    ]

    logger_config do |l|
      l.progname = 'asdfasdf'
      l.formatter = LoggingSupport::Formatter
    end
  end

  def self.run!
    # setup
    logger.info 'foobar'
    logger.info JSON.stringify({})
    logger.info foo: 'bar'
  end
end


