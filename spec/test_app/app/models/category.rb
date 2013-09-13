class Category < ActiveRecord::Base
  auto_update_cache :ranking_category
end
