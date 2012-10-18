# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#

require 'spec_helper'

describe Comment do

	let(:user) { FactoryGirl.create(:user) }
	let(:post) { FactoryGirl.create(:post) }
	before {
		@comment = user.comments.build(content: "Lorem ipsum")
		@comment.post = post
	}

  subject { @comment }

  it { should respond_to(:content) }

  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }
  
  it { should respond_to(:post_id) }
  it { should respond_to(:post) }
  its(:post) { should == post }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @comment.user_id = nil }
    it { should_not be_valid }
  end

  describe "when post_id is not present" do
    before { @comment.post_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @comment.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @comment.content = "a" * 301 }
    it { should_not be_valid }
  end


  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Comment.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end

    it "should not allow access to post_id" do
      expect do
        Comment.new(post_id: post.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end   
  end
end
