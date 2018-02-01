module AttrCleaner
  module Model
    extend ActiveSupport::Concern
    
    module ClassMethods
      def attr_cleaner(*columns)
        columns.each do |column|
          define_attr_cleaner(column)
        end
      end

      def define_attr_cleaner(column)
        define_method "#{column}=" do |value|
          if value.is_a?(String)
            value = value.strip
            value = nil if value.empty?
          end

          super(value)
        end
      end
    end
  end
end
