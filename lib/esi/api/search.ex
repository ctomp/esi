defmodule ESI.API.Search do

  @typedoc """
  Options for [`Search.search/1`](#search/1).

  - `:categories` (REQUIRED) -- Type of entities to search for
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  - `:search` (REQUIRED) -- The string to search on
  - `:strict` (DEFAULT: `false`) -- Whether the search should be a strict match
  """
  @type search_opts :: [search_opt]
  @type search_opt :: {:categories, [:agent | :alliance | :character | :constellation | :corporation | :faction | :inventorytype | :region | :solarsystem | :station | :wormhole]} | {:language, nil | :de | :"en-us" | :fr | :ja | :ru | :zh} | {:search, String.t} | {:strict, nil | boolean}


  @doc """
  Search for entities that match a given sub-string..

  ## Response Example

  A list of search results:

      %{"solarsystem" => [30002510],
        "station" => [60004588, 60004594, 60005725, 60009106, 60012721, 60012724,
         60012727]}

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_search`
  - `path` -- `/v1/search/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Search/get_search)

  """
  @spec search(opts :: search_opts) :: ESI.Request.t
  def search(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/v1/search/",
      opts_schema: %{categories: {:query, :required}, datasource: {:query, :optional}, language: {:query, :optional}, search: {:query, :required}, strict: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end
end