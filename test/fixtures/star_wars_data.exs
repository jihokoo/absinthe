defmodule Fixtures.StarWarsData do

  @luke %{
    id: "1000",
    name: "Luke Skywalker",
    friends: ["1002", "1003", "2000", "2001"],
    appearsIn: [4, 5, 6],
    homePlanet: "Tatooine"
  }
  @vader %{
    id: "1001",
    name: "Darth Vader",
    friends: ["1004"],
    appearsIn: [4, 5, 6],
    homePlanet: "Tatooine"
  }
  @han %{
    id: "1002",
    name: "Han Solo",
    friends: ["1000", "1003", "2001"],
    appearsIn: [4, 5, 6]
  }
  @leia %{
    id: "1003",
    name: "Leia Organa",
    friends: ["1000", "1002", "2000", "2001"],
    appearsIn: [4, 5, 6],
    homePlanet: "Alderaan"
  }
  @tarkin %{
    id: "1004",
    name: "Wilhuff Tarkin",
    friends: ["1001"],
    appearsIn: [4]
  }

  @humanData %{
    1000 => @luke,
    1001 => @vader,
    1002 => @han,
    1003 => @leia,
    1004 => @tarkin
  }

  @threepio %{
    id: "2000",
    name: "C-3PO",
    friends: ["1000", "1002", "1003", "2001"],
    appearsIn: [4, 5, 6],
    primaryFunction: "Protocol",
  }

  @artoo %{
    id: "2001",
    name: "R2-D2",
    friends: ["1000", "1002", "1003"],
    appearsIn: [4, 5, 6],
    primaryFunction: "Astromech",
  }

  @droidData %{
    2000 => @threepio,
    2001 => @artoo,
  }

  # Helper function to get a character by ID.
  def getCharacter(id), do: @humanData[id] || @droidData[id]

  # Allows us to query for a character"s friends.
  def getFriends(character) do
    character.friends
    |> Enum.map &getCharacter/1
  end

  # Allows us to fetch the undisputed hero of the Star Wars trilogy, R2-D2.
  def getHero(episode) do
    if (episode === 5) do
      # Luke is the hero of Episode V.
      @luke
    else
      # Artoo is the hero otherwise.
      @artoo
    end
  end

  # Allows us to query for the human with the given id.
  def getHuman(id), do: @humanData[id]

  # Allows us to query for the droid with the given id.
  def getDroid(id), do: @droidData[id]

end
