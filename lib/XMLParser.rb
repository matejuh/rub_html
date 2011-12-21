#!/usr/bin/env ruby
#
# HtmlParserParser.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: HtmlParserParser.g
# Generated at: 2011-12-17 21:12:04
# 

# ~~~> start load path setup
this_directory = File.expand_path( File.dirname( __FILE__ ) )
$LOAD_PATH.unshift( this_directory ) unless $LOAD_PATH.include?( this_directory )

antlr_load_failed = proc do
  load_path = $LOAD_PATH.map { |dir| '  - ' << dir }.join( $/ )
  raise LoadError, <<-END.strip!
  
Failed to load the ANTLR3 runtime library (version 1.8.11):

Ensure the library has been installed on your system and is available
on the load path. If rubygems is available on your system, this can
be done with the command:
  
  gem install antlr3

Current load path:
#{ load_path }

  END
end

defined?( ANTLR3 ) or begin
  
  # 1: try to load the ruby antlr3 runtime library from the system path
  require 'antlr3'
  
rescue LoadError
  
  # 2: try to load rubygems if it isn't already loaded
  defined?( Gem ) or begin
    require 'rubygems'
  rescue LoadError
    antlr_load_failed.call
  end
  
  # 3: try to activate the antlr3 gem
  begin
    Gem.activate( 'antlr3', '~> 1.8.11' )
  rescue Gem::LoadError
    antlr_load_failed.call
  end
  
  require 'antlr3'
  
end
# <~~~ end load path setup


module XMLParser
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all 
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :PCDATA => 15, :CLOSING_TAG => 13, :END_TAG => 14, :NAME => 11, 
                   :WS => 16, :LETTER => 9, :HEAD => 5, :BODY => 7, :HTML => 4, 
                   :DIGIT => 10, :ID => 8, :EOF => -1, :OPENING_TAG => 12, 
                   :TITLE => 6 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "HTML", "HEAD", "TITLE", "BODY", "ID", "LETTER", "DIGIT", 
                    "NAME", "OPENING_TAG", "CLOSING_TAG", "END_TAG", "PCDATA", 
                    "WS" )
    
  end


  class Parser < ANTLR3::Parser
    @grammar_home = XMLParser

    RULE_METHODS = [ :document, :head, :head_element, :title, :body ].freeze


    include TokenData

    begin
      generated_using( "HtmlParserParser.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end

    def initialize( input, options = {} )
      super( input, options )


    end
    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -

    # 
    # parser rule document
    # 
    # (in HtmlParserParser.g)
    # 5:1: document : OPENING_TAG HTML END_TAG ( head )? ( body )? CLOSING_TAG HTML END_TAG ;
    # 
    def document
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )

      begin
        # at line 6:5: OPENING_TAG HTML END_TAG ( head )? ( body )? CLOSING_TAG HTML END_TAG
        match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_document_27 )
        match( HTML, TOKENS_FOLLOWING_HTML_IN_document_29 )
        match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_document_31 )
        # at line 7:3: ( head )?
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0 == OPENING_TAG )
          look_1_1 = @input.peek( 2 )

          if ( look_1_1 == HEAD )
            alt_1 = 1
          end
        end
        case alt_1
        when 1
          # at line 7:4: head
          @state.following.push( TOKENS_FOLLOWING_head_IN_document_36 )
          head
          @state.following.pop

        end
        # at line 8:3: ( body )?
        alt_2 = 2
        look_2_0 = @input.peek( 1 )

        if ( look_2_0 == OPENING_TAG )
          alt_2 = 1
        end
        case alt_2
        when 1
          # at line 8:4: body
          @state.following.push( TOKENS_FOLLOWING_body_IN_document_43 )
          body
          @state.following.pop

        end
        match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_document_49 )
        match( HTML, TOKENS_FOLLOWING_HTML_IN_document_51 )
        match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_document_53 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 1 )

      end
      
      return 
    end


    # 
    # parser rule head
    # 
    # (in HtmlParserParser.g)
    # 12:1: head : OPENING_TAG HEAD END_TAG ( head_element )? CLOSING_TAG HEAD END_TAG ;
    # 
    def head
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )

      begin
        # at line 12:8: OPENING_TAG HEAD END_TAG ( head_element )? CLOSING_TAG HEAD END_TAG
        match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_head_63 )
        match( HEAD, TOKENS_FOLLOWING_HEAD_IN_head_65 )
        match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_head_67 )
        # at line 13:3: ( head_element )?
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0 == OPENING_TAG )
          alt_3 = 1
        end
        case alt_3
        when 1
          # at line 13:4: head_element
          @state.following.push( TOKENS_FOLLOWING_head_element_IN_head_72 )
          head_element
          @state.following.pop

        end
        match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_head_78 )
        match( HEAD, TOKENS_FOLLOWING_HEAD_IN_head_80 )
        match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_head_82 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 2 )

      end
      
      return 
    end


    # 
    # parser rule head_element
    # 
    # (in HtmlParserParser.g)
    # 17:1: head_element : title ;
    # 
    def head_element
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )

      begin
        # at line 18:4: title
        @state.following.push( TOKENS_FOLLOWING_title_IN_head_element_93 )
        title
        @state.following.pop

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 3 )

      end
      
      return 
    end


    # 
    # parser rule title
    # 
    # (in HtmlParserParser.g)
    # 21:1: title : OPENING_TAG TITLE END_TAG ( PCDATA )? CLOSING_TAG TITLE END_TAG ;
    # 
    def title
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )

      begin
        # at line 22:4: OPENING_TAG TITLE END_TAG ( PCDATA )? CLOSING_TAG TITLE END_TAG
        match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_title_106 )
        match( TITLE, TOKENS_FOLLOWING_TITLE_IN_title_108 )
        match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_title_110 )
        # at line 23:3: ( PCDATA )?
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0 == PCDATA )
          alt_4 = 1
        end
        case alt_4
        when 1
          # at line 23:3: PCDATA
          match( PCDATA, TOKENS_FOLLOWING_PCDATA_IN_title_114 )

        end
        match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_title_119 )
        match( TITLE, TOKENS_FOLLOWING_TITLE_IN_title_121 )
        match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_title_123 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 4 )

      end
      
      return 
    end


    # 
    # parser rule body
    # 
    # (in HtmlParserParser.g)
    # 27:1: body : OPENING_TAG name= BODY ( WS ID )? END_TAG ;
    # 
    def body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )
      name = nil

      begin
        # at line 27:7: OPENING_TAG name= BODY ( WS ID )? END_TAG
        match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_body_132 )
        name = match( BODY, TOKENS_FOLLOWING_BODY_IN_body_136 )
        # at line 27:29: ( WS ID )?
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0 == WS )
          alt_5 = 1
        end
        case alt_5
        when 1
          # at line 27:30: WS ID
          match( WS, TOKENS_FOLLOWING_WS_IN_body_139 )
          match( ID, TOKENS_FOLLOWING_ID_IN_body_141 )

        end
        match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_body_145 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 5 )

      end
      
      return 
    end



    TOKENS_FOLLOWING_OPENING_TAG_IN_document_27 = Set[ 4 ]
    TOKENS_FOLLOWING_HTML_IN_document_29 = Set[ 14 ]
    TOKENS_FOLLOWING_END_TAG_IN_document_31 = Set[ 12, 13 ]
    TOKENS_FOLLOWING_head_IN_document_36 = Set[ 12, 13 ]
    TOKENS_FOLLOWING_body_IN_document_43 = Set[ 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_document_49 = Set[ 4 ]
    TOKENS_FOLLOWING_HTML_IN_document_51 = Set[ 14 ]
    TOKENS_FOLLOWING_END_TAG_IN_document_53 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_head_63 = Set[ 5 ]
    TOKENS_FOLLOWING_HEAD_IN_head_65 = Set[ 14 ]
    TOKENS_FOLLOWING_END_TAG_IN_head_67 = Set[ 12, 13 ]
    TOKENS_FOLLOWING_head_element_IN_head_72 = Set[ 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_head_78 = Set[ 5 ]
    TOKENS_FOLLOWING_HEAD_IN_head_80 = Set[ 14 ]
    TOKENS_FOLLOWING_END_TAG_IN_head_82 = Set[ 1 ]
    TOKENS_FOLLOWING_title_IN_head_element_93 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_title_106 = Set[ 6 ]
    TOKENS_FOLLOWING_TITLE_IN_title_108 = Set[ 14 ]
    TOKENS_FOLLOWING_END_TAG_IN_title_110 = Set[ 13, 15 ]
    TOKENS_FOLLOWING_PCDATA_IN_title_114 = Set[ 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_title_119 = Set[ 6 ]
    TOKENS_FOLLOWING_TITLE_IN_title_121 = Set[ 14 ]
    TOKENS_FOLLOWING_END_TAG_IN_title_123 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_body_132 = Set[ 7 ]
    TOKENS_FOLLOWING_BODY_IN_body_136 = Set[ 14, 16 ]
    TOKENS_FOLLOWING_WS_IN_body_139 = Set[ 8 ]
    TOKENS_FOLLOWING_ID_IN_body_141 = Set[ 14 ]
    TOKENS_FOLLOWING_END_TAG_IN_body_145 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

