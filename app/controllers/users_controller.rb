class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

      # GET /v1/users
      def index
        @users = User.all
      end

      # GET /users/1
      def show
      end

      def new
        @user = User.new
      end

      def edit
        @user = User.find(params[:id])
      end

      # POST /users
      def create
        @user = User.new(user_params)

        respond_to do |format|
          if @user.save
            format.html { redirect_to @user, notice: 'User was successfully created.' }
            format.json { render :show, status: :created, location: @user }
          else
            format.html { render :new }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /users/1
      def update
        respond_to do |format|
          if @user.update(user_params)
            format.html { redirect_to @user, notice: 'User was successfully updated.' }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /users/1
      def destroy
        @user.destroy
        respond_to do |format|
          format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
          @user = User.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def user_params
          params.require(:user).permit(:name, :email)
        end

end
