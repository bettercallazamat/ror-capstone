# spec/models/following_spec.rb
require 'rails_helper'

RSpec.describe Opinion, :type => :model do
  it "is valid with valid attributes" do
    user1 = User.new(username: "johndoe", fullname: "John Doe")
    user1.photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "default-cover.jpg")), filename: 'default-cover.jpg' , content_type: "image/jpg")
    user1.save

    user2 = User.new(username: "rachel", fullname: "Rachel Green")
    user2.photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "default-cover.jpg")), filename: 'default-cover.jpg' , content_type: "image/jpg")
    user2.save

    following = user1.followings.new(followed_id: user2.id)

    expect(following).to be_valid
  end
end
