class Users::AdministratorsController < ApplicationController
	before_action :set_user, only: [:edit, :update,:destroy]
	before_action :authenticate_user!
	def index
		@users = User.all
	end

	def new
	   @user = User.new
	end

	# GET /users/1/edit
  def edit
  	params[:id] = @user.id
  	puts "ID es1: ",params
  end

	def create
		if current_user.tipo == "administrador"
			@user = User.new(user_params)

			respond_to do |format|
		    if @user.save
		        format.html { redirect_to data_users_path, notice: 'Se creó la cuenta existosamente.' }   
		    else
		        format.html { render :new }
		   end
			end
		else

		end

		
	end

	def destroy
		@user.destroy
	  respond_to do |format|
	    format.html { redirect_to "/data_users", notice: 'Se eliminó el usuario.' }
	  end
	end

	def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to data_users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  	private

  	def set_user
  		puts "ID es: ",params
      @user = User.find(params[:id])
    end

	    # Never trust parameters from the scary internet, only allow the white list through.
		def user_params
      params.require(:user).permit(:name,:last_name,:nick_name, :email, :password, :password_confirmation,:tipo)
    end

end