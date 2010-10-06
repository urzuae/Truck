# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def connect_piv
    @pivotal = TicketMaster.new(:pivotal, {:username => 'urzuae', :password => 'redsox'})
  end
  
  def try_connection
    begin
      @pivotal.project(@project.pivotal_id)
    rescue
      nil
    end
  end
  
end
