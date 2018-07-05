require 'rails_helper'

RSpec.describe Movie, type: :model do
  context 'Validation tests for Movie' do
    it 'ensures NAME presence' do
      movie = Movie.new(genre: 'genre',image_url: 'image_url', price: 100, duration: 60).save
      expect(movie).to eq(false)
    end

    it 'ensures GENRE presence' do
      movie = Movie.new(name: 'name',image_url: 'image_url', price: 100, duration: 60).save
      expect(movie).to eq(false)
    end

    it 'ensures IMAGE_URL presence' do
      movie = Movie.new(name: 'name',genre: 'genre', price: 100, duration: 60).save
      expect(movie).to eq(false)
    end

    it 'ensures IMAGE_URL format' do
      movie = Movie.new(image_url: "image").save
      expect(movie).to eq(false)
    end

    it 'ensures PRICE presence' do
      movie = Movie.new(name: 'name',genre: 'genre',image_url: 'image_url', duration: 60).save
      expect(movie).to eq(false)
    end

    it 'ensures DURATION presence' do
      movie = Movie.new(name: 'name',genre: 'genre',image_url: 'image_url', price: 100).save
      expect(movie).to eq(false)
    end

    it 'ensures PRICE is greater_than_or_equal_to 0.01' do
      movie = Movie.new(price: 0.00).save
      expect(movie).to eq(false)
    end

    it 'ensures NAME uniqueness' do
      movie = Movie.new(name: 'name').save
      movie = Movie.new(name: 'name').save
      expect(movie).to eq(false)
    end

    it 'ensures NAME length' do
      movie = Movie.new(name: 'name').save
      expect(movie).to eq(false)
    end

    it 'should SAVE successfully' do
      movie = Movie.new(name: 'name',genre: 'genre',image_url: 'image_url.jpg', price: 100, duration: 60).save
      expect(movie).to eq(true)
    end
  end
end
