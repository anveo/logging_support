require 'spec_helper'

describe LoggingSupport do
  subject do
    class TestLoggingClass
      include LoggingSupport
    end
  end

  it 'responds to both instance and class methods' do
    expect(subject.new).to respond_to(:logger)
    expect(subject).to respond_to(:logger)
  end

  it 'shares a logger object between instance and class methods' do
    expect(subject.logger.object_id).to eq(subject.new.logger.object_id)
  end
end

