
account
=======

[Wordnik.account.get_authenticate(username)](http://developer.wordnik.com/docs/#!/account/get_authenticate)
    :password*                       The user's password

[Wordnik.account.get_api_token_status()](http://developer.wordnik.com/docs/#!/account/get_api_token_status)
    :api_key*                        Wordnik authentication token

[Wordnik.account.post_authenticate(username)](http://developer.wordnik.com/docs/#!/account/post_authenticate)
    :body*                           The user's password

[Wordnik.account.get_user()](http://developer.wordnik.com/docs/#!/account/get_user)
    :api_key*                        API Key
    :auth_token*                     The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above)

[Wordnik.account.get_word_lists()](http://developer.wordnik.com/docs/#!/account/get_word_lists)
    :api_key*                        API Key
    :auth_token*                     auth_token of logged-in user
    :skip                            Results to skip
    :limit                           Maximum number of results to return


word
====

[Wordnik.word.get(word)](http://developer.wordnik.com/docs/#!/word/get)
    :use_canonical                   If true will try to return the correct word root ('cats' -> 'cat'). If false returns exactly what was requested.
    :include_suggestions             Return suggestions (for correct spelling, case variants, etc.)

[Wordnik.word.get_examples(word)](http://developer.wordnik.com/docs/#!/word/get_examples)
    :limit                           Maximum number of results to return
    :include_duplicates              Show duplicate examples from different sources
    :content_provider                Return results from a specific ContentProvider
    :use_canonical                   If true will try to return the correct word root ('cats' -> 'cat'). If false returns exactly what was requested.
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.word.get_definitions(word)](http://developer.wordnik.com/docs/#!/word/get_definitions)
    :limit                           Maximum number of results to return
    :part_of_speech                  CSV list of part-of-speech types
    :include_related                 Return related words with definitions
    :source_dictionaries             Gets from dictionaries in the supplied order of precedence
    :use_canonical                   If true will try to return the correct word root ('cats' -> 'cat'). If false returns exactly what was requested.
    :include_tags                    Return a closed set of XML tags in response

[Wordnik.word.get_frequency(word)](http://developer.wordnik.com/docs/#!/word/get_frequency)
    :use_canonical                   If true will try to return the correct word root ('cats' -> 'cat'). If false returns exactly what was requested.
    :start_year                      Starting Year
    :end_year                        Ending Year

[Wordnik.word.get_top_example(word)](http://developer.wordnik.com/docs/#!/word/get_top_example)
    :content_provider                Return results from a specific ContentProvider
    :use_canonical                   If true will try to return the correct word root ('cats' -> 'cat'). If false returns exactly what was requested.

[Wordnik.word.get_related(word)](http://developer.wordnik.com/docs/#!/word/get_related)
    :part_of_speech                  CSV list of part-of-speech types
    :source_dictionary               Get data from a single dictionary. Valid options are ahd, century, wiktionary, webster, and wordnet.
    :limit                           Maximum number of results to return
    :use_canonical                   If true will try to return the correct word root ('cats' -> 'cat'). If false returns exactly what was requested.
    :type                            Relationship type

[Wordnik.word.get_phrases(word)](http://developer.wordnik.com/docs/#!/word/get_phrases)
    :limit                           Maximum number of results to return
    :wlmi                            Minimum WLMI for the phrase
    :use_canonical                   If true will try to return the correct word root ('cats' -> 'cat'). If false returns exactly what was requested.

[Wordnik.word.get_hyphenation(word)](http://developer.wordnik.com/docs/#!/word/get_hyphenation)
    :use_canonical                   If true will try to return a correct word root ('cats' -> 'cat'). If false returns exactly what was requested.
    :source_dictionary               Get from a single dictionary. Valid options: ahd, century, wiktionary, webster, and wordnet.
    :limit                           Maximum number of results to return

[Wordnik.word.get_pronunciations(word)](http://developer.wordnik.com/docs/#!/word/get_pronunciations)
    :use_canonical                   If true will try to return a correct word root ('cats' -> 'cat'). If false returns exactly what was requested.
    :source_dictionary               Get from a single dictionary.
    :type_format                     Text pronunciation type
    :limit                           Maximum number of results to return

[Wordnik.word.get_audio(word)](http://developer.wordnik.com/docs/#!/word/get_audio)
    :use_canonical                   Use the canonical form of the word.
    :limit                           Maximum number of results to return


words
=====

[Wordnik.words.get_random_word()](http://developer.wordnik.com/docs/#!/words/get_random_word)
    :has_dictionary_def              Only return words with dictionary definitions
    :include_part_of_speech          CSV part-of-speech values to include
    :exclude_part_of_speech          CSV part-of-speech values to exclude
    :min_corpus_count                Minimum corpus frequency for terms
    :max_corpus_count                Maximum corpus frequency for terms
    :min_dictionary_count            Minimum dictionary count
    :max_dictionary_count            Maximum dictionary count
    :min_length                      Minimum word length
    :max_length                      Maximum word length

[Wordnik.words.get_random()](http://developer.wordnik.com/docs/#!/words/get_random)
    :has_dictionary_def              Only return words with dictionary definitions
    :include_part_of_speech          CSV part-of-speech values to include
    :exclude_part_of_speech          CSV part-of-speech values to exclude
    :min_corpus_count                Minimum corpus frequency for terms (integer)
    :max_corpus_count                Maximum corpus frequency for terms (integer)
    :min_dictionary_count            Minimum dictionary count (integer)
    :max_dictionary_count            Maximum dictionary count (integer)
    :min_length                      Minimum word length (characters)
    :max_length                      Maximum word length (characters)
    :sort_by                         Attribute to sort by
    :sort_order                      Sort direction
    :limit                           Maximum number of results to return (integer)

[Wordnik.words.get_search()](http://developer.wordnik.com/docs/#!/words/get_search)
    :query*                          Search term
    :case_sensitive                  Search case sensitive
    :include_part_of_speech          Only include these comma-delimited parts of speech
    :exclude_part_of_speech          Exclude these comma-delimited parts of speech
    :min_corpus_count                Minimum corpus frequency for terms
    :max_corpus_count                Maximum corpus frequency for terms
    :min_dictionary_count            Minimum number of dictionary entries
    :max_dictionary_count            Maximum dictionary count
    :min_length                      Minimum word length
    :max_length                      Maximum word length
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.words.get_word_of_the_day()](http://developer.wordnik.com/docs/#!/words/get_word_of_the_day)
    :date                            Fetches by date in yyyy-MM-dd
    :category                        Filters response by category
    :creator                         Filters response by username

[Wordnik.words.get_search(query)](http://developer.wordnik.com/docs/#!/words/get_search)
    :case_sensitive                  Search case sensitive
    :include_part_of_speech          Only include these comma-delimited parts of speech
    :exclude_part_of_speech          Exclude these comma-delimited parts of speech
    :min_corpus_count                Minimum corpus frequency for terms
    :max_corpus_count                Maximum corpus frequency for terms
    :min_dictionary_count            Minimum number of dictionary entries
    :max_dictionary_count            Maximum dictionary count
    :min_length                      Minimum word length
    :max_length                      Maximum word length
    :skip                            Results to skip
    :limit                           Maximum number of results to return


word_list
=========

[Wordnik.word_list.get(wordListId)](http://developer.wordnik.com/docs/#!/word_list/get)

[Wordnik.word_list.post_delete_words(wordListId)](http://developer.wordnik.com/docs/#!/word_list/post_delete_words)
    :body                            Words to remove from WordList

[Wordnik.word_list.get_words(wordListId)](http://developer.wordnik.com/docs/#!/word_list/get_words)
    :sort_by                         Field to sort by
    :sort_order                      Direction to sort
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.word_list.post_words(wordListId)](http://developer.wordnik.com/docs/#!/word_list/post_words)
    :body                            Words to add to WordList

[Wordnik.word_list.put(wordListId)](http://developer.wordnik.com/docs/#!/word_list/put)
    :body                            Updated WordList

[Wordnik.word_list.delete(wordListId)](http://developer.wordnik.com/docs/#!/word_list/delete)


word_lists
==========

[Wordnik.word_lists.post()](http://developer.wordnik.com/docs/#!/word_lists/post)
    :body                            WordList to create

[Wordnik.word_lists.get()](http://developer.wordnik.com/docs/#!/word_lists/get)

