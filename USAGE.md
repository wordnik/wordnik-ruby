
account
=======

[Wordnik.account.authenticate(username)](http://developer.wordnik.com/docs/#!/account/authenticate)
    :password*                       The user's password
[Wordnik.account.authenticate_post(username)](http://developer.wordnik.com/docs/#!/account/authenticate_post)
    :body*                           The user's password

[Wordnik.account.logout()](http://developer.wordnik.com/docs/#!/account/logout)
    :auth_token*                     auth_token of logged-in user

[Wordnik.account.get_help()](http://developer.wordnik.com/docs/#!/account/get_help)

[Wordnik.account.get_word_lists_for_current_user()](http://developer.wordnik.com/docs/#!/account/get_word_lists_for_current_user)
    :api_key*                        API Key
    :auth_token*                     auth_token of logged-in user
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.account.get_forgot_password(username)](http://developer.wordnik.com/docs/#!/account/get_forgot_password)

[Wordnik.account.reset_password(hashcode)](http://developer.wordnik.com/docs/#!/account/reset_password)

[Wordnik.account.create_api_account()](http://developer.wordnik.com/docs/#!/account/create_api_account)
    :body*                           API Application Info

[Wordnik.account.create_api_account()](http://developer.wordnik.com/docs/#!/account/create_api_account)
    :api_key*                        API Key

[Wordnik.account.get_api_token_status()](http://developer.wordnik.com/docs/#!/account/get_api_token_status)
    :api_key*                        Wordnik authentication token
    :api_key                         Wordnik authentication token

[Wordnik.account.log_visit_for_user()](http://developer.wordnik.com/docs/#!/account/log_visit_for_user)
    :user_id                         User ID to track data for
    :user_guid                       User's persistent GUID
    :user_session_id                 User's session ID
    :user_ip_address                 User IP address
    :server_ip                       Server IP address

[Wordnik.account.get_activation_code_for_user(username)](http://developer.wordnik.com/docs/#!/account/get_activation_code_for_user)

[Wordnik.account.activate_user()](http://developer.wordnik.com/docs/#!/account/activate_user)
    :body*                           Activation Code

[Wordnik.account.get_username_available(username)](http://developer.wordnik.com/docs/#!/account/get_username_available)

[Wordnik.account.get_logged_in_user()](http://developer.wordnik.com/docs/#!/account/get_logged_in_user)
    :api_key*                        API Key
    :auth_token*                     The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above)

[Wordnik.account.get_logged_in_user_profile()](http://developer.wordnik.com/docs/#!/account/get_logged_in_user_profile)
    :api_key*                        API Key
    :auth_token*                     auth_token of logged-in user

[Wordnik.account.get_logged_in_user_settings()](http://developer.wordnik.com/docs/#!/account/get_logged_in_user_settings)
    :api_key*                        API Key
    :auth_token*                     auth_token of logged-in user

[Wordnik.account.get_logged_in_user_tracking_info()](http://developer.wordnik.com/docs/#!/account/get_logged_in_user_tracking_info)
    :api_key*                        API Key
    :auth_token*                     auth_token of logged-in user


corpus
======

[Wordnik.corpus.get_recent_views()](http://developer.wordnik.com/docs/#!/corpus/get_recent_views)
    :limit                           Limits results
    :human_only                      Returns results only from human visitors
    :sort_by_frequency               Sorts results by frequency

[Wordnik.corpus.get_word_frequencies(statsType, object)](http://developer.wordnik.com/docs/#!/corpus/get_word_frequencies)
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.corpus.get_word_frequencies()](http://developer.wordnik.com/docs/#!/corpus/get_word_frequencies)
    :source_dictionary               Dictionary name to fetch stats for

[Wordnik.corpus.get_word_frequencies()](http://developer.wordnik.com/docs/#!/corpus/get_word_frequencies)
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.corpus.get_help()](http://developer.wordnik.com/docs/#!/corpus/get_help)

[Wordnik.corpus.get_total_document_count()](http://developer.wordnik.com/docs/#!/corpus/get_total_document_count)

[Wordnik.corpus.process_text()](http://developer.wordnik.com/docs/#!/corpus/process_text)
    :body                            Text body to process.
    :split                           Tells the processor to split multiple sentences from the input.  Default is true.
    :rank                            Flag to invoke the ranking logic.  Default is false.

[Wordnik.corpus.get_corpus_word_frequencies()](http://developer.wordnik.com/docs/#!/corpus/get_corpus_word_frequencies)
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.corpus.get_punctuation_factor()](http://developer.wordnik.com/docs/#!/corpus/get_punctuation_factor)

[Wordnik.corpus.get_punctuation_factor()](http://developer.wordnik.com/docs/#!/corpus/get_punctuation_factor)
    :body                            Phrase to store.

[Wordnik.corpus.get_document_stats()](http://developer.wordnik.com/docs/#!/corpus/get_document_stats)
    :document_stats_type             Type of statistics to return
    :id                              ID of statistics type to return.
    :split                           Flag to invoke the ranking logic.  Default is false.

[Wordnik.corpus.get_dym(wordstring)](http://developer.wordnik.com/docs/#!/corpus/get_dym)

[Wordnik.corpus.get_recent_listed_words()](http://developer.wordnik.com/docs/#!/corpus/get_recent_listed_words)
    :limit                           Maximun results to return

[Wordnik.corpus.get_mock_contextual_lookup_info()](http://developer.wordnik.com/docs/#!/corpus/get_mock_contextual_lookup_info)
    :word                            Word of interest
    :context_string                  Sentence word appears in
    :title                           Word of interest
    :metadata_id                     Word of interest
    :partner_id                      Partner Id
    :source_url                      Document source URL
[Wordnik.corpus.get_contextual_lookup_info()](http://developer.wordnik.com/docs/#!/corpus/get_contextual_lookup_info)
    :category                        Filters response by category

[Wordnik.corpus.get_total_tokens_count()](http://developer.wordnik.com/docs/#!/corpus/get_total_tokens_count)

[Wordnik.corpus.get_total_sentences_count()](http://developer.wordnik.com/docs/#!/corpus/get_total_sentences_count)


document
========

[Wordnik.document.get_word_frequencies(document_id)](http://developer.wordnik.com/docs/#!/document/get_word_frequencies)
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.document.get_glossaries(contentProvider)](http://developer.wordnik.com/docs/#!/document/get_glossaries)
    :filter_by_word_score            Filter document model by word scores.
    :min_word_score                  Minimum word score to return.
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.document.get_help()](http://developer.wordnik.com/docs/#!/document/get_help)

[Wordnik.document.get_documents_by_content_provider(provider)](http://developer.wordnik.com/docs/#!/document/get_documents_by_content_provider)
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.document.get_metadata_by_id(id)](http://developer.wordnik.com/docs/#!/document/get_metadata_by_id)

[Wordnik.document.get_model_by_id(id)](http://developer.wordnik.com/docs/#!/document/get_model_by_id)
    :scores                          Return word scores


partners
========

[Wordnik.partners.create_glossary(contentProvider)](http://developer.wordnik.com/docs/#!/partners/create_glossary)
    :body                            Glossary to create
[Wordnik.partners.get_glossaries(contentProvider)](http://developer.wordnik.com/docs/#!/partners/get_glossaries)
    :include_drafts                  Includes unpublished Glossaries
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.partners.get_glossary(contentProvider, permalinkId)](http://developer.wordnik.com/docs/#!/partners/get_glossary)
    :version                         Version to fetch
[Wordnik.partners.update_glossary(contentProvider, permalinkId)](http://developer.wordnik.com/docs/#!/partners/update_glossary)
    :version                         Version to fetch
    :body                            Updated Glossary
[Wordnik.partners.delete_glossary(contentProvider, permalinkId)](http://developer.wordnik.com/docs/#!/partners/delete_glossary)
    :version                         Version to delete

[Wordnik.partners.get_help()](http://developer.wordnik.com/docs/#!/partners/get_help)

[Wordnik.partners.get_glossary_entries(contentProvider, permalinkId)](http://developer.wordnik.com/docs/#!/partners/get_glossary_entries)
    :version                         Specific Glossary version to fetch Entries for
    :starts_with                     Word pattern to fetch with.
    :skip                            Results to skip
    :limit                           Maximum number of results to return
[Wordnik.partners.add_glossary_entry(contentProvider, permalinkId)](http://developer.wordnik.com/docs/#!/partners/add_glossary_entry)
    :version                         Specific Glossary version to fetch Entries for
    :body                            Glossary Entries to add

[Wordnik.partners.publish_glossary(contentProvider, permalinkId)](http://developer.wordnik.com/docs/#!/partners/publish_glossary)
    :version                         Version to publish.

[Wordnik.partners.create_version(contentProvider, permalinkId)](http://developer.wordnik.com/docs/#!/partners/create_version)
    :version                         New version number to assign.

[Wordnik.partners.delete_glossary_entry(contentProvider, permalinkId, word)](http://developer.wordnik.com/docs/#!/partners/delete_glossary_entry)
    :version                         Specific Glossary version to fetch Entries for

[Wordnik.partners.delete_glossary_entries(contentProvider, permalinkId)](http://developer.wordnik.com/docs/#!/partners/delete_glossary_entries)
    :body                            Words to remove.
    :version                         Specific Glossary version to remove Entries from


system
======

[Wordnik.system.get_providers()](http://developer.wordnik.com/docs/#!/system/get_providers)

[Wordnik.system.get_help()](http://developer.wordnik.com/docs/#!/system/get_help)

[Wordnik.system.get_related_words(word)](http://developer.wordnik.com/docs/#!/system/get_related_words)
    :limit                           Maximum number of results to return
    :type                            Relationship type

[Wordnik.system.get_related_words(word)](http://developer.wordnik.com/docs/#!/system/get_related_words)
    :use_literal                     Use exact word

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

[Wordnik.system.get_audio_record_id()](http://developer.wordnik.com/docs/#!/system/get_audio_record_id)

[Wordnik.system.get_stats()](http://developer.wordnik.com/docs/#!/system/get_stats)
    :skip*                           
    :limit*                          
    :delta*                          


tag
===

[Wordnik.tag.get_help()](http://developer.wordnik.com/docs/#!/tag/get_help)

[Wordnik.tag.get_words_tagged(tag)](http://developer.wordnik.com/docs/#!/tag/get_words_tagged)
    :user_name                       Username to restrict results to


user
====

[Wordnik.user.get_word_of_the_day_list(username)](http://developer.wordnik.com/docs/#!/user/get_word_of_the_day_list)
    :include_all                     Include future words (owner-only)
[Wordnik.user.create_word_of_the_day_list(username)](http://developer.wordnik.com/docs/#!/user/create_word_of_the_day_list)
    :body*                           WordOfTheDayList to create, provided in the format specified by the URL
[Wordnik.user.update_word_of_the_day_list(username)](http://developer.wordnik.com/docs/#!/user/update_word_of_the_day_list)
    :body*                           Updated WordOfTheDayList data in the format specified by the URL

[Wordnik.user.update_word_of_the_day_list(username, permalink)](http://developer.wordnik.com/docs/#!/user/update_word_of_the_day_list)
[Wordnik.user.update_item_in_word_of_the_day_list(username, permalink)](http://developer.wordnik.com/docs/#!/user/update_item_in_word_of_the_day_list)
    :body*                           WordOfTheDay to add, in the format specified by the URL

[Wordnik.user.get_user_profile(username)](http://developer.wordnik.com/docs/#!/user/get_user_profile)
[Wordnik.user.update_user_profile(username)](http://developer.wordnik.com/docs/#!/user/update_user_profile)
    :body                            Updated UserProfile.

[Wordnik.user.get_user_tracking_info(username)](http://developer.wordnik.com/docs/#!/user/get_user_tracking_info)

[Wordnik.user.update_user(username)](http://developer.wordnik.com/docs/#!/user/update_user)
    :body                            Updated User object.
[Wordnik.user.get_user(username)](http://developer.wordnik.com/docs/#!/user/get_user)
[Wordnik.user.delete_user(username)](http://developer.wordnik.com/docs/#!/user/delete_user)

[Wordnik.user.add_word_to_word_of_the_day_list(username, permalink)](http://developer.wordnik.com/docs/#!/user/add_word_to_word_of_the_day_list)
    :body*                           WordOfTheDay to add

[Wordnik.user.delete_word_from_word_of_the_day_list(username, permalink, wordToDelete)](http://developer.wordnik.com/docs/#!/user/delete_word_from_word_of_the_day_list)

[Wordnik.user.get_word_of_the_day_by_date(username, date)](http://developer.wordnik.com/docs/#!/user/get_word_of_the_day_by_date)
    :include_all                     Include WordOfTheDay items for future dates (owner-only)

[Wordnik.user.get_user_word_lists(username)](http://developer.wordnik.com/docs/#!/user/get_user_word_lists)
    :sort_by*                        
    :sort_order*                     
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.user.get_user_word_list_count(username)](http://developer.wordnik.com/docs/#!/user/get_user_word_list_count)

[Wordnik.user.get_user_settings(username)](http://developer.wordnik.com/docs/#!/user/get_user_settings)
[Wordnik.user.update_user_settings(username)](http://developer.wordnik.com/docs/#!/user/update_user_settings)
    :body                            Updated UserSettings.

[Wordnik.user.get_api_key_for_user(username)](http://developer.wordnik.com/docs/#!/user/get_api_key_for_user)

[Wordnik.user.comment_on_user(username)](http://developer.wordnik.com/docs/#!/user/comment_on_user)
    :body                            Comment to save.
[Wordnik.user.update_comment_on_user(username)](http://developer.wordnik.com/docs/#!/user/update_comment_on_user)
    :body                            Updated Comment.

[Wordnik.user.delete_comment_on_user(username, commentId)](http://developer.wordnik.com/docs/#!/user/delete_comment_on_user)
[Wordnik.user.get_comment_on_user_by_id(username, commentId)](http://developer.wordnik.com/docs/#!/user/get_comment_on_user_by_id)

[Wordnik.user.get_comments_on_user_count(username)](http://developer.wordnik.com/docs/#!/user/get_comments_on_user_count)

[Wordnik.user.get_comments_by_user_count(username)](http://developer.wordnik.com/docs/#!/user/get_comments_by_user_count)

[Wordnik.user.get_comments_by_user(username)](http://developer.wordnik.com/docs/#!/user/get_comments_by_user)
    :skip                            Results to skip
    :limit                           Maximum number of results to return
    :sort_order                      Sort order

[Wordnik.user.get_comments_on_user(username)](http://developer.wordnik.com/docs/#!/user/get_comments_on_user)
    :skip                            Results to skip
    :limit                           Maximum number of results to return
    :sort_order                      Sort order

[Wordnik.user.get_ugc_summary_for_user(username)](http://developer.wordnik.com/docs/#!/user/get_ugc_summary_for_user)
    :skip                            Results to skip
    :limit                           Maximum number of results to return
    :sort_order                      Sort order

[Wordnik.user.get_user_tag_history(user)](http://developer.wordnik.com/docs/#!/user/get_user_tag_history)
    :limit                           Maximum number of results to return

[Wordnik.user.get_user_tags(user)](http://developer.wordnik.com/docs/#!/user/get_user_tags)

[Wordnik.user.get_user_tag_count(user)](http://developer.wordnik.com/docs/#!/user/get_user_tag_count)

[Wordnik.user.get_subscriptions(user)](http://developer.wordnik.com/docs/#!/user/get_subscriptions)

[Wordnik.user.add_subscription(user, objectType, objectIdentifier)](http://developer.wordnik.com/docs/#!/user/add_subscription)
    :medium                          Subscription medium
[Wordnik.user.remove_subscription(user, objectType, objectIdentifier)](http://developer.wordnik.com/docs/#!/user/remove_subscription)
    :medium                          Subscription medium

[Wordnik.user.get_user_favorite_words(user)](http://developer.wordnik.com/docs/#!/user/get_user_favorite_words)

[Wordnik.user.get_user_favorite_count(user)](http://developer.wordnik.com/docs/#!/user/get_user_favorite_count)

[Wordnik.user.get_user_favorite_word_lists(user)](http://developer.wordnik.com/docs/#!/user/get_user_favorite_word_lists)

[Wordnik.user.get_user_favorite_word_lists_count(user)](http://developer.wordnik.com/docs/#!/user/get_user_favorite_word_lists_count)

[Wordnik.user.get_user_search_history(user)](http://developer.wordnik.com/docs/#!/user/get_user_search_history)
    :limit                           Maximum number of results to return
[Wordnik.user.remove_user_search_history_item(user)](http://developer.wordnik.com/docs/#!/user/remove_user_search_history_item)
    :word                            Word to delete

[Wordnik.user.get_user_search_history_count(user)](http://developer.wordnik.com/docs/#!/user/get_user_search_history_count)

[Wordnik.user.get_user_pronunciations(user)](http://developer.wordnik.com/docs/#!/user/get_user_pronunciations)
    :limit                           Maximum number of results to return

[Wordnik.user.get_user_activity_stream(user)](http://developer.wordnik.com/docs/#!/user/get_user_activity_stream)

[Wordnik.user.get_help()](http://developer.wordnik.com/docs/#!/user/get_help)


users
=====

[Wordnik.users.get_recent_pronunciations()](http://developer.wordnik.com/docs/#!/users/get_recent_pronunciations)
    :limit                           Maximum number of results to return

[Wordnik.users.get_help()](http://developer.wordnik.com/docs/#!/users/get_help)
[Wordnik.users.create_user()](http://developer.wordnik.com/docs/#!/users/create_user)
    :signup_ip                       Client IP address
    :password                        Password
    :body                            User to create

[Wordnik.users.get_user_by_id(id)](http://developer.wordnik.com/docs/#!/users/get_user_by_id)

[Wordnik.users.get_by_facebook_id(facebookId)](http://developer.wordnik.com/docs/#!/users/get_by_facebook_id)

[Wordnik.users.get_recent_favorites()](http://developer.wordnik.com/docs/#!/users/get_recent_favorites)
    :limit                           Maximum number of results to return

[Wordnik.users.get_recent_comments()](http://developer.wordnik.com/docs/#!/users/get_recent_comments)
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.users.get_users_who_listed_most_words()](http://developer.wordnik.com/docs/#!/users/get_users_who_listed_most_words)
    :day_interval                    Interval in days to compute from
    :limit                           Maximum number of results to return


word
====

[Wordnik.word.get_entries(word)](http://developer.wordnik.com/docs/#!/word/get_entries)
    :tags                            Return XML tags in response
    :source_dictionary               Get from a single dictionary. Valid options: ahd, century, wiktionary, webster, and wordnet.
    :limit                           Maximum number of results to return
    :etymologies                     Return etymologies

[Wordnik.word.get_examples(word)](http://developer.wordnik.com/docs/#!/word/get_examples)
    :limit                           Maximum number of results to return
    :include_duplicates              Show duplicate examples from different sources
    :content_provider                Return results from a specific ContentProvider
    :use_canonical                   If true will try to return the correct word root ('cats' -> 'cat'). If false returns exactly what was requested.
    :internal_data_store             Specify the internal storage engine.
    :skip                            Results to skip
    :limit                           Maximum number of results to return
[Wordnik.word.get_examples_post(word)](http://developer.wordnik.com/docs/#!/word/get_examples_post)
    :body                            Search definition object
    :internal_data_store             Specify the internal storage engine.

[Wordnik.word.add_word_form(word)](http://developer.wordnik.com/docs/#!/word/add_word_form)
    :body                            RelationshipMapWord to add
    :canonical                       Make this the Canonical form of the word.
[Wordnik.word.get_word_forms(word)](http://developer.wordnik.com/docs/#!/word/get_word_forms)
    :use_canonical                   If true will try to return a correct word root ('cats' -> 'cat'). If false returns exactly what was requested.
[Wordnik.word.delete_word_form(word)](http://developer.wordnik.com/docs/#!/word/delete_word_form)
    :type                            Relationship type to delete
    :word                            Target word to remove relationship from.

[Wordnik.word.get_word(word)](http://developer.wordnik.com/docs/#!/word/get_word)
    :use_canonical                   If true will try to return the correct word root ('cats' -> 'cat'). If false returns exactly what was requested.
    :include_suggestions             Return suggestions (for correct spelling, case variants, etc.)
    :should_create                   Create word if not existing

[Wordnik.word.get_definitions(word)](http://developer.wordnik.com/docs/#!/word/get_definitions)
    :limit                           Maximum number of results to return
    :part_of_speech                  CSV list of part-of-speech types
    :include_related                 Return related words with definitions
    :source_dictionaries             Gets from dictionaries in the supplied order of precedence
    :use_canonical                   If true will try to return the correct word root ('cats' -> 'cat'). If false returns exactly what was requested.
    :include_tags                    Return a closed set of XML tags in response

[Wordnik.word.get_word_stats(word)](http://developer.wordnik.com/docs/#!/word/get_word_stats)
    :use_canonical                   If true will try to return the correct word root ('cats' -> 'cat'). If false returns exactly what was requested.
    :detailed                        Return detailed usage info

[Wordnik.word.get_help()](http://developer.wordnik.com/docs/#!/word/get_help)

[Wordnik.word.get_top_example(word)](http://developer.wordnik.com/docs/#!/word/get_top_example)
    :content_provider                Return results from a specific ContentProvider
    :use_canonical                   If true will try to return the correct word root ('cats' -> 'cat'). If false returns exactly what was requested.
    :internal_data_store             Specify the internal storage engine.

[Wordnik.word.get_punctuation_factor(word)](http://developer.wordnik.com/docs/#!/word/get_punctuation_factor)
    :case_sensitive                  Input is case sensitive
    :use_canonical                   Use the canonical form of the word.

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

[Wordnik.word.get_comment_count(word)](http://developer.wordnik.com/docs/#!/word/get_comment_count)

[Wordnik.word.get_related_words(word)](http://developer.wordnik.com/docs/#!/word/get_related_words)
    :part_of_speech                  CSV list of part-of-speech types
    :source_dictionary               Get data from a single dictionary. Valid options are ahd, century, wiktionary, webster, and wordnet.
    :limit                           Maximum number of results to return
    :use_canonical                   If true will try to return the correct word root ('cats' -> 'cat'). If false returns exactly what was requested.
    :type                            Relationship type

[Wordnik.word.get_listed_in(word)](http://developer.wordnik.com/docs/#!/word/get_listed_in)
    :limit                           Maximum number of results to return

[Wordnik.word.get_listed_in_count(word)](http://developer.wordnik.com/docs/#!/word/get_listed_in_count)

[Wordnik.word.get_first_listed_in(word)](http://developer.wordnik.com/docs/#!/word/get_first_listed_in)

[Wordnik.word.get_first_listed_by(word)](http://developer.wordnik.com/docs/#!/word/get_first_listed_by)

[Wordnik.word.get_text_pronunciations(word)](http://developer.wordnik.com/docs/#!/word/get_text_pronunciations)
    :use_canonical                   If true will try to return a correct word root ('cats' -> 'cat'). If false returns exactly what was requested.
    :source_dictionary               Get from a single dictionary.
    :type_format                     Text pronunciation type
    :limit                           Maximum number of results to return

[Wordnik.word.get_flickr_images(word)](http://developer.wordnik.com/docs/#!/word/get_flickr_images)
    :size                            Image size
    :limit                           Maximum number of results to return

[Wordnik.word.get_scrabble_score(word)](http://developer.wordnik.com/docs/#!/word/get_scrabble_score)

[Wordnik.word.get_citations(word)](http://developer.wordnik.com/docs/#!/word/get_citations)
    :use_canonical                   If true will try to return a correct word root ('cats' -> 'cat'). If false returns exactly what was requested.
    :source_dictionary               Get from a single dictionary. Valid options: ahd, century, wiktionary, webster, and wordnet.
    :limit                           Maximum number of results to return

[Wordnik.word.get_hyphenation(word)](http://developer.wordnik.com/docs/#!/word/get_hyphenation)
    :use_canonical                   If true will try to return a correct word root ('cats' -> 'cat'). If false returns exactly what was requested.
    :source_dictionary               Get from a single dictionary. Valid options: ahd, century, wiktionary, webster, and wordnet.
    :limit                           Maximum number of results to return

[Wordnik.word.get_unigram_count_internal(word)](http://developer.wordnik.com/docs/#!/word/get_unigram_count_internal)

[Wordnik.word.get_bigrams_internal(word)](http://developer.wordnik.com/docs/#!/word/get_bigrams_internal)
    :gamma                           Gamma filter
    :min_wlmi                        WLMI Limit
    :limit                           Maximum number of results to return

[Wordnik.word.get_lookup_count(word)](http://developer.wordnik.com/docs/#!/word/get_lookup_count)

[Wordnik.word.get_tags_on_word(word)](http://developer.wordnik.com/docs/#!/word/get_tags_on_word)
    :use_canonical                   Use the canonical form of the word.
    :username                        Restrict to a particular user

[Wordnik.word.get_tag_count_on_word(word)](http://developer.wordnik.com/docs/#!/word/get_tag_count_on_word)
    :use_canonical                   Use the canonical form of the word.
    :username                        Restrict to a particular user

[Wordnik.word.add_tag_to_word(word)](http://developer.wordnik.com/docs/#!/word/add_tag_to_word)
    :tags                            CSV list of tags to add.
    :username                        Add tag on behalf of a particular user
[Wordnik.word.delete_tag_from_word(word)](http://developer.wordnik.com/docs/#!/word/delete_tag_from_word)
    :tags                            CSV list of tags to remove.
    :username                        Remove tag on behalf of a particular user

[Wordnik.word.get_word_frequency(word)](http://developer.wordnik.com/docs/#!/word/get_word_frequency)
    :case_sensitive                  Input is case sensitive
    :use_canonical                   If true will try to return the correct word root ('cats' -> 'cat'). If false returns exactly what was requested.
    :start_year                      Starting Year
    :end_year                        Ending Year
    :include_error_bars              Get error bar data

[Wordnik.word.get_first_usage_of_word(word)](http://developer.wordnik.com/docs/#!/word/get_first_usage_of_word)
    :use_canonical                   Use the canonical form of the word.
    :detailed                        Return detailed usage info

[Wordnik.word.add_word_view(word)](http://developer.wordnik.com/docs/#!/word/add_word_view)
    :user_id                         ID of the user viewing the word
    :user_guid                       Tracking ID for the user
    :user_session_id                 Session ID for the user
    :server_ip                       Internal IP address of the web server
    :page_name                       Page being viewed
    :method                          Method of the word view
    :user_agent                      Browser user agent

[Wordnik.word.is_favorite(word)](http://developer.wordnik.com/docs/#!/word/is_favorite)
    :use_canonical                   Use the canonical form of the word.
    :user_name                       Check for a particular user

[Wordnik.word.get_favorite_count(word)](http://developer.wordnik.com/docs/#!/word/get_favorite_count)
    :use_canonical                   Use the canonical form of the word.
    :user_name                       Check for a particular user

[Wordnik.word.add_word_to_favorites(word)](http://developer.wordnik.com/docs/#!/word/add_word_to_favorites)
    :user_name                       Add as favorite on behalf of a particular user
[Wordnik.word.delete_from_favorites(word)](http://developer.wordnik.com/docs/#!/word/delete_from_favorites)
    :user_name                       Remove on behalf of a particular user

[Wordnik.word.get_phrases(word)](http://developer.wordnik.com/docs/#!/word/get_phrases)
    :limit                           Maximum number of results to return
    :wlmi                            Minimum WLMI for the phrase
    :use_canonical                   If true will try to return the correct word root ('cats' -> 'cat'). If false returns exactly what was requested.

[Wordnik.word.get_etymologies(word)](http://developer.wordnik.com/docs/#!/word/get_etymologies)
    :source_dictionary               Get etymologies from a single dictionary. Options are ahd or century.
    :use_canonical                   If true will try to return the correct word root ('cats' -> 'cat'). If false returns exactly what was requested.
    :type                            Etymology type

[Wordnik.word.get_other_forms_internal(word)](http://developer.wordnik.com/docs/#!/word/get_other_forms_internal)
    :limit                           Maximum number of results to return
    :min_frequency                   Minimum corpus frequency

[Wordnik.word.add_word_relationship_internal(word)](http://developer.wordnik.com/docs/#!/word/add_word_relationship_internal)
    :body                            Relationship to add

[Wordnik.word.get_comments_on_word(word)](http://developer.wordnik.com/docs/#!/word/get_comments_on_word)
    :sort_order                      Direction to sort by
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.word.delete_comment_on_word(word, commentId)](http://developer.wordnik.com/docs/#!/word/delete_comment_on_word)
[Wordnik.word.delete_comment_by_id_on_word(word, commentId)](http://developer.wordnik.com/docs/#!/word/delete_comment_by_id_on_word)

[Wordnik.word.comment_on_word(word)](http://developer.wordnik.com/docs/#!/word/comment_on_word)
    :body                            Comment to add.
[Wordnik.word.update_comment_on_word(word)](http://developer.wordnik.com/docs/#!/word/update_comment_on_word)
    :body                            Updated Comment.

[Wordnik.word.get_audio(word)](http://developer.wordnik.com/docs/#!/word/get_audio)
    :use_canonical                   Use the canonical form of the word.
    :v3_format                       Use the V3 api.
    :limit                           Maximum number of results to return
[Wordnik.word.add_audio(word)](http://developer.wordnik.com/docs/#!/word/add_audio)
    :body                            AudioPon metadata to add.

[Wordnik.word.delete_audio(word, audio_id)](http://developer.wordnik.com/docs/#!/word/delete_audio)


words
=====

[Wordnik.words.get_word_of_the_day_list(permalink)](http://developer.wordnik.com/docs/#!/words/get_word_of_the_day_list)
    :include_all                     Returns future WordOfTheDay items

[Wordnik.words.get_word_of_the_day()](http://developer.wordnik.com/docs/#!/words/get_word_of_the_day)
    :date                            Fetches by date in yyyy-MM-dd
    :category                        Filters response by category
    :creator                         Filters response by username

[Wordnik.words.get_help()](http://developer.wordnik.com/docs/#!/words/get_help)

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
    :min_lexicality_rating           Minimum lexicality
    :max_lexicality_rating           Maximum lexicality

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
    :return_words_only               Return words only
    :include_tags                    Return a closed set of XML tags in response
    :use_tags_for_ranking            Use user tags, dictionary labels and hypernyms for ranking
    :sort_by                         Attribute to sort by
    :sort_order                      Sort direction
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.words.search_entries()](http://developer.wordnik.com/docs/#!/words/search_entries)
    :query*                          Search term
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.words.search_words()](http://developer.wordnik.com/docs/#!/words/search_words)
    :query*                          Search term
    :allow_regex                     Search term is a Regular Expression
    :case_sensitive                  Search case sensitive
    :include_part_of_speech          Only include these comma-delimited parts of speech
    :exclude_part_of_speech          Exclude these comma-delimited parts of speech
    :min_corpus_count                Minimum corpus frequency for terms
    :max_corpus_count                Maximum corpus frequency for terms
    :min_dictionary_count            Minimum number of dictionary entries
    :max_dictionary_count            Maximum dictionary count
    :min_length                      Minimum word length
    :max_length                      Maximum word length
    :min_lexicality_rating           Minimum lexicality
    :max_lexicality_rating           Maximum lexicality
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.words.get_frequency()](http://developer.wordnik.com/docs/#!/words/get_frequency)

[Wordnik.words.get_surface_forms()](http://developer.wordnik.com/docs/#!/words/get_surface_forms)
    :term                            Word to get surface forms for.

[Wordnik.words.get_word_by_id(id)](http://developer.wordnik.com/docs/#!/words/get_word_by_id)

[Wordnik.words.get_word_of_the_day_range()](http://developer.wordnik.com/docs/#!/words/get_word_of_the_day_range)
    :category                        Filters response by category
    :creator                         Filters response by username
    :provider                        Filters response by ContentProvider
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.words.get_canonical_forms()](http://developer.wordnik.com/docs/#!/words/get_canonical_forms)
    :term                            Word to get canonical forms for.

[Wordnik.words.search_words_new(query)](http://developer.wordnik.com/docs/#!/words/search_words_new)
    :allow_regex                     Search query is a Regular Expression
    :case_sensitive                  Search case sensitive
    :include_part_of_speech          Only include these comma-delimited parts of speech
    :exclude_part_of_speech          Exclude these comma-delimited parts of speech
    :min_corpus_count                Minimum corpus frequency for terms
    :max_corpus_count                Maximum corpus frequency for terms
    :min_dictionary_count            Minimum number of dictionary entries
    :max_dictionary_count            Maximum dictionary count
    :min_length                      Minimum word length
    :max_length                      Maximum word length
    :min_lexicality_rating           Minimum lexicality
    :max_lexicality_rating           Maximum lexicality
    :skip                            Results to skip
    :limit                           Maximum number of results to return

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
    :min_lexicality_rating           Minimum lexicality
    :max_lexicality_rating           Maximum lexicality
    :sort_by                         Attribute to sort by
    :sort_order                      Sort direction
    :limit                           Maximum number of results to return (integer)

[Wordnik.words.get_examples_for_words()](http://developer.wordnik.com/docs/#!/words/get_examples_for_words)
    :body                            Words to fetch examples for
    :limit                           Maximum number of results to return

[Wordnik.words.get_words_most_commented_on()](http://developer.wordnik.com/docs/#!/words/get_words_most_commented_on)
    :day_interval                    Number of days to consider
    :limit                           Maximum number of results to return

[Wordnik.words.get_words_most_commented_on(statsType, object)](http://developer.wordnik.com/docs/#!/words/get_words_most_commented_on)
    :detailed                        Return detailed data
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.words.invite_to_word_of_the_day_list(permalink)](http://developer.wordnik.com/docs/#!/words/invite_to_word_of_the_day_list)
    :body                            Invitation to send

[Wordnik.words.get_recent_word_of_the_day_lists()](http://developer.wordnik.com/docs/#!/words/get_recent_word_of_the_day_lists)
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.words.get_word_of_the_day_list_item(permalink, specifier)](http://developer.wordnik.com/docs/#!/words/get_word_of_the_day_list_item)
    :include_extra_html              Include extra HTML if available

[Wordnik.words.get_word_of_the_day_lists_containing_word()](http://developer.wordnik.com/docs/#!/words/get_word_of_the_day_lists_containing_word)
    :item_count*                     Lists must have the specified number of items
    :contains_word                   Lists must contain a specific word
    :subscriber_count                Lists must have the specified number of subscribers
    :include_all                     Returns future WordOfTheDay items

[Wordnik.words.get_word_of_the_day_list_subscription_process_status()](http://developer.wordnik.com/docs/#!/words/get_word_of_the_day_list_subscription_process_status)
    :date                            Date string to fetch for.

[Wordnik.words.subscribe_to_list(permalink)](http://developer.wordnik.com/docs/#!/words/subscribe_to_list)
    :auth_token*                     auth_token of logged-in user
    :medium                          Medium to subscribe with
    :body                            Username to subscribe

[Wordnik.words.get_word_of_the_day_lists_for_date(date)](http://developer.wordnik.com/docs/#!/words/get_word_of_the_day_lists_for_date)
    :include_all                     Returns future WordOfTheDay items


word_list
=========

[Wordnik.word_list.update_word_list(wordListId)](http://developer.wordnik.com/docs/#!/word_list/update_word_list)
    :auth_token*                     The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above)
    :body                            Updated WordList
[Wordnik.word_list.delete_word_list(wordListId)](http://developer.wordnik.com/docs/#!/word_list/delete_word_list)
    :auth_token*                     The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above)
[Wordnik.word_list.get_word_list_by_id(wordListId)](http://developer.wordnik.com/docs/#!/word_list/get_word_list_by_id)
    :auth_token*                     The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above)

[Wordnik.word_list.add_words_to_word_list(wordListId)](http://developer.wordnik.com/docs/#!/word_list/add_words_to_word_list)
    :auth_token*                     The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above)
    :username                        Username to add words on behalf of
    :body                            Words to add to WordList
[Wordnik.word_list.get_word_list_words(wordListId)](http://developer.wordnik.com/docs/#!/word_list/get_word_list_words)
    :auth_token*                     The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above)
    :sort_by                         Field to sort by
    :sort_order                      Direction to sort
    :skip                            Results to skip
    :limit                           Maximum number of results to return

[Wordnik.word_list.get_help()](http://developer.wordnik.com/docs/#!/word_list/get_help)

[Wordnik.word_list.is_favorite_word_list(wordListId)](http://developer.wordnik.com/docs/#!/word_list/is_favorite_word_list)
    :username                        Username to check for Favorite status

[Wordnik.word_list.favorite_word_list(wordListId)](http://developer.wordnik.com/docs/#!/word_list/favorite_word_list)
    :username                        Username to favorite on behalf of
[Wordnik.word_list.un_favorite_word_list(wordListId)](http://developer.wordnik.com/docs/#!/word_list/un_favorite_word_list)
    :username                        Username to unfavorite on behalf of

[Wordnik.word_list.get_word_list_tags(wordListId)](http://developer.wordnik.com/docs/#!/word_list/get_word_list_tags)
    :username                        Username to get Tags for

[Wordnik.word_list.get_word_list_tag_count(wordListId)](http://developer.wordnik.com/docs/#!/word_list/get_word_list_tag_count)
    :username                        Username to get Tags for

[Wordnik.word_list.add_word_list_tag(wordListId)](http://developer.wordnik.com/docs/#!/word_list/add_word_list_tag)
    :username                        Username to add Tags for
    :tags                            Tags to add
[Wordnik.word_list.delete_word_list_tag(wordListId)](http://developer.wordnik.com/docs/#!/word_list/delete_word_list_tag)
    :username                        Username to delete Tags for
    :tags                            Tags to add

[Wordnik.word_list.get_word_list_comments(wordListId)](http://developer.wordnik.com/docs/#!/word_list/get_word_list_comments)
    :skip                            Results to skip
    :limit                           Maximum number of results to return
    :sort_order                      Direction to sort

[Wordnik.word_list.add_comment_to_word_list(wordListId)](http://developer.wordnik.com/docs/#!/word_list/add_comment_to_word_list)
    :body                            Comment to add
[Wordnik.word_list.update_comment_on_word_list(wordListId)](http://developer.wordnik.com/docs/#!/word_list/update_comment_on_word_list)
    :body                            Updated Comment

[Wordnik.word_list.get_word_list_comment_by_id(wordListId, commentId)](http://developer.wordnik.com/docs/#!/word_list/get_word_list_comment_by_id)
[Wordnik.word_list.delete_word_list_comment_by_id(wordListId, commentId)](http://developer.wordnik.com/docs/#!/word_list/delete_word_list_comment_by_id)

[Wordnik.word_list.get_word_list_comment_count(wordListId)](http://developer.wordnik.com/docs/#!/word_list/get_word_list_comment_count)

[Wordnik.word_list.delete_words_from_word_list(wordListId)](http://developer.wordnik.com/docs/#!/word_list/delete_words_from_word_list)
    :auth_token*                     The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above)
    :username                        Username to remove words on behalf of
    :body                            Words to remove from WordList

[Wordnik.word_list.get_word_list_words_count(wordListId)](http://developer.wordnik.com/docs/#!/word_list/get_word_list_words_count)
    :auth_token*                     The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above)


word_lists
==========

[Wordnik.word_lists.find_by_name(searchString)](http://developer.wordnik.com/docs/#!/word_lists/find_by_name)
    :limit                           Maximum number of results to return

[Wordnik.word_lists.create_word_list()](http://developer.wordnik.com/docs/#!/word_lists/create_word_list)
    :auth_token*                     The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above)
    :body                            WordList to create
[Wordnik.word_lists.get_help()](http://developer.wordnik.com/docs/#!/word_lists/get_help)

[Wordnik.word_lists.find_most_commented_on()](http://developer.wordnik.com/docs/#!/word_lists/find_most_commented_on)
    :day_interval                    Results to skip
    :limit                           Maximum number of results to return

[Wordnik.word_lists.find_recent_lists()](http://developer.wordnik.com/docs/#!/word_lists/find_recent_lists)
    :skip                            Results to skip
    :limit                           Maximum number of results to return
    :type                            WordListType to filter by

