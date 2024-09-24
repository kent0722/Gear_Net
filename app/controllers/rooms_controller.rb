class RoomsController < ApplicationController
  def create
    @room = Room.create
    @current_entry = @room.entries.create(user_id: current_user.id)
    @another_entry = @room.entries.create(user_id: params[:entry][:user_id])
    redirect_to user_room_path(current_user, @room)
  end

  def index
    @user = User.find(params[:user_id])
    @meaages = Message.all
    my_room_id = current_user.entries.pluck(:room_id)
    @another_entries = Entry.where(room_id: my_room_id, visible: true).where.not(user_id: current_user.id).preload(room: :messages)
    current_user.notifications.where(checked: false, subject_type: 'Message').update_all(checked: true)
  end

  def show
    @room = Room.find(params[:id])
    @entry = Entry.find(params[:id])
    if @room.entries.where(user_id: current_user.id).present?
      @messages = @room.messages.all
      @message = Message.new
      @entries = @room.entries
      @another_entry = @entries.where.not(user_id: current_user.id).first
      # @current_entry = @room.entries.find_by(user_id: current_user.id)
      # @is_room = true
      # @room_id = @room.id
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def visible_selected
    if params[:entry_ids].present?
      params[:entry_ids].each do |entry_id|
        entry = current_user.entries.find_by(room_id: entry_id)
        Entry.where(room_id: entry_id).update(visible: false) if entry.present?
      end
      flash[:notice] = '非表示にしました'
      redirect_to user_rooms_path(current_user), status: :see_other
    else
      flash[:danger] = '選択されていません'
      redirect_to user_rooms_path(current_user), status: :see_other
    end
  end
end
