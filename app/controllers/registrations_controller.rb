class RegistrationsController < Devise::RegistrationsController

    private

    def sign_up_params
        params.require(:user).permit(:username,:name,:email,:password,:password_confirmation, :avatar)
    end
end
