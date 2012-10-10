class NotesController < PrivateController 
  # GET /notes
  # GET /notes.json
  def index
    @notes = @user.notes.all
    @notes_by_date = @notes.group_by(&:practice)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notes }
    end
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @note = @user.notes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @note }
    end
  end

  # GET /notes/new
  # GET /notes/new.json
  def new
    @note = @user.notes.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @note }
    end
  end

  # GET /notes/1/edit
  def edit
    @note = @user.notes.find(params[:id])
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = @user.notes.new(params[:note])

    respond_to do |format|
      if @note.save
        format.html { redirect_to(user_note_path(@user, @note), notice: 'Note was successfully created.') }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.json
  def update
    @note = @user.notes.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to user_note_path(@user, @note), notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note = @user.notes.find(params[:id])
    @note.destroy 

    respond_to do |format|
      format.html { redirect_to user_notes_path(@user) }
      format.json { head :no_content }
    end
  end
end
