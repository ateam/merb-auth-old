module MerbAuth
  module Adapter
    module Sequel
      module Map
      
        def self.included(base)
          base.send(:include, InstanceMethods)
          base.send(:extend,  ClassMethods)
        end
      
        module InstanceMethods
        end
      
        module ClassMethods
          def find_with_conditions(conditions)
            filter(conditions).first
          end
        
          def find_all_with_login_like(logn)
            filter(:login.like(logn)).order(:login.desc).limit(1)
          end
                  
          def find_active_with_conditions(conditions)
            #filter(conditions).exclude(:activated_at => nil, :special => true).first
            filter(conditions).exclude(:activated_at => nil).first
          end
        
          def clear_database_table
            delete
          end
        end # ClassMethods 
        
      end # Map
    end # Sequel
  end # Adapters
end # MerbAuth
