get '/' do
  @categories = Category.all
  erb :index
end

get '/categories/:id' do
  @category = Category.find(params[:id])
  erb :all_posts
end

get '/posts/new' do
  @categories = Category.all
  erb :create_post
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :view_post
end

get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  @categories = Category.all
  erb :edit_post
end

get 'posts/:id/edit?key=:key' do
  post = Post.find_by(key: params[:key])

  redirect to "/posts/#{post.id}/edit"
end

post '/posts/new' do
  category = Category.find_by(name: params[:category])
  category.posts.create(name: params[:name],
                        description: params[:description],
                        location: params[:location],
                        key: Post.generate_key)
  redirect to ('/')
end

post '/posts/:id/edit?key=:key' do
  category = Category.find_by(name: params[:category])
  post = Post.find(params[:id])
  post.update(name: params[:name],
              description: params[:description],
              location: params[:location],
              category_id: category.id)
  redirect '/'
end

post '/posts/:id/delete' do
  post = Post.find(params[:id])
  post.destroy
  redirect '/'
end
