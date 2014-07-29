

enable 'sessions'

get '/' do
  # render home page
  @notes=Note.all.order(created_at: :desc)
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  @email = nil
  erb :sign_in
end

post '/sessions' do
  # sign-in

  user = Lover.authenticate(params[:email], params[:password])
  if user
    # successfully authenticated; set up session and redirect
    session[:user_id] = user.id
    redirect '/'
    #redirect '/'
  else
    # an error occurred, re-render the sign-in form, displaying an error
    @error = "Invalid email or password."
    erb :sign_in
  end
end

# delete '/sessions/:id' do
#   # sign-out -- invoked via AJAX
#   return 401 unless params[:id].to_i == session[:user_id].to_i
#   session.clear
#   200
# end


delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  return 401 unless params[:id].to_i == session[:user_id].to_i
  session.clear
  200
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  @user = Lover.new
  erb :sign_up
end

post '/users' do
  # sign-up
  @user = Lover.new params[:user]
  if @user.save
    # successfully created new account; set up the session and redirect
    session[:user_id] = @user.id
    #redirect '/users/#{current_user.id}/notes'
    redirect '/'
  else
    # an error occurred, re-render the sign-up form, displaying errors
    erb :sign_up
  end
end


#----------- AFTER LOGGED IN -----------

get '/users/:id/notes' do
  #return 401 unless params[:id].to_i == session[:user_id].to_i
  @notes=Note.all.order(created_at: :desc)
  erb :index
end

post '/notes/new' do
  current_user.notes << Note.create(to: params[:to], content: params[:content]) 
  redirect to ("/users/#{current_user.id}/notes")
end


get '/note/:id' do
  @note=Note.find(params[:id])
  erb :edit_note
end

patch '/note/:id' do
  note=Note.find(params[:id])
  note.update(to: params[:to], content: params[:content])
  #redirect '/users/#{@userid}/skills'
  redirect to ("/users/#{current_user.id}/notes")
end

get '/delete/note/:id' do
  @note=Note.find(params[:id])
  @note.destroy
  redirect to ("/users/#{current_user.id}/notes")
end



