#!/usr/bin/env ruby
#
# HtmlPrinter.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: HtmlPrinter.g
# Generated at: 2011-12-23 14:42:39
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
                   :DIGIT => 56, :ALIGN => 40, :IMG => 31, :TD => 29, :A => 30, 
                   :BR => 33, :B => 24, :TH => 28, :HEIGHT => 44, :ANAME => 49, 
                   :I => 23, :TR => 27, :SRC => 41, :U => 25, :ATTRS => 5, 
                   :P => 21, :TARGET => 50, :END_NOPAIR_TAG => 32, :TAG => 4, 
                   :NAMECHAR => 54, :BGCOLOR => 38, :CLOSING_TAG => 10, 
                   :SVALUE => 52, :WS => 34, :WIDTH => 43, :ASSIGN => 51, 
                   :STYLE => 36, :H6 => 20, :H5 => 19, :H4 => 18, :H3 => 17, 
                   :H2 => 16, :H1 => 15, :DIV => 22, :OPENING_TAG => 7, 
                   :DATA => 6, :TITLE => 12 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "TAG", "ATTRS", "DATA", "OPENING_TAG", "HTML", "END_TAG", 
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
                     :body_content, :text, :pcdata, :text_tags, :text_tag, 
                     :special, :body_tag, :heading, :heading_data, :block, 
                     :paragraph, :div, :attrs, :attr, :attr_svalue ].freeze


    include TokenData

    begin
      generated_using( "HtmlPrinter.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end

    def initialize( input, options = {} )
      super( input, options )


    end

      
      require 'colorize'
      
      def printStartTag(tag)
        print (("\t")*(tag.depth-1))
        print "<#{tag.text}".colorize(:green)
      end
      
      def printEndTag(tag)
        print (("\t")*(tag.depth-1))
        puts "</#{tag.text}>".colorize(:green)
      end
      
      def putsEndingBracket
        puts ">".colorize(:green)
      end
      
      def printEndingBracket
        puts ">".colorize(:green)
      end
      
      def putsEndTag(tag)
        puts "</#{tag.text}>".colorize(:green)
      end

    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -

    # 
    # parser rule document
    # 
    # (in HtmlPrinter.g)
    # 35:1: document : html ;
    # 
    def document
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )

      begin
        # at line 35:12: html
        @state.following.push( TOKENS_FOLLOWING_html_IN_document_48 )
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
    # 37:1: html : ^( TAG HTML ( head )? ( body )? ) ;
    # 
    def html
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )
      __HTML1__ = nil

      begin
        # at line 37:7: ^( TAG HTML ( head )? ( body )? )
        match( TAG, TOKENS_FOLLOWING_TAG_IN_html_60 )

        match( DOWN, nil )
        __HTML1__ = match( HTML, TOKENS_FOLLOWING_HTML_IN_html_62 )
        # --> action
        printStartTag(__HTML1__);putsEndingBracket;
        # <-- action
        # at line 37:60: ( head )?
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
          # at line 37:60: head
          @state.following.push( TOKENS_FOLLOWING_head_IN_html_66 )
          head
          @state.following.pop

        end
        # at line 37:66: ( body )?
        alt_2 = 2
        look_2_0 = @input.peek( 1 )

        if ( look_2_0 == TAG )
          alt_2 = 1
        end
        case alt_2
        when 1
          # at line 37:66: body
          @state.following.push( TOKENS_FOLLOWING_body_IN_html_69 )
          body
          @state.following.pop

        end

        match( UP, nil )
        # --> action
        putsEndTag(__HTML1__);
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
    # 39:1: head : ( ^( TAG HEAD title_element ) | ^( TAG HEAD ) );
    # 
    def head
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )
      __HEAD2__ = nil
      __HEAD3__ = nil

      begin
        # at line 39:6: ( ^( TAG HEAD title_element ) | ^( TAG HEAD ) )
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
          # at line 39:8: ^( TAG HEAD title_element )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_head_81 )

          match( DOWN, nil )
          __HEAD2__ = match( HEAD, TOKENS_FOLLOWING_HEAD_IN_head_83 )
          # --> action
          printStartTag(__HEAD2__);putsEndingBracket;
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_title_element_IN_head_87 )
          title_element
          @state.following.pop

          match( UP, nil )
          # --> action
          printEndTag(__HEAD2__);
          # <-- action

        when 2
          # at line 40:8: ^( TAG HEAD )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_head_99 )

          match( DOWN, nil )
          __HEAD3__ = match( HEAD, TOKENS_FOLLOWING_HEAD_IN_head_101 )
          # --> action
          printStartTag(__HEAD3__);putsEndingBracket;
          # <-- action

          match( UP, nil )
          # --> action
          putsEndTag(__HEAD3__);
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
    # 43:1: title_element : title ;
    # 
    def title_element
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )

      begin
        # at line 43:16: title
        @state.following.push( TOKENS_FOLLOWING_title_IN_title_element_118 )
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
    # 45:1: title : ( ^( TAG TITLE pcdata ) | ^( TAG TITLE ) );
    # 
    def title
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )
      __TITLE4__ = nil
      __TITLE5__ = nil

      begin
        # at line 45:6: ( ^( TAG TITLE pcdata ) | ^( TAG TITLE ) )
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0 == TAG )
          look_4_1 = @input.peek( 2 )

          if ( look_4_1 == DOWN )
            look_4_2 = @input.peek( 3 )

            if ( look_4_2 == TITLE )
              look_4_3 = @input.peek( 4 )

              if ( look_4_3 == DATA || look_4_3 == PCDATA )
                alt_4 = 1
              elsif ( look_4_3 == UP )
                alt_4 = 2
              else
                raise NoViableAlternative( "", 4, 3 )
              end
            else
              raise NoViableAlternative( "", 4, 2 )
            end
          else
            raise NoViableAlternative( "", 4, 1 )
          end
        else
          raise NoViableAlternative( "", 4, 0 )
        end
        case alt_4
        when 1
          # at line 45:8: ^( TAG TITLE pcdata )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_title_126 )

          match( DOWN, nil )
          __TITLE4__ = match( TITLE, TOKENS_FOLLOWING_TITLE_IN_title_128 )
          # --> action
          printStartTag(__TITLE4__); putsEndingBracket;
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_pcdata_IN_title_131 )
          pcdata
          @state.following.pop

          match( UP, nil )
          # --> action
          printEndTag(__TITLE4__);
          # <-- action

        when 2
          # at line 46:8: ^( TAG TITLE )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_title_143 )

          match( DOWN, nil )
          __TITLE5__ = match( TITLE, TOKENS_FOLLOWING_TITLE_IN_title_145 )
          # --> action
          printStartTag(__TITLE5__); printEndingBracket;
          # <-- action

          match( UP, nil )
          # --> action
          putsEndTag(__TITLE5__);
          # <-- action

        end
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
    # 49:1: body : ( ^( TAG BODY attrs ( body_content )+ ) | ^( TAG BODY attrs ) );
    # 
    def body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )
      __BODY6__ = nil
      __BODY7__ = nil

      begin
        # at line 50:5: ( ^( TAG BODY attrs ( body_content )+ ) | ^( TAG BODY attrs ) )
        alt_6 = 2
        alt_6 = @dfa6.predict( @input )
        case alt_6
        when 1
          # at line 50:7: ^( TAG BODY attrs ( body_content )+ )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_body_167 )

          match( DOWN, nil )
          __BODY6__ = match( BODY, TOKENS_FOLLOWING_BODY_IN_body_169 )
          # --> action
          printStartTag(__BODY6__);
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_attrs_IN_body_173 )
          attrs
          @state.following.pop
          # --> action
          putsEndingBracket;
          # <-- action
          # at file 50:69: ( body_content )+
          match_count_5 = 0
          while true
            alt_5 = 2
            look_5_0 = @input.peek( 1 )

            if ( look_5_0 == TAG || look_5_0 == DATA || look_5_0 == PCDATA )
              alt_5 = 1

            end
            case alt_5
            when 1
              # at line 50:69: body_content
              @state.following.push( TOKENS_FOLLOWING_body_content_IN_body_177 )
              body_content
              @state.following.pop

            else
              match_count_5 > 0 and break
              eee = EarlyExit(5)


              raise eee
            end
            match_count_5 += 1
          end


          match( UP, nil )
          # --> action
          printEndTag(__BODY6__);
          # <-- action

        when 2
          # at line 51:7: ^( TAG BODY attrs )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_body_189 )

          match( DOWN, nil )
          __BODY7__ = match( BODY, TOKENS_FOLLOWING_BODY_IN_body_191 )
          # --> action
          printStartTag(__BODY7__);
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_attrs_IN_body_195 )
          attrs
          @state.following.pop
          # --> action
          printEndingBracket;
          # <-- action

          match( UP, nil )
          # --> action
          putsEndTag(__BODY7__);
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
    # 54:1: body_content : ( text | body_tag );
    # 
    def body_content
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )

      begin
        # at line 55:3: ( text | body_tag )
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == DATA || look_7_0 == PCDATA )
          alt_7 = 1
        elsif ( look_7_0 == TAG )
          look_7_2 = @input.peek( 2 )

          if ( look_7_2 == DOWN )
            look_7_3 = @input.peek( 3 )

            if ( look_7_3.between?( I, U ) || look_7_3.between?( A, IMG ) || look_7_3 == BR )
              alt_7 = 1
            elsif ( look_7_3.between?( H1, DIV ) )
              alt_7 = 2
            else
              raise NoViableAlternative( "", 7, 3 )
            end
          else
            raise NoViableAlternative( "", 7, 2 )
          end
        else
          raise NoViableAlternative( "", 7, 0 )
        end
        case alt_7
        when 1
          # at line 55:5: text
          @state.following.push( TOKENS_FOLLOWING_text_IN_body_content_214 )
          text
          @state.following.pop

        when 2
          # at line 56:5: body_tag
          @state.following.push( TOKENS_FOLLOWING_body_tag_IN_body_content_220 )
          body_tag
          @state.following.pop

        end
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
    # 59:1: text : ( pcdata | text_tags );
    # 
    def text
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )

      begin
        # at line 60:3: ( pcdata | text_tags )
        alt_8 = 2
        look_8_0 = @input.peek( 1 )

        if ( look_8_0 == DATA || look_8_0 == PCDATA )
          alt_8 = 1
        elsif ( look_8_0 == TAG )
          alt_8 = 2
        else
          raise NoViableAlternative( "", 8, 0 )
        end
        case alt_8
        when 1
          # at line 60:5: pcdata
          @state.following.push( TOKENS_FOLLOWING_pcdata_IN_text_236 )
          pcdata
          @state.following.pop

        when 2
          # at line 61:5: text_tags
          @state.following.push( TOKENS_FOLLOWING_text_tags_IN_text_242 )
          text_tags
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
    # parser rule pcdata
    # 
    # (in HtmlPrinter.g)
    # 64:1: pcdata : ( ^( DATA PCDATA ) | PCDATA );
    # 
    def pcdata
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )
      __PCDATA8__ = nil
      __PCDATA9__ = nil

      begin
        # at line 64:7: ( ^( DATA PCDATA ) | PCDATA )
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0 == DATA )
          alt_9 = 1
        elsif ( look_9_0 == PCDATA )
          alt_9 = 2
        else
          raise NoViableAlternative( "", 9, 0 )
        end
        case alt_9
        when 1
          # at line 64:9: ^( DATA PCDATA )
          match( DATA, TOKENS_FOLLOWING_DATA_IN_pcdata_255 )

          match( DOWN, nil )
          __PCDATA8__ = match( PCDATA, TOKENS_FOLLOWING_PCDATA_IN_pcdata_257 )

          match( UP, nil )
          # --> action
          (__PCDATA8__.text).each_line{|line| if ((line.strip).length>0) then print (("\t")*(__PCDATA8__.depth-1));puts line.strip; end;};
          # <-- action

        when 2
          # at line 65:9: PCDATA
          __PCDATA9__ = match( PCDATA, TOKENS_FOLLOWING_PCDATA_IN_pcdata_270 )
          # --> action
          (__PCDATA9__.text).each_line{|line| if ((line.strip).length>0) then print (("\t")*(__PCDATA9__.depth));puts line.strip; end;};
          # <-- action

        end
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
    # parser rule text_tags
    # 
    # (in HtmlPrinter.g)
    # 68:1: text_tags : ( text_tag | special );
    # 
    def text_tags
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )

      begin
        # at line 69:3: ( text_tag | special )
        alt_10 = 2
        look_10_0 = @input.peek( 1 )

        if ( look_10_0 == TAG )
          look_10_1 = @input.peek( 2 )

          if ( look_10_1 == DOWN )
            look_10_2 = @input.peek( 3 )

            if ( look_10_2.between?( I, U ) || look_10_2 == A )
              alt_10 = 1
            elsif ( look_10_2 == IMG || look_10_2 == BR )
              alt_10 = 2
            else
              raise NoViableAlternative( "", 10, 2 )
            end
          else
            raise NoViableAlternative( "", 10, 1 )
          end
        else
          raise NoViableAlternative( "", 10, 0 )
        end
        case alt_10
        when 1
          # at line 69:5: text_tag
          @state.following.push( TOKENS_FOLLOWING_text_tag_IN_text_tags_291 )
          text_tag
          @state.following.pop

        when 2
          # at line 70:5: special
          @state.following.push( TOKENS_FOLLOWING_special_IN_text_tags_297 )
          special
          @state.following.pop

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
    # parser rule text_tag
    # 
    # (in HtmlPrinter.g)
    # 74:1: text_tag : ( ^( TAG tag_name= ( U | I | B | A ) attrs text ) | ^( TAG tag_name= ( A ) attrs ) );
    # 
    def text_tag
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )
      tag_name = nil

      begin
        # at line 74:10: ( ^( TAG tag_name= ( U | I | B | A ) attrs text ) | ^( TAG tag_name= ( A ) attrs ) )
        alt_11 = 2
        alt_11 = @dfa11.predict( @input )
        case alt_11
        when 1
          # at line 74:12: ^( TAG tag_name= ( U | I | B | A ) attrs text )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_text_tag_310 )

          match( DOWN, nil )
          tag_name = @input.look
          if @input.peek( 1 ).between?( I, U ) || @input.peek(1) == A
            @input.consume
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          # --> action
          printStartTag(tag_name);
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_attrs_IN_text_tag_326 )
          attrs
          @state.following.pop
          # --> action
          putsEndingBracket;
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_text_IN_text_tag_330 )
          text
          @state.following.pop

          match( UP, nil )
          # --> action
          printEndTag(tag_name);
          # <-- action

        when 2
          # at line 75:12: ^( TAG tag_name= ( A ) attrs )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_text_tag_346 )

          match( DOWN, nil )
          # at line 75:27: ( A )
          # at line 75:28: A
          match( A, TOKENS_FOLLOWING_A_IN_text_tag_351 )

          # --> action
          printStartTag(tag_name);
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_attrs_IN_text_tag_356 )
          attrs
          @state.following.pop
          # --> action
          printEndingBracket;
          # <-- action

          match( UP, nil )
          # --> action
          printEndTag(tag_name);
          # <-- action

        end
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
    # parser rule special
    # 
    # (in HtmlPrinter.g)
    # 78:1: special : ^( TAG tag_name= ( IMG | BR ) attrs ) ;
    # 
    def special
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
      tag_name = nil

      begin
        # at line 79:5: ^( TAG tag_name= ( IMG | BR ) attrs )
        match( TAG, TOKENS_FOLLOWING_TAG_IN_special_382 )

        match( DOWN, nil )
        tag_name = @input.look
        if @input.peek(1) == IMG || @input.peek(1) == BR
          @input.consume
          @state.error_recovery = false
        else
          mse = MismatchedSet( nil )
          raise mse
        end


        # --> action
        printStartTag(tag_name);
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_attrs_IN_special_394 )
        attrs
        @state.following.pop

        match( UP, nil )
        # --> action
        puts " \\>".colorize(:green)
        # <-- action

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
    # parser rule body_tag
    # 
    # (in HtmlPrinter.g)
    # 82:1: body_tag : ( heading | block );
    # 
    def body_tag
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )

      begin
        # at line 83:3: ( heading | block )
        alt_12 = 2
        look_12_0 = @input.peek( 1 )

        if ( look_12_0 == TAG )
          look_12_1 = @input.peek( 2 )

          if ( look_12_1 == DOWN )
            look_12_2 = @input.peek( 3 )

            if ( look_12_2.between?( H1, H6 ) )
              alt_12 = 1
            elsif ( look_12_2.between?( P, DIV ) )
              alt_12 = 2
            else
              raise NoViableAlternative( "", 12, 2 )
            end
          else
            raise NoViableAlternative( "", 12, 1 )
          end
        else
          raise NoViableAlternative( "", 12, 0 )
        end
        case alt_12
        when 1
          # at line 83:5: heading
          @state.following.push( TOKENS_FOLLOWING_heading_IN_body_tag_412 )
          heading
          @state.following.pop

        when 2
          # at line 84:5: block
          @state.following.push( TOKENS_FOLLOWING_block_IN_body_tag_419 )
          block
          @state.following.pop

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 13 )

      end
      
      return 
    end


    # 
    # parser rule heading
    # 
    # (in HtmlPrinter.g)
    # 87:1: heading : ( ^( TAG tag_name= ( H1 | H2 | H3 | H4 | H5 | H6 ) attrs ( heading_data )+ ) | ^( TAG tag_name= ( H1 | H2 | H3 | H4 | H5 | H6 ) attrs ) );
    # 
    def heading
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
      tag_name = nil

      begin
        # at line 87:10: ( ^( TAG tag_name= ( H1 | H2 | H3 | H4 | H5 | H6 ) attrs ( heading_data )+ ) | ^( TAG tag_name= ( H1 | H2 | H3 | H4 | H5 | H6 ) attrs ) )
        alt_14 = 2
        alt_14 = @dfa14.predict( @input )
        case alt_14
        when 1
          # at line 87:12: ^( TAG tag_name= ( H1 | H2 | H3 | H4 | H5 | H6 ) attrs ( heading_data )+ )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_heading_432 )

          match( DOWN, nil )
          tag_name = @input.look
          if @input.peek( 1 ).between?( H1, H6 )
            @input.consume
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          # --> action
          printStartTag(tag_name);
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_attrs_IN_heading_452 )
          attrs
          @state.following.pop
          # --> action
          putsEndingBracket;
          # <-- action
          # at file 87:102: ( heading_data )+
          match_count_13 = 0
          while true
            alt_13 = 2
            look_13_0 = @input.peek( 1 )

            if ( look_13_0 == TAG || look_13_0 == DATA || look_13_0 == PCDATA )
              alt_13 = 1

            end
            case alt_13
            when 1
              # at line 87:102: heading_data
              @state.following.push( TOKENS_FOLLOWING_heading_data_IN_heading_456 )
              heading_data
              @state.following.pop

            else
              match_count_13 > 0 and break
              eee = EarlyExit(13)


              raise eee
            end
            match_count_13 += 1
          end


          match( UP, nil )
          # --> action
          printEndTag(tag_name);
          # <-- action

        when 2
          # at line 88:12: ^( TAG tag_name= ( H1 | H2 | H3 | H4 | H5 | H6 ) attrs )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_heading_473 )

          match( DOWN, nil )
          tag_name = @input.look
          if @input.peek( 1 ).between?( H1, H6 )
            @input.consume
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          # --> action
          printStartTag(tag_name);
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_attrs_IN_heading_493 )
          attrs
          @state.following.pop
          # --> action
          printEndingBracket;
          # <-- action

          match( UP, nil )
          # --> action
          putsEndTag(tag_name);
          # <-- action

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 14 )

      end
      
      return 
    end


    # 
    # parser rule heading_data
    # 
    # (in HtmlPrinter.g)
    # 91:1: heading_data : ( block | text );
    # 
    def heading_data
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )

      begin
        # at line 91:14: ( block | text )
        alt_15 = 2
        look_15_0 = @input.peek( 1 )

        if ( look_15_0 == TAG )
          look_15_1 = @input.peek( 2 )

          if ( look_15_1 == DOWN )
            look_15_3 = @input.peek( 3 )

            if ( look_15_3.between?( P, DIV ) )
              alt_15 = 1
            elsif ( look_15_3.between?( I, U ) || look_15_3.between?( A, IMG ) || look_15_3 == BR )
              alt_15 = 2
            else
              raise NoViableAlternative( "", 15, 3 )
            end
          else
            raise NoViableAlternative( "", 15, 1 )
          end
        elsif ( look_15_0 == DATA || look_15_0 == PCDATA )
          alt_15 = 2
        else
          raise NoViableAlternative( "", 15, 0 )
        end
        case alt_15
        when 1
          # at line 91:16: block
          @state.following.push( TOKENS_FOLLOWING_block_IN_heading_data_525 )
          block
          @state.following.pop

        when 2
          # at line 92:16: text
          @state.following.push( TOKENS_FOLLOWING_text_IN_heading_data_542 )
          text
          @state.following.pop

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 15 )

      end
      
      return 
    end


    # 
    # parser rule block
    # 
    # (in HtmlPrinter.g)
    # 95:1: block : ( paragraph | div );
    # 
    def block
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )

      begin
        # at line 95:8: ( paragraph | div )
        alt_16 = 2
        look_16_0 = @input.peek( 1 )

        if ( look_16_0 == TAG )
          look_16_1 = @input.peek( 2 )

          if ( look_16_1 == DOWN )
            look_16_2 = @input.peek( 3 )

            if ( look_16_2 == P )
              alt_16 = 1
            elsif ( look_16_2 == DIV )
              alt_16 = 2
            else
              raise NoViableAlternative( "", 16, 2 )
            end
          else
            raise NoViableAlternative( "", 16, 1 )
          end
        else
          raise NoViableAlternative( "", 16, 0 )
        end
        case alt_16
        when 1
          # at line 95:10: paragraph
          @state.following.push( TOKENS_FOLLOWING_paragraph_IN_block_574 )
          paragraph
          @state.following.pop

        when 2
          # at line 96:10: div
          @state.following.push( TOKENS_FOLLOWING_div_IN_block_585 )
          div
          @state.following.pop

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 16 )

      end
      
      return 
    end


    # 
    # parser rule paragraph
    # 
    # (in HtmlPrinter.g)
    # 100:1: paragraph : ( ^( TAG P attrs text ) | ^( TAG P attrs ) );
    # 
    def paragraph
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      __P10__ = nil
      __P11__ = nil

      begin
        # at line 101:10: ( ^( TAG P attrs text ) | ^( TAG P attrs ) )
        alt_17 = 2
        alt_17 = @dfa17.predict( @input )
        case alt_17
        when 1
          # at line 101:12: ^( TAG P attrs text )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_paragraph_619 )

          match( DOWN, nil )
          __P10__ = match( P, TOKENS_FOLLOWING_P_IN_paragraph_621 )
          # --> action
          printStartTag(__P10__);
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_attrs_IN_paragraph_625 )
          attrs
          @state.following.pop
          # --> action
          putsEndingBracket;
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_text_IN_paragraph_629 )
          text
          @state.following.pop

          match( UP, nil )
          # --> action
          printEndTag(__P10__);
          # <-- action

        when 2
          # at line 102:12: ^( TAG P attrs )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_paragraph_645 )

          match( DOWN, nil )
          __P11__ = match( P, TOKENS_FOLLOWING_P_IN_paragraph_647 )
          # --> action
          printStartTag(__P11__);
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_attrs_IN_paragraph_651 )
          attrs
          @state.following.pop
          # --> action
          printEndingBracket;
          # <-- action

          match( UP, nil )
          # --> action
          putsEndTag(__P11__);
          # <-- action

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 17 )

      end
      
      return 
    end


    # 
    # parser rule div
    # 
    # (in HtmlPrinter.g)
    # 105:1: div : ( ^( TAG DIV attrs ( body_content )+ ) | ^( TAG DIV attrs ) );
    # 
    def div
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      __DIV12__ = nil
      __DIV13__ = nil

      begin
        # at line 105:4: ( ^( TAG DIV attrs ( body_content )+ ) | ^( TAG DIV attrs ) )
        alt_19 = 2
        alt_19 = @dfa19.predict( @input )
        case alt_19
        when 1
          # at line 105:6: ^( TAG DIV attrs ( body_content )+ )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_div_674 )

          match( DOWN, nil )
          __DIV12__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_div_676 )
          # --> action
          printStartTag(__DIV12__);
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_attrs_IN_div_680 )
          attrs
          @state.following.pop
          # --> action
          putsEndingBracket;
          # <-- action
          # at file 105:66: ( body_content )+
          match_count_18 = 0
          while true
            alt_18 = 2
            look_18_0 = @input.peek( 1 )

            if ( look_18_0 == TAG || look_18_0 == DATA || look_18_0 == PCDATA )
              alt_18 = 1

            end
            case alt_18
            when 1
              # at line 105:66: body_content
              @state.following.push( TOKENS_FOLLOWING_body_content_IN_div_684 )
              body_content
              @state.following.pop

            else
              match_count_18 > 0 and break
              eee = EarlyExit(18)


              raise eee
            end
            match_count_18 += 1
          end


          match( UP, nil )
          # --> action
          printEndTag(__DIV12__);
          # <-- action

        when 2
          # at line 106:6: ^( TAG DIV attrs )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_div_695 )

          match( DOWN, nil )
          __DIV13__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_div_697 )
          # --> action
          printStartTag(__DIV13__);
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_attrs_IN_div_701 )
          attrs
          @state.following.pop
          # --> action
          printEndingBracket;
          # <-- action

          match( UP, nil )
          # --> action
          putsEndTag(__DIV13__);
          # <-- action

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 18 )

      end
      
      return 
    end


    # 
    # parser rule attrs
    # 
    # (in HtmlPrinter.g)
    # 109:1: attrs : ( attr )* ;
    # 
    def attrs
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )

      begin
        # at line 109:7: ( attr )*
        # at line 109:7: ( attr )*
        while true # decision 20
          alt_20 = 2
          look_20_0 = @input.peek( 1 )

          if ( look_20_0.between?( ID, HREF ) || look_20_0 == TARGET || look_20_0 == NAME )
            alt_20 = 1

          end
          case alt_20
          when 1
            # at line 109:7: attr
            @state.following.push( TOKENS_FOLLOWING_attr_IN_attrs_716 )
            attr
            @state.following.pop

          else
            break # out of loop for decision 20
          end
        end # loop for decision 20

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 19 )

      end
      
      return 
    end


    # 
    # parser rule attr
    # 
    # (in HtmlPrinter.g)
    # 111:1: attr : ^(attr_name= ( ID | STYLE | CLASS | BGCOLOR | BACKGROUND | ALIGN | SRC | ALT | WIDTH | HEIGHT | BORDERCOLOR | VALIGN | BORDER | HREF | NAME | TARGET ) attr_svalue ) ;
    # 
    def attr
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      attr_name = nil

      begin
        # at line 111:7: ^(attr_name= ( ID | STYLE | CLASS | BGCOLOR | BACKGROUND | ALIGN | SRC | ALT | WIDTH | HEIGHT | BORDERCOLOR | VALIGN | BORDER | HREF | NAME | TARGET ) attr_svalue )
        attr_name = @input.look
        if @input.peek( 1 ).between?( ID, HREF ) || @input.peek(1) == TARGET || @input.peek(1) == NAME
          @input.consume
          @state.error_recovery = false
        else
          mse = MismatchedSet( nil )
          raise mse
        end



        # --> action
        print " #{attr_name.text.colorize(:magenta)}"
        # <-- action

        match( DOWN, nil )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_attr_763 )
        attr_svalue
        @state.following.pop

        match( UP, nil )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 20 )

      end
      
      return 
    end


    # 
    # parser rule attr_svalue
    # 
    # (in HtmlPrinter.g)
    # 113:1: attr_svalue : ^( ASSIGN SVALUE ) ;
    # 
    def attr_svalue
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      __SVALUE14__ = nil

      begin
        # at line 113:14: ^( ASSIGN SVALUE )
        match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_attr_svalue_772 )

        # --> action
        print "=".colorize(:magenta)
        # <-- action

        match( DOWN, nil )
        __SVALUE14__ = match( SVALUE, TOKENS_FOLLOWING_SVALUE_IN_attr_svalue_776 )
        # --> action
        print (__SVALUE14__.text).colorize(:magenta)
        # <-- action

        match( UP, nil )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 21 )

      end
      
      return 
    end



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA6 < ANTLR3::DFA
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
        unpack( 1, 6, 1, 5, 1, -1, 1, 5, 6, -1, 1, 5, 21, -1, 14, 4, 1, 
                 -1, 1, 4, 4, -1, 1, 4 ),
        unpack( 1, 7 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 8 ),
        unpack( 1, 9 ),
        unpack( 1, 10 ),
        unpack( 1, 11 ),
        unpack( 1, 12 ),
        unpack( 1, 6, 1, 5, 1, -1, 1, 5, 6, -1, 1, 5, 21, -1, 14, 4, 1, 
                 -1, 1, 4, 4, -1, 1, 4 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 6
      

      def description
        <<-'__dfa_description__'.strip!
          49:1: body : ( ^( TAG BODY attrs ( body_content )+ ) | ^( TAG BODY attrs ) );
        __dfa_description__
      end
    end
    class DFA11 < ANTLR3::DFA
      EOT = unpack( 13, -1 )
      EOF = unpack( 13, -1 )
      MIN = unpack( 1, 4, 1, 2, 1, 23, 1, 3, 1, -1, 1, 2, 1, -1, 1, 51, 
                    1, 2, 1, 52, 3, 3 )
      MAX = unpack( 1, 4, 1, 2, 1, 30, 1, 55, 1, -1, 1, 2, 1, -1, 1, 51, 
                    1, 2, 1, 52, 2, 3, 1, 55 )
      ACCEPT = unpack( 4, -1, 1, 1, 1, -1, 1, 2, 6, -1 )
      SPECIAL = unpack( 13, -1 )
      TRANSITION = [
        unpack( 1, 1 ),
        unpack( 1, 2 ),
        unpack( 3, 4, 4, -1, 1, 3 ),
        unpack( 1, 6, 1, 4, 1, -1, 1, 4, 6, -1, 1, 4, 21, -1, 14, 5, 1, 
                 -1, 1, 5, 4, -1, 1, 5 ),
        unpack(  ),
        unpack( 1, 7 ),
        unpack(  ),
        unpack( 1, 8 ),
        unpack( 1, 9 ),
        unpack( 1, 10 ),
        unpack( 1, 11 ),
        unpack( 1, 12 ),
        unpack( 1, 6, 1, 4, 1, -1, 1, 4, 6, -1, 1, 4, 21, -1, 14, 5, 1, 
                 -1, 1, 5, 4, -1, 1, 5 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 11
      

      def description
        <<-'__dfa_description__'.strip!
          74:1: text_tag : ( ^( TAG tag_name= ( U | I | B | A ) attrs text ) | ^( TAG tag_name= ( A ) attrs ) );
        __dfa_description__
      end
    end
    class DFA14 < ANTLR3::DFA
      EOT = unpack( 13, -1 )
      EOF = unpack( 13, -1 )
      MIN = unpack( 1, 4, 1, 2, 1, 15, 1, 3, 1, 2, 2, -1, 1, 51, 1, 2, 1, 
                    52, 3, 3 )
      MAX = unpack( 1, 4, 1, 2, 1, 20, 1, 55, 1, 2, 2, -1, 1, 51, 1, 2, 
                    1, 52, 2, 3, 1, 55 )
      ACCEPT = unpack( 5, -1, 1, 1, 1, 2, 6, -1 )
      SPECIAL = unpack( 13, -1 )
      TRANSITION = [
        unpack( 1, 1 ),
        unpack( 1, 2 ),
        unpack( 6, 3 ),
        unpack( 1, 6, 1, 5, 1, -1, 1, 5, 6, -1, 1, 5, 21, -1, 14, 4, 1, 
                 -1, 1, 4, 4, -1, 1, 4 ),
        unpack( 1, 7 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 8 ),
        unpack( 1, 9 ),
        unpack( 1, 10 ),
        unpack( 1, 11 ),
        unpack( 1, 12 ),
        unpack( 1, 6, 1, 5, 1, -1, 1, 5, 6, -1, 1, 5, 21, -1, 14, 4, 1, 
                 -1, 1, 4, 4, -1, 1, 4 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 14
      

      def description
        <<-'__dfa_description__'.strip!
          87:1: heading : ( ^( TAG tag_name= ( H1 | H2 | H3 | H4 | H5 | H6 ) attrs ( heading_data )+ ) | ^( TAG tag_name= ( H1 | H2 | H3 | H4 | H5 | H6 ) attrs ) );
        __dfa_description__
      end
    end
    class DFA17 < ANTLR3::DFA
      EOT = unpack( 13, -1 )
      EOF = unpack( 13, -1 )
      MIN = unpack( 1, 4, 1, 2, 1, 21, 1, 3, 1, 2, 2, -1, 1, 51, 1, 2, 1, 
                    52, 3, 3 )
      MAX = unpack( 1, 4, 1, 2, 1, 21, 1, 55, 1, 2, 2, -1, 1, 51, 1, 2, 
                    1, 52, 2, 3, 1, 55 )
      ACCEPT = unpack( 5, -1, 1, 1, 1, 2, 6, -1 )
      SPECIAL = unpack( 13, -1 )
      TRANSITION = [
        unpack( 1, 1 ),
        unpack( 1, 2 ),
        unpack( 1, 3 ),
        unpack( 1, 6, 1, 5, 1, -1, 1, 5, 6, -1, 1, 5, 21, -1, 14, 4, 1, 
                 -1, 1, 4, 4, -1, 1, 4 ),
        unpack( 1, 7 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 8 ),
        unpack( 1, 9 ),
        unpack( 1, 10 ),
        unpack( 1, 11 ),
        unpack( 1, 12 ),
        unpack( 1, 6, 1, 5, 1, -1, 1, 5, 6, -1, 1, 5, 21, -1, 14, 4, 1, 
                 -1, 1, 4, 4, -1, 1, 4 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 17
      

      def description
        <<-'__dfa_description__'.strip!
          100:1: paragraph : ( ^( TAG P attrs text ) | ^( TAG P attrs ) );
        __dfa_description__
      end
    end
    class DFA19 < ANTLR3::DFA
      EOT = unpack( 13, -1 )
      EOF = unpack( 13, -1 )
      MIN = unpack( 1, 4, 1, 2, 1, 22, 1, 3, 1, 2, 2, -1, 1, 51, 1, 2, 1, 
                    52, 3, 3 )
      MAX = unpack( 1, 4, 1, 2, 1, 22, 1, 55, 1, 2, 2, -1, 1, 51, 1, 2, 
                    1, 52, 2, 3, 1, 55 )
      ACCEPT = unpack( 5, -1, 1, 1, 1, 2, 6, -1 )
      SPECIAL = unpack( 13, -1 )
      TRANSITION = [
        unpack( 1, 1 ),
        unpack( 1, 2 ),
        unpack( 1, 3 ),
        unpack( 1, 6, 1, 5, 1, -1, 1, 5, 6, -1, 1, 5, 21, -1, 14, 4, 1, 
                 -1, 1, 4, 4, -1, 1, 4 ),
        unpack( 1, 7 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 8 ),
        unpack( 1, 9 ),
        unpack( 1, 10 ),
        unpack( 1, 11 ),
        unpack( 1, 12 ),
        unpack( 1, 6, 1, 5, 1, -1, 1, 5, 6, -1, 1, 5, 21, -1, 14, 4, 1, 
                 -1, 1, 4, 4, -1, 1, 4 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 19
      

      def description
        <<-'__dfa_description__'.strip!
          105:1: div : ( ^( TAG DIV attrs ( body_content )+ ) | ^( TAG DIV attrs ) );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa6 = DFA6.new( self, 6 )
      @dfa11 = DFA11.new( self, 11 )
      @dfa14 = DFA14.new( self, 14 )
      @dfa17 = DFA17.new( self, 17 )
      @dfa19 = DFA19.new( self, 19 )

    end
    TOKENS_FOLLOWING_html_IN_document_48 = Set[ 1 ]
    TOKENS_FOLLOWING_TAG_IN_html_60 = Set[ 2 ]
    TOKENS_FOLLOWING_HTML_IN_html_62 = Set[ 3, 4 ]
    TOKENS_FOLLOWING_head_IN_html_66 = Set[ 3, 4 ]
    TOKENS_FOLLOWING_body_IN_html_69 = Set[ 3 ]
    TOKENS_FOLLOWING_TAG_IN_head_81 = Set[ 2 ]
    TOKENS_FOLLOWING_HEAD_IN_head_83 = Set[ 4 ]
    TOKENS_FOLLOWING_title_element_IN_head_87 = Set[ 3 ]
    TOKENS_FOLLOWING_TAG_IN_head_99 = Set[ 2 ]
    TOKENS_FOLLOWING_HEAD_IN_head_101 = Set[ 3 ]
    TOKENS_FOLLOWING_title_IN_title_element_118 = Set[ 1 ]
    TOKENS_FOLLOWING_TAG_IN_title_126 = Set[ 2 ]
    TOKENS_FOLLOWING_TITLE_IN_title_128 = Set[ 6, 13 ]
    TOKENS_FOLLOWING_pcdata_IN_title_131 = Set[ 3 ]
    TOKENS_FOLLOWING_TAG_IN_title_143 = Set[ 2 ]
    TOKENS_FOLLOWING_TITLE_IN_title_145 = Set[ 3 ]
    TOKENS_FOLLOWING_TAG_IN_body_167 = Set[ 2 ]
    TOKENS_FOLLOWING_BODY_IN_body_169 = Set[ 4, 6, 13, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 50, 55 ]
    TOKENS_FOLLOWING_attrs_IN_body_173 = Set[ 4, 6, 13, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 50, 55 ]
    TOKENS_FOLLOWING_body_content_IN_body_177 = Set[ 3, 4, 6, 13, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 50, 55 ]
    TOKENS_FOLLOWING_TAG_IN_body_189 = Set[ 2 ]
    TOKENS_FOLLOWING_BODY_IN_body_191 = Set[ 3, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 50, 55 ]
    TOKENS_FOLLOWING_attrs_IN_body_195 = Set[ 3 ]
    TOKENS_FOLLOWING_text_IN_body_content_214 = Set[ 1 ]
    TOKENS_FOLLOWING_body_tag_IN_body_content_220 = Set[ 1 ]
    TOKENS_FOLLOWING_pcdata_IN_text_236 = Set[ 1 ]
    TOKENS_FOLLOWING_text_tags_IN_text_242 = Set[ 1 ]
    TOKENS_FOLLOWING_DATA_IN_pcdata_255 = Set[ 2 ]
    TOKENS_FOLLOWING_PCDATA_IN_pcdata_257 = Set[ 3 ]
    TOKENS_FOLLOWING_PCDATA_IN_pcdata_270 = Set[ 1 ]
    TOKENS_FOLLOWING_text_tag_IN_text_tags_291 = Set[ 1 ]
    TOKENS_FOLLOWING_special_IN_text_tags_297 = Set[ 1 ]
    TOKENS_FOLLOWING_TAG_IN_text_tag_310 = Set[ 2 ]
    TOKENS_FOLLOWING_set_IN_text_tag_314 = Set[ 4, 6, 13, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 50, 55 ]
    TOKENS_FOLLOWING_attrs_IN_text_tag_326 = Set[ 4, 6, 13 ]
    TOKENS_FOLLOWING_text_IN_text_tag_330 = Set[ 3 ]
    TOKENS_FOLLOWING_TAG_IN_text_tag_346 = Set[ 2 ]
    TOKENS_FOLLOWING_A_IN_text_tag_351 = Set[ 3, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 50, 55 ]
    TOKENS_FOLLOWING_attrs_IN_text_tag_356 = Set[ 3 ]
    TOKENS_FOLLOWING_TAG_IN_special_382 = Set[ 2 ]
    TOKENS_FOLLOWING_set_IN_special_386 = Set[ 3, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 50, 55 ]
    TOKENS_FOLLOWING_attrs_IN_special_394 = Set[ 3 ]
    TOKENS_FOLLOWING_heading_IN_body_tag_412 = Set[ 1 ]
    TOKENS_FOLLOWING_block_IN_body_tag_419 = Set[ 1 ]
    TOKENS_FOLLOWING_TAG_IN_heading_432 = Set[ 2 ]
    TOKENS_FOLLOWING_set_IN_heading_436 = Set[ 4, 6, 13, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 50, 55 ]
    TOKENS_FOLLOWING_attrs_IN_heading_452 = Set[ 4, 6, 13, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 50, 55 ]
    TOKENS_FOLLOWING_heading_data_IN_heading_456 = Set[ 3, 4, 6, 13, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 50, 55 ]
    TOKENS_FOLLOWING_TAG_IN_heading_473 = Set[ 2 ]
    TOKENS_FOLLOWING_set_IN_heading_477 = Set[ 3, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 50, 55 ]
    TOKENS_FOLLOWING_attrs_IN_heading_493 = Set[ 3 ]
    TOKENS_FOLLOWING_block_IN_heading_data_525 = Set[ 1 ]
    TOKENS_FOLLOWING_text_IN_heading_data_542 = Set[ 1 ]
    TOKENS_FOLLOWING_paragraph_IN_block_574 = Set[ 1 ]
    TOKENS_FOLLOWING_div_IN_block_585 = Set[ 1 ]
    TOKENS_FOLLOWING_TAG_IN_paragraph_619 = Set[ 2 ]
    TOKENS_FOLLOWING_P_IN_paragraph_621 = Set[ 4, 6, 13, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 50, 55 ]
    TOKENS_FOLLOWING_attrs_IN_paragraph_625 = Set[ 4, 6, 13 ]
    TOKENS_FOLLOWING_text_IN_paragraph_629 = Set[ 3 ]
    TOKENS_FOLLOWING_TAG_IN_paragraph_645 = Set[ 2 ]
    TOKENS_FOLLOWING_P_IN_paragraph_647 = Set[ 3, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 50, 55 ]
    TOKENS_FOLLOWING_attrs_IN_paragraph_651 = Set[ 3 ]
    TOKENS_FOLLOWING_TAG_IN_div_674 = Set[ 2 ]
    TOKENS_FOLLOWING_DIV_IN_div_676 = Set[ 4, 6, 13, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 50, 55 ]
    TOKENS_FOLLOWING_attrs_IN_div_680 = Set[ 4, 6, 13, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 50, 55 ]
    TOKENS_FOLLOWING_body_content_IN_div_684 = Set[ 3, 4, 6, 13, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 50, 55 ]
    TOKENS_FOLLOWING_TAG_IN_div_695 = Set[ 2 ]
    TOKENS_FOLLOWING_DIV_IN_div_697 = Set[ 3, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 50, 55 ]
    TOKENS_FOLLOWING_attrs_IN_div_701 = Set[ 3 ]
    TOKENS_FOLLOWING_attr_IN_attrs_716 = Set[ 1, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 50, 55 ]
    TOKENS_FOLLOWING_set_IN_attr_727 = Set[ 2 ]
    TOKENS_FOLLOWING_attr_svalue_IN_attr_763 = Set[ 3 ]
    TOKENS_FOLLOWING_ASSIGN_IN_attr_svalue_772 = Set[ 2 ]
    TOKENS_FOLLOWING_SVALUE_IN_attr_svalue_776 = Set[ 3 ]

  end # class TreeParser < ANTLR3::TreeParser

  at_exit { TreeParser.main( ARGV ) } if __FILE__ == $0
end

