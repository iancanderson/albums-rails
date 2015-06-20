require "rails_helper"

describe "GET /api/v1/albums" do
  it "returns the albums" do
    album = create(:album)

    json_get "/api/albums"

    albums_response = json_response["albums"]

    expect(response).to be_successful
    expect(albums_response).to eq([
      {
        "id" => album.id,
        "artist" => album.artist,
        "title" => album.title,
      }
    ])
  end
end
