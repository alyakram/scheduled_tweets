class PasswordMailer < ApplicationMailer
    def reset
      #signed_id is not human readable so the user can't tamper with it
      @token = params[:user].signed_id(purpose: "password_reset", expires_in: 15.minutes)

      mail to: params[:user].email, subject: "Password reset - Tweet Schedule"
    end
  end