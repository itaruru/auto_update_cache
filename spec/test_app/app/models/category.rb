class Category < ActiveRecord::Base
  acts_as_auto_update_cache :ranking_category
end
