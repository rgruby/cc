require 'spec_helper'

describe "Post pages" do

  subject { page }

  describe "index" do

    let(:post) { FactoryGirl.create(:post) }

    before(:each) do
      visit posts_path
    end

    it { should have_selector('title', text: 'All Posts') }
    it { should have_selector('h1',    text: 'Posts') }

    describe "pagination" do

      before(:all) { 30.times { FactoryGirl.create(:post) } }
      after(:all)  { Post.delete_all }

#      it { should have_pagination_list }
it "should be cool" do
	page.should have_selector('div.photoSocial', text: 'pins')
end

      it "should list each post" do
        Post.paginate(page: 1).each do |post|
          page.should have_selector('div', text: post.name)
        end
      end
    end

  end
end


