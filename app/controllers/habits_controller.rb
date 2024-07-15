class HabitsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_habit, only: %i[ show edit update destroy plus minus ]
  
  
    def index
      @habits = current_user.habits.includes(:awards).ordered
      @pagy, @habits = pagy(@habits)
      @habit = current_user.habits.build

      rescue Pagy::OverflowError
        redirect_to habits_path
    end
  
    def show
    end
  
    def new
      @habit = current_user.habits.build
    end
  
    def create
      @habit = current_user.habits.build(habit_params)
  
      respond_to do |format|
        if @habit.save
          format.html { redirect_to habits_path, notice: "Habit was successfully create!." }
          format.turbo_stream { flash.now[:notice] = "Habit was successfully create!." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  
    def edit
    end
  
    def update
      if @habit.update(habit_params)
  
        respond_to do |format|
          format.html { redirect_to habits_path, notice: "Habit was successfully updated!." }
          format.turbo_stream { flash.now[:notice] = "Habit was successfully updated!." }
        end
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @habit.destroy
  
      respond_to do |format|
        format.html { redirect_to habits_path, notice: "Habit was successfully destroyed!." }
        format.turbo_stream { flash.now[:notice] = "Habit was successfully destroyed!." }
      end
    end
  
    def plus
        current_day = Time.zone.now
        last_count_date = @habit.created_at

        if @habit.created_at.today?
            current_day += 1.day
        end
        
        @habit.update(count: @habit.count)

        if  @habit.saved_changes.include?("count")
            last_count_date = @habit.saved_changes["updated_at"][1]
        end

        day_difference = ( current_day.to_date - last_count_date.to_date).to_i
        day_difference += 1 unless @habit.created_at.today?
        
        if @habit.count < day_difference
            @habit.update(count: @habit.count + 1)
            render :result
        else
            respond_to do |format|
                format.turbo_stream { flash.now[:notice] = 
                "You cannot track more than days you've followed 
                '#{@habit.name.upcase}' habit!."}
            end
        end
    end
  
    def minus
      @habit.update(count: @habit.count - 1)
      render :result
    end
      
  
  
  
    private
  
    def set_habit
      @habit = current_user.habits.find(params[:id])
    end
  
    def habit_params
      params.require(:habit).permit(:name, :count)
    end
  end
  