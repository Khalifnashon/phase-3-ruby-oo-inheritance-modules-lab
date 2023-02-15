module Memorable

    module ClassMethods
        # class method that clears the @@songs array
        # when defining class methods in a module you remove the self keyword.
        def reset_all
            self.all.clear
        end
          
        # returns the number of song objects in the @@songs array.
        def count
            self.all.count
        end
    end

    module InstanceMethods
        def initialize
          self.class.all << self
        end
    end

    
end