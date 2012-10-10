class PlayersController < PrivateController

  
  # GET /players
  # GET /players.json
  def index
    @players = @user.players.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @players }
    end
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @player = @user.players.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player }
    end
  end

  # GET /players/new
  # GET /players/new.json
  def new
    @player = @user.players.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @player }
    end
  end

  # GET /players/1/edit
  def edit
    @player = @user.players.find(params[:id])
  end

  # POST /players
  # POST /players.json
  def create
    @player = @user.players.new(params[:player])

    respond_to do |format|
      if @player.save
        format.html { redirect_to [@user, @player], notice: 'Player was successfully created.' }
        format.json { render json: @player, status: :created, location: @player }
      else
        format.html { render action: "new" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /players/1
  # PUT /players/1.json
  def update
    @player = @user.players.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.html { redirect_to [@user, @player], notice: 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player = @user.players.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to [@user, :players] }
      format.json { head :no_content }
    end
  end
end
