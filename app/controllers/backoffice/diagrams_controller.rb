class Backoffice::DiagramsController < BackofficeController

	def index
		%x('rails g controller backoffice::diagrams')
	end
end
