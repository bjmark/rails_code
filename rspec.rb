require 'spec_helper'
describe Timesheet do
	let(:timesheet) { Factory(:timesheet) }
	describe "validation of hours worked" do
		it "fails without a number" do
			subject.hours_worked = 'abc'
			subject.should have(1).error_on(:hours_worked)
		end
		it "passes with a number" do
			subject.hours_worked = '123'
			subject.should have(0).errors_on(:hours_worked)
		end
	end
	#not undstand
	context "when submitted" do
		it "sends an email notification to the manager" do
			Notifier.should_receive(:send_later).with(
				:deliver_timesheet_submitted, timesheet
			)
			timesheet.submit
		end
		it "notifies its opening" do
			timesheet.opening.should_not be_nil
			timesheet.opening.should_receive(:fill)
			timesheet.submit
		end
	end
end
#$let
describe "Search Colleagues" do
	let(:user) { Factory(:user, :name => 'Joe') }
	let(:public_user) do
		Factory(:user, :name => 'Pete', :privacy_level => 'Public')
	end
	let(:private_user) do
		Factory(:user, :name => 'Nancy', :privacy_level => 'Private')
	end
	#$before
	before { login_as user }
	it "takes you to the search results page" do
		email_search_for(user, public_user.email)
		current_url.should == search_colleagues_path
	end
	it "doesn't return the current user" do
		email_search_for(user, user.email)
		response.body.should_not contain_text(user.name)
	end
	#$body $contain
	it "doesn't return private users" do
		email_search_for(@user, private_user.email)
		response.body.should_not contain_text(private_user.name)
	end
	#$tag $response
	context "when the user is not their colleague" do
		it "shows the 'Add colleague' button" do
			email_search_for(@user, Factory(:user).email)
			response.body.should have_tag('input[type=submit][value=?]',
																		'Add as Colleague')
		end
	end
	#$visit = $request
	#$form $button $click
	def email_search_for(current_user, email)
		visit colleagues_path
		fill_in 'Search', :with => email
		click_button 'Search'
	end
end

describe BlogPost do
	let(:blog_post) { BlogPost.create :title => 'Hello' }
	let!(:comment) { blog_post.comments.create :text => 'first post' }
	describe "#comment" do
		before do
			blog_post.comment("finally got a first post")
		end
		it "adds the comment" do
			blog_post.comments.count.should == 2
		end
	end
end

context "when there are no search results" do
	before do
		email_search_for(user, '123')
	end
	it "shows the search form" do
		current_url.should == colleagues_url
	end
	it "renders an error message" do
		response.should have_tag('.error', 'No matching email addresses found.')
	end
end

describe BlogPost do
	before { @blog_post = BlogPost.new :title => 'foo' }
	it "should not be published" do
		@blog_post.should_not be_published
	end
end

describe BlogPost do
	let(:blog_post) { BlogPost.new :title => 'foo' }
	specify { blog_post.should_not be_published }
end

expect {
	BlogPost.create :title => 'Hello'
}.to change { BlogPost.count }.by(1)

describe "#publish!" do
	let(:blog_post) { BlogPost.create :title => 'Hello' }
	it "updates published_on date" do
		expect {
			blog_post.publish!
		}.to change { blog_post.published_on }.from(nil).to(Date.today)
	end
end

describe "#unpublish!" do
	context "when brand new" do
		let(:blog_post) { BlogPost.create :title => 'Hello' }
		it "raises an exception" do
			expect {
				blog_post.unpublish!
			}.to raise_exception(NotPublishedError, /not yet published/)
		end
	end
end

describe GeneralController do
	describe "GET to index" do
		it "should be implemented eventually"
	end
end

describe GeneralController do
	describe "on GET to index" do
		it "should be successful" do
			pending("not implemented yet")
		end
	end
end

describe BlogPost do
	it "defaults to rating of 3.0" do
		pending "implementation of new rating algorithm" do
			BlogPost.new.rating.should == 3.0
		end
	end
end

describe 'Veg-O-Matic' do
	before { pending }
	it 'slices' do
		# will not run, instead displays "slices (PENDING: TODO)"
	end
	it 'dices' do
		# will also be pending
	end
	it 'juliennes' do
		# will also be pending
	end
end

describe BlogPost do
	it { should be_invalid }
end
BlogPost.new.should be_invalid

describe BlogPost do
	subject { BlogPost.new :title => 'foo', :body => 'bar' }
	it { should be_valid }
end

describe BlogPost do
	subject { BlogPost.new :title => 'foo', :body => 'bar' }
	it "sets published timestamp" do
		subject.publish!
		subject.published?.should == true
	end
end

describe Array do
	its(:length) { should == 0 }
end

describe BlogPost do
	subject do
		blog_post = BlogPost.new :title => 'foo', :body => 'bar'
		blog_post.publish!
		blog_post
	end
	it { should be_valid }
	its(:errors) { should be_empty }
	its(:title) { should == 'foo' }
	its(:body) { should == 'bar' }
	its(:published_on) { should == Date.today }
end

target.should be_true 
# targer.should == true

target.should be_false 
# targer.should == false

target.should be_nil 
# targer.should == ni

target.should be_a_kind_of(Array) 
# target.class.should == Array
target.should be_an_instance_of(Array) 
# target.class.should == Array

target.should respond_to(:foo) 
# target.repond_to?(:foo).should == true

target.should have_key(:foo) 
# target[:foo].should_not == nil

target.should include(4) 
# target.include?(4).should == true

target.should have(3).items 
# target.items.length == 3

target.should be_empty 
# target.empty?.should == true

target.should be_blank 
# target.blank?.should == true

target.should be_admin 
# target.admin?.should == true

describe Order do
	describe "#ship!" do

		context "with paid" do
			it "should update status to shipping" do
				expect {
					order.ship!
				}.to change { order.status }.from("new").to("shipping")
			end
		end

		context "without paid" { ... }
	end
end

describe Order do
  describe "#ship!" do

    context "with paid" do
      it "should raise NotPaidError" do
       expect {
          order.paid? = false
          order.ship!
        }.to raise_error(NotPaidError)
      end
    end  
 
    context "with paid" { ... }
  
  end
end

=begin
要怎麼執行測試呢?輸入bundle exec rake spec就會根據目前的開發資料庫Schema建一個測試用資料庫，然後執行所有spec目錄下的_spec.rb檔案結尾的測試。

如果測試資料庫已經建好了，例如執行過rake spec或是bundle exec rake db:test:prepare之後，你也可以單獨執行測試bundle exec rspec spec/models/event_spec.rb。

關於測試資料最重要的一點是，記得確認每個測試案例之間的測試資料需要清除，Rails預設是用關聯式資料庫的Transaction功能，所以每次之間增修的資料都會清除。但是如果你的資料庫不支援(例如MySQL的MyISAM格式就不支援)或是用如MongoDB的NoSQL，那麼就要自己處理，推薦可以試試Database Clener這套工具。
=end

