class PostsShowPresenter
  def initialize(topic, post)
    @topic = topic
    @post = post
  end

  def topic
    @topic
  end

  def post
    @post
  end

  def book_club
    @topic.book_club 
  end

  def book_club_cover_url
    @topic.book_club.cover.url(:medium)
  end

  def book_club_title
    @topic.book_club.title
  end

  def book_club_author
    @topic.book_club.author
  end

  def book_club_end_date
    @topic.book_club.end_date.strftime("%B %-d, %Y")
  end





end
