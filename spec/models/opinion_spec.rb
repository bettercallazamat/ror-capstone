# spec/models/opinion_spec.rb
require 'rails_helper'

RSpec.describe Opinion, :type => :model do
  it "is valid with valid attributes" do
    user = User.new(username: "johndoe", fullname: "John Doe")
    user.photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "default-cover.jpg")), filename: 'default-cover.jpg' , content_type: "image/jpg")
    user.save
    opinion = user.opinions.create(text: "Some opinion")
    expect(opinion).to be_valid
  end

  it "is not valid without text" do 
    user = User.new(username: "johndoe", fullname: "John Doe")
    user.photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "default-cover.jpg")), filename: 'default-cover.jpg' , content_type: "image/jpg")
    user.save
    opinion = user.opinions.create
    expect(opinion).to_not be_valid
  end

  it "is not valid with a short text" do
    user = User.new(username: "johndoe", fullname: "John Doe")
    user.photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "default-cover.jpg")), filename: 'default-cover.jpg' , content_type: "image/jpg")
    user.save
    opinion = user.opinions.create(text: "Ab")
    expect(opinion).to_not be_valid
  end
end
