class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
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
      flash.now[:alert] = '登録に失敗しました' # 失敗時のフラッシュメッセージ
      render :new, status: :unprocessable_entity # 投稿画面を再表示
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    unless @event
    flash[:alert] = "イベントが見つかりません"
    redirect_to events_path
    end
  end

  def destroy
    @event = current_user.events.find_by(id: params[:id])

    if @event.nil?
      flash[:alert] = "削除する権限がありません"
      redirect_to events_path
      return
    end

    if @event.destroy
    flash[:success] = "イベントを削除しました。"
    redirect_to events_path
    else
    flash[:alert] = "削除に失敗しました。"
    redirect_to events_path  # render :showではなく、redirect_toを使う
    end
  end


 def edit
  @event = current_user.events.find_by(id: params[:id])
  unless @event
    flash[:alert] = "編集する権限がありません"
    redirect_to events_path
    return
  end
 end

def update
  @event = current_user.events.find_by(id: params[:id])
  unless @event
    flash[:alert] = "更新する権限がありません"
    redirect_to events_path
    return
  end
  
  if @event.update(event_params)  # event_paramsを追加
    flash[:success] = 'イベントを更新しました。'
    redirect_to root_path
  else
    flash.now[:alert] = '更新に失敗しました'
    render :edit, status: :unprocessable_entity
  end
end

  private



  def event_params
    params.require(:event).permit(:title, :description, :start_date, :organiser_name, :target_department) 
  end
end