class MessagesController < ApplicationController
  def new
    @messages = Message.all
    @message = Message.new
    @match = Match.find(params[:match_id])
  end

  def create
    @match = Match.find(params[:match_id])
    @message = @match.messages.new(message_params)
    if @message.save
      redirect_to new_user_match_messages_path(id: current_user.id, user_id: current_user.id, match_id: @match.id)
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
