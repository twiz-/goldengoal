class LogisticsController < PrivateController
  
  # GET /logistics
  # GET /logistics.json
  def index
    @logistics = @user.logistics.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @logistics }
    end
  end

  # GET /logistics/1
  # GET /logistics/1.json
  def show
    @logistic = @user.logistics.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @logistic }
    end
  end

  # GET /logistics/new
  # GET /logistics/new.json
  def new
    @logistic = @user.logistics.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @logistic }
    end
  end

  # GET /logistics/1/edit
  def edit
    @logistic = @user.logistics.find(params[:id])
  end

  # POST /logistics
  # POST /logistics.json
  def create
    @logistic = @user.logistics.new(params[:logistic])

    respond_to do |format|
      if @logistic.save
        format.html { redirect_to logistic_path(@logistic), notice: 'Logistic was successfully created.' }
        format.json { render json: @logistic, status: :created, location: @logistic }
      else
        format.html { render action: "new" }
        format.json { render json: @logistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /logistics/1
  # PUT /logistics/1.json
  def update
    @logistic = @user.logistics.find(params[:id])

    respond_to do |format|
      if @logistic.update_attributes(params[:logistic])
        format.html { redirect_to logistic_path(@logistic), notice: 'Logistic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @logistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logistics/1
  # DELETE /logistics/1.json
  def destroy
    @logistic = @user.logistics.find(params[:id])
    @logistic.destroy

    respond_to do |format|
      format.html { redirect_to logistics_path }
      format.json { head :no_content }
    end
  end
end
