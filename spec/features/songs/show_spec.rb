require 'rails_helper'

RSpec.describe 'the songs show page' do
  it 'displays song title' do
    song = Song.create!(title: "I Really Like You", length: 208, play_count: 234)
    visit "/songs/#{song.id}"
  end

  xit 'displays artist title' do
    artist = Artists.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 234)
    song2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 649)
    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song2.title)
  end
end
