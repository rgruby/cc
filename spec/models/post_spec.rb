# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  image_url  :string(255)
#  link_url   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Post do
  
  before do
  	@post = Post.new(name: "Photography",
  						image_url: "http://placehold.it/280x150/CCCCCC/000000&text=Photographer",
  						link_url: "https://bigfuture.collegeboard.org/careers/arts-visualand-performing-photographers")
	end

	subject { @post }

	it { should respond_to(:name)}
	it { should respond_to(:image_url)}
	it { should respond_to(:link_url)}

	it { should be_valid }

  describe "when name is not present" do
    before { @post.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @post.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when image_url is not present" do
    before { @post.image_url = " " }
    it { should_not be_valid }
  end

  describe "when image_url format is malformed" do
  	before { @post.image_url = "badformat"}
  	it { should_not be_valid }
  end

  describe "when link_url is not present" do
    before { @post.link_url = " " }
    it { should_not be_valid }
  end

  describe "when link_url format is malformed" do
  	before { @post.link_url = "badformat" }
  	it { should_not be_valid }
  end


  describe "comment associations" do

    before { @post.save }
    let!(:user) { FactoryGirl.create(:user) }
    let!(:older_comment) do 
      FactoryGirl.create(:comment, user: user, post: @post, created_at: 1.day.ago)
    end
    let!(:newer_comment) do
      FactoryGirl.create(:comment, user: user, post: @post, created_at: 1.hour.ago)
    end

    it "should have the right comments in the right order" do
      @post.comments.should == [newer_comment, older_comment]
    end

    it "should destroy associated comments" do
      comments = @post.comments
      @post.destroy
      comments.each do |comment|
        Comment.find_by_id(comment.id).should be_nil
      end
    end
  end
end
