require 'rails_helper'

RSpec.describe ImageResource do
  describe '#initialize' do
    it 'exists and has attributes' do
      data = {
        :id=>"gsllxmVO4HQ",
        :created_at=>"2018-06-05T06:50:34Z",
        :updated_at=>"2023-03-08T00:03:31Z",
        :promoted_at=>nil,
        :width=>5034,
        :height=>3356,
        :color=>"#d9d9d9",
        :blur_hash=>"L.IrQxRlnhM}yZWFoeS5R+bcogoy",
        :description=>"Traveling on motorbike in norther thailand we came across these amazing sculptural temples and buildings.",
        :alt_description=>"standing statue and temples landmark during daytime",
        :urls=>
          {:raw=>"https://images.unsplash.com/photo-1528181304800-259b08848526?ixid=Mnw0MTkzMDd8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2NzgyNDM2NTY&ixlib=rb-4.0.3",
          :full=>"https://images.unsplash.com/photo-1528181304800-259b08848526?crop=entropy&cs=tinysrgb&fm=jpg&ixid=Mnw0MTkzMDd8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2NzgyNDM2NTY&ixlib=rb-4.0.3&q=80",
          :regular=>
            "https://images.unsplash.com/photo-1528181304800-259b08848526?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MTkzMDd8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2NzgyNDM2NTY&ixlib=rb-4.0.3&q=80&w=1080",
          :small=>
            "https://images.unsplash.com/photo-1528181304800-259b08848526?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MTkzMDd8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2NzgyNDM2NTY&ixlib=rb-4.0.3&q=80&w=400",
          :thumb=>
            "https://images.unsplash.com/photo-1528181304800-259b08848526?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MTkzMDd8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2NzgyNDM2NTY&ixlib=rb-4.0.3&q=80&w=200",
          :small_s3=>"https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1528181304800-259b08848526"},
        :links=>
          {:self=>"https://api.unsplash.com/photos/gsllxmVO4HQ",
          :html=>"https://unsplash.com/photos/gsllxmVO4HQ",
          :download=>"https://unsplash.com/photos/gsllxmVO4HQ/download?ixid=Mnw0MTkzMDd8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2NzgyNDM2NTY",
          :download_location=>"https://api.unsplash.com/photos/gsllxmVO4HQ/download?ixid=Mnw0MTkzMDd8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2NzgyNDM2NTY"},
        :likes=>266,
        :liked_by_user=>false,
        :current_user_collections=>[],
        :sponsorship=>nil,
        :topic_submissions=>{:nature=>{:status=>"rejected"}, :"architecture-interior"=>{:status=>"rejected"}, :spirituality=>{:status=>"rejected"}, :"arts-culture"=>{:status=>"rejected"}},
        :user=>
          {:id=>"hae8rLbohfw",
          :updated_at=>"2023-03-07T15:07:13Z",
          :username=>"cadop",
          :name=>"Mathew Schwartz",
          :first_name=>"Mathew",
          :last_name=>"Schwartz",
          :twitter_username=>nil,
          :portfolio_url=>"http://smart-art.org",
          :bio=>"Researcher and designer that likes photography and open source work.  Happy to share my photos and hope people find good use from them.",
          :location=>nil,
          :links=>
            {:self=>"https://api.unsplash.com/users/cadop",
            :html=>"https://unsplash.com/pt-br/@cadop",
            :photos=>"https://api.unsplash.com/users/cadop/photos",
            :likes=>"https://api.unsplash.com/users/cadop/likes",
            :portfolio=>"https://api.unsplash.com/users/cadop/portfolio",
            :following=>"https://api.unsplash.com/users/cadop/following",
            :followers=>"https://api.unsplash.com/users/cadop/followers"},
          :profile_image=>
            {:small=>"https://images.unsplash.com/placeholder-avatars/extra-large.jpg?ixlib=rb-4.0.3&crop=faces&fit=crop&w=32&h=32",
            :medium=>"https://images.unsplash.com/placeholder-avatars/extra-large.jpg?ixlib=rb-4.0.3&crop=faces&fit=crop&w=64&h=64",
            :large=>"https://images.unsplash.com/placeholder-avatars/extra-large.jpg?ixlib=rb-4.0.3&crop=faces&fit=crop&w=128&h=128"},
          :instagram_username=>nil,
          :total_collections=>11,
          :total_likes=>0,
          :total_photos=>422,
          :accepted_tos=>true,
          :for_hire=>false,
          :social=>{:instagram_username=>nil, :portfolio_url=>"http://smart-art.org", :twitter_username=>nil, :paypal_email=>nil}},
        :tags=>[{:type=>"search", :title=>"thailand"}, {:type=>"search", :title=>"wiang kum kam"}, {:type=>"search", :title=>"ตำบล ช้างเผือก"}]
      }

      image = ImageResource.new(data)

      expect(image).to be_a(ImageResource)
      expect(image.alt_tag).to eq("standing statue and temples landmark during daytime")
      expect(image.url).to eq("https://images.unsplash.com/photo-1528181304800-259b08848526?ixid=Mnw0MTkzMDd8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2NzgyNDM2NTY&ixlib=rb-4.0.3")
    end
  end
end