module DualityCMS
	module Sequencing
		def jump_to=(route)
			session[:jump_to] = route
		end
		
		def jump_to
			session[:jump_to]
		end
		
		def jump!(default_destination = {:controller => 'dashboard', :action => 'index'})
			redirect_to jump_to() || default_destination
			self.jump_to = false
		end
		
		def sequence=(sequence_array)
			session[:sequence] = sequence_array
		end
		
		def add_to_sequence(sequence_item)
			session[:sequence] = [] unless session[:sequence].is_a?Array
			session[:sequence] << sequence_item
		end
		
		def stack_on_sequence(sequence_item)
			session[:sequence] = [] unless session[:sequence].is_a?Array
			session[:sequence].unshift sequence_item
		end
		
		def next_in_sequence(additional_options = {})
			if sequence_ended? 
				return false
			else
				redirect_to session[:sequence].shift.merge(additional_options)
				return true
			end
		end
		
		def sequence_ended?
			not (session[:sequence] and session[:sequence].is_a?Array and !session[:sequence].empty?)
		end
		
	end
end
