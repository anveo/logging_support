module LoggingSupport
  module Filters
    class KvFilter
      mattr_accessor :kvs

      def call(data)
        # each k,v
          # do something expensive if flattened_keys.include? key
        data
      end

      private

      def flattened_keys(key, hash)
        hash.each_with_object([]) do |(k,v), keys|
          keys << k
          keys.concat(flattened_keys(v)) if v.respond_to?(:keys)
        end
      end
    end
  end
end

