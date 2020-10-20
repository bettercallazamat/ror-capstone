# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is valid with valid attributes" do
    user = User.new(username: "johndoe", fullname: "John Doe")
    user.photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "default-cover.jpg")), filename: 'default-cover.jpg' , content_type: "image/jpg")
    expect(user).to be_valid
  end

  it "is not valid without a username" do 
    user = User.new(fullname: "John Doe")
    user.photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "default-cover.jpg")), filename: 'default-cover.jpg' , content_type: "image/jpg")
    expect(user).to_not be_valid
  end

  it "is not valid with a short username" do 
    user = User.new(username: "jo",fullname: "John Doe")
    user.photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "default-cover.jpg")), filename: 'default-cover.jpg' , content_type: "image/jpg")
    expect(user).to_not be_valid
  end

  it "is not valid with a dublicated username" do 
    user1 = User.new(username: "johndoe",fullname: "John Doe")
    user1.photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "default-cover.jpg")), filename: 'default-cover.jpg' , content_type: "image/jpg")
    user1.save
    user2 = User.new(username: "johndoe",fullname: "John Doeee")
    expect(user2).to_not be_valid
  end

  it "is not valid without a fullname" do
    user = User.new(username: "johndoe")
    user.photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "default-cover.jpg")), filename: 'default-cover.jpg' , content_type: "image/jpg")
    expect(user).to_not be_valid
  end

  it "is not valid with a short fullname" do
    user = User.new(username: "johndoe",fullname: "JD")
    user.photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "default-cover.jpg")), filename: 'default-cover.jpg' , content_type: "image/jpg")
    expect(user).to_not be_valid
  end

  it "is not valid without photo" do
    user = User.new(username: "johndoe",fullname: "John Doe")
    expect(user).to_not be_valid
  end
end
