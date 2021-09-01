class PostsCreator

  def initialize(title:, content:)
    @title = title
    @content = content
  end

  def create
    post = Post.create!(title: @title, content: @content)

    ActionCable.server.broadcast(
      "wall_channel",
      {
        id: post.id,
        title: post.title,
        contetn: post.content
      }
    )
  end
end
