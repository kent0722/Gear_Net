class MessagesController < ApplicationController
  before_action :set_user_id

  def new; end

  def create
    @room = Room.find(params[:message][:room_id])  # 送信先のルームを取得
    @message = @room.messages.new(message_params)
    @message.user = current_user # 現在のユーザーをメッセージの作成者として設定

    if @message.save
      Entry.where(room_id: @message.room_id).update(visible: true)
      redirect_to user_room_path(@user, @room), flash: { notice: 'メッセージが送信しました' }
    else
      redirect_to user_room_path(@user, @room), flash: { danger: 'メッセージの送信に失敗しました' }
    end
  end

  def destroy
    @message = Message.find(params[:id])
    if @message.destroy
      flash[:notice] = 'メッセージを削除しました'
      redirect_to user_room_path(@user), status: :see_other
    end
  end

  private

  def message_params
    params.require(:message).permit(:message, :room_id)
  end
end
