module MerbAuth
  module Controller
    # Provides basic functionality for sessions.  eg Allows login and logout.
    module SessionsBase
      
      def self.included(base)
        # base.send(:skip_before, :login_required)
        base.send(:include, InstanceMethods)
        base.send(:show_action, :new, :create, :destroy)
      end
      
      module InstanceMethods
        def new
          render
        end

        def create
          self.current_ma_user = MA[:user].authenticate(params[MA[:login_field]], params[:password])
          if logged_in?
            if params[:remember_me] == "1"
              self.current_ma_user.remember_me
              expires = Time.parse(self.current_ma_user.remember_token_expires_at.to_s)
              cookies[:auth_token] = { :value => self.current_ma_user.remember_token , :expires => expires }
            end
            #redirect_back_or_default('/')
            #redirect MA[:redirect_after_login] || '/'

            redirect_back_or_default(MA[:redirect_after_login] || '/')
          else
            render :new
          end
        end

        def destroy
          self.current_ma_user.forget_me if logged_in?
          cookies.delete :auth_token
          session.clear
          redirect_back_or_default('/')
        end
      end # InstanceMethods
      
    end # SessionsBase
  end # Controller
end # MerbAuth
