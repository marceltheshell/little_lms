class CohortController < ApplicationController


def index
	@cohorts = Cohort.where({:archived => [false, nil]})
	p @cohorts
	@cohort = Cohort.new
	render :index
end

def new
      cohort_params = params.require(:cohort).permit(:name, :subject)
      cohort_params[:archived] = false
      p cohort_params
 	  cohort = Cohort.create(cohort_params)
      redirect_to "/cohort/#{cohort.id}/show"
    
end

def show
	@klass = Cohort.find(params[:id])
	@present = []
	@absent = []
	@students = 'x,'
	@cohort_id = @klass.id
	@cohort = @klass.students
	@cohort.each do |stu|
		 @absent.push(stu.attendances.where({present: -1}).count)
		 @present.push(stu.attendances.where({present: 1}).count)
		 @students = @students + "#{stu.name},"
	end
	p @present
	p @students
	render :show
end

def data
    @cohort = Cohort.find(params[:id])
	render :data
end

def attendance
	klass = Cohort.find(params[:id])
	@cohort_id = klass.id
	@cohort = klass.students
	render :attendance
end

def homework
	klass = Cohort.find(params[:id])
	@cohort_id = klass
	@cohort = klass.students
	render :homework
end

def attendance_log
	# at this route params[:id] will be cohort_id 
	# params[:sid] will be student_id
	# will write a check for :sid == "all" to update all students
end

def studentsShow
	@student = Student.new
	klass = Cohort.find(params[:id])
	@cohort_id = klass.id
	@cohort = klass.students
	render :studentsShow
end

def archived
	@cohorts = Cohort.where({:archived => true})
end

def toggle_archive
	p params[:id]
	cohort = Cohort.find(params[:id])
	p cohort
	if(cohort.archived != nil)
		cohort.archived = !cohort.archived
		p cohort
		cohort.save
	end	
	render :js => "location.reload();"
end

end
