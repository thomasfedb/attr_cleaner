require "active_support"
require "active_support/core_ext/module/aliasing"
require "active_support/core_ext/class/attribute"
require "active_support/concern"

require "attr_cleaner/module_mixin"

# If not using active_record then include AttrCleaner::ModuleMixin.

if defined?(Rails::Railtie)
  # Railtie is used to ensure correct loading order
  require "attr_cleaner/railtie"
else
  # If used outside of rails, just check for ActiveRecord::Base
  ActiveRecord::Base.send(:include, AttrCleaner::ModuleMixin) if defined?(ActiveRecord::Base)
end