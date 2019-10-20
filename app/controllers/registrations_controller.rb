class RegistrationsController < ApplicationController

  def create
    # ！をつけることにより、例外を発生させるか発生させないかの違いです。

    user = User.create!(
      email: params['user']['email'],
      password: params['user']['password'],
      password_confirmation: params['user']['password_confirmation']

    )
    if user
      session[:user_id] = user.id
      render json: {
        status: 201,
        user: user
      }
    else
      render json: {status: 500}
    
    end

  end

end
