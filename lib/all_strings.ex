defmodule AllStrings do
  @moduledoc """
  Documentation for `AllStrings`.
  """

  @doc """
  Get the first letter of a string

  iex> AllStrings.first_letter("Frankline")
  "F"
  """
  def first_letter(value) do
    String.trim(value)
    |> String.first()
  end

  @doc """
  Get the initials of a string
  iex> AllStrings.initial("Franline ")
  "F. "
  """
  def initial(value) do
    "#{first_letter(value) |> String.capitalize()}. "
  end

  @doc """
  Get the initials of a full name

  iex> AllStrings.initials("Frankline Apiyo")
  "F. A."
  iex> AllStrings.initials("Elon Musk")
  "E. M."
  iex> AllStrings.initials("Mr. Bean")
  "M. B."
  """
  def initials(full_name) do
    list = String.split(full_name)
    # Enum.map(list, &initial/1)
    Enum.map(list, fn name ->
      # internal function
      initial(name)
    end)
    |> List.to_string()
    |> String.trim()
  end

  @doc """
  Build a saucer
  """
  def build_saucer() do
    """

                        %%%%%%%%%%%%%%%%%%%%
                   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
      ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ************************************************************
        ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
           ,,,&&&,,,,,,&&&,,,,,,&&&,,,,,,&&&,,,,,,&&&,,,
                ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

    """
  end

  def display_saucer() do
    IO.puts(build_saucer())
  end

  @doc """
  Customize a spacecraft with custom plates

  iex> AllStrings.customize_spacecraft("Frankline Apiyo")
  "\\n                    %%%%%%%%%%%%%%%%%%%%\\n               %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\\n            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\\n      ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,\\n  ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,\\n****************** F. A.'s  SPACECRAFT *********************\\n    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,\\n       ,,,&&&,,,,,,&&&,,,,,,&&&,,,,,,&&&,,,,,,&&&,,,\\n            ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,\\n\\n"
  """
  def customize_spacecraft(full_name) do
    initials = initials(full_name)
    middle_layer = "************************************************************"
    space_plates = " #{initials}'s  SPACECRAFT "
    middle_layer_difference = String.length(middle_layer) - String.length(space_plates)

    build_saucer()
    |> String.replace(
      middle_layer,
      space_plates
      |> String.pad_leading(middle_layer_difference, middle_layer)
      |> String.pad_trailing(String.length(middle_layer), middle_layer)
    )
  end

  @doc """
  Display a spacecraft with custom plates

  iex> AllStrings.display_customized_spacecraft("Frankline Apiyo")

                      %%%%%%%%%%%%%%%%%%%%
                 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
              %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
  ****************** F. A.'s  SPACECRAFT *********************
      ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
         ,,,&&&,,,,,,&&&,,,,,,&&&,,,,,,&&&,,,,,,&&&,,,
              ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,


  :ok
  """
  def display_customized_spacecraft(full_name) do
    IO.puts(customize_spacecraft(full_name))
  end
end
