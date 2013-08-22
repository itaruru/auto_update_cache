require 'auto_update_cache/engine'
require 'auto_update_cache/core_ext'
require 'auto_update_cache/acts_as'

module AutoUpdateCache
  ActiveRecord::Base.send :include, AutoUpdateCache::ActsAs
end
