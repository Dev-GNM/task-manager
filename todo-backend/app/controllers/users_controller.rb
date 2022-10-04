class UsersController < ApplicationController
#    GET /users
    def index
        render json: User.all, status :ok 
   end 

#    GET /users/{id}
def show
    users = User.find_by(:id:params[:id])
    if user
    render json: user, status :ok 
    else
        render json: { error: "User not found" }, status :not_found
    end
end
# POST /Users
def create
    users = User.create!(user_params)
    if users.valid?
        render json: user, status: :created
    else
        render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
end

#    PUT/PATCH /users/{id}
def update
    users = User.find_by(id: params[:id])
    if users
        user.update(user_params)
            render json: user, status: :accepted
    else
        render json: { error: "User not found" }, status: :not_found
    end
end
# DELETE /users/{id}
def destroy
    user = User.find_by(id: params[:id])
    if user
    user.destroy
    head :no_content
    else
        render json: { error: "User not found" }, status: :not_found
    end
end

private
def user_params
    params.permit(
        :first_name,
        :last_name,
        :email,
        :username,
        :password_confirmation
    )
end
end
