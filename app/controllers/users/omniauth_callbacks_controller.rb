module Users
    class OmniauthCallbacksController < Devise::OmniauthCallbacksController
      def google_oauth2
        handle_auth 'Google'
      end

      def facebook_oauth2
        handle_auth 'Facebook'
      end
  
      def handle_auth(_kind)
        @user = User.from_omniauth(request.env['omniauth.auth'])
        if @user.persisted?
          flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: _kind
          sign_in_and_redirect @user, event: :authentication
        else
          session['devise.auth_data'] = request.env['omniauth.auth'].except('extra')
          sign_in_and_redirect @user, alert: @user.errors.full_messages.join("\n")
        end
      end
    end
end
