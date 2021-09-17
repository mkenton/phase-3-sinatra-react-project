require 'pry'

class LabController < ApplicationController
    get "/labs" do 
        Lab.all.to_json(include: :student)
    end

    get "/labs/:id" do 
        Lab.find(params[:id]).to_json
    end


  # TO DO: create end point to fetch labs where both students have not yet completed the lab

  #  implement SQL below: -- gets all labs that student a and student b have not completed
  # #   select * from students s  inner join labs l on s.id=l.student_id where s.user_name in ("mkenton", "jthomassen") and l.completed="No";

    get "/labs/:studentA/:studentB" do 
        @labs = Lab.all
        @studentA = Student.findBy(user_name: params[":studentA"])
        @studentB = Student.findBy(user_name: params[":studentB"])
        @labs = @labs.where(completed: "No", student_id: @studentA.id)
    end

    get "/students/:student" do 
        Student.find(params[:student_id]).get_labs_by_student.to_json
    end

    patch "/labs/:id" do
        lab = Lab.find(params[:id])
        lab.update(
            tasked: params[:tasked]
        )
        lab.to_json
    end

    delete "/labs/:id" do
        Lab.find(params[:id]).destroy
    end
    
end