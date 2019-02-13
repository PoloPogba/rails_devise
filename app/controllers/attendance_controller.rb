class AttendanceController < ApplicationController

def index 

end

def show

end

def new
    @attendance = Event.last
    
end

def create 
    @attendance = Attendance.new
    
end

end
