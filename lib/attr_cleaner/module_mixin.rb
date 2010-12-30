module AttrCleaner
  module ModuleMixin
    extend ActiveSupport::Concern
  
    included do
      alias_method_chain :write_attribute, :cleaner
      class_attribute :attr_cleaners
    end
    
    module ClassMethods
      def write_attribute_with_cleaner(attr_name, value)
        if attr_cleaners.include?(attr_cleaners.to_sym) && value.is_a?(String)
          value = value.strip
          value = nil if value.empty?
        end
        write_attribute_without_cleaner(attr_name, value)
      end
      
      def attr_cleaner(*args)
        all_columns = column_names.map(&:to_sym)
        
        only = Array(args[:only])          
        except = Array(args[:except])
        
        columns = only.empty? ? all_columns : (only & all_columns)
        
        self.attr_cleaners = (Array(self.attr_cleaners) + columns) - except
      end        
    end
  end
end