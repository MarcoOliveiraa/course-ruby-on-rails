class Backoffice::SendMailController < ApplicationController
#    before_action :set_admin, only: [:edit]

    layout false

    def edit
        @admin = Admin.find(params[:id])

        respond_to do |format|
            format.js
        end
    end
    
    def create
        begin
            AdminMailer.send_message(current_admin, params[:'recipient-text'], 
                params[:'subject-text'], params[:'message-text']).deliver_now            
        rescue Exception => exception
            
        end

        respond_to do |format|
            format.js
        end
    end

    protected 

    def set_admin
        @admin = Admin.find(params[:id])
    end
end
