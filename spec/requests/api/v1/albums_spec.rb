require "rails_helper"

describe "GET /api/v1/albums" do
  it "returns the albums" do
    album = create(:album)

    json_get "/api/albums"

    expect(response).to be_successful
    expect(json_response["data"]).to eq([
      {
        "id" => album.id.to_s,
        "type" => "albums",
        "attributes" => {
          "artist" => album.artist,
          "title" => album.title,
        },
        "links" => { "self" => url_for([:api, album]) },
      }
    ])
  end
end
