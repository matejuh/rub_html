#!/usr/bin/env ruby
#
# ../lib/htmlparser/HtmlPrinter.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: ../lib/htmlparser/HtmlPrinter.g
# Generated at: 2011-12-25 02:23:08
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
    define_tokens( :END_TAG => 8, :CLASS => 36, :BORDERCOLOR => 44, :LETTER => 52, 
                   :HEAD => 10, :HREF => 47, :TABLE => 26, :VALIGN => 45, 
                   :HTML => 7, :ID => 34, :EOF => -1, :BORDER => 46, :PCDATA => 12, 
                   :NAME => 54, :BACKGROUND => 38, :ALT => 41, :BODY => 13, 
                   :DIGIT => 55, :ALIGN => 39, :IMG => 31, :TD => 29, :A => 30, 
                   :BR => 33, :B => 24, :TH => 28, :HEIGHT => 43, :ANAME => 48, 
                   :I => 23, :TR => 27, :SRC => 40, :U => 25, :P => 20, 
                   :TARGET => 49, :END_NOPAIR_TAG => 32, :TAG => 4, :NAMECHAR => 53, 
                   :BGCOLOR => 37, :CLOSING_TAG => 9, :SVALUE => 51, :WS => 22, 
                   :WIDTH => 42, :ASSIGN => 50, :STYLE => 35, :H6 => 19, 
                   :H5 => 18, :H4 => 17, :H3 => 16, :H2 => 15, :H1 => 14, 
                   :DIV => 21, :OPENING_TAG => 6, :DATA => 5, :TITLE => 11 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "TAG", "DATA", "OPENING_TAG", "HTML", "END_TAG", "CLOSING_TAG", 
                    "HEAD", "TITLE", "PCDATA", "BODY", "H1", "H2", "H3", 
                    "H4", "H5", "H6", "P", "DIV", "WS", "I", "B", "U", "TABLE", 
                    "TR", "TH", "TD", "A", "IMG", "END_NOPAIR_TAG", "BR", 
                    "ID", "STYLE", "CLASS", "BGCOLOR", "BACKGROUND", "ALIGN", 
                    "SRC", "ALT", "WIDTH", "HEIGHT", "BORDERCOLOR", "VALIGN", 
                    "BORDER", "HREF", "ANAME", "TARGET", "ASSIGN", "SVALUE", 
                    "LETTER", "NAMECHAR", "NAME", "DIGIT" )
    
  end


  class TreeParser < ANTLR3::TreeParser
    @grammar_home = HtmlPrinter

    RULE_METHODS = [ :document, :html, :head, :title_element, :title, :body, 
                     :body_content, :text, :pcdata, :text_tags, :text_tag, 
                     :special, :body_tag, :heading, :heading_data, :block, 
                     :paragraph, :div, :table, :tr, :tr_data, :attrs, :attr, 
                     :attr_svalue ].freeze


    include TokenData

    begin
      generated_using( "../lib/htmlparser/HtmlPrinter.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
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
        print ">".colorize(:green)
      end
      
      def putsEndTag(tag)
        puts "</#{tag.text}>".colorize(:green)
      end

    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -

    # 
    # parser rule document
    # 
    # (in ../lib/htmlparser/HtmlPrinter.g)
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
    # (in ../lib/htmlparser/HtmlPrinter.g)
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
    # (in ../lib/htmlparser/HtmlPrinter.g)
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
    # (in ../lib/htmlparser/HtmlPrinter.g)
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
    # (in ../lib/htmlparser/HtmlPrinter.g)
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
    # (in ../lib/htmlparser/HtmlPrinter.g)
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

            if ( look_5_0.between?( TAG, DATA ) || look_5_0 == PCDATA )
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
    # (in ../lib/htmlparser/HtmlPrinter.g)
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
            elsif ( look_7_3.between?( H1, DIV ) || look_7_3 == TABLE )
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
    # (in ../lib/htmlparser/HtmlPrinter.g)
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
    # (in ../lib/htmlparser/HtmlPrinter.g)
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
    # (in ../lib/htmlparser/HtmlPrinter.g)
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
    # (in ../lib/htmlparser/HtmlPrinter.g)
    # 74:1: text_tag : ( ^( TAG tag_name= ( U | I | B | A ) attrs ( text )+ ) | ^( TAG tag_name= ( A ) attrs ) );
    # 
    def text_tag
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )
      tag_name = nil

      begin
        # at line 74:10: ( ^( TAG tag_name= ( U | I | B | A ) attrs ( text )+ ) | ^( TAG tag_name= ( A ) attrs ) )
        alt_12 = 2
        alt_12 = @dfa12.predict( @input )
        case alt_12
        when 1
          # at line 74:12: ^( TAG tag_name= ( U | I | B | A ) attrs ( text )+ )
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
          # at file 74:92: ( text )+
          match_count_11 = 0
          while true
            alt_11 = 2
            look_11_0 = @input.peek( 1 )

            if ( look_11_0.between?( TAG, DATA ) || look_11_0 == PCDATA )
              alt_11 = 1

            end
            case alt_11
            when 1
              # at line 74:92: text
              @state.following.push( TOKENS_FOLLOWING_text_IN_text_tag_330 )
              text
              @state.following.pop

            else
              match_count_11 > 0 and break
              eee = EarlyExit(11)


              raise eee
            end
            match_count_11 += 1
          end


          match( UP, nil )
          # --> action
          printEndTag(tag_name);
          # <-- action

        when 2
          # at line 75:12: ^( TAG tag_name= ( A ) attrs )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_text_tag_347 )

          match( DOWN, nil )
          # at line 75:27: ( A )
          # at line 75:28: A
          match( A, TOKENS_FOLLOWING_A_IN_text_tag_352 )

          # --> action
          printStartTag(tag_name);
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_attrs_IN_text_tag_357 )
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
    # (in ../lib/htmlparser/HtmlPrinter.g)
    # 78:1: special : ^( TAG tag_name= ( IMG | BR ) attrs ) ;
    # 
    def special
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
      tag_name = nil

      begin
        # at line 79:5: ^( TAG tag_name= ( IMG | BR ) attrs )
        match( TAG, TOKENS_FOLLOWING_TAG_IN_special_383 )

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
        @state.following.push( TOKENS_FOLLOWING_attrs_IN_special_395 )
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
    # (in ../lib/htmlparser/HtmlPrinter.g)
    # 87:1: body_tag : ( heading | block );
    # 
    def body_tag
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )

      begin
        # at line 88:3: ( heading | block )
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0 == TAG )
          look_13_1 = @input.peek( 2 )

          if ( look_13_1 == DOWN )
            look_13_2 = @input.peek( 3 )

            if ( look_13_2.between?( H1, H6 ) )
              alt_13 = 1
            elsif ( look_13_2.between?( P, DIV ) || look_13_2 == TABLE )
              alt_13 = 2
            else
              raise NoViableAlternative( "", 13, 2 )
            end
          else
            raise NoViableAlternative( "", 13, 1 )
          end
        else
          raise NoViableAlternative( "", 13, 0 )
        end
        case alt_13
        when 1
          # at line 88:5: heading
          @state.following.push( TOKENS_FOLLOWING_heading_IN_body_tag_434 )
          heading
          @state.following.pop

        when 2
          # at line 89:5: block
          @state.following.push( TOKENS_FOLLOWING_block_IN_body_tag_441 )
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
    # (in ../lib/htmlparser/HtmlPrinter.g)
    # 92:1: heading : ( ^( TAG tag_name= ( H1 | H2 | H3 | H4 | H5 | H6 ) attrs ( heading_data )+ ) | ^( TAG tag_name= ( H1 | H2 | H3 | H4 | H5 | H6 ) attrs ) );
    # 
    def heading
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
      tag_name = nil

      begin
        # at line 92:10: ( ^( TAG tag_name= ( H1 | H2 | H3 | H4 | H5 | H6 ) attrs ( heading_data )+ ) | ^( TAG tag_name= ( H1 | H2 | H3 | H4 | H5 | H6 ) attrs ) )
        alt_15 = 2
        alt_15 = @dfa15.predict( @input )
        case alt_15
        when 1
          # at line 92:12: ^( TAG tag_name= ( H1 | H2 | H3 | H4 | H5 | H6 ) attrs ( heading_data )+ )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_heading_454 )

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
          @state.following.push( TOKENS_FOLLOWING_attrs_IN_heading_474 )
          attrs
          @state.following.pop
          # --> action
          putsEndingBracket;
          # <-- action
          # at file 92:102: ( heading_data )+
          match_count_14 = 0
          while true
            alt_14 = 2
            look_14_0 = @input.peek( 1 )

            if ( look_14_0.between?( TAG, DATA ) || look_14_0 == PCDATA )
              alt_14 = 1

            end
            case alt_14
            when 1
              # at line 92:102: heading_data
              @state.following.push( TOKENS_FOLLOWING_heading_data_IN_heading_478 )
              heading_data
              @state.following.pop

            else
              match_count_14 > 0 and break
              eee = EarlyExit(14)


              raise eee
            end
            match_count_14 += 1
          end


          match( UP, nil )
          # --> action
          printEndTag(tag_name);
          # <-- action

        when 2
          # at line 93:12: ^( TAG tag_name= ( H1 | H2 | H3 | H4 | H5 | H6 ) attrs )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_heading_495 )

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
          @state.following.push( TOKENS_FOLLOWING_attrs_IN_heading_515 )
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
    # (in ../lib/htmlparser/HtmlPrinter.g)
    # 96:1: heading_data : ( block | text );
    # 
    def heading_data
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )

      begin
        # at line 96:14: ( block | text )
        alt_16 = 2
        look_16_0 = @input.peek( 1 )

        if ( look_16_0 == TAG )
          look_16_1 = @input.peek( 2 )

          if ( look_16_1 == DOWN )
            look_16_3 = @input.peek( 3 )

            if ( look_16_3.between?( P, DIV ) || look_16_3 == TABLE )
              alt_16 = 1
            elsif ( look_16_3.between?( I, U ) || look_16_3.between?( A, IMG ) || look_16_3 == BR )
              alt_16 = 2
            else
              raise NoViableAlternative( "", 16, 3 )
            end
          else
            raise NoViableAlternative( "", 16, 1 )
          end
        elsif ( look_16_0 == DATA || look_16_0 == PCDATA )
          alt_16 = 2
        else
          raise NoViableAlternative( "", 16, 0 )
        end
        case alt_16
        when 1
          # at line 96:16: block
          @state.following.push( TOKENS_FOLLOWING_block_IN_heading_data_547 )
          block
          @state.following.pop

        when 2
          # at line 97:16: text
          @state.following.push( TOKENS_FOLLOWING_text_IN_heading_data_564 )
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
    # (in ../lib/htmlparser/HtmlPrinter.g)
    # 100:1: block : ( paragraph | div | table );
    # 
    def block
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )

      begin
        # at line 100:8: ( paragraph | div | table )
        alt_17 = 3
        look_17_0 = @input.peek( 1 )

        if ( look_17_0 == TAG )
          look_17_1 = @input.peek( 2 )

          if ( look_17_1 == DOWN )
            case look_17 = @input.peek( 3 )
            when P then alt_17 = 1
            when DIV then alt_17 = 2
            when TABLE then alt_17 = 3
            else
              raise NoViableAlternative( "", 17, 2 )
            end
          else
            raise NoViableAlternative( "", 17, 1 )
          end
        else
          raise NoViableAlternative( "", 17, 0 )
        end
        case alt_17
        when 1
          # at line 100:10: paragraph
          @state.following.push( TOKENS_FOLLOWING_paragraph_IN_block_596 )
          paragraph
          @state.following.pop

        when 2
          # at line 101:10: div
          @state.following.push( TOKENS_FOLLOWING_div_IN_block_607 )
          div
          @state.following.pop

        when 3
          # at line 102:10: table
          @state.following.push( TOKENS_FOLLOWING_table_IN_block_618 )
          table
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
    # (in ../lib/htmlparser/HtmlPrinter.g)
    # 105:1: paragraph : ( ^( TAG P attrs ( text )+ ) | ^( TAG P attrs ) );
    # 
    def paragraph
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      __P10__ = nil
      __P11__ = nil

      begin
        # at line 106:10: ( ^( TAG P attrs ( text )+ ) | ^( TAG P attrs ) )
        alt_19 = 2
        alt_19 = @dfa19.predict( @input )
        case alt_19
        when 1
          # at line 106:12: ^( TAG P attrs ( text )+ )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_paragraph_651 )

          match( DOWN, nil )
          __P10__ = match( P, TOKENS_FOLLOWING_P_IN_paragraph_653 )
          # --> action
          printStartTag(__P10__);
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_attrs_IN_paragraph_657 )
          attrs
          @state.following.pop
          # --> action
          putsEndingBracket;
          # <-- action
          # at file 106:68: ( text )+
          match_count_18 = 0
          while true
            alt_18 = 2
            look_18_0 = @input.peek( 1 )

            if ( look_18_0.between?( TAG, DATA ) || look_18_0 == PCDATA )
              alt_18 = 1

            end
            case alt_18
            when 1
              # at line 106:68: text
              @state.following.push( TOKENS_FOLLOWING_text_IN_paragraph_661 )
              text
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
          printEndTag(__P10__);
          # <-- action

        when 2
          # at line 107:12: ^( TAG P attrs )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_paragraph_678 )

          match( DOWN, nil )
          __P11__ = match( P, TOKENS_FOLLOWING_P_IN_paragraph_680 )
          # --> action
          printStartTag(__P11__);
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_attrs_IN_paragraph_684 )
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
    # (in ../lib/htmlparser/HtmlPrinter.g)
    # 110:1: div : ( ^( TAG DIV attrs ( body_content )+ ) | ^( TAG DIV attrs ) );
    # 
    def div
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      __DIV12__ = nil
      __DIV13__ = nil

      begin
        # at line 110:4: ( ^( TAG DIV attrs ( body_content )+ ) | ^( TAG DIV attrs ) )
        alt_21 = 2
        alt_21 = @dfa21.predict( @input )
        case alt_21
        when 1
          # at line 110:6: ^( TAG DIV attrs ( body_content )+ )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_div_707 )

          match( DOWN, nil )
          __DIV12__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_div_709 )
          # --> action
          printStartTag(__DIV12__);
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_attrs_IN_div_713 )
          attrs
          @state.following.pop
          # --> action
          putsEndingBracket;
          # <-- action
          # at file 110:66: ( body_content )+
          match_count_20 = 0
          while true
            alt_20 = 2
            look_20_0 = @input.peek( 1 )

            if ( look_20_0.between?( TAG, DATA ) || look_20_0 == PCDATA )
              alt_20 = 1

            end
            case alt_20
            when 1
              # at line 110:66: body_content
              @state.following.push( TOKENS_FOLLOWING_body_content_IN_div_717 )
              body_content
              @state.following.pop

            else
              match_count_20 > 0 and break
              eee = EarlyExit(20)


              raise eee
            end
            match_count_20 += 1
          end


          match( UP, nil )
          # --> action
          printEndTag(__DIV12__);
          # <-- action

        when 2
          # at line 111:6: ^( TAG DIV attrs )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_div_728 )

          match( DOWN, nil )
          __DIV13__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_div_730 )
          # --> action
          printStartTag(__DIV13__);
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_attrs_IN_div_734 )
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
    # parser rule table
    # 
    # (in ../lib/htmlparser/HtmlPrinter.g)
    # 114:1: table : ^( TAG TABLE attrs ( tr )+ ) ;
    # 
    def table
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      __TABLE14__ = nil

      begin
        # at line 114:8: ^( TAG TABLE attrs ( tr )+ )
        match( TAG, TOKENS_FOLLOWING_TAG_IN_table_754 )

        match( DOWN, nil )
        __TABLE14__ = match( TABLE, TOKENS_FOLLOWING_TABLE_IN_table_756 )
        # --> action
        printStartTag(__TABLE14__);
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_attrs_IN_table_760 )
        attrs
        @state.following.pop
        # --> action
        putsEndingBracket;
        # <-- action
        # at file 114:72: ( tr )+
        match_count_22 = 0
        while true
          alt_22 = 2
          look_22_0 = @input.peek( 1 )

          if ( look_22_0 == TAG )
            alt_22 = 1

          end
          case alt_22
          when 1
            # at line 114:72: tr
            @state.following.push( TOKENS_FOLLOWING_tr_IN_table_764 )
            tr
            @state.following.pop

          else
            match_count_22 > 0 and break
            eee = EarlyExit(22)


            raise eee
          end
          match_count_22 += 1
        end


        match( UP, nil )
        # --> action
        printEndTag(__TABLE14__);
        # <-- action

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
    # parser rule tr
    # 
    # (in ../lib/htmlparser/HtmlPrinter.g)
    # 116:1: tr : ( ^( TAG TR ( tr_data )+ ) | ^( TAG TR ) );
    # 
    def tr
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      __TR15__ = nil
      __TR16__ = nil

      begin
        # at line 116:4: ( ^( TAG TR ( tr_data )+ ) | ^( TAG TR ) )
        alt_24 = 2
        look_24_0 = @input.peek( 1 )

        if ( look_24_0 == TAG )
          look_24_1 = @input.peek( 2 )

          if ( look_24_1 == DOWN )
            look_24_2 = @input.peek( 3 )

            if ( look_24_2 == TR )
              look_24_3 = @input.peek( 4 )

              if ( look_24_3 == TAG )
                alt_24 = 1
              elsif ( look_24_3 == UP )
                alt_24 = 2
              else
                raise NoViableAlternative( "", 24, 3 )
              end
            else
              raise NoViableAlternative( "", 24, 2 )
            end
          else
            raise NoViableAlternative( "", 24, 1 )
          end
        else
          raise NoViableAlternative( "", 24, 0 )
        end
        case alt_24
        when 1
          # at line 116:6: ^( TAG TR ( tr_data )+ )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_tr_776 )

          match( DOWN, nil )
          __TR15__ = match( TR, TOKENS_FOLLOWING_TR_IN_tr_778 )
          # --> action
          printStartTag(__TR15__);
          # <-- action
          # --> action
          putsEndingBracket;
          # <-- action
          # at file 116:58: ( tr_data )+
          match_count_23 = 0
          while true
            alt_23 = 2
            look_23_0 = @input.peek( 1 )

            if ( look_23_0 == TAG )
              alt_23 = 1

            end
            case alt_23
            when 1
              # at line 116:58: tr_data
              @state.following.push( TOKENS_FOLLOWING_tr_data_IN_tr_784 )
              tr_data
              @state.following.pop

            else
              match_count_23 > 0 and break
              eee = EarlyExit(23)


              raise eee
            end
            match_count_23 += 1
          end


          match( UP, nil )
          # --> action
          printEndTag(__TR15__);
          # <-- action

        when 2
          # at line 117:6: ^( TAG TR )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_tr_795 )

          match( DOWN, nil )
          __TR16__ = match( TR, TOKENS_FOLLOWING_TR_IN_tr_797 )
          # --> action
          printStartTag(__TR16__);
          # <-- action
          # --> action
          printEndingBracket;
          # <-- action

          match( UP, nil )
          # --> action
          putsEndTag(__TR16__);
          # <-- action

        end
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
    # parser rule tr_data
    # 
    # (in ../lib/htmlparser/HtmlPrinter.g)
    # 120:1: tr_data : ( ^( TAG tag_name= ( TH | TD ) attrs ( body_content )+ ) | ^( TAG tag_name= ( TH | TD ) attrs ) );
    # 
    def tr_data
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      tag_name = nil

      begin
        # at line 120:9: ( ^( TAG tag_name= ( TH | TD ) attrs ( body_content )+ ) | ^( TAG tag_name= ( TH | TD ) attrs ) )
        alt_26 = 2
        alt_26 = @dfa26.predict( @input )
        case alt_26
        when 1
          # at line 120:11: ^( TAG tag_name= ( TH | TD ) attrs ( body_content )+ )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_tr_data_816 )

          match( DOWN, nil )
          tag_name = @input.look
          if @input.peek( 1 ).between?( TH, TD )
            @input.consume
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          # --> action
          printStartTag(tag_name);
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_attrs_IN_tr_data_828 )
          attrs
          @state.following.pop
          # --> action
          putsEndingBracket;
          # <-- action
          # at file 120:89: ( body_content )+
          match_count_25 = 0
          while true
            alt_25 = 2
            look_25_0 = @input.peek( 1 )

            if ( look_25_0.between?( TAG, DATA ) || look_25_0 == PCDATA )
              alt_25 = 1

            end
            case alt_25
            when 1
              # at line 120:89: body_content
              @state.following.push( TOKENS_FOLLOWING_body_content_IN_tr_data_832 )
              body_content
              @state.following.pop

            else
              match_count_25 > 0 and break
              eee = EarlyExit(25)


              raise eee
            end
            match_count_25 += 1
          end


          match( UP, nil )
          # --> action
          printEndTag(tag_name);
          # <-- action

        when 2
          # at line 121:11: ^( TAG tag_name= ( TH | TD ) attrs )
          match( TAG, TOKENS_FOLLOWING_TAG_IN_tr_data_848 )

          match( DOWN, nil )
          tag_name = @input.look
          if @input.peek( 1 ).between?( TH, TD )
            @input.consume
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          # --> action
          printStartTag(tag_name);
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_attrs_IN_tr_data_860 )
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
        # trace_out( __method__, 21 )

      end
      
      return 
    end


    # 
    # parser rule attrs
    # 
    # (in ../lib/htmlparser/HtmlPrinter.g)
    # 124:1: attrs : ( attr )* ;
    # 
    def attrs
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )

      begin
        # at line 124:7: ( attr )*
        # at line 124:7: ( attr )*
        while true # decision 27
          alt_27 = 2
          look_27_0 = @input.peek( 1 )

          if ( look_27_0.between?( ID, TARGET ) )
            alt_27 = 1

          end
          case alt_27
          when 1
            # at line 124:7: attr
            @state.following.push( TOKENS_FOLLOWING_attr_IN_attrs_880 )
            attr
            @state.following.pop

          else
            break # out of loop for decision 27
          end
        end # loop for decision 27

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 22 )

      end
      
      return 
    end


    # 
    # parser rule attr
    # 
    # (in ../lib/htmlparser/HtmlPrinter.g)
    # 126:1: attr : ^(attr_name= ( ID | STYLE | CLASS | BGCOLOR | BACKGROUND | ALIGN | SRC | ALT | WIDTH | HEIGHT | BORDERCOLOR | VALIGN | BORDER | HREF | ANAME | TARGET ) attr_svalue ) ;
    # 
    def attr
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      attr_name = nil

      begin
        # at line 126:7: ^(attr_name= ( ID | STYLE | CLASS | BGCOLOR | BACKGROUND | ALIGN | SRC | ALT | WIDTH | HEIGHT | BORDERCOLOR | VALIGN | BORDER | HREF | ANAME | TARGET ) attr_svalue )
        attr_name = @input.look
        if @input.peek( 1 ).between?( ID, TARGET )
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
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_attr_927 )
        attr_svalue
        @state.following.pop

        match( UP, nil )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 23 )

      end
      
      return 
    end


    # 
    # parser rule attr_svalue
    # 
    # (in ../lib/htmlparser/HtmlPrinter.g)
    # 128:1: attr_svalue : ^( ASSIGN SVALUE ) ;
    # 
    def attr_svalue
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      __SVALUE17__ = nil

      begin
        # at line 128:14: ^( ASSIGN SVALUE )
        match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_attr_svalue_936 )

        # --> action
        print "=".colorize(:magenta)
        # <-- action

        match( DOWN, nil )
        __SVALUE17__ = match( SVALUE, TOKENS_FOLLOWING_SVALUE_IN_attr_svalue_940 )
        # --> action
        print (__SVALUE17__.text).colorize(:magenta)
        # <-- action

        match( UP, nil )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 24 )

      end
      
      return 
    end



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA6 < ANTLR3::DFA
      EOT = unpack( 13, -1 )
      EOF = unpack( 13, -1 )
      MIN = unpack( 1, 4, 1, 2, 1, 13, 1, 3, 1, 2, 2, -1, 1, 50, 1, 2, 1, 
                    51, 3, 3 )
      MAX = unpack( 1, 4, 1, 2, 1, 13, 1, 49, 1, 2, 2, -1, 1, 50, 1, 2, 
                    1, 51, 2, 3, 1, 49 )
      ACCEPT = unpack( 5, -1, 1, 1, 1, 2, 6, -1 )
      SPECIAL = unpack( 13, -1 )
      TRANSITION = [
        unpack( 1, 1 ),
        unpack( 1, 2 ),
        unpack( 1, 3 ),
        unpack( 1, 6, 2, 5, 6, -1, 1, 5, 21, -1, 16, 4 ),
        unpack( 1, 7 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 8 ),
        unpack( 1, 9 ),
        unpack( 1, 10 ),
        unpack( 1, 11 ),
        unpack( 1, 12 ),
        unpack( 1, 6, 2, 5, 6, -1, 1, 5, 21, -1, 16, 4 )
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
    class DFA12 < ANTLR3::DFA
      EOT = unpack( 13, -1 )
      EOF = unpack( 13, -1 )
      MIN = unpack( 1, 4, 1, 2, 1, 23, 1, 3, 1, -1, 1, 2, 1, -1, 1, 50, 
                    1, 2, 1, 51, 3, 3 )
      MAX = unpack( 1, 4, 1, 2, 1, 30, 1, 49, 1, -1, 1, 2, 1, -1, 1, 50, 
                    1, 2, 1, 51, 2, 3, 1, 49 )
      ACCEPT = unpack( 4, -1, 1, 1, 1, -1, 1, 2, 6, -1 )
      SPECIAL = unpack( 13, -1 )
      TRANSITION = [
        unpack( 1, 1 ),
        unpack( 1, 2 ),
        unpack( 3, 4, 4, -1, 1, 3 ),
        unpack( 1, 6, 2, 4, 6, -1, 1, 4, 21, -1, 16, 5 ),
        unpack(  ),
        unpack( 1, 7 ),
        unpack(  ),
        unpack( 1, 8 ),
        unpack( 1, 9 ),
        unpack( 1, 10 ),
        unpack( 1, 11 ),
        unpack( 1, 12 ),
        unpack( 1, 6, 2, 4, 6, -1, 1, 4, 21, -1, 16, 5 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 12
      

      def description
        <<-'__dfa_description__'.strip!
          74:1: text_tag : ( ^( TAG tag_name= ( U | I | B | A ) attrs ( text )+ ) | ^( TAG tag_name= ( A ) attrs ) );
        __dfa_description__
      end
    end
    class DFA15 < ANTLR3::DFA
      EOT = unpack( 13, -1 )
      EOF = unpack( 13, -1 )
      MIN = unpack( 1, 4, 1, 2, 1, 14, 1, 3, 1, 2, 2, -1, 1, 50, 1, 2, 1, 
                    51, 3, 3 )
      MAX = unpack( 1, 4, 1, 2, 1, 19, 1, 49, 1, 2, 2, -1, 1, 50, 1, 2, 
                    1, 51, 2, 3, 1, 49 )
      ACCEPT = unpack( 5, -1, 1, 1, 1, 2, 6, -1 )
      SPECIAL = unpack( 13, -1 )
      TRANSITION = [
        unpack( 1, 1 ),
        unpack( 1, 2 ),
        unpack( 6, 3 ),
        unpack( 1, 6, 2, 5, 6, -1, 1, 5, 21, -1, 16, 4 ),
        unpack( 1, 7 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 8 ),
        unpack( 1, 9 ),
        unpack( 1, 10 ),
        unpack( 1, 11 ),
        unpack( 1, 12 ),
        unpack( 1, 6, 2, 5, 6, -1, 1, 5, 21, -1, 16, 4 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 15
      

      def description
        <<-'__dfa_description__'.strip!
          92:1: heading : ( ^( TAG tag_name= ( H1 | H2 | H3 | H4 | H5 | H6 ) attrs ( heading_data )+ ) | ^( TAG tag_name= ( H1 | H2 | H3 | H4 | H5 | H6 ) attrs ) );
        __dfa_description__
      end
    end
    class DFA19 < ANTLR3::DFA
      EOT = unpack( 13, -1 )
      EOF = unpack( 13, -1 )
      MIN = unpack( 1, 4, 1, 2, 1, 20, 1, 3, 1, 2, 2, -1, 1, 50, 1, 2, 1, 
                    51, 3, 3 )
      MAX = unpack( 1, 4, 1, 2, 1, 20, 1, 49, 1, 2, 2, -1, 1, 50, 1, 2, 
                    1, 51, 2, 3, 1, 49 )
      ACCEPT = unpack( 5, -1, 1, 1, 1, 2, 6, -1 )
      SPECIAL = unpack( 13, -1 )
      TRANSITION = [
        unpack( 1, 1 ),
        unpack( 1, 2 ),
        unpack( 1, 3 ),
        unpack( 1, 6, 2, 5, 6, -1, 1, 5, 21, -1, 16, 4 ),
        unpack( 1, 7 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 8 ),
        unpack( 1, 9 ),
        unpack( 1, 10 ),
        unpack( 1, 11 ),
        unpack( 1, 12 ),
        unpack( 1, 6, 2, 5, 6, -1, 1, 5, 21, -1, 16, 4 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 19
      

      def description
        <<-'__dfa_description__'.strip!
          105:1: paragraph : ( ^( TAG P attrs ( text )+ ) | ^( TAG P attrs ) );
        __dfa_description__
      end
    end
    class DFA21 < ANTLR3::DFA
      EOT = unpack( 13, -1 )
      EOF = unpack( 13, -1 )
      MIN = unpack( 1, 4, 1, 2, 1, 21, 1, 3, 1, 2, 2, -1, 1, 50, 1, 2, 1, 
                    51, 3, 3 )
      MAX = unpack( 1, 4, 1, 2, 1, 21, 1, 49, 1, 2, 2, -1, 1, 50, 1, 2, 
                    1, 51, 2, 3, 1, 49 )
      ACCEPT = unpack( 5, -1, 1, 1, 1, 2, 6, -1 )
      SPECIAL = unpack( 13, -1 )
      TRANSITION = [
        unpack( 1, 1 ),
        unpack( 1, 2 ),
        unpack( 1, 3 ),
        unpack( 1, 6, 2, 5, 6, -1, 1, 5, 21, -1, 16, 4 ),
        unpack( 1, 7 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 8 ),
        unpack( 1, 9 ),
        unpack( 1, 10 ),
        unpack( 1, 11 ),
        unpack( 1, 12 ),
        unpack( 1, 6, 2, 5, 6, -1, 1, 5, 21, -1, 16, 4 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 21
      

      def description
        <<-'__dfa_description__'.strip!
          110:1: div : ( ^( TAG DIV attrs ( body_content )+ ) | ^( TAG DIV attrs ) );
        __dfa_description__
      end
    end
    class DFA26 < ANTLR3::DFA
      EOT = unpack( 13, -1 )
      EOF = unpack( 13, -1 )
      MIN = unpack( 1, 4, 1, 2, 1, 28, 1, 3, 1, 2, 2, -1, 1, 50, 1, 2, 1, 
                    51, 3, 3 )
      MAX = unpack( 1, 4, 1, 2, 1, 29, 1, 49, 1, 2, 2, -1, 1, 50, 1, 2, 
                    1, 51, 2, 3, 1, 49 )
      ACCEPT = unpack( 5, -1, 1, 1, 1, 2, 6, -1 )
      SPECIAL = unpack( 13, -1 )
      TRANSITION = [
        unpack( 1, 1 ),
        unpack( 1, 2 ),
        unpack( 2, 3 ),
        unpack( 1, 6, 2, 5, 6, -1, 1, 5, 21, -1, 16, 4 ),
        unpack( 1, 7 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 8 ),
        unpack( 1, 9 ),
        unpack( 1, 10 ),
        unpack( 1, 11 ),
        unpack( 1, 12 ),
        unpack( 1, 6, 2, 5, 6, -1, 1, 5, 21, -1, 16, 4 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 26
      

      def description
        <<-'__dfa_description__'.strip!
          120:1: tr_data : ( ^( TAG tag_name= ( TH | TD ) attrs ( body_content )+ ) | ^( TAG tag_name= ( TH | TD ) attrs ) );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa6 = DFA6.new( self, 6 )
      @dfa12 = DFA12.new( self, 12 )
      @dfa15 = DFA15.new( self, 15 )
      @dfa19 = DFA19.new( self, 19 )
      @dfa21 = DFA21.new( self, 21 )
      @dfa26 = DFA26.new( self, 26 )

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
    TOKENS_FOLLOWING_TITLE_IN_title_128 = Set[ 5, 12 ]
    TOKENS_FOLLOWING_pcdata_IN_title_131 = Set[ 3 ]
    TOKENS_FOLLOWING_TAG_IN_title_143 = Set[ 2 ]
    TOKENS_FOLLOWING_TITLE_IN_title_145 = Set[ 3 ]
    TOKENS_FOLLOWING_TAG_IN_body_167 = Set[ 2 ]
    TOKENS_FOLLOWING_BODY_IN_body_169 = Set[ 4, 5, 12, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ]
    TOKENS_FOLLOWING_attrs_IN_body_173 = Set[ 4, 5, 12, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ]
    TOKENS_FOLLOWING_body_content_IN_body_177 = Set[ 3, 4, 5, 12, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ]
    TOKENS_FOLLOWING_TAG_IN_body_189 = Set[ 2 ]
    TOKENS_FOLLOWING_BODY_IN_body_191 = Set[ 3, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ]
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
    TOKENS_FOLLOWING_set_IN_text_tag_314 = Set[ 4, 5, 12, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ]
    TOKENS_FOLLOWING_attrs_IN_text_tag_326 = Set[ 4, 5, 12 ]
    TOKENS_FOLLOWING_text_IN_text_tag_330 = Set[ 3, 4, 5, 12 ]
    TOKENS_FOLLOWING_TAG_IN_text_tag_347 = Set[ 2 ]
    TOKENS_FOLLOWING_A_IN_text_tag_352 = Set[ 3, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ]
    TOKENS_FOLLOWING_attrs_IN_text_tag_357 = Set[ 3 ]
    TOKENS_FOLLOWING_TAG_IN_special_383 = Set[ 2 ]
    TOKENS_FOLLOWING_set_IN_special_387 = Set[ 3, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ]
    TOKENS_FOLLOWING_attrs_IN_special_395 = Set[ 3 ]
    TOKENS_FOLLOWING_heading_IN_body_tag_434 = Set[ 1 ]
    TOKENS_FOLLOWING_block_IN_body_tag_441 = Set[ 1 ]
    TOKENS_FOLLOWING_TAG_IN_heading_454 = Set[ 2 ]
    TOKENS_FOLLOWING_set_IN_heading_458 = Set[ 4, 5, 12, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ]
    TOKENS_FOLLOWING_attrs_IN_heading_474 = Set[ 4, 5, 12, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ]
    TOKENS_FOLLOWING_heading_data_IN_heading_478 = Set[ 3, 4, 5, 12, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ]
    TOKENS_FOLLOWING_TAG_IN_heading_495 = Set[ 2 ]
    TOKENS_FOLLOWING_set_IN_heading_499 = Set[ 3, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ]
    TOKENS_FOLLOWING_attrs_IN_heading_515 = Set[ 3 ]
    TOKENS_FOLLOWING_block_IN_heading_data_547 = Set[ 1 ]
    TOKENS_FOLLOWING_text_IN_heading_data_564 = Set[ 1 ]
    TOKENS_FOLLOWING_paragraph_IN_block_596 = Set[ 1 ]
    TOKENS_FOLLOWING_div_IN_block_607 = Set[ 1 ]
    TOKENS_FOLLOWING_table_IN_block_618 = Set[ 1 ]
    TOKENS_FOLLOWING_TAG_IN_paragraph_651 = Set[ 2 ]
    TOKENS_FOLLOWING_P_IN_paragraph_653 = Set[ 4, 5, 12, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ]
    TOKENS_FOLLOWING_attrs_IN_paragraph_657 = Set[ 4, 5, 12 ]
    TOKENS_FOLLOWING_text_IN_paragraph_661 = Set[ 3, 4, 5, 12 ]
    TOKENS_FOLLOWING_TAG_IN_paragraph_678 = Set[ 2 ]
    TOKENS_FOLLOWING_P_IN_paragraph_680 = Set[ 3, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ]
    TOKENS_FOLLOWING_attrs_IN_paragraph_684 = Set[ 3 ]
    TOKENS_FOLLOWING_TAG_IN_div_707 = Set[ 2 ]
    TOKENS_FOLLOWING_DIV_IN_div_709 = Set[ 4, 5, 12, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ]
    TOKENS_FOLLOWING_attrs_IN_div_713 = Set[ 4, 5, 12, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ]
    TOKENS_FOLLOWING_body_content_IN_div_717 = Set[ 3, 4, 5, 12, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ]
    TOKENS_FOLLOWING_TAG_IN_div_728 = Set[ 2 ]
    TOKENS_FOLLOWING_DIV_IN_div_730 = Set[ 3, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ]
    TOKENS_FOLLOWING_attrs_IN_div_734 = Set[ 3 ]
    TOKENS_FOLLOWING_TAG_IN_table_754 = Set[ 2 ]
    TOKENS_FOLLOWING_TABLE_IN_table_756 = Set[ 4, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ]
    TOKENS_FOLLOWING_attrs_IN_table_760 = Set[ 4, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ]
    TOKENS_FOLLOWING_tr_IN_table_764 = Set[ 3, 4, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ]
    TOKENS_FOLLOWING_TAG_IN_tr_776 = Set[ 2 ]
    TOKENS_FOLLOWING_TR_IN_tr_778 = Set[ 4 ]
    TOKENS_FOLLOWING_tr_data_IN_tr_784 = Set[ 3, 4 ]
    TOKENS_FOLLOWING_TAG_IN_tr_795 = Set[ 2 ]
    TOKENS_FOLLOWING_TR_IN_tr_797 = Set[ 3 ]
    TOKENS_FOLLOWING_TAG_IN_tr_data_816 = Set[ 2 ]
    TOKENS_FOLLOWING_set_IN_tr_data_820 = Set[ 4, 5, 12, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ]
    TOKENS_FOLLOWING_attrs_IN_tr_data_828 = Set[ 4, 5, 12, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ]
    TOKENS_FOLLOWING_body_content_IN_tr_data_832 = Set[ 3, 4, 5, 12, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ]
    TOKENS_FOLLOWING_TAG_IN_tr_data_848 = Set[ 2 ]
    TOKENS_FOLLOWING_set_IN_tr_data_852 = Set[ 3, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ]
    TOKENS_FOLLOWING_attrs_IN_tr_data_860 = Set[ 3 ]
    TOKENS_FOLLOWING_attr_IN_attrs_880 = Set[ 1, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ]
    TOKENS_FOLLOWING_set_IN_attr_891 = Set[ 2 ]
    TOKENS_FOLLOWING_attr_svalue_IN_attr_927 = Set[ 3 ]
    TOKENS_FOLLOWING_ASSIGN_IN_attr_svalue_936 = Set[ 2 ]
    TOKENS_FOLLOWING_SVALUE_IN_attr_svalue_940 = Set[ 3 ]

  end # class TreeParser < ANTLR3::TreeParser

  at_exit { TreeParser.main( ARGV ) } if __FILE__ == $0
end

