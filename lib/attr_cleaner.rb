require "active_support"
require "active_record"

require "active_support/core_ext/module/aliasing"
require "active_support/concern"

# If not using active_record require attr_cleaner/module_mixin
# and include it into your own ORM.
require "attr_cleaner/module_mixin"
ActiveRecord::Base.send(:include, AttrCleaner::ModuleMixin)