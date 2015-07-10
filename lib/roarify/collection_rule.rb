module Roarify
  class CollectionRule
    def initialize(options=nil)
      @options = options
    end
    attr_accessor :condition, :column, :relation

    def column
      self.column = clean_column
    end

    def condition
      self.condition = condition
    end

    def relation
      self.relation = relation
    end

    def condition
      first_value
    end

    def valid_relation_options?
      available_options.include? first_key
    end

    def valid_column?
      available_columns.include? where
    end

    def relation
      if valid_relation_options?
        first_key
      else
       raise "Invalid Options Passed - Options ARE: #{available_options.to_s}"
      end
    end

    def first_key
      clean_options.keys[0].to_sym
    end

    def clean_options
      @options.delete(:where)
      @options
    end

    def first_value
      if valid_relation_options?
        clean_options[first_key.to_sym]
      end
    end

    def available_options
      [:equals, :not_equals, :greater_than, :less_than, :not_contains,:starts_with,:ends_with,:contains]
    end

    def available_columns
      ['title','type','tag','variant_price','variant_compare_at_price','variant_weight','variant_title','variant_inventory','vendor']
    end

    def clean_column
      if valid_column?
        @options[:where]
      else
        raise 'Invalid Column'
      end
    end

    def where
      @options[:where]
    end

  end
end
