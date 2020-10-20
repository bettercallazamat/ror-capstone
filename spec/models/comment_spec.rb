# spec/models/comment_spec.rb
require 'rails_helper'

RSpec.describe Comment, :type => :model do
  it "is valid with valid attributes" do
    user = User.new(username: "johndoe", fullname: "John Doe")
    user.photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "default-cover.jpg")), filename: 'default-cover.jpg' , content_type: "image/jpg")
    user.save
    opinion = user.opinions.create(text: "Some opinion")
    comment = opinion.comments.new(text: "Some comment")
    comment.user_id = 1
    expect(comment).to be_valid
  end

  it "is not valid without text" do 
    user = User.new(username: "johndoe", fullname: "John Doe")
    user.photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "default-cover.jpg")), filename: 'default-cover.jpg' , content_type: "image/jpg")
    user.save
    opinion = user.opinions.create(text: "Some opinion")
    comment = opinion.comments.new
    comment.user_id = 1
    expect(comment).to_not be_valid
  end

  it "is not valid with a short text" do
    user = User.new(username: "johndoe", fullname: "John Doe")
    user.photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "default-cover.jpg")), filename: 'default-cover.jpg' , content_type: "image/jpg")
    user.save
    opinion = user.opinions.create(text: "Some opinion")
    comment = opinion.comments.new(text: "Ab")
    comment.user_id = 1
    expect(comment).to_not be_valid
  end
end
