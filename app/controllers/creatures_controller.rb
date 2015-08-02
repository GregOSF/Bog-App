class CreaturesController < ApplicationController

	def index
		@creatures = Creature.all
		render :index
	end

	def new
		@creature = Creature.new
		render :new
	end

	def create
        # creature_params = params.require(:creature).permit(:name, :description)
        Creature.create(creature_params)

        # @creature = Creature.new(creature_params)
        # if @creature.save
        redirect_to "/creatures/#{creature.id}"
        # end
	end

	def show
        creature_id = params[:id]
        @creature = Creature.find(creature_id)
        render :show
    end

    def edit
    	creature_id = params[:id]
    	@creature = Creature.find(creature_id)
    	render :edit
    end

    def update
    	creature_id = params[:id]
    	@creature = Creature.find(creature_id)
    	@creature.update_attributes(creature_params)
    	redirect_to "/creatures"

    end

    def destroy
    	creature_id = params[:id]
    	@creature = Creature.find(creature_id)
    	@creature.destroy
    	redirect_to "/creatures"
    end



	private
		def creature_params
			params.require(:creature).permit(:name, :description)
		end



end
