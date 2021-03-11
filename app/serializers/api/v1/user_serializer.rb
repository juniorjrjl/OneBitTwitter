class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :description, :tweets_count, :followings, :followers, :followers_count, :following_count, :photo
  attribute :followed, if: :has_user?

  def tweets_count
    object.tweets.count
  end

  def followers_count
    object.followers_by_type('User').count
  end

  def following_count
    object.following_users.count
  end

  def followers
    object.followers_by_type('User')
  end

  def followings
    object.following_users
  end

  def followed
    object.followed_by? current_user
  end

  def has_user?
    defined? current_user
  end
end
