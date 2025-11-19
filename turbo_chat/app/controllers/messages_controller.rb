class  MessagesController < ApplicationController
  before_action :set_room

  def new
    @message = @room.messages.new
  end

  def create
    @messages = @room.messages.create!(message_params)

    respond_to do |format|
        format.html { redirect_to @room }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params.require(:room_id))    
    end
    
    def message_params
      params.require(:message).permit(:content)
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.expect(room: [ :name ])
    end
end
