require "attr_cleaner"
require "rails"

module AttrCleaner
  class Railtie < Rails::Railtie
    initializer "attr_cleaner.initialize" do
      ActiveSupport.on_load(:active_record) do
        ActiveRecord::Base.send :include, AttrCleaner::ModuleMixin
      end
    end
  end
end