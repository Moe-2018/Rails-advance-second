class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
  def index
    @events = Event.limit(10).order(created_at: :desc)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    if @event.save
      flash[:success] = 'イベントを登録しました。' # 成功時のフラッシュメッセージ
      redirect_to root_path 
    else
      flash[:alert] = '登録に失敗しました' # 失敗時のフラッシュメッセージ
      render :new # 投稿画面を再表示
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def destroy
    @event = current_user.events.find_by(id: params[:id])

    if @event.nil?
      flash[:alert] = "削除する権限がありません"
      redirect_to events_path
    end

    if @event.destroy
    flash[:success] = "イベントを削除しました。"
    redirect_to events_path
    else
    flash[:alert] = "削除に失敗しました。"
    render :show
    end
  end


  def edit
  end

  def update 
    
    if @event.update
      flash[:success] = 'イベントを更新しました。' # 成功時のフラッシュメッセージ
      redirect_to root_path 
    else
      flash[:alert] = '更新に失敗しました' # 失敗時のフラッシュメッセージ
      render :edit # 編集画面を再表示
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :organiser_name, :target_department) 
  end
end