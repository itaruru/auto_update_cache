module AutoUpdateCache
  module ActsAs
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def acts_as_auto_update_cache(*keys)
        keys.uniq.each do |key|
          self.class_eval <<-EOS
            after_save    :__acts_as_auto_delete_cache__#{key}
            after_destroy :__acts_as_auto_delete_cache__#{key}

            private

            def __acts_as_auto_delete_cache__#{key}
              Rails.cache.delete('auc/#{self.to_s.underscore}/#{key}')
            end

            class << self
              def cache_#{key}(opts={}, &block)
                Rails.cache.fetch('auc/#{self.to_s.underscore}/#{key}', opts, &block)
              end
            end
          EOS
        end
      end
    end
  end
end