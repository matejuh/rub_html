#!/usr/bin/env ruby
#
# HtmlParser.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: HtmlParser.g
# Generated at: 2011-12-20 22:29:35
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
    define_tokens( :END_TAG => 6, :CLASS => 34, :BORDERCOLOR => 42, :LETTER => 47, 
                   :HEAD => 8, :TABLE => 23, :VALIGN => 43, :HTML => 5, 
                   :ID => 32, :EOF => -1, :BORDER => 44, :PCDATA => 10, 
                   :NAME => 49, :BACKGROUND => 36, :ALT => 39, :BODY => 11, 
                   :DIGIT => 50, :ALIGN => 37, :IMG => 28, :TD => 26, :A => 27, 
                   :BR => 30, :B => 21, :TH => 25, :HEIGHT => 41, :I => 20, 
                   :TR => 24, :SRC => 38, :U => 22, :P => 18, :END_NOPAIR_TAG => 29, 
                   :NAMECHAR => 48, :BGCOLOR => 35, :CLOSING_TAG => 7, :SVALUE => 46, 
                   :WS => 31, :ASSIGN => 45, :WIDTH => 40, :STYLE => 33, 
                   :H6 => 17, :H5 => 16, :H4 => 15, :H3 => 14, :H2 => 13, 
                   :H1 => 12, :DIV => 19, :OPENING_TAG => 4, :TITLE => 9 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "OPENING_TAG", "HTML", "END_TAG", "CLOSING_TAG", "HEAD", 
                    "TITLE", "PCDATA", "BODY", "H1", "H2", "H3", "H4", "H5", 
                    "H6", "P", "DIV", "I", "B", "U", "TABLE", "TR", "TH", 
                    "TD", "A", "IMG", "END_NOPAIR_TAG", "BR", "WS", "ID", 
                    "STYLE", "CLASS", "BGCOLOR", "BACKGROUND", "ALIGN", 
                    "SRC", "ALT", "WIDTH", "HEIGHT", "BORDERCOLOR", "VALIGN", 
                    "BORDER", "ASSIGN", "SVALUE", "LETTER", "NAMECHAR", 
                    "NAME", "DIGIT" )
    
  end


  class Parser < ANTLR3::Parser
    @grammar_home = HtmlParser
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :document, :head, :head_element, :title, :body, :body_tag, 
                     :body_content, :heading, :block, :font, :special, :text_tag, 
                     :text, :h1, :h2, :h3, :h4, :h5, :h6, :paragraph, :div, 
                     :italic, :bold, :underline, :table, :tr, :th, :td, 
                     :anchor, :img, :br, :id, :style, :klass, :bgcolor, 
                     :background, :align, :src, :alt, :width, :height, :bordercolor, 
                     :valign, :border, :attr_svalue ].freeze


    include TokenData

    begin
      generated_using( "HtmlParser.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end

    def initialize( input, options = {} )
      super( input, options )


    end

      @tagMode = false
      
       def emit_error_message(message)
    	 	puts @stack.pop
    	    puts "Error: " + message
         end

    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -
    DocumentReturnValue = define_return_scope 

    # 
    # parser rule document
    # 
    # (in HtmlParser.g)
    # 20:1: document : OPENING_TAG ohtml= HTML END_TAG ( head )? ( body )? CLOSING_TAG HTML END_TAG ;
    # 
    def document
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )
      return_value = DocumentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      ohtml = nil
      __OPENING_TAG1__ = nil
      __END_TAG2__ = nil
      __CLOSING_TAG5__ = nil
      __HTML6__ = nil
      __END_TAG7__ = nil
      head3 = nil
      body4 = nil

      tree_for_ohtml = nil
      tree_for_OPENING_TAG1 = nil
      tree_for_END_TAG2 = nil
      tree_for_CLOSING_TAG5 = nil
      tree_for_HTML6 = nil
      tree_for_END_TAG7 = nil
      # - - - - @init action - - - -
      @stack=Array.new

      begin
        root_0 = @adaptor.create_flat_list


        # at line 23:5: OPENING_TAG ohtml= HTML END_TAG ( head )? ( body )? CLOSING_TAG HTML END_TAG
        # --> action
        puts "in html doc"
        # <-- action
        __OPENING_TAG1__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_document_56 )

        tree_for_OPENING_TAG1 = @adaptor.create_with_payload( __OPENING_TAG1__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG1 )

        ohtml = match( HTML, TOKENS_FOLLOWING_HTML_IN_document_60 )

        tree_for_ohtml = @adaptor.create_with_payload( ohtml )
        @adaptor.add_child( root_0, tree_for_ohtml )

        # --> action
        @stack << ohtml;
        # <-- action
        __END_TAG2__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_document_64 )

        tree_for_END_TAG2 = @adaptor.create_with_payload( __END_TAG2__ )
        @adaptor.add_child( root_0, tree_for_END_TAG2 )

        # at line 25:3: ( head )?
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
          # at line 25:4: head
          @state.following.push( TOKENS_FOLLOWING_head_IN_document_69 )
          head3 = head
          @state.following.pop
          @adaptor.add_child( root_0, head3.tree )

        end
        # at line 26:3: ( body )?
        alt_2 = 2
        look_2_0 = @input.peek( 1 )

        if ( look_2_0 == OPENING_TAG )
          alt_2 = 1
        end
        case alt_2
        when 1
          # at line 26:4: body
          @state.following.push( TOKENS_FOLLOWING_body_IN_document_76 )
          body4 = body
          @state.following.pop
          @adaptor.add_child( root_0, body4.tree )

        end
        __CLOSING_TAG5__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_document_82 )

        tree_for_CLOSING_TAG5 = @adaptor.create_with_payload( __CLOSING_TAG5__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG5 )

        __HTML6__ = match( HTML, TOKENS_FOLLOWING_HTML_IN_document_84 )

        tree_for_HTML6 = @adaptor.create_with_payload( __HTML6__ )
        @adaptor.add_child( root_0, tree_for_HTML6 )

        # --> action
        puts @stack.pop
        # <-- action
        __END_TAG7__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_document_88 )

        tree_for_END_TAG7 = @adaptor.create_with_payload( __END_TAG7__ )
        @adaptor.add_child( root_0, tree_for_END_TAG7 )

        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )
        # --> action
        puts @stack.pop
        # <-- action
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 1 )

      end
      
      return return_value
    end

    HeadReturnValue = define_return_scope 

    # 
    # parser rule head
    # 
    # (in HtmlParser.g)
    # 30:1: head : OPENING_TAG HEAD END_TAG ( head_element )? CLOSING_TAG HEAD END_TAG ;
    # 
    def head
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )
      return_value = HeadReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG8__ = nil
      __HEAD9__ = nil
      __END_TAG10__ = nil
      __CLOSING_TAG12__ = nil
      __HEAD13__ = nil
      __END_TAG14__ = nil
      head_element11 = nil

      tree_for_OPENING_TAG8 = nil
      tree_for_HEAD9 = nil
      tree_for_END_TAG10 = nil
      tree_for_CLOSING_TAG12 = nil
      tree_for_HEAD13 = nil
      tree_for_END_TAG14 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 30:8: OPENING_TAG HEAD END_TAG ( head_element )? CLOSING_TAG HEAD END_TAG
        __OPENING_TAG8__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_head_98 )

        tree_for_OPENING_TAG8 = @adaptor.create_with_payload( __OPENING_TAG8__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG8 )

        __HEAD9__ = match( HEAD, TOKENS_FOLLOWING_HEAD_IN_head_100 )

        tree_for_HEAD9 = @adaptor.create_with_payload( __HEAD9__ )
        @adaptor.add_child( root_0, tree_for_HEAD9 )

        __END_TAG10__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_head_102 )

        tree_for_END_TAG10 = @adaptor.create_with_payload( __END_TAG10__ )
        @adaptor.add_child( root_0, tree_for_END_TAG10 )

        # at line 31:3: ( head_element )?
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0 == OPENING_TAG )
          alt_3 = 1
        end
        case alt_3
        when 1
          # at line 31:4: head_element
          @state.following.push( TOKENS_FOLLOWING_head_element_IN_head_107 )
          head_element11 = head_element
          @state.following.pop
          @adaptor.add_child( root_0, head_element11.tree )

        end
        __CLOSING_TAG12__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_head_113 )

        tree_for_CLOSING_TAG12 = @adaptor.create_with_payload( __CLOSING_TAG12__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG12 )

        __HEAD13__ = match( HEAD, TOKENS_FOLLOWING_HEAD_IN_head_115 )

        tree_for_HEAD13 = @adaptor.create_with_payload( __HEAD13__ )
        @adaptor.add_child( root_0, tree_for_HEAD13 )

        __END_TAG14__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_head_117 )

        tree_for_END_TAG14 = @adaptor.create_with_payload( __END_TAG14__ )
        @adaptor.add_child( root_0, tree_for_END_TAG14 )

        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 2 )

      end
      
      return return_value
    end

    HeadElementReturnValue = define_return_scope 

    # 
    # parser rule head_element
    # 
    # (in HtmlParser.g)
    # 35:1: head_element : title ;
    # 
    def head_element
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )
      return_value = HeadElementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      title15 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 36:4: title
        @state.following.push( TOKENS_FOLLOWING_title_IN_head_element_128 )
        title15 = title
        @state.following.pop
        @adaptor.add_child( root_0, title15.tree )
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 3 )

      end
      
      return return_value
    end

    TitleReturnValue = define_return_scope 

    # 
    # parser rule title
    # 
    # (in HtmlParser.g)
    # 39:1: title : OPENING_TAG TITLE END_TAG ( PCDATA )? CLOSING_TAG TITLE END_TAG ;
    # 
    def title
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )
      return_value = TitleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG16__ = nil
      __TITLE17__ = nil
      __END_TAG18__ = nil
      __PCDATA19__ = nil
      __CLOSING_TAG20__ = nil
      __TITLE21__ = nil
      __END_TAG22__ = nil

      tree_for_OPENING_TAG16 = nil
      tree_for_TITLE17 = nil
      tree_for_END_TAG18 = nil
      tree_for_PCDATA19 = nil
      tree_for_CLOSING_TAG20 = nil
      tree_for_TITLE21 = nil
      tree_for_END_TAG22 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 40:4: OPENING_TAG TITLE END_TAG ( PCDATA )? CLOSING_TAG TITLE END_TAG
        __OPENING_TAG16__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_title_140 )

        tree_for_OPENING_TAG16 = @adaptor.create_with_payload( __OPENING_TAG16__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG16 )

        __TITLE17__ = match( TITLE, TOKENS_FOLLOWING_TITLE_IN_title_142 )

        tree_for_TITLE17 = @adaptor.create_with_payload( __TITLE17__ )
        @adaptor.add_child( root_0, tree_for_TITLE17 )

        __END_TAG18__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_title_144 )

        tree_for_END_TAG18 = @adaptor.create_with_payload( __END_TAG18__ )
        @adaptor.add_child( root_0, tree_for_END_TAG18 )

        # at line 41:3: ( PCDATA )?
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0 == PCDATA )
          alt_4 = 1
        end
        case alt_4
        when 1
          # at line 41:3: PCDATA
          __PCDATA19__ = match( PCDATA, TOKENS_FOLLOWING_PCDATA_IN_title_148 )

          tree_for_PCDATA19 = @adaptor.create_with_payload( __PCDATA19__ )
          @adaptor.add_child( root_0, tree_for_PCDATA19 )


        end
        __CLOSING_TAG20__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_title_153 )

        tree_for_CLOSING_TAG20 = @adaptor.create_with_payload( __CLOSING_TAG20__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG20 )

        __TITLE21__ = match( TITLE, TOKENS_FOLLOWING_TITLE_IN_title_155 )

        tree_for_TITLE21 = @adaptor.create_with_payload( __TITLE21__ )
        @adaptor.add_child( root_0, tree_for_TITLE21 )

        __END_TAG22__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_title_157 )

        tree_for_END_TAG22 = @adaptor.create_with_payload( __END_TAG22__ )
        @adaptor.add_child( root_0, tree_for_END_TAG22 )

        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 4 )

      end
      
      return return_value
    end

    BodyReturnValue = define_return_scope 

    # 
    # parser rule body
    # 
    # (in HtmlParser.g)
    # 45:1: body : OPENING_TAG BODY ( id | style | klass | bgcolor | background )* END_TAG ( body_content )* CLOSING_TAG BODY END_TAG ;
    # 
    def body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )
      return_value = BodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG23__ = nil
      __BODY24__ = nil
      __END_TAG30__ = nil
      __CLOSING_TAG32__ = nil
      __BODY33__ = nil
      __END_TAG34__ = nil
      id25 = nil
      style26 = nil
      klass27 = nil
      bgcolor28 = nil
      background29 = nil
      body_content31 = nil

      tree_for_OPENING_TAG23 = nil
      tree_for_BODY24 = nil
      tree_for_END_TAG30 = nil
      tree_for_CLOSING_TAG32 = nil
      tree_for_BODY33 = nil
      tree_for_END_TAG34 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 45:8: OPENING_TAG BODY ( id | style | klass | bgcolor | background )* END_TAG ( body_content )* CLOSING_TAG BODY END_TAG
        __OPENING_TAG23__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_body_167 )

        tree_for_OPENING_TAG23 = @adaptor.create_with_payload( __OPENING_TAG23__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG23 )

        __BODY24__ = match( BODY, TOKENS_FOLLOWING_BODY_IN_body_169 )

        tree_for_BODY24 = @adaptor.create_with_payload( __BODY24__ )
        @adaptor.add_child( root_0, tree_for_BODY24 )

        # at line 45:25: ( id | style | klass | bgcolor | background )*
        while true # decision 5
          alt_5 = 6
          look_5_0 = @input.peek( 1 )

          if ( look_5_0 == WS )
            case look_5 = @input.peek( 2 )
            when ID then alt_5 = 1
            when STYLE then alt_5 = 2
            when CLASS then alt_5 = 3
            when BGCOLOR then alt_5 = 4
            when BACKGROUND then alt_5 = 5
            end

          end
          case alt_5
          when 1
            # at line 45:26: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_body_172 )
            id25 = id
            @state.following.pop
            @adaptor.add_child( root_0, id25.tree )

          when 2
            # at line 45:29: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_body_174 )
            style26 = style
            @state.following.pop
            @adaptor.add_child( root_0, style26.tree )

          when 3
            # at line 45:35: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_body_176 )
            klass27 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass27.tree )

          when 4
            # at line 45:41: bgcolor
            @state.following.push( TOKENS_FOLLOWING_bgcolor_IN_body_178 )
            bgcolor28 = bgcolor
            @state.following.pop
            @adaptor.add_child( root_0, bgcolor28.tree )

          when 5
            # at line 45:49: background
            @state.following.push( TOKENS_FOLLOWING_background_IN_body_180 )
            background29 = background
            @state.following.pop
            @adaptor.add_child( root_0, background29.tree )

          else
            break # out of loop for decision 5
          end
        end # loop for decision 5
        __END_TAG30__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_body_184 )

        tree_for_END_TAG30 = @adaptor.create_with_payload( __END_TAG30__ )
        @adaptor.add_child( root_0, tree_for_END_TAG30 )

        # at line 47:4: ( body_content )*
        while true # decision 6
          alt_6 = 2
          look_6_0 = @input.peek( 1 )

          if ( look_6_0 == OPENING_TAG || look_6_0 == PCDATA )
            alt_6 = 1

          end
          case alt_6
          when 1
            # at line 47:5: body_content
            @state.following.push( TOKENS_FOLLOWING_body_content_IN_body_194 )
            body_content31 = body_content
            @state.following.pop
            @adaptor.add_child( root_0, body_content31.tree )

          else
            break # out of loop for decision 6
          end
        end # loop for decision 6
        __CLOSING_TAG32__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_body_202 )

        tree_for_CLOSING_TAG32 = @adaptor.create_with_payload( __CLOSING_TAG32__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG32 )

        __BODY33__ = match( BODY, TOKENS_FOLLOWING_BODY_IN_body_204 )

        tree_for_BODY33 = @adaptor.create_with_payload( __BODY33__ )
        @adaptor.add_child( root_0, tree_for_BODY33 )

        __END_TAG34__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_body_206 )

        tree_for_END_TAG34 = @adaptor.create_with_payload( __END_TAG34__ )
        @adaptor.add_child( root_0, tree_for_END_TAG34 )

        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 5 )

      end
      
      return return_value
    end

    BodyTagReturnValue = define_return_scope 

    # 
    # parser rule body_tag
    # 
    # (in HtmlParser.g)
    # 55:1: body_tag : ( heading | block );
    # 
    def body_tag
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )
      return_value = BodyTagReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      heading35 = nil
      block36 = nil


      begin
        # at line 56:2: ( heading | block )
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == OPENING_TAG )
          look_7_1 = @input.peek( 2 )

          if ( look_7_1.between?( H1, H6 ) )
            alt_7 = 1
          elsif ( look_7_1.between?( P, DIV ) || look_7_1 == TABLE )
            alt_7 = 2
          else
            raise NoViableAlternative( "", 7, 1 )
          end
        else
          raise NoViableAlternative( "", 7, 0 )
        end
        case alt_7
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 56:4: heading
          @state.following.push( TOKENS_FOLLOWING_heading_IN_body_tag_221 )
          heading35 = heading
          @state.following.pop
          @adaptor.add_child( root_0, heading35.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 57:4: block
          @state.following.push( TOKENS_FOLLOWING_block_IN_body_tag_227 )
          block36 = block
          @state.following.pop
          @adaptor.add_child( root_0, block36.tree )

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 6 )

      end
      
      return return_value
    end

    BodyContentReturnValue = define_return_scope 

    # 
    # parser rule body_content
    # 
    # (in HtmlParser.g)
    # 60:1: body_content : ( body_tag | text );
    # 
    def body_content
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )
      return_value = BodyContentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      body_tag37 = nil
      text38 = nil


      begin
        # at line 61:2: ( body_tag | text )
        alt_8 = 2
        look_8_0 = @input.peek( 1 )

        if ( look_8_0 == OPENING_TAG )
          look_8_1 = @input.peek( 2 )

          if ( look_8_1.between?( H1, DIV ) || look_8_1 == TABLE )
            alt_8 = 1
          elsif ( look_8_1.between?( I, U ) || look_8_1.between?( A, IMG ) || look_8_1 == BR )
            alt_8 = 2
          else
            raise NoViableAlternative( "", 8, 1 )
          end
        elsif ( look_8_0 == PCDATA )
          alt_8 = 2
        else
          raise NoViableAlternative( "", 8, 0 )
        end
        case alt_8
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 61:4: body_tag
          @state.following.push( TOKENS_FOLLOWING_body_tag_IN_body_content_238 )
          body_tag37 = body_tag
          @state.following.pop
          @adaptor.add_child( root_0, body_tag37.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 62:4: text
          @state.following.push( TOKENS_FOLLOWING_text_IN_body_content_244 )
          text38 = text
          @state.following.pop
          @adaptor.add_child( root_0, text38.tree )

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 7 )

      end
      
      return return_value
    end

    HeadingReturnValue = define_return_scope 

    # 
    # parser rule heading
    # 
    # (in HtmlParser.g)
    # 65:1: heading : ( h1 | h2 | h3 | h4 | h5 | h6 );
    # 
    def heading
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )
      return_value = HeadingReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      h139 = nil
      h240 = nil
      h341 = nil
      h442 = nil
      h543 = nil
      h644 = nil


      begin
        # at line 66:2: ( h1 | h2 | h3 | h4 | h5 | h6 )
        alt_9 = 6
        look_9_0 = @input.peek( 1 )

        if ( look_9_0 == OPENING_TAG )
          case look_9 = @input.peek( 2 )
          when H1 then alt_9 = 1
          when H2 then alt_9 = 2
          when H3 then alt_9 = 3
          when H4 then alt_9 = 4
          when H5 then alt_9 = 5
          when H6 then alt_9 = 6
          else
            raise NoViableAlternative( "", 9, 1 )
          end
        else
          raise NoViableAlternative( "", 9, 0 )
        end
        case alt_9
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 66:4: h1
          @state.following.push( TOKENS_FOLLOWING_h1_IN_heading_257 )
          h139 = h1
          @state.following.pop
          @adaptor.add_child( root_0, h139.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 66:9: h2
          @state.following.push( TOKENS_FOLLOWING_h2_IN_heading_261 )
          h240 = h2
          @state.following.pop
          @adaptor.add_child( root_0, h240.tree )

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 66:14: h3
          @state.following.push( TOKENS_FOLLOWING_h3_IN_heading_265 )
          h341 = h3
          @state.following.pop
          @adaptor.add_child( root_0, h341.tree )

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 66:19: h4
          @state.following.push( TOKENS_FOLLOWING_h4_IN_heading_269 )
          h442 = h4
          @state.following.pop
          @adaptor.add_child( root_0, h442.tree )

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 66:24: h5
          @state.following.push( TOKENS_FOLLOWING_h5_IN_heading_273 )
          h543 = h5
          @state.following.pop
          @adaptor.add_child( root_0, h543.tree )

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 66:29: h6
          @state.following.push( TOKENS_FOLLOWING_h6_IN_heading_277 )
          h644 = h6
          @state.following.pop
          @adaptor.add_child( root_0, h644.tree )

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 8 )

      end
      
      return return_value
    end

    BlockReturnValue = define_return_scope 

    # 
    # parser rule block
    # 
    # (in HtmlParser.g)
    # 69:1: block : ( paragraph | div | table );
    # 
    def block
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )
      return_value = BlockReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      paragraph45 = nil
      div46 = nil
      table47 = nil


      begin
        # at line 70:2: ( paragraph | div | table )
        alt_10 = 3
        look_10_0 = @input.peek( 1 )

        if ( look_10_0 == OPENING_TAG )
          case look_10 = @input.peek( 2 )
          when P then alt_10 = 1
          when DIV then alt_10 = 2
          when TABLE then alt_10 = 3
          else
            raise NoViableAlternative( "", 10, 1 )
          end
        else
          raise NoViableAlternative( "", 10, 0 )
        end
        case alt_10
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 70:4: paragraph
          @state.following.push( TOKENS_FOLLOWING_paragraph_IN_block_289 )
          paragraph45 = paragraph
          @state.following.pop
          @adaptor.add_child( root_0, paragraph45.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 71:4: div
          @state.following.push( TOKENS_FOLLOWING_div_IN_block_294 )
          div46 = div
          @state.following.pop
          @adaptor.add_child( root_0, div46.tree )

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 72:4: table
          @state.following.push( TOKENS_FOLLOWING_table_IN_block_299 )
          table47 = table
          @state.following.pop
          @adaptor.add_child( root_0, table47.tree )

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 9 )

      end
      
      return return_value
    end

    FontReturnValue = define_return_scope 

    # 
    # parser rule font
    # 
    # (in HtmlParser.g)
    # 75:1: font : ( italic | bold | underline );
    # 
    def font
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )
      return_value = FontReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      italic48 = nil
      bold49 = nil
      underline50 = nil


      begin
        # at line 76:2: ( italic | bold | underline )
        alt_11 = 3
        look_11_0 = @input.peek( 1 )

        if ( look_11_0 == OPENING_TAG )
          case look_11 = @input.peek( 2 )
          when I then alt_11 = 1
          when B then alt_11 = 2
          when U then alt_11 = 3
          else
            raise NoViableAlternative( "", 11, 1 )
          end
        else
          raise NoViableAlternative( "", 11, 0 )
        end
        case alt_11
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 76:4: italic
          @state.following.push( TOKENS_FOLLOWING_italic_IN_font_311 )
          italic48 = italic
          @state.following.pop
          @adaptor.add_child( root_0, italic48.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 77:4: bold
          @state.following.push( TOKENS_FOLLOWING_bold_IN_font_316 )
          bold49 = bold
          @state.following.pop
          @adaptor.add_child( root_0, bold49.tree )

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 78:4: underline
          @state.following.push( TOKENS_FOLLOWING_underline_IN_font_321 )
          underline50 = underline
          @state.following.pop
          @adaptor.add_child( root_0, underline50.tree )

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 10 )

      end
      
      return return_value
    end

    SpecialReturnValue = define_return_scope 

    # 
    # parser rule special
    # 
    # (in HtmlParser.g)
    # 81:1: special : ( anchor | img | br );
    # 
    def special
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )
      return_value = SpecialReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      anchor51 = nil
      img52 = nil
      br53 = nil


      begin
        # at line 82:2: ( anchor | img | br )
        alt_12 = 3
        look_12_0 = @input.peek( 1 )

        if ( look_12_0 == OPENING_TAG )
          case look_12 = @input.peek( 2 )
          when A then alt_12 = 1
          when IMG then alt_12 = 2
          when BR then alt_12 = 3
          else
            raise NoViableAlternative( "", 12, 1 )
          end
        else
          raise NoViableAlternative( "", 12, 0 )
        end
        case alt_12
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 82:4: anchor
          @state.following.push( TOKENS_FOLLOWING_anchor_IN_special_333 )
          anchor51 = anchor
          @state.following.pop
          @adaptor.add_child( root_0, anchor51.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 83:4: img
          @state.following.push( TOKENS_FOLLOWING_img_IN_special_339 )
          img52 = img
          @state.following.pop
          @adaptor.add_child( root_0, img52.tree )

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 84:4: br
          @state.following.push( TOKENS_FOLLOWING_br_IN_special_344 )
          br53 = br
          @state.following.pop
          @adaptor.add_child( root_0, br53.tree )

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 11 )

      end
      
      return return_value
    end

    TextTagReturnValue = define_return_scope 

    # 
    # parser rule text_tag
    # 
    # (in HtmlParser.g)
    # 87:1: text_tag : ( font | special );
    # 
    def text_tag
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
      return_value = TextTagReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      font54 = nil
      special55 = nil


      begin
        # at line 88:2: ( font | special )
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0 == OPENING_TAG )
          look_13_1 = @input.peek( 2 )

          if ( look_13_1.between?( I, U ) )
            alt_13 = 1
          elsif ( look_13_1.between?( A, IMG ) || look_13_1 == BR )
            alt_13 = 2
          else
            raise NoViableAlternative( "", 13, 1 )
          end
        else
          raise NoViableAlternative( "", 13, 0 )
        end
        case alt_13
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 88:4: font
          @state.following.push( TOKENS_FOLLOWING_font_IN_text_tag_356 )
          font54 = font
          @state.following.pop
          @adaptor.add_child( root_0, font54.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 89:4: special
          @state.following.push( TOKENS_FOLLOWING_special_IN_text_tag_362 )
          special55 = special
          @state.following.pop
          @adaptor.add_child( root_0, special55.tree )

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 12 )

      end
      
      return return_value
    end

    TextReturnValue = define_return_scope 

    # 
    # parser rule text
    # 
    # (in HtmlParser.g)
    # 92:1: text : ( PCDATA | text_tag );
    # 
    def text
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )
      return_value = TextReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PCDATA56__ = nil
      text_tag57 = nil

      tree_for_PCDATA56 = nil

      begin
        # at line 92:5: ( PCDATA | text_tag )
        alt_14 = 2
        look_14_0 = @input.peek( 1 )

        if ( look_14_0 == PCDATA )
          alt_14 = 1
        elsif ( look_14_0 == OPENING_TAG )
          alt_14 = 2
        else
          raise NoViableAlternative( "", 14, 0 )
        end
        case alt_14
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 92:7: PCDATA
          __PCDATA56__ = match( PCDATA, TOKENS_FOLLOWING_PCDATA_IN_text_372 )

          tree_for_PCDATA56 = @adaptor.create_with_payload( __PCDATA56__ )
          @adaptor.add_child( root_0, tree_for_PCDATA56 )


        when 2
          root_0 = @adaptor.create_flat_list


          # at line 93:4: text_tag
          @state.following.push( TOKENS_FOLLOWING_text_tag_IN_text_378 )
          text_tag57 = text_tag
          @state.following.pop
          @adaptor.add_child( root_0, text_tag57.tree )

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 13 )

      end
      
      return return_value
    end

    H1ReturnValue = define_return_scope 

    # 
    # parser rule h1
    # 
    # (in HtmlParser.g)
    # 99:1: h1 : OPENING_TAG H1 ( id | style | klass | align )* END_TAG ( block | text )* CLOSING_TAG H1 END_TAG ;
    # 
    def h1
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
      return_value = H1ReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG58__ = nil
      __H159__ = nil
      __END_TAG64__ = nil
      __CLOSING_TAG67__ = nil
      __H168__ = nil
      __END_TAG69__ = nil
      id60 = nil
      style61 = nil
      klass62 = nil
      align63 = nil
      block65 = nil
      text66 = nil

      tree_for_OPENING_TAG58 = nil
      tree_for_H159 = nil
      tree_for_END_TAG64 = nil
      tree_for_CLOSING_TAG67 = nil
      tree_for_H168 = nil
      tree_for_END_TAG69 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 99:6: OPENING_TAG H1 ( id | style | klass | align )* END_TAG ( block | text )* CLOSING_TAG H1 END_TAG
        __OPENING_TAG58__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_h1_395 )

        tree_for_OPENING_TAG58 = @adaptor.create_with_payload( __OPENING_TAG58__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG58 )

        __H159__ = match( H1, TOKENS_FOLLOWING_H1_IN_h1_397 )

        tree_for_H159 = @adaptor.create_with_payload( __H159__ )
        @adaptor.add_child( root_0, tree_for_H159 )

        # at line 99:21: ( id | style | klass | align )*
        while true # decision 15
          alt_15 = 5
          look_15_0 = @input.peek( 1 )

          if ( look_15_0 == WS )
            case look_15 = @input.peek( 2 )
            when ID then alt_15 = 1
            when STYLE then alt_15 = 2
            when CLASS then alt_15 = 3
            when ALIGN then alt_15 = 4
            end

          end
          case alt_15
          when 1
            # at line 99:22: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_h1_400 )
            id60 = id
            @state.following.pop
            @adaptor.add_child( root_0, id60.tree )

          when 2
            # at line 99:25: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_h1_402 )
            style61 = style
            @state.following.pop
            @adaptor.add_child( root_0, style61.tree )

          when 3
            # at line 99:31: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_h1_404 )
            klass62 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass62.tree )

          when 4
            # at line 99:37: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_h1_406 )
            align63 = align
            @state.following.pop
            @adaptor.add_child( root_0, align63.tree )

          else
            break # out of loop for decision 15
          end
        end # loop for decision 15
        __END_TAG64__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h1_410 )

        tree_for_END_TAG64 = @adaptor.create_with_payload( __END_TAG64__ )
        @adaptor.add_child( root_0, tree_for_END_TAG64 )

        # at line 100:3: ( block | text )*
        while true # decision 16
          alt_16 = 3
          look_16_0 = @input.peek( 1 )

          if ( look_16_0 == OPENING_TAG )
            look_16_2 = @input.peek( 2 )

            if ( look_16_2.between?( P, DIV ) || look_16_2 == TABLE )
              alt_16 = 1
            elsif ( look_16_2.between?( I, U ) || look_16_2.between?( A, IMG ) || look_16_2 == BR )
              alt_16 = 2

            end
          elsif ( look_16_0 == PCDATA )
            alt_16 = 2

          end
          case alt_16
          when 1
            # at line 100:4: block
            @state.following.push( TOKENS_FOLLOWING_block_IN_h1_415 )
            block65 = block
            @state.following.pop
            @adaptor.add_child( root_0, block65.tree )

          when 2
            # at line 100:12: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_h1_419 )
            text66 = text
            @state.following.pop
            @adaptor.add_child( root_0, text66.tree )

          else
            break # out of loop for decision 16
          end
        end # loop for decision 16
        __CLOSING_TAG67__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_h1_425 )

        tree_for_CLOSING_TAG67 = @adaptor.create_with_payload( __CLOSING_TAG67__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG67 )

        __H168__ = match( H1, TOKENS_FOLLOWING_H1_IN_h1_427 )

        tree_for_H168 = @adaptor.create_with_payload( __H168__ )
        @adaptor.add_child( root_0, tree_for_H168 )

        __END_TAG69__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h1_429 )

        tree_for_END_TAG69 = @adaptor.create_with_payload( __END_TAG69__ )
        @adaptor.add_child( root_0, tree_for_END_TAG69 )

        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 14 )

      end
      
      return return_value
    end

    H2ReturnValue = define_return_scope 

    # 
    # parser rule h2
    # 
    # (in HtmlParser.g)
    # 104:1: h2 : OPENING_TAG H2 ( id | style | klass | align )* END_TAG ( block | text )* CLOSING_TAG H2 END_TAG ;
    # 
    def h2
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )
      return_value = H2ReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG70__ = nil
      __H271__ = nil
      __END_TAG76__ = nil
      __CLOSING_TAG79__ = nil
      __H280__ = nil
      __END_TAG81__ = nil
      id72 = nil
      style73 = nil
      klass74 = nil
      align75 = nil
      block77 = nil
      text78 = nil

      tree_for_OPENING_TAG70 = nil
      tree_for_H271 = nil
      tree_for_END_TAG76 = nil
      tree_for_CLOSING_TAG79 = nil
      tree_for_H280 = nil
      tree_for_END_TAG81 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 104:6: OPENING_TAG H2 ( id | style | klass | align )* END_TAG ( block | text )* CLOSING_TAG H2 END_TAG
        __OPENING_TAG70__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_h2_440 )

        tree_for_OPENING_TAG70 = @adaptor.create_with_payload( __OPENING_TAG70__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG70 )

        __H271__ = match( H2, TOKENS_FOLLOWING_H2_IN_h2_442 )

        tree_for_H271 = @adaptor.create_with_payload( __H271__ )
        @adaptor.add_child( root_0, tree_for_H271 )

        # at line 104:21: ( id | style | klass | align )*
        while true # decision 17
          alt_17 = 5
          look_17_0 = @input.peek( 1 )

          if ( look_17_0 == WS )
            case look_17 = @input.peek( 2 )
            when ID then alt_17 = 1
            when STYLE then alt_17 = 2
            when CLASS then alt_17 = 3
            when ALIGN then alt_17 = 4
            end

          end
          case alt_17
          when 1
            # at line 104:22: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_h2_445 )
            id72 = id
            @state.following.pop
            @adaptor.add_child( root_0, id72.tree )

          when 2
            # at line 104:25: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_h2_447 )
            style73 = style
            @state.following.pop
            @adaptor.add_child( root_0, style73.tree )

          when 3
            # at line 104:31: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_h2_449 )
            klass74 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass74.tree )

          when 4
            # at line 104:37: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_h2_451 )
            align75 = align
            @state.following.pop
            @adaptor.add_child( root_0, align75.tree )

          else
            break # out of loop for decision 17
          end
        end # loop for decision 17
        __END_TAG76__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h2_455 )

        tree_for_END_TAG76 = @adaptor.create_with_payload( __END_TAG76__ )
        @adaptor.add_child( root_0, tree_for_END_TAG76 )

        # at line 105:3: ( block | text )*
        while true # decision 18
          alt_18 = 3
          look_18_0 = @input.peek( 1 )

          if ( look_18_0 == OPENING_TAG )
            look_18_2 = @input.peek( 2 )

            if ( look_18_2.between?( P, DIV ) || look_18_2 == TABLE )
              alt_18 = 1
            elsif ( look_18_2.between?( I, U ) || look_18_2.between?( A, IMG ) || look_18_2 == BR )
              alt_18 = 2

            end
          elsif ( look_18_0 == PCDATA )
            alt_18 = 2

          end
          case alt_18
          when 1
            # at line 105:4: block
            @state.following.push( TOKENS_FOLLOWING_block_IN_h2_460 )
            block77 = block
            @state.following.pop
            @adaptor.add_child( root_0, block77.tree )

          when 2
            # at line 105:12: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_h2_464 )
            text78 = text
            @state.following.pop
            @adaptor.add_child( root_0, text78.tree )

          else
            break # out of loop for decision 18
          end
        end # loop for decision 18
        __CLOSING_TAG79__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_h2_470 )

        tree_for_CLOSING_TAG79 = @adaptor.create_with_payload( __CLOSING_TAG79__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG79 )

        __H280__ = match( H2, TOKENS_FOLLOWING_H2_IN_h2_472 )

        tree_for_H280 = @adaptor.create_with_payload( __H280__ )
        @adaptor.add_child( root_0, tree_for_H280 )

        __END_TAG81__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h2_474 )

        tree_for_END_TAG81 = @adaptor.create_with_payload( __END_TAG81__ )
        @adaptor.add_child( root_0, tree_for_END_TAG81 )

        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 15 )

      end
      
      return return_value
    end

    H3ReturnValue = define_return_scope 

    # 
    # parser rule h3
    # 
    # (in HtmlParser.g)
    # 109:1: h3 : OPENING_TAG H3 ( id | style | klass | align )* END_TAG ( block | text )* CLOSING_TAG H3 END_TAG ;
    # 
    def h3
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
      return_value = H3ReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG82__ = nil
      __H383__ = nil
      __END_TAG88__ = nil
      __CLOSING_TAG91__ = nil
      __H392__ = nil
      __END_TAG93__ = nil
      id84 = nil
      style85 = nil
      klass86 = nil
      align87 = nil
      block89 = nil
      text90 = nil

      tree_for_OPENING_TAG82 = nil
      tree_for_H383 = nil
      tree_for_END_TAG88 = nil
      tree_for_CLOSING_TAG91 = nil
      tree_for_H392 = nil
      tree_for_END_TAG93 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 109:6: OPENING_TAG H3 ( id | style | klass | align )* END_TAG ( block | text )* CLOSING_TAG H3 END_TAG
        __OPENING_TAG82__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_h3_485 )

        tree_for_OPENING_TAG82 = @adaptor.create_with_payload( __OPENING_TAG82__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG82 )

        __H383__ = match( H3, TOKENS_FOLLOWING_H3_IN_h3_487 )

        tree_for_H383 = @adaptor.create_with_payload( __H383__ )
        @adaptor.add_child( root_0, tree_for_H383 )

        # at line 109:21: ( id | style | klass | align )*
        while true # decision 19
          alt_19 = 5
          look_19_0 = @input.peek( 1 )

          if ( look_19_0 == WS )
            case look_19 = @input.peek( 2 )
            when ID then alt_19 = 1
            when STYLE then alt_19 = 2
            when CLASS then alt_19 = 3
            when ALIGN then alt_19 = 4
            end

          end
          case alt_19
          when 1
            # at line 109:22: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_h3_490 )
            id84 = id
            @state.following.pop
            @adaptor.add_child( root_0, id84.tree )

          when 2
            # at line 109:25: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_h3_492 )
            style85 = style
            @state.following.pop
            @adaptor.add_child( root_0, style85.tree )

          when 3
            # at line 109:31: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_h3_494 )
            klass86 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass86.tree )

          when 4
            # at line 109:37: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_h3_496 )
            align87 = align
            @state.following.pop
            @adaptor.add_child( root_0, align87.tree )

          else
            break # out of loop for decision 19
          end
        end # loop for decision 19
        __END_TAG88__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h3_500 )

        tree_for_END_TAG88 = @adaptor.create_with_payload( __END_TAG88__ )
        @adaptor.add_child( root_0, tree_for_END_TAG88 )

        # at line 110:3: ( block | text )*
        while true # decision 20
          alt_20 = 3
          look_20_0 = @input.peek( 1 )

          if ( look_20_0 == OPENING_TAG )
            look_20_2 = @input.peek( 2 )

            if ( look_20_2.between?( P, DIV ) || look_20_2 == TABLE )
              alt_20 = 1
            elsif ( look_20_2.between?( I, U ) || look_20_2.between?( A, IMG ) || look_20_2 == BR )
              alt_20 = 2

            end
          elsif ( look_20_0 == PCDATA )
            alt_20 = 2

          end
          case alt_20
          when 1
            # at line 110:4: block
            @state.following.push( TOKENS_FOLLOWING_block_IN_h3_505 )
            block89 = block
            @state.following.pop
            @adaptor.add_child( root_0, block89.tree )

          when 2
            # at line 110:12: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_h3_509 )
            text90 = text
            @state.following.pop
            @adaptor.add_child( root_0, text90.tree )

          else
            break # out of loop for decision 20
          end
        end # loop for decision 20
        __CLOSING_TAG91__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_h3_515 )

        tree_for_CLOSING_TAG91 = @adaptor.create_with_payload( __CLOSING_TAG91__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG91 )

        __H392__ = match( H3, TOKENS_FOLLOWING_H3_IN_h3_517 )

        tree_for_H392 = @adaptor.create_with_payload( __H392__ )
        @adaptor.add_child( root_0, tree_for_H392 )

        __END_TAG93__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h3_519 )

        tree_for_END_TAG93 = @adaptor.create_with_payload( __END_TAG93__ )
        @adaptor.add_child( root_0, tree_for_END_TAG93 )

        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 16 )

      end
      
      return return_value
    end

    H4ReturnValue = define_return_scope 

    # 
    # parser rule h4
    # 
    # (in HtmlParser.g)
    # 114:1: h4 : OPENING_TAG H4 ( id | style | klass | align )* END_TAG ( block | text )* CLOSING_TAG H4 END_TAG ;
    # 
    def h4
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = H4ReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG94__ = nil
      __H495__ = nil
      __END_TAG100__ = nil
      __CLOSING_TAG103__ = nil
      __H4104__ = nil
      __END_TAG105__ = nil
      id96 = nil
      style97 = nil
      klass98 = nil
      align99 = nil
      block101 = nil
      text102 = nil

      tree_for_OPENING_TAG94 = nil
      tree_for_H495 = nil
      tree_for_END_TAG100 = nil
      tree_for_CLOSING_TAG103 = nil
      tree_for_H4104 = nil
      tree_for_END_TAG105 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 114:6: OPENING_TAG H4 ( id | style | klass | align )* END_TAG ( block | text )* CLOSING_TAG H4 END_TAG
        __OPENING_TAG94__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_h4_530 )

        tree_for_OPENING_TAG94 = @adaptor.create_with_payload( __OPENING_TAG94__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG94 )

        __H495__ = match( H4, TOKENS_FOLLOWING_H4_IN_h4_532 )

        tree_for_H495 = @adaptor.create_with_payload( __H495__ )
        @adaptor.add_child( root_0, tree_for_H495 )

        # at line 114:21: ( id | style | klass | align )*
        while true # decision 21
          alt_21 = 5
          look_21_0 = @input.peek( 1 )

          if ( look_21_0 == WS )
            case look_21 = @input.peek( 2 )
            when ID then alt_21 = 1
            when STYLE then alt_21 = 2
            when CLASS then alt_21 = 3
            when ALIGN then alt_21 = 4
            end

          end
          case alt_21
          when 1
            # at line 114:22: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_h4_535 )
            id96 = id
            @state.following.pop
            @adaptor.add_child( root_0, id96.tree )

          when 2
            # at line 114:25: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_h4_537 )
            style97 = style
            @state.following.pop
            @adaptor.add_child( root_0, style97.tree )

          when 3
            # at line 114:31: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_h4_539 )
            klass98 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass98.tree )

          when 4
            # at line 114:37: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_h4_541 )
            align99 = align
            @state.following.pop
            @adaptor.add_child( root_0, align99.tree )

          else
            break # out of loop for decision 21
          end
        end # loop for decision 21
        __END_TAG100__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h4_545 )

        tree_for_END_TAG100 = @adaptor.create_with_payload( __END_TAG100__ )
        @adaptor.add_child( root_0, tree_for_END_TAG100 )

        # at line 115:3: ( block | text )*
        while true # decision 22
          alt_22 = 3
          look_22_0 = @input.peek( 1 )

          if ( look_22_0 == OPENING_TAG )
            look_22_2 = @input.peek( 2 )

            if ( look_22_2.between?( P, DIV ) || look_22_2 == TABLE )
              alt_22 = 1
            elsif ( look_22_2.between?( I, U ) || look_22_2.between?( A, IMG ) || look_22_2 == BR )
              alt_22 = 2

            end
          elsif ( look_22_0 == PCDATA )
            alt_22 = 2

          end
          case alt_22
          when 1
            # at line 115:4: block
            @state.following.push( TOKENS_FOLLOWING_block_IN_h4_550 )
            block101 = block
            @state.following.pop
            @adaptor.add_child( root_0, block101.tree )

          when 2
            # at line 115:12: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_h4_554 )
            text102 = text
            @state.following.pop
            @adaptor.add_child( root_0, text102.tree )

          else
            break # out of loop for decision 22
          end
        end # loop for decision 22
        __CLOSING_TAG103__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_h4_560 )

        tree_for_CLOSING_TAG103 = @adaptor.create_with_payload( __CLOSING_TAG103__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG103 )

        __H4104__ = match( H4, TOKENS_FOLLOWING_H4_IN_h4_562 )

        tree_for_H4104 = @adaptor.create_with_payload( __H4104__ )
        @adaptor.add_child( root_0, tree_for_H4104 )

        __END_TAG105__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h4_564 )

        tree_for_END_TAG105 = @adaptor.create_with_payload( __END_TAG105__ )
        @adaptor.add_child( root_0, tree_for_END_TAG105 )

        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 17 )

      end
      
      return return_value
    end

    H5ReturnValue = define_return_scope 

    # 
    # parser rule h5
    # 
    # (in HtmlParser.g)
    # 119:1: h5 : OPENING_TAG H5 ( id | style | klass | align )* END_TAG ( block | text )* CLOSING_TAG H5 END_TAG ;
    # 
    def h5
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = H5ReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG106__ = nil
      __H5107__ = nil
      __END_TAG112__ = nil
      __CLOSING_TAG115__ = nil
      __H5116__ = nil
      __END_TAG117__ = nil
      id108 = nil
      style109 = nil
      klass110 = nil
      align111 = nil
      block113 = nil
      text114 = nil

      tree_for_OPENING_TAG106 = nil
      tree_for_H5107 = nil
      tree_for_END_TAG112 = nil
      tree_for_CLOSING_TAG115 = nil
      tree_for_H5116 = nil
      tree_for_END_TAG117 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 119:6: OPENING_TAG H5 ( id | style | klass | align )* END_TAG ( block | text )* CLOSING_TAG H5 END_TAG
        __OPENING_TAG106__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_h5_575 )

        tree_for_OPENING_TAG106 = @adaptor.create_with_payload( __OPENING_TAG106__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG106 )

        __H5107__ = match( H5, TOKENS_FOLLOWING_H5_IN_h5_577 )

        tree_for_H5107 = @adaptor.create_with_payload( __H5107__ )
        @adaptor.add_child( root_0, tree_for_H5107 )

        # at line 119:21: ( id | style | klass | align )*
        while true # decision 23
          alt_23 = 5
          look_23_0 = @input.peek( 1 )

          if ( look_23_0 == WS )
            case look_23 = @input.peek( 2 )
            when ID then alt_23 = 1
            when STYLE then alt_23 = 2
            when CLASS then alt_23 = 3
            when ALIGN then alt_23 = 4
            end

          end
          case alt_23
          when 1
            # at line 119:22: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_h5_580 )
            id108 = id
            @state.following.pop
            @adaptor.add_child( root_0, id108.tree )

          when 2
            # at line 119:25: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_h5_582 )
            style109 = style
            @state.following.pop
            @adaptor.add_child( root_0, style109.tree )

          when 3
            # at line 119:31: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_h5_584 )
            klass110 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass110.tree )

          when 4
            # at line 119:37: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_h5_586 )
            align111 = align
            @state.following.pop
            @adaptor.add_child( root_0, align111.tree )

          else
            break # out of loop for decision 23
          end
        end # loop for decision 23
        __END_TAG112__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h5_590 )

        tree_for_END_TAG112 = @adaptor.create_with_payload( __END_TAG112__ )
        @adaptor.add_child( root_0, tree_for_END_TAG112 )

        # at line 120:3: ( block | text )*
        while true # decision 24
          alt_24 = 3
          look_24_0 = @input.peek( 1 )

          if ( look_24_0 == OPENING_TAG )
            look_24_2 = @input.peek( 2 )

            if ( look_24_2.between?( P, DIV ) || look_24_2 == TABLE )
              alt_24 = 1
            elsif ( look_24_2.between?( I, U ) || look_24_2.between?( A, IMG ) || look_24_2 == BR )
              alt_24 = 2

            end
          elsif ( look_24_0 == PCDATA )
            alt_24 = 2

          end
          case alt_24
          when 1
            # at line 120:4: block
            @state.following.push( TOKENS_FOLLOWING_block_IN_h5_595 )
            block113 = block
            @state.following.pop
            @adaptor.add_child( root_0, block113.tree )

          when 2
            # at line 120:12: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_h5_599 )
            text114 = text
            @state.following.pop
            @adaptor.add_child( root_0, text114.tree )

          else
            break # out of loop for decision 24
          end
        end # loop for decision 24
        __CLOSING_TAG115__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_h5_605 )

        tree_for_CLOSING_TAG115 = @adaptor.create_with_payload( __CLOSING_TAG115__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG115 )

        __H5116__ = match( H5, TOKENS_FOLLOWING_H5_IN_h5_607 )

        tree_for_H5116 = @adaptor.create_with_payload( __H5116__ )
        @adaptor.add_child( root_0, tree_for_H5116 )

        __END_TAG117__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h5_609 )

        tree_for_END_TAG117 = @adaptor.create_with_payload( __END_TAG117__ )
        @adaptor.add_child( root_0, tree_for_END_TAG117 )

        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 18 )

      end
      
      return return_value
    end

    H6ReturnValue = define_return_scope 

    # 
    # parser rule h6
    # 
    # (in HtmlParser.g)
    # 124:1: h6 : OPENING_TAG H6 ( id | style | klass | align )* END_TAG ( block | text )* CLOSING_TAG H6 END_TAG ;
    # 
    def h6
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = H6ReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG118__ = nil
      __H6119__ = nil
      __END_TAG124__ = nil
      __CLOSING_TAG127__ = nil
      __H6128__ = nil
      __END_TAG129__ = nil
      id120 = nil
      style121 = nil
      klass122 = nil
      align123 = nil
      block125 = nil
      text126 = nil

      tree_for_OPENING_TAG118 = nil
      tree_for_H6119 = nil
      tree_for_END_TAG124 = nil
      tree_for_CLOSING_TAG127 = nil
      tree_for_H6128 = nil
      tree_for_END_TAG129 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 124:6: OPENING_TAG H6 ( id | style | klass | align )* END_TAG ( block | text )* CLOSING_TAG H6 END_TAG
        __OPENING_TAG118__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_h6_620 )

        tree_for_OPENING_TAG118 = @adaptor.create_with_payload( __OPENING_TAG118__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG118 )

        __H6119__ = match( H6, TOKENS_FOLLOWING_H6_IN_h6_622 )

        tree_for_H6119 = @adaptor.create_with_payload( __H6119__ )
        @adaptor.add_child( root_0, tree_for_H6119 )

        # at line 124:21: ( id | style | klass | align )*
        while true # decision 25
          alt_25 = 5
          look_25_0 = @input.peek( 1 )

          if ( look_25_0 == WS )
            case look_25 = @input.peek( 2 )
            when ID then alt_25 = 1
            when STYLE then alt_25 = 2
            when CLASS then alt_25 = 3
            when ALIGN then alt_25 = 4
            end

          end
          case alt_25
          when 1
            # at line 124:22: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_h6_625 )
            id120 = id
            @state.following.pop
            @adaptor.add_child( root_0, id120.tree )

          when 2
            # at line 124:25: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_h6_627 )
            style121 = style
            @state.following.pop
            @adaptor.add_child( root_0, style121.tree )

          when 3
            # at line 124:31: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_h6_629 )
            klass122 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass122.tree )

          when 4
            # at line 124:37: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_h6_631 )
            align123 = align
            @state.following.pop
            @adaptor.add_child( root_0, align123.tree )

          else
            break # out of loop for decision 25
          end
        end # loop for decision 25
        __END_TAG124__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h6_635 )

        tree_for_END_TAG124 = @adaptor.create_with_payload( __END_TAG124__ )
        @adaptor.add_child( root_0, tree_for_END_TAG124 )

        # at line 125:3: ( block | text )*
        while true # decision 26
          alt_26 = 3
          look_26_0 = @input.peek( 1 )

          if ( look_26_0 == OPENING_TAG )
            look_26_2 = @input.peek( 2 )

            if ( look_26_2.between?( P, DIV ) || look_26_2 == TABLE )
              alt_26 = 1
            elsif ( look_26_2.between?( I, U ) || look_26_2.between?( A, IMG ) || look_26_2 == BR )
              alt_26 = 2

            end
          elsif ( look_26_0 == PCDATA )
            alt_26 = 2

          end
          case alt_26
          when 1
            # at line 125:4: block
            @state.following.push( TOKENS_FOLLOWING_block_IN_h6_640 )
            block125 = block
            @state.following.pop
            @adaptor.add_child( root_0, block125.tree )

          when 2
            # at line 125:12: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_h6_644 )
            text126 = text
            @state.following.pop
            @adaptor.add_child( root_0, text126.tree )

          else
            break # out of loop for decision 26
          end
        end # loop for decision 26
        __CLOSING_TAG127__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_h6_650 )

        tree_for_CLOSING_TAG127 = @adaptor.create_with_payload( __CLOSING_TAG127__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG127 )

        __H6128__ = match( H6, TOKENS_FOLLOWING_H6_IN_h6_652 )

        tree_for_H6128 = @adaptor.create_with_payload( __H6128__ )
        @adaptor.add_child( root_0, tree_for_H6128 )

        __END_TAG129__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h6_654 )

        tree_for_END_TAG129 = @adaptor.create_with_payload( __END_TAG129__ )
        @adaptor.add_child( root_0, tree_for_END_TAG129 )

        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 19 )

      end
      
      return return_value
    end

    ParagraphReturnValue = define_return_scope 

    # 
    # parser rule paragraph
    # 
    # (in HtmlParser.g)
    # 130:1: paragraph : OPENING_TAG P ( id | style | klass | align )* END_TAG ( text )* CLOSING_TAG P END_TAG ;
    # 
    def paragraph
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = ParagraphReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG130__ = nil
      __P131__ = nil
      __END_TAG136__ = nil
      __CLOSING_TAG138__ = nil
      __P139__ = nil
      __END_TAG140__ = nil
      id132 = nil
      style133 = nil
      klass134 = nil
      align135 = nil
      text137 = nil

      tree_for_OPENING_TAG130 = nil
      tree_for_P131 = nil
      tree_for_END_TAG136 = nil
      tree_for_CLOSING_TAG138 = nil
      tree_for_P139 = nil
      tree_for_END_TAG140 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 131:4: OPENING_TAG P ( id | style | klass | align )* END_TAG ( text )* CLOSING_TAG P END_TAG
        __OPENING_TAG130__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_paragraph_667 )

        tree_for_OPENING_TAG130 = @adaptor.create_with_payload( __OPENING_TAG130__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG130 )

        __P131__ = match( P, TOKENS_FOLLOWING_P_IN_paragraph_669 )

        tree_for_P131 = @adaptor.create_with_payload( __P131__ )
        @adaptor.add_child( root_0, tree_for_P131 )

        # at line 131:18: ( id | style | klass | align )*
        while true # decision 27
          alt_27 = 5
          look_27_0 = @input.peek( 1 )

          if ( look_27_0 == WS )
            case look_27 = @input.peek( 2 )
            when ID then alt_27 = 1
            when STYLE then alt_27 = 2
            when CLASS then alt_27 = 3
            when ALIGN then alt_27 = 4
            end

          end
          case alt_27
          when 1
            # at line 131:19: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_paragraph_672 )
            id132 = id
            @state.following.pop
            @adaptor.add_child( root_0, id132.tree )

          when 2
            # at line 131:22: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_paragraph_674 )
            style133 = style
            @state.following.pop
            @adaptor.add_child( root_0, style133.tree )

          when 3
            # at line 131:28: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_paragraph_676 )
            klass134 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass134.tree )

          when 4
            # at line 131:34: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_paragraph_678 )
            align135 = align
            @state.following.pop
            @adaptor.add_child( root_0, align135.tree )

          else
            break # out of loop for decision 27
          end
        end # loop for decision 27
        __END_TAG136__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_paragraph_682 )

        tree_for_END_TAG136 = @adaptor.create_with_payload( __END_TAG136__ )
        @adaptor.add_child( root_0, tree_for_END_TAG136 )

        # at line 132:3: ( text )*
        while true # decision 28
          alt_28 = 2
          look_28_0 = @input.peek( 1 )

          if ( look_28_0 == OPENING_TAG || look_28_0 == PCDATA )
            alt_28 = 1

          end
          case alt_28
          when 1
            # at line 132:4: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_paragraph_687 )
            text137 = text
            @state.following.pop
            @adaptor.add_child( root_0, text137.tree )

          else
            break # out of loop for decision 28
          end
        end # loop for decision 28
        __CLOSING_TAG138__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_paragraph_693 )

        tree_for_CLOSING_TAG138 = @adaptor.create_with_payload( __CLOSING_TAG138__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG138 )

        __P139__ = match( P, TOKENS_FOLLOWING_P_IN_paragraph_695 )

        tree_for_P139 = @adaptor.create_with_payload( __P139__ )
        @adaptor.add_child( root_0, tree_for_P139 )

        __END_TAG140__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_paragraph_697 )

        tree_for_END_TAG140 = @adaptor.create_with_payload( __END_TAG140__ )
        @adaptor.add_child( root_0, tree_for_END_TAG140 )

        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 20 )

      end
      
      return return_value
    end

    DivReturnValue = define_return_scope 

    # 
    # parser rule div
    # 
    # (in HtmlParser.g)
    # 136:1: div : OPENING_TAG DIV ( id | style | klass | align )* END_TAG ( body_content )* CLOSING_TAG DIV END_TAG ;
    # 
    def div
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = DivReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG141__ = nil
      __DIV142__ = nil
      __END_TAG147__ = nil
      __CLOSING_TAG149__ = nil
      __DIV150__ = nil
      __END_TAG151__ = nil
      id143 = nil
      style144 = nil
      klass145 = nil
      align146 = nil
      body_content148 = nil

      tree_for_OPENING_TAG141 = nil
      tree_for_DIV142 = nil
      tree_for_END_TAG147 = nil
      tree_for_CLOSING_TAG149 = nil
      tree_for_DIV150 = nil
      tree_for_END_TAG151 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 136:7: OPENING_TAG DIV ( id | style | klass | align )* END_TAG ( body_content )* CLOSING_TAG DIV END_TAG
        __OPENING_TAG141__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_div_707 )

        tree_for_OPENING_TAG141 = @adaptor.create_with_payload( __OPENING_TAG141__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG141 )

        __DIV142__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_div_709 )

        tree_for_DIV142 = @adaptor.create_with_payload( __DIV142__ )
        @adaptor.add_child( root_0, tree_for_DIV142 )

        # at line 136:23: ( id | style | klass | align )*
        while true # decision 29
          alt_29 = 5
          look_29_0 = @input.peek( 1 )

          if ( look_29_0 == WS )
            case look_29 = @input.peek( 2 )
            when ID then alt_29 = 1
            when STYLE then alt_29 = 2
            when CLASS then alt_29 = 3
            when ALIGN then alt_29 = 4
            end

          end
          case alt_29
          when 1
            # at line 136:24: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_div_712 )
            id143 = id
            @state.following.pop
            @adaptor.add_child( root_0, id143.tree )

          when 2
            # at line 136:27: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_div_714 )
            style144 = style
            @state.following.pop
            @adaptor.add_child( root_0, style144.tree )

          when 3
            # at line 136:33: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_div_716 )
            klass145 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass145.tree )

          when 4
            # at line 136:39: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_div_718 )
            align146 = align
            @state.following.pop
            @adaptor.add_child( root_0, align146.tree )

          else
            break # out of loop for decision 29
          end
        end # loop for decision 29
        __END_TAG147__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_div_722 )

        tree_for_END_TAG147 = @adaptor.create_with_payload( __END_TAG147__ )
        @adaptor.add_child( root_0, tree_for_END_TAG147 )

        # at line 137:3: ( body_content )*
        while true # decision 30
          alt_30 = 2
          look_30_0 = @input.peek( 1 )

          if ( look_30_0 == OPENING_TAG || look_30_0 == PCDATA )
            alt_30 = 1

          end
          case alt_30
          when 1
            # at line 137:4: body_content
            @state.following.push( TOKENS_FOLLOWING_body_content_IN_div_727 )
            body_content148 = body_content
            @state.following.pop
            @adaptor.add_child( root_0, body_content148.tree )

          else
            break # out of loop for decision 30
          end
        end # loop for decision 30
        __CLOSING_TAG149__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_div_733 )

        tree_for_CLOSING_TAG149 = @adaptor.create_with_payload( __CLOSING_TAG149__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG149 )

        __DIV150__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_div_735 )

        tree_for_DIV150 = @adaptor.create_with_payload( __DIV150__ )
        @adaptor.add_child( root_0, tree_for_DIV150 )

        __END_TAG151__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_div_737 )

        tree_for_END_TAG151 = @adaptor.create_with_payload( __END_TAG151__ )
        @adaptor.add_child( root_0, tree_for_END_TAG151 )

        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 21 )

      end
      
      return return_value
    end

    ItalicReturnValue = define_return_scope 

    # 
    # parser rule italic
    # 
    # (in HtmlParser.g)
    # 142:1: italic : OPENING_TAG I END_TAG ( text )+ CLOSING_TAG I END_TAG ;
    # 
    def italic
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = ItalicReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG152__ = nil
      __I153__ = nil
      __END_TAG154__ = nil
      __CLOSING_TAG156__ = nil
      __I157__ = nil
      __END_TAG158__ = nil
      text155 = nil

      tree_for_OPENING_TAG152 = nil
      tree_for_I153 = nil
      tree_for_END_TAG154 = nil
      tree_for_CLOSING_TAG156 = nil
      tree_for_I157 = nil
      tree_for_END_TAG158 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 142:9: OPENING_TAG I END_TAG ( text )+ CLOSING_TAG I END_TAG
        __OPENING_TAG152__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_italic_749 )

        tree_for_OPENING_TAG152 = @adaptor.create_with_payload( __OPENING_TAG152__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG152 )

        __I153__ = match( I, TOKENS_FOLLOWING_I_IN_italic_751 )

        tree_for_I153 = @adaptor.create_with_payload( __I153__ )
        @adaptor.add_child( root_0, tree_for_I153 )

        __END_TAG154__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_italic_753 )

        tree_for_END_TAG154 = @adaptor.create_with_payload( __END_TAG154__ )
        @adaptor.add_child( root_0, tree_for_END_TAG154 )

        # at file 143:3: ( text )+
        match_count_31 = 0
        while true
          alt_31 = 2
          look_31_0 = @input.peek( 1 )

          if ( look_31_0 == OPENING_TAG || look_31_0 == PCDATA )
            alt_31 = 1

          end
          case alt_31
          when 1
            # at line 143:4: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_italic_758 )
            text155 = text
            @state.following.pop
            @adaptor.add_child( root_0, text155.tree )

          else
            match_count_31 > 0 and break
            eee = EarlyExit(31)


            raise eee
          end
          match_count_31 += 1
        end

        __CLOSING_TAG156__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_italic_764 )

        tree_for_CLOSING_TAG156 = @adaptor.create_with_payload( __CLOSING_TAG156__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG156 )

        __I157__ = match( I, TOKENS_FOLLOWING_I_IN_italic_766 )

        tree_for_I157 = @adaptor.create_with_payload( __I157__ )
        @adaptor.add_child( root_0, tree_for_I157 )

        __END_TAG158__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_italic_768 )

        tree_for_END_TAG158 = @adaptor.create_with_payload( __END_TAG158__ )
        @adaptor.add_child( root_0, tree_for_END_TAG158 )

        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 22 )

      end
      
      return return_value
    end

    BoldReturnValue = define_return_scope 

    # 
    # parser rule bold
    # 
    # (in HtmlParser.g)
    # 147:1: bold : OPENING_TAG B END_TAG ( text )+ CLOSING_TAG B END_TAG ;
    # 
    def bold
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = BoldReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG159__ = nil
      __B160__ = nil
      __END_TAG161__ = nil
      __CLOSING_TAG163__ = nil
      __B164__ = nil
      __END_TAG165__ = nil
      text162 = nil

      tree_for_OPENING_TAG159 = nil
      tree_for_B160 = nil
      tree_for_END_TAG161 = nil
      tree_for_CLOSING_TAG163 = nil
      tree_for_B164 = nil
      tree_for_END_TAG165 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 147:9: OPENING_TAG B END_TAG ( text )+ CLOSING_TAG B END_TAG
        __OPENING_TAG159__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_bold_784 )

        tree_for_OPENING_TAG159 = @adaptor.create_with_payload( __OPENING_TAG159__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG159 )

        __B160__ = match( B, TOKENS_FOLLOWING_B_IN_bold_786 )

        tree_for_B160 = @adaptor.create_with_payload( __B160__ )
        @adaptor.add_child( root_0, tree_for_B160 )

        __END_TAG161__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_bold_788 )

        tree_for_END_TAG161 = @adaptor.create_with_payload( __END_TAG161__ )
        @adaptor.add_child( root_0, tree_for_END_TAG161 )

        # at file 148:3: ( text )+
        match_count_32 = 0
        while true
          alt_32 = 2
          look_32_0 = @input.peek( 1 )

          if ( look_32_0 == OPENING_TAG || look_32_0 == PCDATA )
            alt_32 = 1

          end
          case alt_32
          when 1
            # at line 148:4: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_bold_793 )
            text162 = text
            @state.following.pop
            @adaptor.add_child( root_0, text162.tree )

          else
            match_count_32 > 0 and break
            eee = EarlyExit(32)


            raise eee
          end
          match_count_32 += 1
        end

        __CLOSING_TAG163__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_bold_799 )

        tree_for_CLOSING_TAG163 = @adaptor.create_with_payload( __CLOSING_TAG163__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG163 )

        __B164__ = match( B, TOKENS_FOLLOWING_B_IN_bold_801 )

        tree_for_B164 = @adaptor.create_with_payload( __B164__ )
        @adaptor.add_child( root_0, tree_for_B164 )

        __END_TAG165__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_bold_803 )

        tree_for_END_TAG165 = @adaptor.create_with_payload( __END_TAG165__ )
        @adaptor.add_child( root_0, tree_for_END_TAG165 )

        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 23 )

      end
      
      return return_value
    end

    UnderlineReturnValue = define_return_scope 

    # 
    # parser rule underline
    # 
    # (in HtmlParser.g)
    # 152:1: underline : OPENING_TAG U END_TAG ( text )+ CLOSING_TAG U END_TAG ;
    # 
    def underline
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = UnderlineReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG166__ = nil
      __U167__ = nil
      __END_TAG168__ = nil
      __CLOSING_TAG170__ = nil
      __U171__ = nil
      __END_TAG172__ = nil
      text169 = nil

      tree_for_OPENING_TAG166 = nil
      tree_for_U167 = nil
      tree_for_END_TAG168 = nil
      tree_for_CLOSING_TAG170 = nil
      tree_for_U171 = nil
      tree_for_END_TAG172 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 152:12: OPENING_TAG U END_TAG ( text )+ CLOSING_TAG U END_TAG
        __OPENING_TAG166__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_underline_817 )

        tree_for_OPENING_TAG166 = @adaptor.create_with_payload( __OPENING_TAG166__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG166 )

        __U167__ = match( U, TOKENS_FOLLOWING_U_IN_underline_819 )

        tree_for_U167 = @adaptor.create_with_payload( __U167__ )
        @adaptor.add_child( root_0, tree_for_U167 )

        __END_TAG168__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_underline_821 )

        tree_for_END_TAG168 = @adaptor.create_with_payload( __END_TAG168__ )
        @adaptor.add_child( root_0, tree_for_END_TAG168 )

        # at file 153:6: ( text )+
        match_count_33 = 0
        while true
          alt_33 = 2
          look_33_0 = @input.peek( 1 )

          if ( look_33_0 == OPENING_TAG || look_33_0 == PCDATA )
            alt_33 = 1

          end
          case alt_33
          when 1
            # at line 153:7: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_underline_829 )
            text169 = text
            @state.following.pop
            @adaptor.add_child( root_0, text169.tree )

          else
            match_count_33 > 0 and break
            eee = EarlyExit(33)


            raise eee
          end
          match_count_33 += 1
        end

        __CLOSING_TAG170__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_underline_838 )

        tree_for_CLOSING_TAG170 = @adaptor.create_with_payload( __CLOSING_TAG170__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG170 )

        __U171__ = match( U, TOKENS_FOLLOWING_U_IN_underline_840 )

        tree_for_U171 = @adaptor.create_with_payload( __U171__ )
        @adaptor.add_child( root_0, tree_for_U171 )

        __END_TAG172__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_underline_842 )

        tree_for_END_TAG172 = @adaptor.create_with_payload( __END_TAG172__ )
        @adaptor.add_child( root_0, tree_for_END_TAG172 )

        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 24 )

      end
      
      return return_value
    end

    TableReturnValue = define_return_scope 

    # 
    # parser rule table
    # 
    # (in HtmlParser.g)
    # 158:1: table : OPENING_TAG TABLE ( id | style | klass | align | width | height | background | bgcolor | border )* END_TAG ( PCDATA )* ( tr )+ CLOSING_TAG TABLE END_TAG ;
    # 
    def table
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = TableReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG173__ = nil
      __TABLE174__ = nil
      __END_TAG184__ = nil
      __PCDATA185__ = nil
      __CLOSING_TAG187__ = nil
      __TABLE188__ = nil
      __END_TAG189__ = nil
      id175 = nil
      style176 = nil
      klass177 = nil
      align178 = nil
      width179 = nil
      height180 = nil
      background181 = nil
      bgcolor182 = nil
      border183 = nil
      tr186 = nil

      tree_for_OPENING_TAG173 = nil
      tree_for_TABLE174 = nil
      tree_for_END_TAG184 = nil
      tree_for_PCDATA185 = nil
      tree_for_CLOSING_TAG187 = nil
      tree_for_TABLE188 = nil
      tree_for_END_TAG189 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 159:4: OPENING_TAG TABLE ( id | style | klass | align | width | height | background | bgcolor | border )* END_TAG ( PCDATA )* ( tr )+ CLOSING_TAG TABLE END_TAG
        __OPENING_TAG173__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_table_866 )

        tree_for_OPENING_TAG173 = @adaptor.create_with_payload( __OPENING_TAG173__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG173 )

        __TABLE174__ = match( TABLE, TOKENS_FOLLOWING_TABLE_IN_table_868 )

        tree_for_TABLE174 = @adaptor.create_with_payload( __TABLE174__ )
        @adaptor.add_child( root_0, tree_for_TABLE174 )

        # at line 159:22: ( id | style | klass | align | width | height | background | bgcolor | border )*
        while true # decision 34
          alt_34 = 10
          alt_34 = @dfa34.predict( @input )
          case alt_34
          when 1
            # at line 159:23: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_table_871 )
            id175 = id
            @state.following.pop
            @adaptor.add_child( root_0, id175.tree )

          when 2
            # at line 159:26: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_table_873 )
            style176 = style
            @state.following.pop
            @adaptor.add_child( root_0, style176.tree )

          when 3
            # at line 159:32: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_table_875 )
            klass177 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass177.tree )

          when 4
            # at line 159:38: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_table_877 )
            align178 = align
            @state.following.pop
            @adaptor.add_child( root_0, align178.tree )

          when 5
            # at line 159:44: width
            @state.following.push( TOKENS_FOLLOWING_width_IN_table_879 )
            width179 = width
            @state.following.pop
            @adaptor.add_child( root_0, width179.tree )

          when 6
            # at line 159:50: height
            @state.following.push( TOKENS_FOLLOWING_height_IN_table_881 )
            height180 = height
            @state.following.pop
            @adaptor.add_child( root_0, height180.tree )

          when 7
            # at line 159:57: background
            @state.following.push( TOKENS_FOLLOWING_background_IN_table_883 )
            background181 = background
            @state.following.pop
            @adaptor.add_child( root_0, background181.tree )

          when 8
            # at line 159:68: bgcolor
            @state.following.push( TOKENS_FOLLOWING_bgcolor_IN_table_885 )
            bgcolor182 = bgcolor
            @state.following.pop
            @adaptor.add_child( root_0, bgcolor182.tree )

          when 9
            # at line 159:76: border
            @state.following.push( TOKENS_FOLLOWING_border_IN_table_887 )
            border183 = border
            @state.following.pop
            @adaptor.add_child( root_0, border183.tree )

          else
            break # out of loop for decision 34
          end
        end # loop for decision 34
        __END_TAG184__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_table_891 )

        tree_for_END_TAG184 = @adaptor.create_with_payload( __END_TAG184__ )
        @adaptor.add_child( root_0, tree_for_END_TAG184 )

        # at line 160:4: ( PCDATA )*
        while true # decision 35
          alt_35 = 2
          look_35_0 = @input.peek( 1 )

          if ( look_35_0 == PCDATA )
            alt_35 = 1

          end
          case alt_35
          when 1
            # at line 160:5: PCDATA
            __PCDATA185__ = match( PCDATA, TOKENS_FOLLOWING_PCDATA_IN_table_897 )

            tree_for_PCDATA185 = @adaptor.create_with_payload( __PCDATA185__ )
            @adaptor.add_child( root_0, tree_for_PCDATA185 )


          else
            break # out of loop for decision 35
          end
        end # loop for decision 35
        # at file 161:4: ( tr )+
        match_count_36 = 0
        while true
          alt_36 = 2
          look_36_0 = @input.peek( 1 )

          if ( look_36_0 == OPENING_TAG )
            alt_36 = 1

          end
          case alt_36
          when 1
            # at line 161:5: tr
            @state.following.push( TOKENS_FOLLOWING_tr_IN_table_905 )
            tr186 = tr
            @state.following.pop
            @adaptor.add_child( root_0, tr186.tree )

          else
            match_count_36 > 0 and break
            eee = EarlyExit(36)


            raise eee
          end
          match_count_36 += 1
        end

        __CLOSING_TAG187__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_table_912 )

        tree_for_CLOSING_TAG187 = @adaptor.create_with_payload( __CLOSING_TAG187__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG187 )

        __TABLE188__ = match( TABLE, TOKENS_FOLLOWING_TABLE_IN_table_914 )

        tree_for_TABLE188 = @adaptor.create_with_payload( __TABLE188__ )
        @adaptor.add_child( root_0, tree_for_TABLE188 )

        __END_TAG189__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_table_916 )

        tree_for_END_TAG189 = @adaptor.create_with_payload( __END_TAG189__ )
        @adaptor.add_child( root_0, tree_for_END_TAG189 )

        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 25 )

      end
      
      return return_value
    end

    TrReturnValue = define_return_scope 

    # 
    # parser rule tr
    # 
    # (in HtmlParser.g)
    # 165:1: tr : OPENING_TAG TR END_TAG ( PCDATA )* ( th | td )* CLOSING_TAG TR END_TAG ;
    # 
    def tr
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = TrReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG190__ = nil
      __TR191__ = nil
      __END_TAG192__ = nil
      __PCDATA193__ = nil
      __CLOSING_TAG196__ = nil
      __TR197__ = nil
      __END_TAG198__ = nil
      th194 = nil
      td195 = nil

      tree_for_OPENING_TAG190 = nil
      tree_for_TR191 = nil
      tree_for_END_TAG192 = nil
      tree_for_PCDATA193 = nil
      tree_for_CLOSING_TAG196 = nil
      tree_for_TR197 = nil
      tree_for_END_TAG198 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 165:6: OPENING_TAG TR END_TAG ( PCDATA )* ( th | td )* CLOSING_TAG TR END_TAG
        __OPENING_TAG190__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_tr_926 )

        tree_for_OPENING_TAG190 = @adaptor.create_with_payload( __OPENING_TAG190__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG190 )

        __TR191__ = match( TR, TOKENS_FOLLOWING_TR_IN_tr_928 )

        tree_for_TR191 = @adaptor.create_with_payload( __TR191__ )
        @adaptor.add_child( root_0, tree_for_TR191 )

        __END_TAG192__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_tr_930 )

        tree_for_END_TAG192 = @adaptor.create_with_payload( __END_TAG192__ )
        @adaptor.add_child( root_0, tree_for_END_TAG192 )

        # at line 166:4: ( PCDATA )*
        while true # decision 37
          alt_37 = 2
          look_37_0 = @input.peek( 1 )

          if ( look_37_0 == PCDATA )
            alt_37 = 1

          end
          case alt_37
          when 1
            # at line 166:5: PCDATA
            __PCDATA193__ = match( PCDATA, TOKENS_FOLLOWING_PCDATA_IN_tr_936 )

            tree_for_PCDATA193 = @adaptor.create_with_payload( __PCDATA193__ )
            @adaptor.add_child( root_0, tree_for_PCDATA193 )


          else
            break # out of loop for decision 37
          end
        end # loop for decision 37
        # at line 167:4: ( th | td )*
        while true # decision 38
          alt_38 = 3
          look_38_0 = @input.peek( 1 )

          if ( look_38_0 == OPENING_TAG )
            look_38_2 = @input.peek( 2 )

            if ( look_38_2 == TH )
              alt_38 = 1
            elsif ( look_38_2 == TD )
              alt_38 = 2

            end

          end
          case alt_38
          when 1
            # at line 167:5: th
            @state.following.push( TOKENS_FOLLOWING_th_IN_tr_944 )
            th194 = th
            @state.following.pop
            @adaptor.add_child( root_0, th194.tree )

          when 2
            # at line 167:10: td
            @state.following.push( TOKENS_FOLLOWING_td_IN_tr_948 )
            td195 = td
            @state.following.pop
            @adaptor.add_child( root_0, td195.tree )

          else
            break # out of loop for decision 38
          end
        end # loop for decision 38
        __CLOSING_TAG196__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_tr_955 )

        tree_for_CLOSING_TAG196 = @adaptor.create_with_payload( __CLOSING_TAG196__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG196 )

        __TR197__ = match( TR, TOKENS_FOLLOWING_TR_IN_tr_957 )

        tree_for_TR197 = @adaptor.create_with_payload( __TR197__ )
        @adaptor.add_child( root_0, tree_for_TR197 )

        __END_TAG198__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_tr_959 )

        tree_for_END_TAG198 = @adaptor.create_with_payload( __END_TAG198__ )
        @adaptor.add_child( root_0, tree_for_END_TAG198 )

        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 26 )

      end
      
      return return_value
    end

    ThReturnValue = define_return_scope 

    # 
    # parser rule th
    # 
    # (in HtmlParser.g)
    # 171:1: th : OPENING_TAG TH ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )* END_TAG ( body_content )* CLOSING_TAG TH END_TAG ;
    # 
    def th
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = ThReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG199__ = nil
      __TH200__ = nil
      __END_TAG211__ = nil
      __CLOSING_TAG213__ = nil
      __TH214__ = nil
      __END_TAG215__ = nil
      id201 = nil
      style202 = nil
      klass203 = nil
      align204 = nil
      valign205 = nil
      width206 = nil
      height207 = nil
      background208 = nil
      bgcolor209 = nil
      bordercolor210 = nil
      body_content212 = nil

      tree_for_OPENING_TAG199 = nil
      tree_for_TH200 = nil
      tree_for_END_TAG211 = nil
      tree_for_CLOSING_TAG213 = nil
      tree_for_TH214 = nil
      tree_for_END_TAG215 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 171:7: OPENING_TAG TH ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )* END_TAG ( body_content )* CLOSING_TAG TH END_TAG
        __OPENING_TAG199__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_th_970 )

        tree_for_OPENING_TAG199 = @adaptor.create_with_payload( __OPENING_TAG199__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG199 )

        __TH200__ = match( TH, TOKENS_FOLLOWING_TH_IN_th_972 )

        tree_for_TH200 = @adaptor.create_with_payload( __TH200__ )
        @adaptor.add_child( root_0, tree_for_TH200 )

        # at line 171:22: ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )*
        while true # decision 39
          alt_39 = 11
          alt_39 = @dfa39.predict( @input )
          case alt_39
          when 1
            # at line 171:23: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_th_975 )
            id201 = id
            @state.following.pop
            @adaptor.add_child( root_0, id201.tree )

          when 2
            # at line 171:26: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_th_977 )
            style202 = style
            @state.following.pop
            @adaptor.add_child( root_0, style202.tree )

          when 3
            # at line 171:32: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_th_979 )
            klass203 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass203.tree )

          when 4
            # at line 171:38: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_th_981 )
            align204 = align
            @state.following.pop
            @adaptor.add_child( root_0, align204.tree )

          when 5
            # at line 171:44: valign
            @state.following.push( TOKENS_FOLLOWING_valign_IN_th_983 )
            valign205 = valign
            @state.following.pop
            @adaptor.add_child( root_0, valign205.tree )

          when 6
            # at line 171:51: width
            @state.following.push( TOKENS_FOLLOWING_width_IN_th_985 )
            width206 = width
            @state.following.pop
            @adaptor.add_child( root_0, width206.tree )

          when 7
            # at line 171:57: height
            @state.following.push( TOKENS_FOLLOWING_height_IN_th_987 )
            height207 = height
            @state.following.pop
            @adaptor.add_child( root_0, height207.tree )

          when 8
            # at line 171:64: background
            @state.following.push( TOKENS_FOLLOWING_background_IN_th_989 )
            background208 = background
            @state.following.pop
            @adaptor.add_child( root_0, background208.tree )

          when 9
            # at line 171:75: bgcolor
            @state.following.push( TOKENS_FOLLOWING_bgcolor_IN_th_991 )
            bgcolor209 = bgcolor
            @state.following.pop
            @adaptor.add_child( root_0, bgcolor209.tree )

          when 10
            # at line 171:83: bordercolor
            @state.following.push( TOKENS_FOLLOWING_bordercolor_IN_th_993 )
            bordercolor210 = bordercolor
            @state.following.pop
            @adaptor.add_child( root_0, bordercolor210.tree )

          else
            break # out of loop for decision 39
          end
        end # loop for decision 39
        __END_TAG211__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_th_997 )

        tree_for_END_TAG211 = @adaptor.create_with_payload( __END_TAG211__ )
        @adaptor.add_child( root_0, tree_for_END_TAG211 )

        # at line 172:3: ( body_content )*
        while true # decision 40
          alt_40 = 2
          look_40_0 = @input.peek( 1 )

          if ( look_40_0 == OPENING_TAG || look_40_0 == PCDATA )
            alt_40 = 1

          end
          case alt_40
          when 1
            # at line 172:4: body_content
            @state.following.push( TOKENS_FOLLOWING_body_content_IN_th_1002 )
            body_content212 = body_content
            @state.following.pop
            @adaptor.add_child( root_0, body_content212.tree )

          else
            break # out of loop for decision 40
          end
        end # loop for decision 40
        __CLOSING_TAG213__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_th_1008 )

        tree_for_CLOSING_TAG213 = @adaptor.create_with_payload( __CLOSING_TAG213__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG213 )

        __TH214__ = match( TH, TOKENS_FOLLOWING_TH_IN_th_1010 )

        tree_for_TH214 = @adaptor.create_with_payload( __TH214__ )
        @adaptor.add_child( root_0, tree_for_TH214 )

        __END_TAG215__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_th_1012 )

        tree_for_END_TAG215 = @adaptor.create_with_payload( __END_TAG215__ )
        @adaptor.add_child( root_0, tree_for_END_TAG215 )

        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 27 )

      end
      
      return return_value
    end

    TdReturnValue = define_return_scope 

    # 
    # parser rule td
    # 
    # (in HtmlParser.g)
    # 176:1: td : OPENING_TAG TD ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )* END_TAG ( body_content )* CLOSING_TAG TD END_TAG ;
    # 
    def td
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = TdReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG216__ = nil
      __TD217__ = nil
      __END_TAG228__ = nil
      __CLOSING_TAG230__ = nil
      __TD231__ = nil
      __END_TAG232__ = nil
      id218 = nil
      style219 = nil
      klass220 = nil
      align221 = nil
      valign222 = nil
      width223 = nil
      height224 = nil
      background225 = nil
      bgcolor226 = nil
      bordercolor227 = nil
      body_content229 = nil

      tree_for_OPENING_TAG216 = nil
      tree_for_TD217 = nil
      tree_for_END_TAG228 = nil
      tree_for_CLOSING_TAG230 = nil
      tree_for_TD231 = nil
      tree_for_END_TAG232 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 176:7: OPENING_TAG TD ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )* END_TAG ( body_content )* CLOSING_TAG TD END_TAG
        __OPENING_TAG216__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_td_1023 )

        tree_for_OPENING_TAG216 = @adaptor.create_with_payload( __OPENING_TAG216__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG216 )

        __TD217__ = match( TD, TOKENS_FOLLOWING_TD_IN_td_1025 )

        tree_for_TD217 = @adaptor.create_with_payload( __TD217__ )
        @adaptor.add_child( root_0, tree_for_TD217 )

        # at line 176:22: ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )*
        while true # decision 41
          alt_41 = 11
          alt_41 = @dfa41.predict( @input )
          case alt_41
          when 1
            # at line 176:23: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_td_1028 )
            id218 = id
            @state.following.pop
            @adaptor.add_child( root_0, id218.tree )

          when 2
            # at line 176:26: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_td_1030 )
            style219 = style
            @state.following.pop
            @adaptor.add_child( root_0, style219.tree )

          when 3
            # at line 176:32: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_td_1032 )
            klass220 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass220.tree )

          when 4
            # at line 176:38: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_td_1034 )
            align221 = align
            @state.following.pop
            @adaptor.add_child( root_0, align221.tree )

          when 5
            # at line 176:44: valign
            @state.following.push( TOKENS_FOLLOWING_valign_IN_td_1036 )
            valign222 = valign
            @state.following.pop
            @adaptor.add_child( root_0, valign222.tree )

          when 6
            # at line 176:51: width
            @state.following.push( TOKENS_FOLLOWING_width_IN_td_1038 )
            width223 = width
            @state.following.pop
            @adaptor.add_child( root_0, width223.tree )

          when 7
            # at line 176:57: height
            @state.following.push( TOKENS_FOLLOWING_height_IN_td_1040 )
            height224 = height
            @state.following.pop
            @adaptor.add_child( root_0, height224.tree )

          when 8
            # at line 176:64: background
            @state.following.push( TOKENS_FOLLOWING_background_IN_td_1042 )
            background225 = background
            @state.following.pop
            @adaptor.add_child( root_0, background225.tree )

          when 9
            # at line 176:75: bgcolor
            @state.following.push( TOKENS_FOLLOWING_bgcolor_IN_td_1044 )
            bgcolor226 = bgcolor
            @state.following.pop
            @adaptor.add_child( root_0, bgcolor226.tree )

          when 10
            # at line 176:83: bordercolor
            @state.following.push( TOKENS_FOLLOWING_bordercolor_IN_td_1046 )
            bordercolor227 = bordercolor
            @state.following.pop
            @adaptor.add_child( root_0, bordercolor227.tree )

          else
            break # out of loop for decision 41
          end
        end # loop for decision 41
        __END_TAG228__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_td_1050 )

        tree_for_END_TAG228 = @adaptor.create_with_payload( __END_TAG228__ )
        @adaptor.add_child( root_0, tree_for_END_TAG228 )

        # at line 177:3: ( body_content )*
        while true # decision 42
          alt_42 = 2
          look_42_0 = @input.peek( 1 )

          if ( look_42_0 == OPENING_TAG || look_42_0 == PCDATA )
            alt_42 = 1

          end
          case alt_42
          when 1
            # at line 177:4: body_content
            @state.following.push( TOKENS_FOLLOWING_body_content_IN_td_1055 )
            body_content229 = body_content
            @state.following.pop
            @adaptor.add_child( root_0, body_content229.tree )

          else
            break # out of loop for decision 42
          end
        end # loop for decision 42
        __CLOSING_TAG230__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_td_1061 )

        tree_for_CLOSING_TAG230 = @adaptor.create_with_payload( __CLOSING_TAG230__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG230 )

        __TD231__ = match( TD, TOKENS_FOLLOWING_TD_IN_td_1063 )

        tree_for_TD231 = @adaptor.create_with_payload( __TD231__ )
        @adaptor.add_child( root_0, tree_for_TD231 )

        __END_TAG232__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_td_1065 )

        tree_for_END_TAG232 = @adaptor.create_with_payload( __END_TAG232__ )
        @adaptor.add_child( root_0, tree_for_END_TAG232 )

        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 28 )

      end
      
      return return_value
    end

    AnchorReturnValue = define_return_scope 

    # 
    # parser rule anchor
    # 
    # (in HtmlParser.g)
    # 182:1: anchor : OPENING_TAG A END_TAG ( text )* CLOSING_TAG A END_TAG ;
    # 
    def anchor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = AnchorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG233__ = nil
      __A234__ = nil
      __END_TAG235__ = nil
      __CLOSING_TAG237__ = nil
      __A238__ = nil
      __END_TAG239__ = nil
      text236 = nil

      tree_for_OPENING_TAG233 = nil
      tree_for_A234 = nil
      tree_for_END_TAG235 = nil
      tree_for_CLOSING_TAG237 = nil
      tree_for_A238 = nil
      tree_for_END_TAG239 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 182:9: OPENING_TAG A END_TAG ( text )* CLOSING_TAG A END_TAG
        __OPENING_TAG233__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_anchor_1077 )

        tree_for_OPENING_TAG233 = @adaptor.create_with_payload( __OPENING_TAG233__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG233 )

        __A234__ = match( A, TOKENS_FOLLOWING_A_IN_anchor_1079 )

        tree_for_A234 = @adaptor.create_with_payload( __A234__ )
        @adaptor.add_child( root_0, tree_for_A234 )

        __END_TAG235__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_anchor_1081 )

        tree_for_END_TAG235 = @adaptor.create_with_payload( __END_TAG235__ )
        @adaptor.add_child( root_0, tree_for_END_TAG235 )

        # at line 183:3: ( text )*
        while true # decision 43
          alt_43 = 2
          look_43_0 = @input.peek( 1 )

          if ( look_43_0 == OPENING_TAG || look_43_0 == PCDATA )
            alt_43 = 1

          end
          case alt_43
          when 1
            # at line 183:4: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_anchor_1086 )
            text236 = text
            @state.following.pop
            @adaptor.add_child( root_0, text236.tree )

          else
            break # out of loop for decision 43
          end
        end # loop for decision 43
        __CLOSING_TAG237__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_anchor_1092 )

        tree_for_CLOSING_TAG237 = @adaptor.create_with_payload( __CLOSING_TAG237__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG237 )

        __A238__ = match( A, TOKENS_FOLLOWING_A_IN_anchor_1094 )

        tree_for_A238 = @adaptor.create_with_payload( __A238__ )
        @adaptor.add_child( root_0, tree_for_A238 )

        __END_TAG239__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_anchor_1096 )

        tree_for_END_TAG239 = @adaptor.create_with_payload( __END_TAG239__ )
        @adaptor.add_child( root_0, tree_for_END_TAG239 )

        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 29 )

      end
      
      return return_value
    end

    ImgReturnValue = define_return_scope 

    # 
    # parser rule img
    # 
    # (in HtmlParser.g)
    # 187:1: img : OPENING_TAG IMG ( id | style | klass | align | src | alt | width | height )* END_NOPAIR_TAG ;
    # 
    def img
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = ImgReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG240__ = nil
      __IMG241__ = nil
      __END_NOPAIR_TAG250__ = nil
      id242 = nil
      style243 = nil
      klass244 = nil
      align245 = nil
      src246 = nil
      alt247 = nil
      width248 = nil
      height249 = nil

      tree_for_OPENING_TAG240 = nil
      tree_for_IMG241 = nil
      tree_for_END_NOPAIR_TAG250 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 187:6: OPENING_TAG IMG ( id | style | klass | align | src | alt | width | height )* END_NOPAIR_TAG
        __OPENING_TAG240__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_img_1107 )

        tree_for_OPENING_TAG240 = @adaptor.create_with_payload( __OPENING_TAG240__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG240 )

        __IMG241__ = match( IMG, TOKENS_FOLLOWING_IMG_IN_img_1109 )

        tree_for_IMG241 = @adaptor.create_with_payload( __IMG241__ )
        @adaptor.add_child( root_0, tree_for_IMG241 )

        # at line 187:22: ( id | style | klass | align | src | alt | width | height )*
        while true # decision 44
          alt_44 = 9
          alt_44 = @dfa44.predict( @input )
          case alt_44
          when 1
            # at line 187:23: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_img_1112 )
            id242 = id
            @state.following.pop
            @adaptor.add_child( root_0, id242.tree )

          when 2
            # at line 187:26: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_img_1114 )
            style243 = style
            @state.following.pop
            @adaptor.add_child( root_0, style243.tree )

          when 3
            # at line 187:32: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_img_1116 )
            klass244 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass244.tree )

          when 4
            # at line 187:38: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_img_1118 )
            align245 = align
            @state.following.pop
            @adaptor.add_child( root_0, align245.tree )

          when 5
            # at line 187:44: src
            @state.following.push( TOKENS_FOLLOWING_src_IN_img_1120 )
            src246 = src
            @state.following.pop
            @adaptor.add_child( root_0, src246.tree )

          when 6
            # at line 187:48: alt
            @state.following.push( TOKENS_FOLLOWING_alt_IN_img_1122 )
            alt247 = alt
            @state.following.pop
            @adaptor.add_child( root_0, alt247.tree )

          when 7
            # at line 187:52: width
            @state.following.push( TOKENS_FOLLOWING_width_IN_img_1124 )
            width248 = width
            @state.following.pop
            @adaptor.add_child( root_0, width248.tree )

          when 8
            # at line 187:58: height
            @state.following.push( TOKENS_FOLLOWING_height_IN_img_1126 )
            height249 = height
            @state.following.pop
            @adaptor.add_child( root_0, height249.tree )

          else
            break # out of loop for decision 44
          end
        end # loop for decision 44
        __END_NOPAIR_TAG250__ = match( END_NOPAIR_TAG, TOKENS_FOLLOWING_END_NOPAIR_TAG_IN_img_1132 )

        tree_for_END_NOPAIR_TAG250 = @adaptor.create_with_payload( __END_NOPAIR_TAG250__ )
        @adaptor.add_child( root_0, tree_for_END_NOPAIR_TAG250 )

        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 30 )

      end
      
      return return_value
    end

    BrReturnValue = define_return_scope 

    # 
    # parser rule br
    # 
    # (in HtmlParser.g)
    # 191:1: br : OPENING_TAG BR END_NOPAIR_TAG ;
    # 
    def br
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = BrReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG251__ = nil
      __BR252__ = nil
      __END_NOPAIR_TAG253__ = nil

      tree_for_OPENING_TAG251 = nil
      tree_for_BR252 = nil
      tree_for_END_NOPAIR_TAG253 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 191:5: OPENING_TAG BR END_NOPAIR_TAG
        __OPENING_TAG251__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_br_1146 )

        tree_for_OPENING_TAG251 = @adaptor.create_with_payload( __OPENING_TAG251__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG251 )

        __BR252__ = match( BR, TOKENS_FOLLOWING_BR_IN_br_1148 )

        tree_for_BR252 = @adaptor.create_with_payload( __BR252__ )
        @adaptor.add_child( root_0, tree_for_BR252 )

        __END_NOPAIR_TAG253__ = match( END_NOPAIR_TAG, TOKENS_FOLLOWING_END_NOPAIR_TAG_IN_br_1152 )

        tree_for_END_NOPAIR_TAG253 = @adaptor.create_with_payload( __END_NOPAIR_TAG253__ )
        @adaptor.add_child( root_0, tree_for_END_NOPAIR_TAG253 )

        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 31 )

      end
      
      return return_value
    end

    IdReturnValue = define_return_scope 

    # 
    # parser rule id
    # 
    # (in HtmlParser.g)
    # 197:1: id : WS ID attr_svalue ;
    # 
    def id
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = IdReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS254__ = nil
      __ID255__ = nil
      attr_svalue256 = nil

      tree_for_WS254 = nil
      tree_for_ID255 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 197:4: WS ID attr_svalue
        __WS254__ = match( WS, TOKENS_FOLLOWING_WS_IN_id_1166 )

        tree_for_WS254 = @adaptor.create_with_payload( __WS254__ )
        @adaptor.add_child( root_0, tree_for_WS254 )

        __ID255__ = match( ID, TOKENS_FOLLOWING_ID_IN_id_1168 )

        tree_for_ID255 = @adaptor.create_with_payload( __ID255__ )
        @adaptor.add_child( root_0, tree_for_ID255 )

        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_id_1170 )
        attr_svalue256 = attr_svalue
        @state.following.pop
        @adaptor.add_child( root_0, attr_svalue256.tree )
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 32 )

      end
      
      return return_value
    end

    StyleReturnValue = define_return_scope 

    # 
    # parser rule style
    # 
    # (in HtmlParser.g)
    # 198:1: style : WS STYLE attr_svalue ;
    # 
    def style
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = StyleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS257__ = nil
      __STYLE258__ = nil
      attr_svalue259 = nil

      tree_for_WS257 = nil
      tree_for_STYLE258 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 198:7: WS STYLE attr_svalue
        __WS257__ = match( WS, TOKENS_FOLLOWING_WS_IN_style_1175 )

        tree_for_WS257 = @adaptor.create_with_payload( __WS257__ )
        @adaptor.add_child( root_0, tree_for_WS257 )

        __STYLE258__ = match( STYLE, TOKENS_FOLLOWING_STYLE_IN_style_1177 )

        tree_for_STYLE258 = @adaptor.create_with_payload( __STYLE258__ )
        @adaptor.add_child( root_0, tree_for_STYLE258 )

        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_style_1179 )
        attr_svalue259 = attr_svalue
        @state.following.pop
        @adaptor.add_child( root_0, attr_svalue259.tree )
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 33 )

      end
      
      return return_value
    end

    KlassReturnValue = define_return_scope 

    # 
    # parser rule klass
    # 
    # (in HtmlParser.g)
    # 199:1: klass : WS CLASS attr_svalue ;
    # 
    def klass
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = KlassReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS260__ = nil
      __CLASS261__ = nil
      attr_svalue262 = nil

      tree_for_WS260 = nil
      tree_for_CLASS261 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 199:7: WS CLASS attr_svalue
        __WS260__ = match( WS, TOKENS_FOLLOWING_WS_IN_klass_1184 )

        tree_for_WS260 = @adaptor.create_with_payload( __WS260__ )
        @adaptor.add_child( root_0, tree_for_WS260 )

        __CLASS261__ = match( CLASS, TOKENS_FOLLOWING_CLASS_IN_klass_1186 )

        tree_for_CLASS261 = @adaptor.create_with_payload( __CLASS261__ )
        @adaptor.add_child( root_0, tree_for_CLASS261 )

        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_klass_1188 )
        attr_svalue262 = attr_svalue
        @state.following.pop
        @adaptor.add_child( root_0, attr_svalue262.tree )
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 34 )

      end
      
      return return_value
    end

    BgcolorReturnValue = define_return_scope 

    # 
    # parser rule bgcolor
    # 
    # (in HtmlParser.g)
    # 201:1: bgcolor : WS BGCOLOR attr_svalue ;
    # 
    def bgcolor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = BgcolorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS263__ = nil
      __BGCOLOR264__ = nil
      attr_svalue265 = nil

      tree_for_WS263 = nil
      tree_for_BGCOLOR264 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 201:9: WS BGCOLOR attr_svalue
        __WS263__ = match( WS, TOKENS_FOLLOWING_WS_IN_bgcolor_1195 )

        tree_for_WS263 = @adaptor.create_with_payload( __WS263__ )
        @adaptor.add_child( root_0, tree_for_WS263 )

        __BGCOLOR264__ = match( BGCOLOR, TOKENS_FOLLOWING_BGCOLOR_IN_bgcolor_1197 )

        tree_for_BGCOLOR264 = @adaptor.create_with_payload( __BGCOLOR264__ )
        @adaptor.add_child( root_0, tree_for_BGCOLOR264 )

        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_bgcolor_1199 )
        attr_svalue265 = attr_svalue
        @state.following.pop
        @adaptor.add_child( root_0, attr_svalue265.tree )
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 35 )

      end
      
      return return_value
    end

    BackgroundReturnValue = define_return_scope 

    # 
    # parser rule background
    # 
    # (in HtmlParser.g)
    # 203:1: background : WS BACKGROUND attr_svalue ;
    # 
    def background
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = BackgroundReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS266__ = nil
      __BACKGROUND267__ = nil
      attr_svalue268 = nil

      tree_for_WS266 = nil
      tree_for_BACKGROUND267 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 203:13: WS BACKGROUND attr_svalue
        __WS266__ = match( WS, TOKENS_FOLLOWING_WS_IN_background_1206 )

        tree_for_WS266 = @adaptor.create_with_payload( __WS266__ )
        @adaptor.add_child( root_0, tree_for_WS266 )

        __BACKGROUND267__ = match( BACKGROUND, TOKENS_FOLLOWING_BACKGROUND_IN_background_1208 )

        tree_for_BACKGROUND267 = @adaptor.create_with_payload( __BACKGROUND267__ )
        @adaptor.add_child( root_0, tree_for_BACKGROUND267 )

        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_background_1210 )
        attr_svalue268 = attr_svalue
        @state.following.pop
        @adaptor.add_child( root_0, attr_svalue268.tree )
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 36 )

      end
      
      return return_value
    end

    AlignReturnValue = define_return_scope 

    # 
    # parser rule align
    # 
    # (in HtmlParser.g)
    # 205:1: align : WS ALIGN attr_svalue ;
    # 
    def align
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = AlignReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS269__ = nil
      __ALIGN270__ = nil
      attr_svalue271 = nil

      tree_for_WS269 = nil
      tree_for_ALIGN270 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 205:8: WS ALIGN attr_svalue
        __WS269__ = match( WS, TOKENS_FOLLOWING_WS_IN_align_1217 )

        tree_for_WS269 = @adaptor.create_with_payload( __WS269__ )
        @adaptor.add_child( root_0, tree_for_WS269 )

        __ALIGN270__ = match( ALIGN, TOKENS_FOLLOWING_ALIGN_IN_align_1219 )

        tree_for_ALIGN270 = @adaptor.create_with_payload( __ALIGN270__ )
        @adaptor.add_child( root_0, tree_for_ALIGN270 )

        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_align_1221 )
        attr_svalue271 = attr_svalue
        @state.following.pop
        @adaptor.add_child( root_0, attr_svalue271.tree )
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 37 )

      end
      
      return return_value
    end

    SrcReturnValue = define_return_scope 

    # 
    # parser rule src
    # 
    # (in HtmlParser.g)
    # 207:1: src : WS SRC attr_svalue ;
    # 
    def src
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
      return_value = SrcReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS272__ = nil
      __SRC273__ = nil
      attr_svalue274 = nil

      tree_for_WS272 = nil
      tree_for_SRC273 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 207:6: WS SRC attr_svalue
        __WS272__ = match( WS, TOKENS_FOLLOWING_WS_IN_src_1228 )

        tree_for_WS272 = @adaptor.create_with_payload( __WS272__ )
        @adaptor.add_child( root_0, tree_for_WS272 )

        __SRC273__ = match( SRC, TOKENS_FOLLOWING_SRC_IN_src_1230 )

        tree_for_SRC273 = @adaptor.create_with_payload( __SRC273__ )
        @adaptor.add_child( root_0, tree_for_SRC273 )

        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_src_1232 )
        attr_svalue274 = attr_svalue
        @state.following.pop
        @adaptor.add_child( root_0, attr_svalue274.tree )
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 38 )

      end
      
      return return_value
    end

    AltReturnValue = define_return_scope 

    # 
    # parser rule alt
    # 
    # (in HtmlParser.g)
    # 209:1: alt : WS ALT attr_svalue ;
    # 
    def alt
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )
      return_value = AltReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS275__ = nil
      __ALT276__ = nil
      attr_svalue277 = nil

      tree_for_WS275 = nil
      tree_for_ALT276 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 209:6: WS ALT attr_svalue
        __WS275__ = match( WS, TOKENS_FOLLOWING_WS_IN_alt_1239 )

        tree_for_WS275 = @adaptor.create_with_payload( __WS275__ )
        @adaptor.add_child( root_0, tree_for_WS275 )

        __ALT276__ = match( ALT, TOKENS_FOLLOWING_ALT_IN_alt_1241 )

        tree_for_ALT276 = @adaptor.create_with_payload( __ALT276__ )
        @adaptor.add_child( root_0, tree_for_ALT276 )

        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_alt_1243 )
        attr_svalue277 = attr_svalue
        @state.following.pop
        @adaptor.add_child( root_0, attr_svalue277.tree )
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 39 )

      end
      
      return return_value
    end

    WidthReturnValue = define_return_scope 

    # 
    # parser rule width
    # 
    # (in HtmlParser.g)
    # 211:1: width : WS WIDTH attr_svalue ;
    # 
    def width
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )
      return_value = WidthReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS278__ = nil
      __WIDTH279__ = nil
      attr_svalue280 = nil

      tree_for_WS278 = nil
      tree_for_WIDTH279 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 211:8: WS WIDTH attr_svalue
        __WS278__ = match( WS, TOKENS_FOLLOWING_WS_IN_width_1250 )

        tree_for_WS278 = @adaptor.create_with_payload( __WS278__ )
        @adaptor.add_child( root_0, tree_for_WS278 )

        __WIDTH279__ = match( WIDTH, TOKENS_FOLLOWING_WIDTH_IN_width_1252 )

        tree_for_WIDTH279 = @adaptor.create_with_payload( __WIDTH279__ )
        @adaptor.add_child( root_0, tree_for_WIDTH279 )

        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_width_1254 )
        attr_svalue280 = attr_svalue
        @state.following.pop
        @adaptor.add_child( root_0, attr_svalue280.tree )
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 40 )

      end
      
      return return_value
    end

    HeightReturnValue = define_return_scope 

    # 
    # parser rule height
    # 
    # (in HtmlParser.g)
    # 213:1: height : WS HEIGHT attr_svalue ;
    # 
    def height
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )
      return_value = HeightReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS281__ = nil
      __HEIGHT282__ = nil
      attr_svalue283 = nil

      tree_for_WS281 = nil
      tree_for_HEIGHT282 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 213:9: WS HEIGHT attr_svalue
        __WS281__ = match( WS, TOKENS_FOLLOWING_WS_IN_height_1261 )

        tree_for_WS281 = @adaptor.create_with_payload( __WS281__ )
        @adaptor.add_child( root_0, tree_for_WS281 )

        __HEIGHT282__ = match( HEIGHT, TOKENS_FOLLOWING_HEIGHT_IN_height_1263 )

        tree_for_HEIGHT282 = @adaptor.create_with_payload( __HEIGHT282__ )
        @adaptor.add_child( root_0, tree_for_HEIGHT282 )

        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_height_1265 )
        attr_svalue283 = attr_svalue
        @state.following.pop
        @adaptor.add_child( root_0, attr_svalue283.tree )
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 41 )

      end
      
      return return_value
    end

    BordercolorReturnValue = define_return_scope 

    # 
    # parser rule bordercolor
    # 
    # (in HtmlParser.g)
    # 215:1: bordercolor : WS BORDERCOLOR attr_svalue ;
    # 
    def bordercolor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )
      return_value = BordercolorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS284__ = nil
      __BORDERCOLOR285__ = nil
      attr_svalue286 = nil

      tree_for_WS284 = nil
      tree_for_BORDERCOLOR285 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 215:14: WS BORDERCOLOR attr_svalue
        __WS284__ = match( WS, TOKENS_FOLLOWING_WS_IN_bordercolor_1272 )

        tree_for_WS284 = @adaptor.create_with_payload( __WS284__ )
        @adaptor.add_child( root_0, tree_for_WS284 )

        __BORDERCOLOR285__ = match( BORDERCOLOR, TOKENS_FOLLOWING_BORDERCOLOR_IN_bordercolor_1274 )

        tree_for_BORDERCOLOR285 = @adaptor.create_with_payload( __BORDERCOLOR285__ )
        @adaptor.add_child( root_0, tree_for_BORDERCOLOR285 )

        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_bordercolor_1276 )
        attr_svalue286 = attr_svalue
        @state.following.pop
        @adaptor.add_child( root_0, attr_svalue286.tree )
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 42 )

      end
      
      return return_value
    end

    ValignReturnValue = define_return_scope 

    # 
    # parser rule valign
    # 
    # (in HtmlParser.g)
    # 217:1: valign : WS VALIGN attr_svalue ;
    # 
    def valign
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )
      return_value = ValignReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS287__ = nil
      __VALIGN288__ = nil
      attr_svalue289 = nil

      tree_for_WS287 = nil
      tree_for_VALIGN288 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 217:9: WS VALIGN attr_svalue
        __WS287__ = match( WS, TOKENS_FOLLOWING_WS_IN_valign_1283 )

        tree_for_WS287 = @adaptor.create_with_payload( __WS287__ )
        @adaptor.add_child( root_0, tree_for_WS287 )

        __VALIGN288__ = match( VALIGN, TOKENS_FOLLOWING_VALIGN_IN_valign_1285 )

        tree_for_VALIGN288 = @adaptor.create_with_payload( __VALIGN288__ )
        @adaptor.add_child( root_0, tree_for_VALIGN288 )

        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_valign_1287 )
        attr_svalue289 = attr_svalue
        @state.following.pop
        @adaptor.add_child( root_0, attr_svalue289.tree )
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 43 )

      end
      
      return return_value
    end

    BorderReturnValue = define_return_scope 

    # 
    # parser rule border
    # 
    # (in HtmlParser.g)
    # 219:1: border : WS BORDER attr_svalue ;
    # 
    def border
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )
      return_value = BorderReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS290__ = nil
      __BORDER291__ = nil
      attr_svalue292 = nil

      tree_for_WS290 = nil
      tree_for_BORDER291 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 219:9: WS BORDER attr_svalue
        __WS290__ = match( WS, TOKENS_FOLLOWING_WS_IN_border_1294 )

        tree_for_WS290 = @adaptor.create_with_payload( __WS290__ )
        @adaptor.add_child( root_0, tree_for_WS290 )

        __BORDER291__ = match( BORDER, TOKENS_FOLLOWING_BORDER_IN_border_1296 )

        tree_for_BORDER291 = @adaptor.create_with_payload( __BORDER291__ )
        @adaptor.add_child( root_0, tree_for_BORDER291 )

        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_border_1298 )
        attr_svalue292 = attr_svalue
        @state.following.pop
        @adaptor.add_child( root_0, attr_svalue292.tree )
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 44 )

      end
      
      return return_value
    end

    AttrSvalueReturnValue = define_return_scope 

    # 
    # parser rule attr_svalue
    # 
    # (in HtmlParser.g)
    # 222:1: attr_svalue : ( WS )? ASSIGN ( WS )? SVALUE ;
    # 
    def attr_svalue
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )
      return_value = AttrSvalueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS293__ = nil
      __ASSIGN294__ = nil
      __WS295__ = nil
      __SVALUE296__ = nil

      tree_for_WS293 = nil
      tree_for_ASSIGN294 = nil
      tree_for_WS295 = nil
      tree_for_SVALUE296 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 222:14: ( WS )? ASSIGN ( WS )? SVALUE
        # at line 222:14: ( WS )?
        alt_45 = 2
        look_45_0 = @input.peek( 1 )

        if ( look_45_0 == WS )
          alt_45 = 1
        end
        case alt_45
        when 1
          # at line 222:14: WS
          __WS293__ = match( WS, TOKENS_FOLLOWING_WS_IN_attr_svalue_1308 )

          tree_for_WS293 = @adaptor.create_with_payload( __WS293__ )
          @adaptor.add_child( root_0, tree_for_WS293 )


        end
        __ASSIGN294__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_attr_svalue_1311 )

        tree_for_ASSIGN294 = @adaptor.create_with_payload( __ASSIGN294__ )
        @adaptor.add_child( root_0, tree_for_ASSIGN294 )

        # at line 222:25: ( WS )?
        alt_46 = 2
        look_46_0 = @input.peek( 1 )

        if ( look_46_0 == WS )
          alt_46 = 1
        end
        case alt_46
        when 1
          # at line 222:25: WS
          __WS295__ = match( WS, TOKENS_FOLLOWING_WS_IN_attr_svalue_1313 )

          tree_for_WS295 = @adaptor.create_with_payload( __WS295__ )
          @adaptor.add_child( root_0, tree_for_WS295 )


        end
        __SVALUE296__ = match( SVALUE, TOKENS_FOLLOWING_SVALUE_IN_attr_svalue_1316 )

        tree_for_SVALUE296 = @adaptor.create_with_payload( __SVALUE296__ )
        @adaptor.add_child( root_0, tree_for_SVALUE296 )

        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 45 )

      end
      
      return return_value
    end



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA34 < ANTLR3::DFA
      EOT = unpack( 12, -1 )
      EOF = unpack( 12, -1 )
      MIN = unpack( 1, 6, 1, -1, 1, 32, 9, -1 )
      MAX = unpack( 1, 31, 1, -1, 1, 44, 9, -1 )
      ACCEPT = unpack( 1, -1, 1, 10, 1, -1, 1, 1, 1, 2, 1, 3, 1, 4, 1, 5, 
                       1, 6, 1, 7, 1, 8, 1, 9 )
      SPECIAL = unpack( 12, -1 )
      TRANSITION = [
        unpack( 1, 1, 24, -1, 1, 2 ),
        unpack(  ),
        unpack( 1, 3, 1, 4, 1, 5, 1, 10, 1, 9, 1, 6, 2, -1, 1, 7, 1, 8, 
                 2, -1, 1, 11 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 34
      

      def description
        <<-'__dfa_description__'.strip!
          ()* loopback of 159:22: ( id | style | klass | align | width | height | background | bgcolor | border )*
        __dfa_description__
      end
    end
    class DFA39 < ANTLR3::DFA
      EOT = unpack( 13, -1 )
      EOF = unpack( 13, -1 )
      MIN = unpack( 1, 6, 1, -1, 1, 32, 10, -1 )
      MAX = unpack( 1, 31, 1, -1, 1, 43, 10, -1 )
      ACCEPT = unpack( 1, -1, 1, 11, 1, -1, 1, 1, 1, 2, 1, 3, 1, 4, 1, 5, 
                       1, 6, 1, 7, 1, 8, 1, 9, 1, 10 )
      SPECIAL = unpack( 13, -1 )
      TRANSITION = [
        unpack( 1, 1, 24, -1, 1, 2 ),
        unpack(  ),
        unpack( 1, 3, 1, 4, 1, 5, 1, 11, 1, 10, 1, 6, 2, -1, 1, 8, 1, 9, 
                 1, 12, 1, 7 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 39
      

      def description
        <<-'__dfa_description__'.strip!
          ()* loopback of 171:22: ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )*
        __dfa_description__
      end
    end
    class DFA41 < ANTLR3::DFA
      EOT = unpack( 13, -1 )
      EOF = unpack( 13, -1 )
      MIN = unpack( 1, 6, 1, -1, 1, 32, 10, -1 )
      MAX = unpack( 1, 31, 1, -1, 1, 43, 10, -1 )
      ACCEPT = unpack( 1, -1, 1, 11, 1, -1, 1, 1, 1, 2, 1, 3, 1, 4, 1, 5, 
                       1, 6, 1, 7, 1, 8, 1, 9, 1, 10 )
      SPECIAL = unpack( 13, -1 )
      TRANSITION = [
        unpack( 1, 1, 24, -1, 1, 2 ),
        unpack(  ),
        unpack( 1, 3, 1, 4, 1, 5, 1, 11, 1, 10, 1, 6, 2, -1, 1, 8, 1, 9, 
                 1, 12, 1, 7 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 41
      

      def description
        <<-'__dfa_description__'.strip!
          ()* loopback of 176:22: ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )*
        __dfa_description__
      end
    end
    class DFA44 < ANTLR3::DFA
      EOT = unpack( 11, -1 )
      EOF = unpack( 11, -1 )
      MIN = unpack( 1, 29, 1, -1, 1, 32, 8, -1 )
      MAX = unpack( 1, 31, 1, -1, 1, 41, 8, -1 )
      ACCEPT = unpack( 1, -1, 1, 9, 1, -1, 1, 1, 1, 2, 1, 3, 1, 4, 1, 5, 
                       1, 6, 1, 7, 1, 8 )
      SPECIAL = unpack( 11, -1 )
      TRANSITION = [
        unpack( 1, 1, 1, -1, 1, 2 ),
        unpack(  ),
        unpack( 1, 3, 1, 4, 1, 5, 2, -1, 1, 6, 1, 7, 1, 8, 1, 9, 1, 10 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 44
      

      def description
        <<-'__dfa_description__'.strip!
          ()* loopback of 187:22: ( id | style | klass | align | src | alt | width | height )*
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa34 = DFA34.new( self, 34 )
      @dfa39 = DFA39.new( self, 39 )
      @dfa41 = DFA41.new( self, 41 )
      @dfa44 = DFA44.new( self, 44 )

    end
    TOKENS_FOLLOWING_OPENING_TAG_IN_document_56 = Set[ 5 ]
    TOKENS_FOLLOWING_HTML_IN_document_60 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_document_64 = Set[ 4, 7 ]
    TOKENS_FOLLOWING_head_IN_document_69 = Set[ 4, 7 ]
    TOKENS_FOLLOWING_body_IN_document_76 = Set[ 7 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_document_82 = Set[ 5 ]
    TOKENS_FOLLOWING_HTML_IN_document_84 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_document_88 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_head_98 = Set[ 8 ]
    TOKENS_FOLLOWING_HEAD_IN_head_100 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_head_102 = Set[ 4, 7 ]
    TOKENS_FOLLOWING_head_element_IN_head_107 = Set[ 7 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_head_113 = Set[ 8 ]
    TOKENS_FOLLOWING_HEAD_IN_head_115 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_head_117 = Set[ 1 ]
    TOKENS_FOLLOWING_title_IN_head_element_128 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_title_140 = Set[ 9 ]
    TOKENS_FOLLOWING_TITLE_IN_title_142 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_title_144 = Set[ 7, 10 ]
    TOKENS_FOLLOWING_PCDATA_IN_title_148 = Set[ 7 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_title_153 = Set[ 9 ]
    TOKENS_FOLLOWING_TITLE_IN_title_155 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_title_157 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_body_167 = Set[ 11 ]
    TOKENS_FOLLOWING_BODY_IN_body_169 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_id_IN_body_172 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_style_IN_body_174 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_klass_IN_body_176 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_bgcolor_IN_body_178 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_background_IN_body_180 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_END_TAG_IN_body_184 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_body_content_IN_body_194 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_body_202 = Set[ 11 ]
    TOKENS_FOLLOWING_BODY_IN_body_204 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_body_206 = Set[ 1 ]
    TOKENS_FOLLOWING_heading_IN_body_tag_221 = Set[ 1 ]
    TOKENS_FOLLOWING_block_IN_body_tag_227 = Set[ 1 ]
    TOKENS_FOLLOWING_body_tag_IN_body_content_238 = Set[ 1 ]
    TOKENS_FOLLOWING_text_IN_body_content_244 = Set[ 1 ]
    TOKENS_FOLLOWING_h1_IN_heading_257 = Set[ 1 ]
    TOKENS_FOLLOWING_h2_IN_heading_261 = Set[ 1 ]
    TOKENS_FOLLOWING_h3_IN_heading_265 = Set[ 1 ]
    TOKENS_FOLLOWING_h4_IN_heading_269 = Set[ 1 ]
    TOKENS_FOLLOWING_h5_IN_heading_273 = Set[ 1 ]
    TOKENS_FOLLOWING_h6_IN_heading_277 = Set[ 1 ]
    TOKENS_FOLLOWING_paragraph_IN_block_289 = Set[ 1 ]
    TOKENS_FOLLOWING_div_IN_block_294 = Set[ 1 ]
    TOKENS_FOLLOWING_table_IN_block_299 = Set[ 1 ]
    TOKENS_FOLLOWING_italic_IN_font_311 = Set[ 1 ]
    TOKENS_FOLLOWING_bold_IN_font_316 = Set[ 1 ]
    TOKENS_FOLLOWING_underline_IN_font_321 = Set[ 1 ]
    TOKENS_FOLLOWING_anchor_IN_special_333 = Set[ 1 ]
    TOKENS_FOLLOWING_img_IN_special_339 = Set[ 1 ]
    TOKENS_FOLLOWING_br_IN_special_344 = Set[ 1 ]
    TOKENS_FOLLOWING_font_IN_text_tag_356 = Set[ 1 ]
    TOKENS_FOLLOWING_special_IN_text_tag_362 = Set[ 1 ]
    TOKENS_FOLLOWING_PCDATA_IN_text_372 = Set[ 1 ]
    TOKENS_FOLLOWING_text_tag_IN_text_378 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_h1_395 = Set[ 12 ]
    TOKENS_FOLLOWING_H1_IN_h1_397 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_id_IN_h1_400 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_style_IN_h1_402 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_klass_IN_h1_404 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_align_IN_h1_406 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_END_TAG_IN_h1_410 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_block_IN_h1_415 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_text_IN_h1_419 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_h1_425 = Set[ 12 ]
    TOKENS_FOLLOWING_H1_IN_h1_427 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_h1_429 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_h2_440 = Set[ 13 ]
    TOKENS_FOLLOWING_H2_IN_h2_442 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_id_IN_h2_445 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_style_IN_h2_447 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_klass_IN_h2_449 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_align_IN_h2_451 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_END_TAG_IN_h2_455 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_block_IN_h2_460 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_text_IN_h2_464 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_h2_470 = Set[ 13 ]
    TOKENS_FOLLOWING_H2_IN_h2_472 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_h2_474 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_h3_485 = Set[ 14 ]
    TOKENS_FOLLOWING_H3_IN_h3_487 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_id_IN_h3_490 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_style_IN_h3_492 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_klass_IN_h3_494 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_align_IN_h3_496 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_END_TAG_IN_h3_500 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_block_IN_h3_505 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_text_IN_h3_509 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_h3_515 = Set[ 14 ]
    TOKENS_FOLLOWING_H3_IN_h3_517 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_h3_519 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_h4_530 = Set[ 15 ]
    TOKENS_FOLLOWING_H4_IN_h4_532 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_id_IN_h4_535 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_style_IN_h4_537 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_klass_IN_h4_539 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_align_IN_h4_541 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_END_TAG_IN_h4_545 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_block_IN_h4_550 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_text_IN_h4_554 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_h4_560 = Set[ 15 ]
    TOKENS_FOLLOWING_H4_IN_h4_562 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_h4_564 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_h5_575 = Set[ 16 ]
    TOKENS_FOLLOWING_H5_IN_h5_577 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_id_IN_h5_580 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_style_IN_h5_582 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_klass_IN_h5_584 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_align_IN_h5_586 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_END_TAG_IN_h5_590 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_block_IN_h5_595 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_text_IN_h5_599 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_h5_605 = Set[ 16 ]
    TOKENS_FOLLOWING_H5_IN_h5_607 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_h5_609 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_h6_620 = Set[ 17 ]
    TOKENS_FOLLOWING_H6_IN_h6_622 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_id_IN_h6_625 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_style_IN_h6_627 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_klass_IN_h6_629 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_align_IN_h6_631 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_END_TAG_IN_h6_635 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_block_IN_h6_640 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_text_IN_h6_644 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_h6_650 = Set[ 17 ]
    TOKENS_FOLLOWING_H6_IN_h6_652 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_h6_654 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_paragraph_667 = Set[ 18 ]
    TOKENS_FOLLOWING_P_IN_paragraph_669 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_id_IN_paragraph_672 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_style_IN_paragraph_674 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_klass_IN_paragraph_676 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_align_IN_paragraph_678 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_END_TAG_IN_paragraph_682 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_text_IN_paragraph_687 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_paragraph_693 = Set[ 18 ]
    TOKENS_FOLLOWING_P_IN_paragraph_695 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_paragraph_697 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_div_707 = Set[ 19 ]
    TOKENS_FOLLOWING_DIV_IN_div_709 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_id_IN_div_712 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_style_IN_div_714 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_klass_IN_div_716 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_align_IN_div_718 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_END_TAG_IN_div_722 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_body_content_IN_div_727 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_div_733 = Set[ 19 ]
    TOKENS_FOLLOWING_DIV_IN_div_735 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_div_737 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_italic_749 = Set[ 20 ]
    TOKENS_FOLLOWING_I_IN_italic_751 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_italic_753 = Set[ 4, 10 ]
    TOKENS_FOLLOWING_text_IN_italic_758 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_italic_764 = Set[ 20 ]
    TOKENS_FOLLOWING_I_IN_italic_766 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_italic_768 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_bold_784 = Set[ 21 ]
    TOKENS_FOLLOWING_B_IN_bold_786 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_bold_788 = Set[ 4, 10 ]
    TOKENS_FOLLOWING_text_IN_bold_793 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_bold_799 = Set[ 21 ]
    TOKENS_FOLLOWING_B_IN_bold_801 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_bold_803 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_underline_817 = Set[ 22 ]
    TOKENS_FOLLOWING_U_IN_underline_819 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_underline_821 = Set[ 4, 10 ]
    TOKENS_FOLLOWING_text_IN_underline_829 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_underline_838 = Set[ 22 ]
    TOKENS_FOLLOWING_U_IN_underline_840 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_underline_842 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_table_866 = Set[ 23 ]
    TOKENS_FOLLOWING_TABLE_IN_table_868 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_id_IN_table_871 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_style_IN_table_873 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_klass_IN_table_875 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_align_IN_table_877 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_width_IN_table_879 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_height_IN_table_881 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_background_IN_table_883 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_bgcolor_IN_table_885 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_border_IN_table_887 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_END_TAG_IN_table_891 = Set[ 4, 10 ]
    TOKENS_FOLLOWING_PCDATA_IN_table_897 = Set[ 4, 10 ]
    TOKENS_FOLLOWING_tr_IN_table_905 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_table_912 = Set[ 23 ]
    TOKENS_FOLLOWING_TABLE_IN_table_914 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_table_916 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_tr_926 = Set[ 24 ]
    TOKENS_FOLLOWING_TR_IN_tr_928 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_tr_930 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_PCDATA_IN_tr_936 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_th_IN_tr_944 = Set[ 4, 7 ]
    TOKENS_FOLLOWING_td_IN_tr_948 = Set[ 4, 7 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_tr_955 = Set[ 24 ]
    TOKENS_FOLLOWING_TR_IN_tr_957 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_tr_959 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_th_970 = Set[ 25 ]
    TOKENS_FOLLOWING_TH_IN_th_972 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_id_IN_th_975 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_style_IN_th_977 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_klass_IN_th_979 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_align_IN_th_981 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_valign_IN_th_983 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_width_IN_th_985 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_height_IN_th_987 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_background_IN_th_989 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_bgcolor_IN_th_991 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_bordercolor_IN_th_993 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_END_TAG_IN_th_997 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_body_content_IN_th_1002 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_th_1008 = Set[ 25 ]
    TOKENS_FOLLOWING_TH_IN_th_1010 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_th_1012 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_td_1023 = Set[ 26 ]
    TOKENS_FOLLOWING_TD_IN_td_1025 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_id_IN_td_1028 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_style_IN_td_1030 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_klass_IN_td_1032 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_align_IN_td_1034 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_valign_IN_td_1036 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_width_IN_td_1038 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_height_IN_td_1040 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_background_IN_td_1042 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_bgcolor_IN_td_1044 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_bordercolor_IN_td_1046 = Set[ 6, 31 ]
    TOKENS_FOLLOWING_END_TAG_IN_td_1050 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_body_content_IN_td_1055 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_td_1061 = Set[ 26 ]
    TOKENS_FOLLOWING_TD_IN_td_1063 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_td_1065 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_anchor_1077 = Set[ 27 ]
    TOKENS_FOLLOWING_A_IN_anchor_1079 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_anchor_1081 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_text_IN_anchor_1086 = Set[ 4, 7, 10 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_anchor_1092 = Set[ 27 ]
    TOKENS_FOLLOWING_A_IN_anchor_1094 = Set[ 6 ]
    TOKENS_FOLLOWING_END_TAG_IN_anchor_1096 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_img_1107 = Set[ 28 ]
    TOKENS_FOLLOWING_IMG_IN_img_1109 = Set[ 29, 31 ]
    TOKENS_FOLLOWING_id_IN_img_1112 = Set[ 29, 31 ]
    TOKENS_FOLLOWING_style_IN_img_1114 = Set[ 29, 31 ]
    TOKENS_FOLLOWING_klass_IN_img_1116 = Set[ 29, 31 ]
    TOKENS_FOLLOWING_align_IN_img_1118 = Set[ 29, 31 ]
    TOKENS_FOLLOWING_src_IN_img_1120 = Set[ 29, 31 ]
    TOKENS_FOLLOWING_alt_IN_img_1122 = Set[ 29, 31 ]
    TOKENS_FOLLOWING_width_IN_img_1124 = Set[ 29, 31 ]
    TOKENS_FOLLOWING_height_IN_img_1126 = Set[ 29, 31 ]
    TOKENS_FOLLOWING_END_NOPAIR_TAG_IN_img_1132 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_br_1146 = Set[ 30 ]
    TOKENS_FOLLOWING_BR_IN_br_1148 = Set[ 29 ]
    TOKENS_FOLLOWING_END_NOPAIR_TAG_IN_br_1152 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_id_1166 = Set[ 32 ]
    TOKENS_FOLLOWING_ID_IN_id_1168 = Set[ 31, 45 ]
    TOKENS_FOLLOWING_attr_svalue_IN_id_1170 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_style_1175 = Set[ 33 ]
    TOKENS_FOLLOWING_STYLE_IN_style_1177 = Set[ 31, 45 ]
    TOKENS_FOLLOWING_attr_svalue_IN_style_1179 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_klass_1184 = Set[ 34 ]
    TOKENS_FOLLOWING_CLASS_IN_klass_1186 = Set[ 31, 45 ]
    TOKENS_FOLLOWING_attr_svalue_IN_klass_1188 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_bgcolor_1195 = Set[ 35 ]
    TOKENS_FOLLOWING_BGCOLOR_IN_bgcolor_1197 = Set[ 31, 45 ]
    TOKENS_FOLLOWING_attr_svalue_IN_bgcolor_1199 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_background_1206 = Set[ 36 ]
    TOKENS_FOLLOWING_BACKGROUND_IN_background_1208 = Set[ 31, 45 ]
    TOKENS_FOLLOWING_attr_svalue_IN_background_1210 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_align_1217 = Set[ 37 ]
    TOKENS_FOLLOWING_ALIGN_IN_align_1219 = Set[ 31, 45 ]
    TOKENS_FOLLOWING_attr_svalue_IN_align_1221 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_src_1228 = Set[ 38 ]
    TOKENS_FOLLOWING_SRC_IN_src_1230 = Set[ 31, 45 ]
    TOKENS_FOLLOWING_attr_svalue_IN_src_1232 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_alt_1239 = Set[ 39 ]
    TOKENS_FOLLOWING_ALT_IN_alt_1241 = Set[ 31, 45 ]
    TOKENS_FOLLOWING_attr_svalue_IN_alt_1243 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_width_1250 = Set[ 40 ]
    TOKENS_FOLLOWING_WIDTH_IN_width_1252 = Set[ 31, 45 ]
    TOKENS_FOLLOWING_attr_svalue_IN_width_1254 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_height_1261 = Set[ 41 ]
    TOKENS_FOLLOWING_HEIGHT_IN_height_1263 = Set[ 31, 45 ]
    TOKENS_FOLLOWING_attr_svalue_IN_height_1265 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_bordercolor_1272 = Set[ 42 ]
    TOKENS_FOLLOWING_BORDERCOLOR_IN_bordercolor_1274 = Set[ 31, 45 ]
    TOKENS_FOLLOWING_attr_svalue_IN_bordercolor_1276 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_valign_1283 = Set[ 43 ]
    TOKENS_FOLLOWING_VALIGN_IN_valign_1285 = Set[ 31, 45 ]
    TOKENS_FOLLOWING_attr_svalue_IN_valign_1287 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_border_1294 = Set[ 44 ]
    TOKENS_FOLLOWING_BORDER_IN_border_1296 = Set[ 31, 45 ]
    TOKENS_FOLLOWING_attr_svalue_IN_border_1298 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_attr_svalue_1308 = Set[ 45 ]
    TOKENS_FOLLOWING_ASSIGN_IN_attr_svalue_1311 = Set[ 31, 46 ]
    TOKENS_FOLLOWING_WS_IN_attr_svalue_1313 = Set[ 46 ]
    TOKENS_FOLLOWING_SVALUE_IN_attr_svalue_1316 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

