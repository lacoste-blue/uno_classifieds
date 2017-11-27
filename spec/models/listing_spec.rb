require 'rails_helper'

RSpec.describe Listing, :type => :model do
  before(:each) do
    @cat1 = FactoryBot.create :category
    @cat2 = FactoryBot.create :category
    @user1 = FactoryBot.create :user
    FactoryBot.create :listing, :all_tags => 'apple, dog',
                                :category => @cat1, :title => 't1', :user => @user1
    FactoryBot.create :listing, :all_tags => 'apple', :category => @cat1,
                                :title => 't2'
    FactoryBot.create :listing, :all_tags => 'dog', :category => @cat2,
                                :title => 't3', :user => @user1
  end

  describe 'category_id' do
    before(:each) do
      @listings = Listing.category_id(@cat1.id)
    end

    it 'returns 2 results' do
      expect(@listings.count).to eq(2)
    end

    it 'returns listings by category_id' do
      expect(@listings.first.category_id).to eq(@cat1.id)
    end

    it 'contains listing with :title => t1 && t2' do
      expect(@listings).to exist(:title => 't1') & exist(:title => 't2')
    end
  end

  describe 'user_id' do
    before(:each) do
      @listings = Listing.user_id(@user1.id)
    end

    it 'returns listings by user_id' do
      expect(@listings.first.user).to eq(@user1)
    end

    it 'returns 2 results' do
      expect(@listings.count).to eq(2)
    end

    it 'contains listing with :title => t1 && t3' do
      expect(@listings).to exist(:title => 't1') & exist(:title => 't3')
    end
  end

  describe 'has_picture' do
    before { FactoryBot.create(:listing) }
    it 'returns empty when no pictures' do
      expect(Listing.has_picture).to be_empty
    end

    it 'returns all listings with images' do
      2.times { FactoryBot.create(:picture) }
      expect(Listing.has_picture.count).to eq(2)
    end
  end

  describe '.all_tags=' do
    it 'returns empty if blank' do
      listing = FactoryBot.create :listing, :all_tags => ''
      expect(listing.tags).to be_empty
    end

    it 'returns apple and dog tags' do
      listing = FactoryBot.create :listing
      expect(listing.tags).to exist(:name => 'apple') & exist(:name => 'dog')
    end

    it 'creates new Tags if necessary' do
      FactoryBot.create :listing
      expect do
        FactoryBot.create :listing, :all_tags => 'newtag1, new tag2'
      end.to change(Tag, :count).by(2)
    end
  end

  describe '.all_tags' do
    it 'returns nothing if empty' do
      listing = FactoryBot.create :listing, :all_tags => ''
      expect(listing.all_tags).to be_empty
    end

    it 'returns csv of tags' do
      listing = FactoryBot.create :listing
      expect(listing.all_tags).to eq('apple, dog')
    end
  end

  describe '.tag' do
    it 'returns a scope(ActiveRecord_Relation' do
      expect(Listing.tag('')).to be_a(Listing::ActiveRecord_Relation)
    end

    context 'when retrieving apple tag' do
      before(:each) do
        @listings = Listing.tag('apple')
      end

      it 'returns 2 listings with apple tag' do
        expect(@listings.count).to eq(2)
      end

      it 'returns listings l1 and l2' do
        l1 = Listing.where(:title => 't1').first
        l2 = Listing.where(:title => 't2').first
        expect(@listings).to include(l1) & include(l2)
      end

      context 'when retrieving dog tag' do
        it 'returns listings l1 and l3' do
          @listings = Listing.tag('dog')
          l1 = Listing.where(:title => 't1').first
          l3 = Listing.where(:title => 't3').first
          expect(@listings).to include(l1) & include(l3)
        end
      end
    end
  end
end

