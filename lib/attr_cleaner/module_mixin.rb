module AttrCleaner
  module ModuleMixin
    extend ActiveSupport::Concern
  
    included do
      alias_method_chain :write_attribute, :cleaner
      class_attribute :attr_cleaners
    end
    
    def write_attribute_with_cleaner(attr_name, value)
      if Array(attr_cleaners).include?(attr_name.to_sym) && value.is_a?(String)
        value = value.strip
        value = nil if value.empty?
      end
      write_attribute_without_cleaner(attr_name, value)
    end
    
    module ClassMethods
      # Adds attributes to the list of attributes to be cleaned
      # Attributes are inherited, but can be removed from :except
      #
      # @param [Hash] args options hash, set :only and/or :except
      # @return [Array] a array of symbols representing the attributes to be cleaned
      def attr_cleaner(args = {})
        all_columns = column_names.map(&:to_sym)
        
        only = Array(args[:only])          
        except = Array(args[:except])
        
        columns = only.empty? ? all_columns : (only & all_columns)
        
        self.attr_cleaners = (Array(self.attr_cleaners) + columns) - except
      end        
    end
  end
end