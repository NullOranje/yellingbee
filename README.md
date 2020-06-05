# YellingBee

**Simple App to Solve NYT's Spelling Bee Puzzles**

## Background

I was struggling when working with Elixir streams, so I made up a quick project to test it out.

The NY Times puzzle [Spelling Bee](https://www.nytimes.com/puzzles/spelling-bee) seemed a good project to 
test out filtering large sets of data.  The rules of the puzzle are simple: given seven input letters (1 
mandatory, 6 optional), find all the words you can at least 4 letters in length.

I used the (words)[https://en.wikipedia.org/wiki/Words_(Unix)] wordlist as my source dictionary, but any 
newline delimited wordlist will work.  There are a lot of proper nouns in this dictionary, so there are 
a lot of false positives.  It doesn't capture every word, but this is a limitation of the dictionary used.
Better dictionaries would yield better results.

## Usage
`YellingBee.solve/2` takes two arguments:

  1. The wordlist,
  2. The valid letters

Letters are provided as a list of individual characters.  The first letter in the list is required.

```elixir
iex(1)> YellingBee.solve("/usr/share/dict/words", ~w(o l b i y t m))
["bilbo", "bimbo", "biol", "blob", "bloom", "bloom", "blot", "blotto", "bobbi",
 "bobbitt", "bobby", "bobby", "boil", "boll", "bolt", "bomb", "boob", "booby",
 "boom", "boot", "booty", "bottom", "byob", "immobility", "lilo", "limbo",
 "limbo", "limo", "lobby", "lobotomy", "loll", "lolly", "loom", "loot", "lott",
 "lotto", "milo", "mobil", "mobility", "moil", "moll", "moll", "molly", "molly",
 "molt", "mommy", "moot", "motility", "mott", "motto", ...]

```

## Installation

Clone this package and start the application in Iex via `mix -S iex`

