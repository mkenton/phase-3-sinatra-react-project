#Lab model code here. Lab belongs to student
#Labs contain data such as num of commits, time of submission, lines of code (additions/changes)
#Further data may include calcualted time taken to complete (date-time completed minus date-time forked)

class Lab < ActiveRecord::Base
    belongs_to :student

    # def self.get_labs_by_student(id)
    #     Lab.find_by_student_id(id).name
    # end
end