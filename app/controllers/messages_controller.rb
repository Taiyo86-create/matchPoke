class MessagesController < ApplicationController
  def new
    @match = Match.find(params[:match_id])
    @user = User.find(params[:user_id])
    @messages = @match.messages.includes(:user)
    @message = Message.new(user_id: @user.id, match_id: @match.id)
  end

  def create
    @match = Match.find(params[:match_id])
    @message = @match.messages.new(message_params)
    if @message.save
      render json:{ message: @message }
    else
      @messages = @match.messages.includes(:user)
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :match_id).merge(user_id: current_user.id)
  end
end
