defmodule Typeform.Client.Test do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  alias Typeform.Client

  test "information - against the vcr cassette information" do
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

  test "create a form - against the vcr cassette create form" do
    field = %Typeform.ClientField{type: "short_text", question: "What is your name?"}
    form = %Typeform.ClientForm{title: "Test typeform", fields: [field]}
    payload = Poison.encode!(form)
    use_cassette "create_form", custom: true do
      response = Client.create_form(payload)
      %Typeform.ClientForm{
        id: id,
        title: title,
        fields: fields,
        _links: links
      } = response
      field = fields |> List.first
      form_field = field |> Typeform.ClientField.build

      link = links |> List.first
      form_link = link |> Typeform.ClientLink.build

      %Typeform.ClientField{type: type, question: question} = form_field
      %Typeform.ClientLink{rel: rel, href: href} = form_link

      assert id == "keEwsGeuC"
      assert title == "My first typeform"
      assert type == form_field.type
      assert question == form_field.question
      assert rel == form_link.rel
      assert href == form_link.href
    end
  end

end
