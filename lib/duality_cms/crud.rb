module DualityCMS
	module CRUD
		
		def new
			@model = factory(params[:controller]).new
		end
		
		def edit
			@model = factory(params[:controller]).find(params[:id])
		end
		
		def create
			if request.post?
				@model = factory(params[:controller]).new(params[:model])
				if(@model.save)
					flash[:notice] = "#{@model.to_s} page saved successfully."
					redirect_to :action => 'index'
				else
					flash[:notice] = "#{@model.to_s} failed to save."
					render :action => 'new'
				end
			else
				redirect_to :action => 'index'
			end
		end
		
		def update
			if request.post?
				@model = factory(params[:controller]).find(params[:id])
				if(@model.update_attributes(params[:model]))
					flash[:notice] = "#{@model.to_s} page saved successfully."
					redirect_to :action => 'index'
				else
					flash[:notice] = "#{@model.to_s} failed to save."
					render :action => 'edit'
				end
			else
				redirect_to :action => 'index'
			end
		end
		
		def destroy
			if request.xhr?
				@model = factory(params[:controller]).find(params[:id])
				@model.destroy
			else
				redirect_to :action => 'index'
			end
		end
		
	end
end