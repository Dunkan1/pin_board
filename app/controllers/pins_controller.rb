class PinsController < ApplicationController
    before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote]
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @pins = Pin.all.order("created_at DESC")
    end

    def new
        @pin = current_user.pins.build
    end

    def create
        @pin = current_user.pins.build(pin_params)
        # byebug
        if @pin.save
            redirect_to @pin, notice: "succesfully created new pin"
        else
            render 'new'
        end
    end

    def show
        @user_id = current_user.id
        @pin_id = @pin.id
    end

    def edit
    end

    def update
        # byebug
        if @pin.update(pin_params)
            redirect_to @pin, notice: "Pin was succesfully created"
        else
            render 'edit'
        end
    end

    def upvote
        @pin.upvote_by current_user
        redirect_to :back
    end

    def destroy 
        @pin.destroy
        redirect_to root_path
    end

    # --------------------------------------------------------------
    private

    def pin_params
        params.require(:pin).permit(:title, :description, :image)
    end

    def find_pin
        @pin = Pin.find(params[:id])
    end

end
