
account
=======

[Wordnik.account.authenticate(username)](http://developer.wordnik.com/docs/#!/account/authenticate)
    :password*                       The user's password

[Wordnik.account.get_api_token_status()](http://developer.wordnik.com/docs/#!/account/get_api_token_status)
    :api_key*                        Wordnik authentication token

[Wordnik.account.get_username_available(username)](http://developer.wordnik.com/docs/#!/account/get_username_available)

[Wordnik.account.create_api_account()](http://developer.wordnik.com/docs/#!/account/create_api_account)
    :api_key*                        API Key

[Wordnik.account.authenticate_post(username)](http://developer.wordnik.com/docs/#!/account/authenticate_post)
    :body*                           The user's password

[Wordnik.account.get_logged_in_user()](http://developer.wordnik.com/docs/#!/account/get_logged_in_user)
    :api_key*                        API Key
    :auth_token*                     The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above)

[Wordnik.account.get_word_lists_for_current_user()](http://developer.wordnik.com/docs/#!/account/get_word_lists_for_current_user)
    :api_key*                        API Key
    :auth_token*                     auth_token of logged-in user
    :skip                            Results to skip
    :limit                           Maximum number of results to return


system
======

[Wordnik.system.get_word_by_id()](http://developer.wordnik.com/docs/#!/system/get_word_by_id)
    :term                            Term to query
    :object_type                     Object type
    :exclude_edge_types              Relationships to exclude
    :include_edge_types              Specifies the only relationship to include (note, this overrides the exclusions)
    :start_constraints               Edge start constraints to enforce
    :end_constraints                 Edge end constraints to enforce
    :max_hops                        Maximum number of to route
    :max_results                     Maximum number of routes to return
    :destination                     Destination to route to (VERY inefficient)
    :use_graph_ml                    Return is GraphML format
    :goal                            Selection goal

[Wordnik.system.get_related_words(word)](http://developer.wordnik.com/docs/#!/system/get_related_words)
    :use_literal                     Use exact word

[Wordnik.system.get_related_words(word)](http://developer.wordnik.com/docs/#!/system/get_related_words)
    :limit                           Maximum number of results to return
    :type                            Relationship type


user
====

[Wordnik.user.get_word_of_the_day_by_date(username, date)](http://developer.wordnik.com/docs/#!/user/get_word_of_the_day_by_date)
    :include_all                     Include WordOfTheDay items for future dates (owner-only)

[Wordnik.user.get_word_of_the_day_list(username)](http://developer.wordnik.com/docs/#!/user/get_word_of_the_day_list)
    :include_all                     Include future words (owner-only)

[Wordnik.user.update_word_of_the_day_list(username)](http://developer.wordnik.com/docs/#!/user/update_word_of_the_day_list)
    :body*                           Updated WordOfTheDayList data in the format specified by the URL

[Wordnik.user.create_word_of_the_day_list(username)](http://developer.wordnik.com/docs/#!/user/create_word_of_the_day_list)
    :body*                           WordOfTheDayList to create, provided in the format specified by the URL

[Wordnik.user.update_item_in_word_of_the_day_list(username, permalink)](http://developer.wordnik.com/docs/#!/user/update_item_in_word_of_the_day_list)
    :body*                           WordOfTheDay to add, in the format specified by the URL

[Wordnik.user.update_word_of_the_day_list(username, permalink)](http://developer.wordnik.com/docs/#!/user/update_word_of_the_day_list)

[Wordnik.user.delete_word_from_word_of_the_day_list(username, permalink, wordToDelete)](http://developer.wordnik.com/docs/#!/user/delete_word_from_word_of_the_day_list)

[Wordnik.user.add_word_to_word_of_the_day_list(username, permalink)](http://developer.wordnik.com/docs/#!/user/add_word_to_word_of_the_day_list)
    :body*                           WordOfTheDay to add


word
====

[Wordnik.word.get_word(word)](http://developer.wordnik.com/docs/#!/word/get_word)
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

[Wordnik.word.get_word_frequency(word)](http://developer.wordnik.com/docs/#!/word/get_word_frequency)
    :use_canonical                   If true will try to return the correct word root ('cats' -> 'cat'). If false returns exactly what was requested.
    :start_year                      Starting Year
    :end_year                        Ending Year

[Wordnik.word.get_top_example(word)](http://developer.wordnik.com/docs/#!/word/get_top_example)
    :content_provider                Return results from a specific ContentProvider
    :use_canonical                   If true will try to return the correct word root ('cats' -> 'cat'). If false returns exactly what was requested.

[Wordnik.word.get_related_words(word)](http://developer.wordnik.com/docs/#!/word/get_related_words)
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

[Wordnik.word.get_text_pronunciations(word)](http://developer.wordnik.com/docs/#!/word/get_text_pronunciations)
    :use_canonical                   If true will try to return a correct word root ('cats' -> 'cat'). If false returns exactly what was requested.
    :source_dictionary               Get from a single dictionary.
    :type_format                     Text pronunciation type
    :limit                           Maximum number of results to return

[Wordnik.word.get_word_forms(word)](http://developer.wordnik.com/docs/#!/word/get_word_forms)
    :use_canonical                   If true will try to return a correct word root ('cats' -> 'cat'). If false returns exactly what was requested.

[Wordnik.word.get_audio(word)](http://developer.wordnik.com/docs/#!/word/get_audio)
    :use_canonical                   Use the canonical form of the word.
    :limit                           Maximum number of results to return

[Wordnik.word.contextual_lookup(word)](http://developer.wordnik.com/docs/#!/word/contextual_lookup)
    :sentence*                       The sentence in which the word occurs
    :offset                          The start character offset of the word in the given sentence
    :expand_terms                    Expand context terms using related words
    :include_source_dictionaries     Only include these comma-delimited source dictionaries
    :exclude_source_dictionaries     Exclude these comma-delimited source dictionaries
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.word.contextual_lookup_post(word)](http://developer.wordnik.com/docs/#!/word/contextual_lookup_post)
    :body*                           The sentence in which the word occurs
    :offset                          The start character offset of the word in the given sentence
    :expand_terms                    Expand context terms using related words
    :include_source_dictionaries     Only include these comma-delimited source dictionaries
    :exclude_source_dictionaries     Exclude these comma-delimited source dictionaries
    :skip                            Results to skip
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

[Wordnik.words.get_random_words()](http://developer.wordnik.com/docs/#!/words/get_random_words)
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

[Wordnik.words.search_words()](http://developer.wordnik.com/docs/#!/words/search_words)
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

[Wordnik.words.get_word_of_the_day_lists_containing_word()](http://developer.wordnik.com/docs/#!/words/get_word_of_the_day_lists_containing_word)
    :item_count*                     Lists must have the specified number of items
    :contains_word                   Lists must contain a specific word
    :subscriber_count                Lists must have the specified number of subscribers
    :include_all                     Returns future WordOfTheDay items

[Wordnik.words.get_word_of_the_day_lists_for_date(date)](http://developer.wordnik.com/docs/#!/words/get_word_of_the_day_lists_for_date)
    :include_all                     Returns future WordOfTheDay items

[Wordnik.words.subscribe_to_list(permalink)](http://developer.wordnik.com/docs/#!/words/subscribe_to_list)
    :auth_token*                     auth_token of logged-in user
    :medium                          Medium to subscribe with
    :body                            Username to subscribe

[Wordnik.words.search_definitions()](http://developer.wordnik.com/docs/#!/words/search_definitions)
    :query*                          Search term
    :defined_word_search_term        Defined word search term
    :include_source_dictionaries     Only include these comma-delimited source dictionaries
    :exclude_source_dictionaries     Exclude these comma-delimited source dictionaries
    :include_part_of_speech          Only include these comma-delimited parts of speech
    :exclude_part_of_speech          Exclude these comma-delimited parts of speech
    :min_corpus_count                Minimum corpus frequency for terms
    :max_corpus_count                Maximum corpus frequency for terms
    :min_length                      Minimum word length
    :max_length                      Maximum word length
    :expand_terms                    Expand terms
    :word_types                      Word types
    :include_tags                    Return a closed set of XML tags in response
    :sort_by                         Attribute to sort by
    :sort_order                      Sort direction
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.words.search_entries()](http://developer.wordnik.com/docs/#!/words/search_entries)
    :query*                          Search term
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.words.get_surface_forms()](http://developer.wordnik.com/docs/#!/words/get_surface_forms)
    :term                            Word to get surface forms for.

[Wordnik.words.get_word_of_the_day()](http://developer.wordnik.com/docs/#!/words/get_word_of_the_day)
    :date                            Fetches by date in yyyy-MM-dd
    :category                        Filters response by category
    :creator                         Filters response by username

[Wordnik.words.get_word_of_the_day_range()](http://developer.wordnik.com/docs/#!/words/get_word_of_the_day_range)
    :category                        Filters response by category
    :creator                         Filters response by username
    :provider                        Filters response by ContentProvider
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.words.get_word_of_the_day_list(permalink)](http://developer.wordnik.com/docs/#!/words/get_word_of_the_day_list)
    :include_all                     Returns future WordOfTheDay items

[Wordnik.words.get_word_of_the_day_list_item(permalink, specifier)](http://developer.wordnik.com/docs/#!/words/get_word_of_the_day_list_item)

[Wordnik.words.get_recent_word_of_the_day_lists()](http://developer.wordnik.com/docs/#!/words/get_recent_word_of_the_day_lists)
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.words.get_word_of_the_day_list_subscription_process_status()](http://developer.wordnik.com/docs/#!/words/get_word_of_the_day_list_subscription_process_status)
    :date                            Date string to fetch for.


word_list
=========

[Wordnik.word_list.get_word_list_by_id(wordListId)](http://developer.wordnik.com/docs/#!/word_list/get_word_list_by_id)
    :auth_token*                     The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above)

[Wordnik.word_list.get_word_list_words(wordListId)](http://developer.wordnik.com/docs/#!/word_list/get_word_list_words)
    :auth_token*                     The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above)
    :sort_by                         Field to sort by
    :sort_order                      Direction to sort
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.word_list.add_words_to_word_list(wordListId)](http://developer.wordnik.com/docs/#!/word_list/add_words_to_word_list)
    :auth_token*                     The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above)
    :body                            Words to add to WordList

[Wordnik.word_list.update_word_list(wordListId)](http://developer.wordnik.com/docs/#!/word_list/update_word_list)
    :auth_token*                     The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above)
    :body                            Updated WordList

[Wordnik.word_list.delete_word_list(wordListId)](http://developer.wordnik.com/docs/#!/word_list/delete_word_list)
    :auth_token*                     The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above)

[Wordnik.word_list.delete_words_from_word_list(wordListId)](http://developer.wordnik.com/docs/#!/word_list/delete_words_from_word_list)
    :auth_token*                     The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above)
    :body                            Words to remove from WordList


word_lists
==========

[Wordnik.word_lists.get_help()](http://developer.wordnik.com/docs/#!/word_lists/get_help)

[Wordnik.word_lists.create_word_list()](http://developer.wordnik.com/docs/#!/word_lists/create_word_list)
    :auth_token*                     The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above)
    :body                            WordList to create

