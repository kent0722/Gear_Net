class MessagesController < ApplicationController
  def new; end

  def create
    @user = User.find(params[:user_id])
    @room = Room.find(params[:message][:room_id])  # 送信先のルームを取得
    @message = @room.messages.new(message_params)
    @message.user = current_user # 現在のユーザーをメッセージの作成者として設定

    if @message.save
      redirect_to user_room_path(@user, @room), flash: { notice: 'メッセージが送信しました' }
    else
      redirect_to user_room_path(@user, @room), flash: { danger: 'メッセージの送信に失敗しました' }
    end
  end

  def destroy
    @room = Room.find(params[:message][:room_id])
    @message = @room.messages
    if @message.destroy
      flash[:notice] = 'メッセージを削除しました'
      redirect_to user_room_path(@user, @room), status: :see_other
    end
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
end
