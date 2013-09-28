class SubjectController < ApplicationController
   layout 'standard'
   def list
	@subjects = Subject.all
   end
   
   def show
	@subject = Subject.find(params[:id])
   end
   
   def create
	  @subject = Subject.new(params.require(:subject).permit(:name))
    if @subject.save
         render :partial => 'subject', :object => @subject
	  else
		  @subject = Subject.all
		  render :controller => 'book', :action => 'new'
	  end
   end
end
