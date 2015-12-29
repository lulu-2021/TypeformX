defmodule Typeform.Client.Test do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  alias Typeform.Client

  test "against the vcr cassette information" do
    use_cassette "information", custom: true do
      body = Client.information
      %Typeform.ClientInformation{
        description: description,
        documentation: documentation,
        name: name,
        support: _,
        time: _,
        version: _
        } = body
        
        assert description == "Build API for creating forms awesomely"
        assert documentation == "https://docs.typeform.io/"
        assert name == "Typeform I/O Build API"
    end
  end

end
