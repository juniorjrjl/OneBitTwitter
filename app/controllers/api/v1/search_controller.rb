class Api::V1::SearchController < Api::V1::ApiController
  def index
    tweets = Tweet.search(params[:query], page: (params[:page] || 1))
    users = User.search(params[:query], page: (params[:page] || 1))

    tweets_json = ActiveModelSerializers::SerializableResource.new(tweets, each_serializer: Api::V1::TweetSerializer)
    users_json = ActiveModelSerializers::SerializableResource.new(users, each_serializer: Api::V1::UserSerializer)

    render json: { tweets: tweets_json, users: users_json }
  end

  def autocomplete
    tweets = Tweet.search(params[:query], { fields: %i[body], match: :word_start, misspellings: false}).map(&:body)
    users = User.search(params[:query], { fields: %i[name email], match: :word_start, misspellings: false }).map(&:name)

    render json: { tweets: tweets, users: users }
  end
end
