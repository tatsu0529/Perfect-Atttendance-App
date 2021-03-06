class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info, :edit_admin, :update_admin]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :admin_user, only: [:index, :destroy, :update, :edit_basic_info, :update_basic_info]
  # before_action :correct_user, only: [:edit, :update]
  before_action :month, only: :show
  before_action :set_one_month, only: :show
  before_action :users, only: :show
  
  def index
    @users = User.paginate(page: params[:page], per_page: 20).where.not(id: 1)
  end
  
  def import
    if params[:file].blank?
      flash[:danger] = 'CSVを選択してください'
      redirect_to users_url
    else
      User.import(params[:file])
      flash[:success] = 'ファイルをインポートしました。'
      redirect_to users_url
    end 
  end
  
  
  def attended_employees
    @attendance = Attendance.where.not(started_at: nil).where(finished_at: nil)
  end
  
  def show
    @first_attendance = @user.attendances.find_by(worked_on: @first_day)
    @all_users = User.all
    @attendance = Attendance.find(params[:id])
    @all_attendances = Attendance.all
    @worked_sum = @attendances.where.not(started_at: nil).or(@attendances.where.not(latest_started_at: nil)).count
    @user_sum = User.joins(:attendances).group("users.id").where.not(attendances: {request_one_month: nil})
    @link_to1 = 0
    @link_to2 = 0
    @link_to3 = 0
    @overtime_sum = 0
    @change_sum = 0
    @attendance_sum = 0
    respond_to do |format|
      format.html do
          #html用の処理を書く
      end 
      format.csv do
        send_data render_to_string, filename: "#{@user.name}.csv", type: :csv
      end
    end     
  end 
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user # 保存成功後ログインする
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "基本情報を更新しました。"
    else
      flash[:danger] = "更新は失敗しました。"
    end
    redirect_to users_url
  end
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end
  
  def edit_basic_info
  end
  
  def update_basic_info
    if @user.update_attributes(basic_info_params)
      flash[:success] = "#{@user.name}の基本情報を更新しました。"
    else
      flash[:danger] = "#{@user.name}の更新は失敗しました。"
    end
    redirect_to users_url
  end
  
  def edit_admin
  end 
  
  def update_admin
    if @user.update(admin_params)
      flash[:success] = "基本情報を更新しました。"
    else
      flash[:danger] = "更新は失敗しました。"
    end 
    redirect_to edit_admin_user_url
  end 
  
  
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :basic_time, :affiliation, :employee_number,
                                   :uid, :basic_work_time, :designed_work_start_time, :designed_work_start_time)
    end
    
    def admin_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end 
end
