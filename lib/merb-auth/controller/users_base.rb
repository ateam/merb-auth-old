module MerbAuth
  module Controller
    
    # Provides basic functionality for the users controller.  Allows creation of a new user and activation
    module UsersBase
      
      def self.included(base)
        # base.send(:skip_before, :login_required)
        base.send(:include, InstanceMethods)
        base.send(:show_action, :new, :create, :activate)
      end
      
      module InstanceMethods
        # Displays the new form for the user
        def new
          only_provides :html
          @ivar = MA[:user].new(params[MA[:single_resource]] || {})
          set_ivar
          display @ivar
        end

        def create
          cookies.delete :auth_token
          @use_recaptcha = Object.const_defined?(:Ambethia)

          @ivar = MA[:user].new(params[MA[:single_resource]])
          set_ivar
          #if (!@use_recaptcha || verify_recaptcha(@ivar, :failure_message => nil)) && @ivar.save
          if (!@use_recaptcha || verify_recaptcha(@ivar, :failure_message => nil)) && @ivar.valid?
            @ivar.save
            self.current_ma_user = @ivar unless MA[:use_activation]
            redirect url(:merb_auth_registered)
          else
            render :new
          end
        end

        def activate
          self.current_ma_user = MA[:user].find_with_conditions(:activation_code => params[:activation_code])
          if logged_in? && !current_ma_user.activated?
            Merb.logger.info "Activated #{current_ma_user}"
            current_ma_user.activate
            redirect url(:merb_auth_activated)
          else
            redirect url(:merb_auth_activated, :fail => 'true')
          end
        end

        private
        # sets the instance variable for the developer to use eg. @user
        def set_ivar
          instance_variable_set("@#{MA[:single_resource]}", @ivar)
        end
        
      end # InstanceMethods
      
    end # UsersBase
  end # Controllers
end #MerbAuth
