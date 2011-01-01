require "rails"
require "attr_cleaner"

module AttrCleaner
  class Railtie < Rails::Railtie
    initializer 'attr_cleaner.include_into_activerecord' do |app|
      ActiveSupport.on_load(:active_record) do
        ActiveRecord::Base.send(:include, AttrCleaner::ModuleMixin)
      end
    end
  end
end
