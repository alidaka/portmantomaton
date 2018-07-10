# portmantomaton

## Run
Tests: `rake`

Work in progress: `ruby simple.rb`

## Development notes
I think all vowel phones start with vowels, and Y is a consonant sound. Maybe we can depend on that for syllables?

Words like "bracket"/"yttrium" currently don't work since the first syllable of "yttrium" is only the vowel sound :(

## TODO
* First/last syllable rather than stress? Missing consonant sounds :(
* How to reconstruct a word? (Phones -> spelling)
* Given two words, do they smash together well?
* CMU dict seems to have multiple pronounciations for words, like `ARE  AA1 R`/`ARE(1)  ER0`
