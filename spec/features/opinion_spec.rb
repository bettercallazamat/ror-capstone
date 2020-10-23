# spec/features/opinion_spec.rb
require 'rails_helper'

RSpec.describe Opinion, type: :feature do
  def create_user
    user = User.new(username: 'johndoe1', fullname: 'John Doe1')
    user.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-cover.jpg')),
                      filename: 'default-cover.jpg', content_type: 'image/jpg')
    user.save
  end

  def log_in
    visit sign_in_path
    fill_in 'session_username', with: 'johndoe1'
    find("input[type='submit']").click
  end

  before(:each) do
    log_in
    visit root_path
  end

  before(:all) do
    create_user
  end

  it 'is created successfully' do
    fill_in 'opinion_text', with: 'Some opinion'
    find("input[value='Create Opinion']").click
    expect(page).to have_content('Opinion was created successfully')
  end

  it 'can have a comment' do
    fill_in 'opinion_text', with: 'Some opinion'
    find("input[value='Create Opinion']").click
    fill_in 'comment_text', with: 'Some comment'
    find("input[value='Comment']").click
    expect(page).to have_content('Comment was successfully created')
  end
end
