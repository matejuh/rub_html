#!/usr/bin/env ruby
#
# HtmlPrinter.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: HtmlPrinter.g
# Generated at: 2011-12-23 01:55:34
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


module HtmlPrinter
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all 
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :END_TAG => 9, :CLASS => 37, :BORDERCOLOR => 45, :LETTER => 53, 
                   :HEAD => 11, :HREF => 48, :TABLE => 26, :VALIGN => 46, 
                   :HTML => 8, :ID => 35, :EOF => -1, :BORDER => 47, :PCDATA => 13, 
                   :NAME => 55, :BACKGROUND => 39, :ALT => 42, :BODY => 14, 
                   :DIGIT => 56, :ALIGN => 40, :ATTR => 6, :IMG => 31, :TD => 29, 
                   :A => 30, :BR => 33, :B => 24, :TH => 28, :HEIGHT => 44, 
                   :ANAME => 49, :I => 23, :TR => 27, :SRC => 41, :U => 25, 
                   :ATTRS => 5, :P => 21, :TARGET => 50, :END_NOPAIR_TAG => 32, 
                   :TAG => 4, :NAMECHAR => 54, :BGCOLOR => 38, :CLOSING_TAG => 10, 
                   :SVALUE => 52, :WS => 34, :WIDTH => 43, :ASSIGN => 51, 
                   :STYLE => 36, :H6 => 20, :H5 => 19, :H4 => 18, :H3 => 17, 
                   :H2 => 16, :H1 => 15, :DIV => 22, :OPENING_TAG => 7, 
                   :TITLE => 12 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "TAG", "ATTRS", "ATTR", "OPENING_TAG", "HTML", "END_TAG", 
                    "CLOSING_TAG", "HEAD", "TITLE", "PCDATA", "BODY", "H1", 
                    "H2", "H3", "H4", "H5", "H6", "P", "DIV", "I", "B", 
                    "U", "TABLE", "TR", "TH", "TD", "A", "IMG", "END_NOPAIR_TAG", 
                    "BR", "WS", "ID", "STYLE", "CLASS", "BGCOLOR", "BACKGROUND", 
                    "ALIGN", "SRC", "ALT", "WIDTH", "HEIGHT", "BORDERCOLOR", 
                    "VALIGN", "BORDER", "HREF", "ANAME", "TARGET", "ASSIGN", 
                    "SVALUE", "LETTER", "NAMECHAR", "NAME", "DIGIT" )
    
  end


  class TreeParser < ANTLR3::TreeParser
    @grammar_home = HtmlPrinter

    RULE_METHODS = [ :document, :html, :head, :title_element, :title, :body, 
                     :body_content, :text, :text_tag, :fonts, :attrs, :attr, 
                     :attr_svalue ].freeze


    include TokenData

    begin
      generated_using( "HtmlPrinter.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end

    def initialize( input, options = {} )
      super( input, options )


    end

      
      def printStartTag(tag)
        print (("\t")*(tag.depth-1))
        print "<#{tag.text}"
      end
      
      def printEndTag(tag)
        print (("\t")*(tag.depth-1))
        puts "</#{tag.text}>"
      end

    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -

    # 
    # parser rule document
    # 
    # (in HtmlPrinter.g)
    # 20:1: document : html ;
    # 
    def document
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )

      begin
        # at line 20:12: html
        @state.following.push( TOKENS_FOLLOWING_html_IN_document_47 )
        html
        @state.following.pop

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
    # parser rule html
    # 
    # (in HtmlPrinter.g)
    # 24:1: html : ^( TAG HTML ( head )? ( body )? ) ;
    # 
    def html
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )
      __HTML1__ = nil

      begin
        # at line 24:7: ^( TAG HTML ( head )? ( body )? )
        match( TAG, TOKENS_FOLLOWING_TAG_IN_html_65 )

        match( DOWN, nil )
        __HTML1__ = match( HTML, TOKENS_FOLLOWING_HTML_IN_html_67 )
        # --> action
        printStartTag(__HTML1__);puts">";
        # <-- action
        # at line 24:50: ( head )?
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0 == TAG )
          look_1_1 = @input.peek( 2 )

          if ( look_1_1 == DOWN )
            look_1_3 = @input.peek( 3 )

            if ( look_1_3 == HEAD )
              alt_1 = 1
            end
          end
        end
        case alt_1
        when 1
          # at line 24:50: head
          @state.following.push( TOKENS_FOLLOWING_head_IN_html_71 )
          head
          @state.following.pop

        end
        # at line 24:56: ( body )?
        alt_2 = 2
        look_2_0 = @input.peek( 1 )

        if ( look_2_0 == TAG )
          alt_2 = 1
        end
        case alt_2
        when 1
          # at line 24:56: body
          @state.following.push( TOKENS_FOLLOWING_body_IN_html_74 )
          body
          @state.following.pop

        end

        match( UP, nil )
        # --> action
        puts "</html>"
        # <-- action

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
    # parser rule head
    # 
    # (in HtmlPrinter.g)
    # 26:1: head : ( ^( TAG HEAD title_element ) | ^( TAG HEAD ) );
    # 
    def head
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )
      __HEAD2__ = nil
      __HEAD3__ = nil

      begin
        # at line 26:6: ( ^( TAG HEAD title_element ) | ^( TAG HEAD ) )
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0 == TAG )
          look_3_1 = @input.peek( 2 )

          if ( look_3_1 == DOWN )
            look_3_2 = @input.peek( 3 )

            if ( look_3_2 == HEAD )
              look_3_3 = @input.peek( 4 )

              if ( look_3_3 == TAG )
                alt_3 = 1
              elsif ( look_3_3 == UP )
                alt_3 = 2
              else
                raise NoViableAlternative( "", 3, 3 )
              end
            else
              raise NoViableAlternative( "", 3, 2 )
            end
          else
            raise NoViableAlternative( "", 3, 1 )
          end
        else
          raise NoViableAlternative( "", 3, 0 )
        end
        case alt_3
        when 1
          # at line 26:8: ^( TAG HEAD title_element )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_head_86 )

          match( DOWN, nil )
          __HEAD2__ = match( HEAD, TOKENS_FOLLOWING_HEAD_IN_head_88 )
          # --> action
          printStartTag(__HEAD2__);puts">";
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_title_element_IN_head_92 )
          title_element
          @state.following.pop

          match( UP, nil )
          # --> action
          printEndTag(__HEAD2__);
          # <-- action

        when 2
          # at line 27:8: ^( TAG HEAD )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_head_104 )

          match( DOWN, nil )
          __HEAD3__ = match( HEAD, TOKENS_FOLLOWING_HEAD_IN_head_106 )
          # --> action
          printStartTag(__HEAD3__);print">";
          # <-- action

          match( UP, nil )
          # --> action
          puts "</head>"
          # <-- action

        end
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
    # parser rule title_element
    # 
    # (in HtmlPrinter.g)
    # 30:1: title_element : title ;
    # 
    def title_element
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )

      begin
        # at line 30:16: title
        @state.following.push( TOKENS_FOLLOWING_title_IN_title_element_123 )
        title
        @state.following.pop

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
    # parser rule title
    # 
    # (in HtmlPrinter.g)
    # 32:1: title : ^( TAG TITLE ( PCDATA )? ) ;
    # 
    def title
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )
      __TITLE4__ = nil
      __PCDATA5__ = nil

      begin
        # at line 32:8: ^( TAG TITLE ( PCDATA )? )
        match( TAG, TOKENS_FOLLOWING_TAG_IN_title_131 )

        match( DOWN, nil )
        __TITLE4__ = match( TITLE, TOKENS_FOLLOWING_TITLE_IN_title_133 )
        # --> action
        printStartTag(__TITLE4__); print">"
        # <-- action
        # at line 32:53: ( PCDATA )?
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0 == PCDATA )
          alt_4 = 1
        end
        case alt_4
        when 1
          # at line 32:54: PCDATA
          __PCDATA5__ = match( PCDATA, TOKENS_FOLLOWING_PCDATA_IN_title_137 )

        end
        # --> action
        if !(__PCDATA5__.nil?) then print __PCDATA5__.text; end 
        # <-- action

        match( UP, nil )
        # --> action
        puts "</title>"
        # <-- action

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 5 )

      end
      
      return 
    end


    # 
    # parser rule body
    # 
    # (in HtmlPrinter.g)
    # 34:1: body : ( ^( TAG BODY attrs body_content ) | ^( TAG BODY attrs ) );
    # 
    def body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )
      __BODY6__ = nil
      __BODY7__ = nil

      begin
        # at line 34:5: ( ^( TAG BODY attrs body_content ) | ^( TAG BODY attrs ) )
        alt_5 = 2
        alt_5 = @dfa5.predict( @input )
        case alt_5
        when 1
          # at line 34:7: ^( TAG BODY attrs body_content )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_body_150 )

          match( DOWN, nil )
          __BODY6__ = match( BODY, TOKENS_FOLLOWING_BODY_IN_body_152 )
          # --> action
          printStartTag(__BODY6__);
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_attrs_IN_body_156 )
          attrs
          @state.following.pop
          # --> action
          puts ">"
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_body_content_IN_body_160 )
          body_content
          @state.following.pop

          match( UP, nil )
          # --> action
          printEndTag(__BODY6__);
          # <-- action

        when 2
          # at line 35:7: ^( TAG BODY attrs )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_body_171 )

          match( DOWN, nil )
          __BODY7__ = match( BODY, TOKENS_FOLLOWING_BODY_IN_body_173 )
          # --> action
          printStartTag(__BODY7__);
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_attrs_IN_body_177 )
          attrs
          @state.following.pop
          # --> action
          print ">"
          # <-- action

          match( UP, nil )
          # --> action
          puts "</body>"
          # <-- action

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 6 )

      end
      
      return 
    end


    # 
    # parser rule body_content
    # 
    # (in HtmlPrinter.g)
    # 38:1: body_content : text ;
    # 
    def body_content
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )

      begin
        # at line 39:5: text
        @state.following.push( TOKENS_FOLLOWING_text_IN_body_content_196 )
        text
        @state.following.pop

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 7 )

      end
      
      return 
    end


    # 
    # parser rule text
    # 
    # (in HtmlPrinter.g)
    # 43:1: text : ( PCDATA | text_tag );
    # 
    def text
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )
      __PCDATA8__ = nil

      begin
        # at line 44:3: ( PCDATA | text_tag )
        alt_6 = 2
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == PCDATA )
          alt_6 = 1
        elsif ( look_6_0 == TAG )
          alt_6 = 2
        else
          raise NoViableAlternative( "", 6, 0 )
        end
        case alt_6
        when 1
          # at line 44:5: PCDATA
          __PCDATA8__ = match( PCDATA, TOKENS_FOLLOWING_PCDATA_IN_text_212 )
          # --> action
          print __PCDATA8__.text;
          # <-- action

        when 2
          # at line 45:5: text_tag
          @state.following.push( TOKENS_FOLLOWING_text_tag_IN_text_220 )
          text_tag
          @state.following.pop

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 8 )

      end
      
      return 
    end


    # 
    # parser rule text_tag
    # 
    # (in HtmlPrinter.g)
    # 48:1: text_tag : fonts ;
    # 
    def text_tag
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )

      begin
        # at line 49:5: fonts
        @state.following.push( TOKENS_FOLLOWING_fonts_IN_text_tag_235 )
        fonts
        @state.following.pop

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 9 )

      end
      
      return 
    end


    # 
    # parser rule fonts
    # 
    # (in HtmlPrinter.g)
    # 53:1: fonts : ( ^( TAG tag_name= ( U | I | B ) text ) | ^( TAG tag_name= ( U | I | B ) ) );
    # 
    def fonts
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )
      tag_name = nil

      begin
        # at line 53:6: ( ^( TAG tag_name= ( U | I | B ) text ) | ^( TAG tag_name= ( U | I | B ) ) )
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == TAG )
          look_7_1 = @input.peek( 2 )

          if ( look_7_1 == DOWN )
            look_7_2 = @input.peek( 3 )

            if ( look_7_2.between?( I, U ) )
              look_7_3 = @input.peek( 4 )

              if ( look_7_3 == TAG || look_7_3 == PCDATA )
                alt_7 = 1
              elsif ( look_7_3 == UP )
                alt_7 = 2
              else
                raise NoViableAlternative( "", 7, 3 )
              end
            else
              raise NoViableAlternative( "", 7, 2 )
            end
          else
            raise NoViableAlternative( "", 7, 1 )
          end
        else
          raise NoViableAlternative( "", 7, 0 )
        end
        case alt_7
        when 1
          # at line 53:8: ^( TAG tag_name= ( U | I | B ) text )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_fonts_249 )

          match( DOWN, nil )
          tag_name = @input.look
          if @input.peek( 1 ).between?( I, U )
            @input.consume
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          # --> action
          printStartTag(tag_name);
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_text_IN_fonts_263 )
          text
          @state.following.pop

          match( UP, nil )
          # --> action
          printEndTag(tag_name);
          # <-- action

        when 2
          # at line 54:8: ^( TAG tag_name= ( U | I | B ) )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_fonts_275 )

          match( DOWN, nil )
          tag_name = @input.look
          if @input.peek( 1 ).between?( I, U )
            @input.consume
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          # --> action
          printStartTag(tag_name);
          # <-- action

          match( UP, nil )
          # --> action
          print "</#{tag_name.text}>"
          # <-- action

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 10 )

      end
      
      return 
    end


    # 
    # parser rule attrs
    # 
    # (in HtmlPrinter.g)
    # 63:1: attrs : ( attr )* ;
    # 
    def attrs
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )

      begin
        # at line 63:7: ( attr )*
        # at line 63:7: ( attr )*
        while true # decision 8
          alt_8 = 2
          look_8_0 = @input.peek( 1 )

          if ( look_8_0.between?( ID, HREF ) || look_8_0 == TARGET || look_8_0 == NAME )
            alt_8 = 1

          end
          case alt_8
          when 1
            # at line 63:7: attr
            @state.following.push( TOKENS_FOLLOWING_attr_IN_attrs_307 )
            attr
            @state.following.pop

          else
            break # out of loop for decision 8
          end
        end # loop for decision 8

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 11 )

      end
      
      return 
    end


    # 
    # parser rule attr
    # 
    # (in HtmlPrinter.g)
    # 65:1: attr : ^(attr_name= ( ID | STYLE | CLASS | BGCOLOR | BACKGROUND | ALIGN | SRC | ALT | WIDTH | HEIGHT | BORDERCOLOR | VALIGN | BORDER | HREF | NAME | TARGET ) attr_svalue ) ;
    # 
    def attr
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
      attr_name = nil

      begin
        # at line 65:7: ^(attr_name= ( ID | STYLE | CLASS | BGCOLOR | BACKGROUND | ALIGN | SRC | ALT | WIDTH | HEIGHT | BORDERCOLOR | VALIGN | BORDER | HREF | NAME | TARGET ) attr_svalue )
        attr_name = @input.look
        if @input.peek( 1 ).between?( ID, HREF ) || @input.peek(1) == TARGET || @input.peek(1) == NAME
          @input.consume
          @state.error_recovery = false
        else
          mse = MismatchedSet( nil )
          raise mse
        end



        # --> action
        print " #{attr_name.text}"
        # <-- action

        match( DOWN, nil )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_attr_354 )
        attr_svalue
        @state.following.pop

        match( UP, nil )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 12 )

      end
      
      return 
    end


    # 
    # parser rule attr_svalue
    # 
    # (in HtmlPrinter.g)
    # 67:1: attr_svalue : ^( ASSIGN SVALUE ) ;
    # 
    def attr_svalue
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )
      __SVALUE9__ = nil

      begin
        # at line 67:14: ^( ASSIGN SVALUE )
        match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_attr_svalue_363 )

        # --> action
        print "="
        # <-- action

        match( DOWN, nil )
        __SVALUE9__ = match( SVALUE, TOKENS_FOLLOWING_SVALUE_IN_attr_svalue_367 )
        # --> action
        print (__SVALUE9__.text)
        # <-- action

        match( UP, nil )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 13 )

      end
      
      return 
    end



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA5 < ANTLR3::DFA
      EOT = unpack( 13, -1 )
      EOF = unpack( 13, -1 )
      MIN = unpack( 1, 4, 1, 2, 1, 14, 1, 3, 1, 2, 2, -1, 1, 51, 1, 2, 1, 
                    52, 3, 3 )
      MAX = unpack( 1, 4, 1, 2, 1, 14, 1, 55, 1, 2, 2, -1, 1, 51, 1, 2, 
                    1, 52, 2, 3, 1, 55 )
      ACCEPT = unpack( 5, -1, 1, 1, 1, 2, 6, -1 )
      SPECIAL = unpack( 13, -1 )
      TRANSITION = [
        unpack( 1, 1 ),
        unpack( 1, 2 ),
        unpack( 1, 3 ),
        unpack( 1, 6, 1, 5, 8, -1, 1, 5, 21, -1, 14, 4, 1, -1, 1, 4, 4, 
                 -1, 1, 4 ),
        unpack( 1, 7 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 8 ),
        unpack( 1, 9 ),
        unpack( 1, 10 ),
        unpack( 1, 11 ),
        unpack( 1, 12 ),
        unpack( 1, 6, 1, 5, 8, -1, 1, 5, 21, -1, 14, 4, 1, -1, 1, 4, 4, 
                 -1, 1, 4 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 5
      

      def description
        <<-'__dfa_description__'.strip!
          34:1: body : ( ^( TAG BODY attrs body_content ) | ^( TAG BODY attrs ) );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa5 = DFA5.new( self, 5 )

    end
    TOKENS_FOLLOWING_html_IN_document_47 = Set[ 1 ]
    TOKENS_FOLLOWING_TAG_IN_html_65 = Set[ 2 ]
    TOKENS_FOLLOWING_HTML_IN_html_67 = Set[ 3, 4 ]
    TOKENS_FOLLOWING_head_IN_html_71 = Set[ 3, 4 ]
    TOKENS_FOLLOWING_body_IN_html_74 = Set[ 3 ]
    TOKENS_FOLLOWING_TAG_IN_head_86 = Set[ 2 ]
    TOKENS_FOLLOWING_HEAD_IN_head_88 = Set[ 4 ]
    TOKENS_FOLLOWING_title_element_IN_head_92 = Set[ 3 ]
    TOKENS_FOLLOWING_TAG_IN_head_104 = Set[ 2 ]
    TOKENS_FOLLOWING_HEAD_IN_head_106 = Set[ 3 ]
    TOKENS_FOLLOWING_title_IN_title_element_123 = Set[ 1 ]
    TOKENS_FOLLOWING_TAG_IN_title_131 = Set[ 2 ]
    TOKENS_FOLLOWING_TITLE_IN_title_133 = Set[ 3, 13 ]
    TOKENS_FOLLOWING_PCDATA_IN_title_137 = Set[ 3 ]
    TOKENS_FOLLOWING_TAG_IN_body_150 = Set[ 2 ]
    TOKENS_FOLLOWING_BODY_IN_body_152 = Set[ 4, 13, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 50, 55 ]
    TOKENS_FOLLOWING_attrs_IN_body_156 = Set[ 4, 13, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 50, 55 ]
    TOKENS_FOLLOWING_body_content_IN_body_160 = Set[ 3 ]
    TOKENS_FOLLOWING_TAG_IN_body_171 = Set[ 2 ]
    TOKENS_FOLLOWING_BODY_IN_body_173 = Set[ 3, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 50, 55 ]
    TOKENS_FOLLOWING_attrs_IN_body_177 = Set[ 3 ]
    TOKENS_FOLLOWING_text_IN_body_content_196 = Set[ 1 ]
    TOKENS_FOLLOWING_PCDATA_IN_text_212 = Set[ 1 ]
    TOKENS_FOLLOWING_text_tag_IN_text_220 = Set[ 1 ]
    TOKENS_FOLLOWING_fonts_IN_text_tag_235 = Set[ 1 ]
    TOKENS_FOLLOWING_TAG_IN_fonts_249 = Set[ 2 ]
    TOKENS_FOLLOWING_set_IN_fonts_253 = Set[ 4, 13, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 50, 55 ]
    TOKENS_FOLLOWING_text_IN_fonts_263 = Set[ 3 ]
    TOKENS_FOLLOWING_TAG_IN_fonts_275 = Set[ 2 ]
    TOKENS_FOLLOWING_set_IN_fonts_279 = Set[ 3 ]
    TOKENS_FOLLOWING_attr_IN_attrs_307 = Set[ 1, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 50, 55 ]
    TOKENS_FOLLOWING_set_IN_attr_318 = Set[ 2 ]
    TOKENS_FOLLOWING_attr_svalue_IN_attr_354 = Set[ 3 ]
    TOKENS_FOLLOWING_ASSIGN_IN_attr_svalue_363 = Set[ 2 ]
    TOKENS_FOLLOWING_SVALUE_IN_attr_svalue_367 = Set[ 3 ]

  end # class TreeParser < ANTLR3::TreeParser

  at_exit { TreeParser.main( ARGV ) } if __FILE__ == $0
end

