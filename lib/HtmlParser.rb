#!/usr/bin/env ruby
#
# HtmlParser.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: HtmlParser.g
# Generated at: 2011-12-17 21:30:03
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


module HtmlParser
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all 
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :END_TAG => 6, :LETTER => 18, :HEAD => 11, :HTML => 5, 
                   :ID => 17, :EOF => -1, :PCDATA => 14, :CLOSING_TAG => 9, 
                   :NAME => 20, :WS => 16, :TITLE_ELEM => 12, :BODY_ELEM => 8, 
                   :DOCUMENT => 10, :BODY => 15, :DIGIT => 19, :HEAD_ELEM => 7, 
                   :OPENING_TAG => 4, :TITLE => 13 )
    
  end


  class Lexer < ANTLR3::Lexer
    @grammar_home = HtmlParser
    include TokenData

    
    begin
      generated_using( "HtmlParser.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end
    
    RULE_NAMES   = [ "DOCUMENT", "HEAD_ELEM", "TITLE_ELEM", "BODY_ELEM", 
                     "HTML", "HEAD", "TITLE", "BODY", "ID", "NAME", "OPENING_TAG", 
                     "CLOSING_TAG", "END_TAG", "DIGIT", "LETTER", "WS", 
                     "PCDATA" ].freeze
    RULE_METHODS = [ :document!, :head_elem!, :title_elem!, :body_elem!, 
                     :html!, :head!, :title!, :body!, :id!, :name!, :opening_tag!, 
                     :closing_tag!, :end_tag!, :digit!, :letter!, :ws!, 
                     :pcdata! ].freeze

    
    def initialize( input=nil, options = {} )
      super( input, options )

    end
    
    # - - - - - - begin action @lexer::members - - - - - -
    # HtmlParser.g



    # - - - - - - end action @lexer::members - - - - - - -

    
    # - - - - - - - - - - - lexer rules - - - - - - - - - - - -
    # lexer rule document! (DOCUMENT)
    # (in HtmlParser.g)
    def document!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )

      type = DOCUMENT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 8:5: OPENING_TAG HTML END_TAG ( HEAD_ELEM )? ( BODY_ELEM )? CLOSING_TAG HTML END_TAG
      opening_tag!
      html!
      end_tag!
      # at line 9:3: ( HEAD_ELEM )?
      alt_1 = 2
      look_1_0 = @input.peek( 1 )

      if ( look_1_0 == 0x3c )
        look_1_1 = @input.peek( 2 )

        if ( look_1_1 == 0x68 )
          alt_1 = 1
        end
      end
      case alt_1
      when 1
        # at line 9:4: HEAD_ELEM
        head_elem!

      end
      # at line 10:3: ( BODY_ELEM )?
      alt_2 = 2
      look_2_0 = @input.peek( 1 )

      if ( look_2_0 == 0x3c )
        look_2_1 = @input.peek( 2 )

        if ( look_2_1 == 0x62 )
          alt_2 = 1
        end
      end
      case alt_2
      when 1
        # at line 10:4: BODY_ELEM
        body_elem!

      end
      closing_tag!
      html!
      end_tag!

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 1 )

    end

    # lexer rule head_elem! (HEAD_ELEM)
    # (in HtmlParser.g)
    def head_elem!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )

      
      # - - - - main rule block - - - -
      # at line 15:13: OPENING_TAG HEAD END_TAG ( TITLE_ELEM )? CLOSING_TAG HEAD END_TAG
      opening_tag!
      head!
      end_tag!
      # at line 16:3: ( TITLE_ELEM )?
      alt_3 = 2
      look_3_0 = @input.peek( 1 )

      if ( look_3_0 == 0x3c )
        look_3_1 = @input.peek( 2 )

        if ( look_3_1 == 0x74 )
          alt_3 = 1
        end
      end
      case alt_3
      when 1
        # at line 16:4: TITLE_ELEM
        title_elem!

      end
      closing_tag!
      head!
      end_tag!

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 2 )

    end

    # lexer rule title_elem! (TITLE_ELEM)
    # (in HtmlParser.g)
    def title_elem!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )

      
      # - - - - main rule block - - - -
      # at line 26:4: OPENING_TAG TITLE END_TAG PCDATA CLOSING_TAG TITLE END_TAG
      opening_tag!
      title!
      end_tag!
      pcdata!
      closing_tag!
      title!
      end_tag!

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 3 )

    end

    # lexer rule body_elem! (BODY_ELEM)
    # (in HtmlParser.g)
    def body_elem!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )

      
      # - - - - main rule block - - - -
      # at line 32:12: OPENING_TAG BODY ( WS ID )? END_TAG
      opening_tag!
      body!
      # at line 32:29: ( WS ID )?
      alt_4 = 2
      look_4_0 = @input.peek( 1 )

      if ( look_4_0.between?( 0x9, 0xa ) || look_4_0.between?( 0xc, 0xd ) || look_4_0 == 0x20 || look_4_0 == 0x69 )
        alt_4 = 1
      end
      case alt_4
      when 1
        # at line 32:30: WS ID
        ws!
        id!

      end
      end_tag!

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 4 )

    end

    # lexer rule html! (HTML)
    # (in HtmlParser.g)
    def html!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )

      
      # - - - - main rule block - - - -
      # at line 36:7: 'html'
      match( "html" )

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 5 )

    end

    # lexer rule head! (HEAD)
    # (in HtmlParser.g)
    def head!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )

      
      # - - - - main rule block - - - -
      # at line 39:7: 'head'
      match( "head" )

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 6 )

    end

    # lexer rule title! (TITLE)
    # (in HtmlParser.g)
    def title!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )

      
      # - - - - main rule block - - - -
      # at line 42:8: 'title'
      match( "title" )

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 7 )

    end

    # lexer rule body! (BODY)
    # (in HtmlParser.g)
    def body!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )

      
      # - - - - main rule block - - - -
      # at line 45:7: 'body'
      match( "body" )

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 8 )

    end

    # lexer rule id! (ID)
    # (in HtmlParser.g)
    def id!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )

      
      # - - - - main rule block - - - -
      # at line 48:5: 'id'
      match( "id" )

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 9 )

    end

    # lexer rule name! (NAME)
    # (in HtmlParser.g)
    def name!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )

      
      # - - - - main rule block - - - -
      # at line 
      if @input.peek( 1 ).between?( 0x2d, 0x2e ) || @input.peek( 1 ).between?( 0x30, 0x3a ) || @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek(1) == 0x5f || @input.peek( 1 ).between?( 0x61, 0x7a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end



    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 10 )

    end

    # lexer rule opening_tag! (OPENING_TAG)
    # (in HtmlParser.g)
    def opening_tag!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )

      
      # - - - - main rule block - - - -
      # at line 54:14: '<'
      match( 0x3c )

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 11 )

    end

    # lexer rule closing_tag! (CLOSING_TAG)
    # (in HtmlParser.g)
    def closing_tag!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )

      
      # - - - - main rule block - - - -
      # at line 57:14: '</'
      match( "</" )

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 12 )

    end

    # lexer rule end_tag! (END_TAG)
    # (in HtmlParser.g)
    def end_tag!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )

      
      # - - - - main rule block - - - -
      # at line 60:10: '>'
      match( 0x3e )

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 13 )

    end

    # lexer rule digit! (DIGIT)
    # (in HtmlParser.g)
    def digit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )

      
      # - - - - main rule block - - - -
      # at line 67:10: '0' .. '9'
      match_range( 0x30, 0x39 )

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 14 )

    end

    # lexer rule letter! (LETTER)
    # (in HtmlParser.g)
    def letter!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )

      
      # - - - - main rule block - - - -
      # at line 
      if @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek( 1 ).between?( 0x61, 0x7a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end



    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 15 )

    end

    # lexer rule ws! (WS)
    # (in HtmlParser.g)
    def ws!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )

      
      # - - - - main rule block - - - -
      # at line 77:8: ( ' ' | '\\r' | '\\t' | '\\u000C' | '\\n' )*
      # at line 77:8: ( ' ' | '\\r' | '\\t' | '\\u000C' | '\\n' )*
      while true # decision 5
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0.between?( 0x9, 0xa ) || look_5_0.between?( 0xc, 0xd ) || look_5_0 == 0x20 )
          alt_5 = 1

        end
        case alt_5
        when 1
          # at line 
          if @input.peek( 1 ).between?( 0x9, 0xa ) || @input.peek( 1 ).between?( 0xc, 0xd ) || @input.peek(1) == 0x20
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse
          end



        else
          break # out of loop for decision 5
        end
      end # loop for decision 5
      # --> action
      channel=99;
      # <-- action

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 16 )

    end

    # lexer rule pcdata! (PCDATA)
    # (in HtmlParser.g)
    def pcdata!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )

      
      # - - - - main rule block - - - -
      # at line 81:9: (~ '<' )
      # at line 81:9: (~ '<' )
      # at line 81:10: ~ '<'
      if @input.peek( 1 ).between?( 0x0, 0x3b ) || @input.peek( 1 ).between?( 0x3d, 0xff )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end




    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 17 )

    end

    # main rule used to study the input at the current position,
    # and choose the proper lexer rule to call in order to
    # fetch the next token
    # 
    # usually, you don't make direct calls to this method,
    # but instead use the next_token method, which will
    # build and emit the actual next token
    def token!
      # at line 1:10: DOCUMENT
      document!

    end

  end # class Lexer < ANTLR3::Lexer

  at_exit { Lexer.main( ARGV ) } if __FILE__ == $0
end

