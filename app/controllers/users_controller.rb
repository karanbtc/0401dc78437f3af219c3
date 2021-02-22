class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]
  before_action :auto_increment, only: %i[ create ]

  # GET /users or /users.json
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1 or /users/1.json
  def show
    render json: @user
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        # format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render json: {msg: "successfully created"}, status: :ok, location: @user }
      else
        # format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        # format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render json: {msg: "successfully updated"}, status: :ok, location: @user }
      else
        # format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      # format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { render json: {msg: "successfully destroyed." } }
    end
  end

  def search
    params[:input] =  Regexp.new('.*' + params[:input] + '.*')
    users = User.or(:email => params[:input]).or(:first_name => params[:input]).or(:last_name => params[:input])
    render json: users
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.where({id: params[:id].to_i}).try(:[],0)
    end

    def auto_increment
      @last = User.all.order(id: :desc)[0]
      params[:user][:id] = (@last&.id + 1 || 1)
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :id)
    end
end
