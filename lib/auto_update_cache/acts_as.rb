module AutoUpdateCache
  module ActsAs
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def auto_update_cache(*keys)
        keys.uniq.each do |key|
          self.class_eval <<-EOS
            after_save    :__auto_delete_cache__#{key}
            after_destroy :__auto_delete_cache__#{key}

            private

            def __auto_delete_cache__#{key}
              @_redis ||= begin
                Rails.cache.instance_variable_get(:@data)
              end
              @_redis.keys('auc/#{self.to_s.underscore}/#{key}*').each do |key|
                Rails.cache.delete(key)
              end
            end

            class << self
              def cache_#{key}(opts={}, &block)
                other_key = if _key = opts[:other_key]
                  '/' << _key
                else
                  ''
                end
                Rails.cache.fetch('auc/#{self.to_s.underscore}/#{key}' << other_key, opts, &block)
              end
            end
          EOS
        end
      end
    end
  end
end
