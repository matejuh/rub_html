#!/usr/bin/env ruby
#
# HtmlParser.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: HtmlParser.g
# Generated at: 2011-12-23 13:58:18
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
    define_tokens( :END_TAG => 9, :CLASS => 37, :BORDERCOLOR => 45, :LETTER => 53, 
                   :HEAD => 11, :HREF => 48, :VALIGN => 46, :TABLE => 26, 
                   :HTML => 8, :ID => 35, :EOF => -1, :BORDER => 47, :PCDATA => 13, 
                   :NAME => 55, :BACKGROUND => 39, :ALT => 42, :BODY => 14, 
                   :DIGIT => 56, :ALIGN => 40, :IMG => 31, :TD => 29, :A => 30, 
                   :BR => 33, :B => 24, :TH => 28, :HEIGHT => 44, :ANAME => 49, 
                   :I => 23, :TR => 27, :SRC => 41, :U => 25, :ATTRS => 5, 
                   :P => 21, :TARGET => 50, :END_NOPAIR_TAG => 32, :TAG => 4, 
                   :NAMECHAR => 54, :BGCOLOR => 38, :CLOSING_TAG => 10, 
                   :SVALUE => 52, :WS => 34, :ASSIGN => 51, :WIDTH => 43, 
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


  class Parser < ANTLR3::Parser
    @grammar_home = HtmlParser
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :document, :html, :head, :head_element, :title, :body, 
                     :body_tag, :body_content, :heading, :block, :font, 
                     :special, :text_tag, :text, :h1, :h2, :h3, :h4, :h5, 
                     :h6, :heading_data, :paragraph, :div, :italic, :bold, 
                     :underline, :table, :tr, :th, :td, :anchor, :img, :br, 
                     :id, :style, :klass, :bgcolor, :background, :align, 
                     :src, :alt, :width, :height, :bordercolor, :valign, 
                     :border, :href, :name, :target, :attr_svalue ].freeze


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
      
      def print()
        @input.each do |token|
          puts token_name(token.type)
        end
      end

       def recover_from_mismatched_token( type, follow )
       end
         
       def error_message(e=$!)
       	# $!         The exception information message set by 'raise'.
        puts e.class
        puts (e.input.at(e.input.position+2)).text
        case e
          when UnwantedToken
              if(token_name((e.input.at(e.input.position)).type)=="SVALUE")
                "Missing quotation around attribute #{e.token.text}"
              else
                token_name = token_name( e.expecting )
                "Extraneous input #{ token_error_display( e.unexpected_token ) } expecting #{ token_name }"
              end
              
          when MissingToken
            token_name = token_name( e.expecting )
            "Missing #{ token_name } at #{ token_error_display( e.symbol ) }"
            
          when MismatchedToken
            i=0
            while token_name((e.input.at(e.input.position-i)).type)=="WS"
              i+=1;
            end
            
            puts (e.input.at(e.input.position))
            
            if(!((e.input.at(e.input.position-i)).nil?) && token_name((e.input.at(e.input.position-i)).type)=="CLOSING_TAG")
              "Mismatched input: found </#{e.token}> expecting </#{(token_name(e.expecting)).downcase}>"
            elsif(!((e.input.at(e.input.position-i)).nil?) && token_name((e.input.at(e.input.position-i)).type)=="OPENING_TAG")
              "Mismatched input: found <#{e.token}> expecting <#{(token_name(e.expecting)).downcase}>"
            elsif(!((e.input.at(e.input.position)).nil?) && token_name((e.input.at(e.input.position)).type)=="NAME")
              "Missing quotations around attribute #{(e.input.at(e.input.position)).type}"
            else
              token_name=""
              if token_name( e.expecting )=="SVALUE"
                token_name="attributte value"
              else
                token_name=(token_name(e.expecting)).downcase
              end
              "Mismatched input #{ token_error_display(e.symbol) } expecting #{token_name}"
            end
            
          when MismatchedTreeNode
            token_name = token_name( e.expecting )
            "Mismatched tree node: #{ e.symbol } expecting #{ token_name }"
          
          when NoViableAlternative
            if token_name(e.symbol.type)=="OPENING_TAG"
              i=1
              while token_name((e.input.at(e.input.position+i)).type)=="WS"
                i+=1;
              end
              "Unknown tagname "<< (e.input.at(e.input.position+i)).text
            elsif token_name(e.symbol.type)=="NAME"
              "Unknown attribute name, or this attribute cannot be used with given tag: "<< (e.input.at(e.input.position+1)).text
            else
              "No viable alternative at input " << token_error_display( e.symbol )
            end
          
          when MismatchedSet
            "Mismatched input %s expecting set %s" %
            [ token_error_display( e.symbol ), e.expecting.inspect ]
          when MismatchedNotSet
            "Mismatched input %s expecting set %s" %
            [ token_error_display( e.symbol ), e.expecting.inspect ]
          when FailedPredicate
            "Rule %s failed predicate: { %s }?" % [ e.rule_name, e.predicate_text ]
          
          else
            e.message   
          end
        end

    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -
    DocumentReturnValue = define_return_scope 

    # 
    # parser rule document
    # 
    # (in HtmlParser.g)
    # 91:1: document : html ;
    # 
    def document
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )
      return_value = DocumentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      html1 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 91:11: html
        @state.following.push( TOKENS_FOLLOWING_html_IN_document_38 )
        html1 = html
        @state.following.pop
        @adaptor.add_child( root_0, html1.tree )
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
        # trace_out( __method__, 1 )

      end
      
      return return_value
    end

    HtmlReturnValue = define_return_scope 

    # 
    # parser rule html
    # 
    # (in HtmlParser.g)
    # 93:1: html : OPENING_TAG HTML END_TAG ( head )? ( body )? CLOSING_TAG HTML END_TAG -> ^( TAG HTML ( head )? ( body )? ) ;
    # 
    def html
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )
      return_value = HtmlReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG2__ = nil
      __HTML3__ = nil
      __END_TAG4__ = nil
      __CLOSING_TAG7__ = nil
      __HTML8__ = nil
      __END_TAG9__ = nil
      head5 = nil
      body6 = nil

      tree_for_OPENING_TAG2 = nil
      tree_for_HTML3 = nil
      tree_for_END_TAG4 = nil
      tree_for_CLOSING_TAG7 = nil
      tree_for_HTML8 = nil
      tree_for_END_TAG9 = nil
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_HTML = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token HTML" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_body = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule body" )
      stream_head = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule head" )# - - - - @init action - - - -
      @stack=[]

      begin
        # at line 95:4: OPENING_TAG HTML END_TAG ( head )? ( body )? CLOSING_TAG HTML END_TAG
        __OPENING_TAG2__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_html_52 )
        stream_OPENING_TAG.add( __OPENING_TAG2__ )
        __HTML3__ = match( HTML, TOKENS_FOLLOWING_HTML_IN_html_54 )
        stream_HTML.add( __HTML3__ )
        __END_TAG4__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_html_56 )
        stream_END_TAG.add( __END_TAG4__ )
        # at line 96:3: ( head )?
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
          # at line 96:4: head
          @state.following.push( TOKENS_FOLLOWING_head_IN_html_62 )
          head5 = head
          @state.following.pop
          stream_head.add( head5.tree )

        end
        # at line 97:3: ( body )?
        alt_2 = 2
        look_2_0 = @input.peek( 1 )

        if ( look_2_0 == OPENING_TAG )
          alt_2 = 1
        end
        case alt_2
        when 1
          # at line 97:4: body
          @state.following.push( TOKENS_FOLLOWING_body_IN_html_69 )
          body6 = body
          @state.following.pop
          stream_body.add( body6.tree )

        end
        __CLOSING_TAG7__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_html_75 )
        stream_CLOSING_TAG.add( __CLOSING_TAG7__ )
        __HTML8__ = match( HTML, TOKENS_FOLLOWING_HTML_IN_html_77 )
        stream_HTML.add( __HTML8__ )
        __END_TAG9__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_html_79 )
        stream_END_TAG.add( __END_TAG9__ )
        # AST Rewrite
        # elements: head, body, HTML
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 98:28: -> ^( TAG HTML ( head )? ( body )? )
        # at line 98:31: ^( TAG HTML ( head )? ( body )? )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_HTML.next_node )
        # at line 98:42: ( head )?
        if stream_head.has_next?
          @adaptor.add_child( root_1, stream_head.next_tree )

        end

        stream_head.reset();
        # at line 98:50: ( body )?
        if stream_body.has_next?
          @adaptor.add_child( root_1, stream_body.next_tree )

        end

        stream_body.reset();

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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

    HeadReturnValue = define_return_scope 

    # 
    # parser rule head
    # 
    # (in HtmlParser.g)
    # 101:1: head : OPENING_TAG HEAD END_TAG ( head_element )? CLOSING_TAG HEAD END_TAG -> ^( TAG HEAD ( head_element )? ) ;
    # 
    def head
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )
      return_value = HeadReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG10__ = nil
      __HEAD11__ = nil
      __END_TAG12__ = nil
      __CLOSING_TAG14__ = nil
      __HEAD15__ = nil
      __END_TAG16__ = nil
      head_element13 = nil

      tree_for_OPENING_TAG10 = nil
      tree_for_HEAD11 = nil
      tree_for_END_TAG12 = nil
      tree_for_CLOSING_TAG14 = nil
      tree_for_HEAD15 = nil
      tree_for_END_TAG16 = nil
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_HEAD = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token HEAD" )
      stream_head_element = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule head_element" )
      begin
        # at line 101:8: OPENING_TAG HEAD END_TAG ( head_element )? CLOSING_TAG HEAD END_TAG
        __OPENING_TAG10__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_head_107 )
        stream_OPENING_TAG.add( __OPENING_TAG10__ )
        __HEAD11__ = match( HEAD, TOKENS_FOLLOWING_HEAD_IN_head_109 )
        stream_HEAD.add( __HEAD11__ )
        __END_TAG12__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_head_111 )
        stream_END_TAG.add( __END_TAG12__ )
        # at line 102:3: ( head_element )?
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0 == OPENING_TAG )
          alt_3 = 1
        end
        case alt_3
        when 1
          # at line 102:4: head_element
          @state.following.push( TOKENS_FOLLOWING_head_element_IN_head_116 )
          head_element13 = head_element
          @state.following.pop
          stream_head_element.add( head_element13.tree )

        end
        __CLOSING_TAG14__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_head_122 )
        stream_CLOSING_TAG.add( __CLOSING_TAG14__ )
        __HEAD15__ = match( HEAD, TOKENS_FOLLOWING_HEAD_IN_head_124 )
        stream_HEAD.add( __HEAD15__ )
        __END_TAG16__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_head_126 )
        stream_END_TAG.add( __END_TAG16__ )
        # AST Rewrite
        # elements: head_element, HEAD
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 103:28: -> ^( TAG HEAD ( head_element )? )
        # at line 103:31: ^( TAG HEAD ( head_element )? )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_HEAD.next_node )
        # at line 103:42: ( head_element )?
        if stream_head_element.has_next?
          @adaptor.add_child( root_1, stream_head_element.next_tree )

        end

        stream_head_element.reset();

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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

    HeadElementReturnValue = define_return_scope 

    # 
    # parser rule head_element
    # 
    # (in HtmlParser.g)
    # 106:1: head_element : title ;
    # 
    def head_element
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )
      return_value = HeadElementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      title17 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 107:4: title
        @state.following.push( TOKENS_FOLLOWING_title_IN_head_element_150 )
        title17 = title
        @state.following.pop
        @adaptor.add_child( root_0, title17.tree )
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

    TitleReturnValue = define_return_scope 

    # 
    # parser rule title
    # 
    # (in HtmlParser.g)
    # 110:1: title : OPENING_TAG TITLE END_TAG ( PCDATA )? CLOSING_TAG TITLE END_TAG -> ^( TAG TITLE ( PCDATA )? ) ;
    # 
    def title
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )
      return_value = TitleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG18__ = nil
      __TITLE19__ = nil
      __END_TAG20__ = nil
      __PCDATA21__ = nil
      __CLOSING_TAG22__ = nil
      __TITLE23__ = nil
      __END_TAG24__ = nil

      tree_for_OPENING_TAG18 = nil
      tree_for_TITLE19 = nil
      tree_for_END_TAG20 = nil
      tree_for_PCDATA21 = nil
      tree_for_CLOSING_TAG22 = nil
      tree_for_TITLE23 = nil
      tree_for_END_TAG24 = nil
      stream_PCDATA = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token PCDATA" )
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_TITLE = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token TITLE" )

      begin
        # at line 111:4: OPENING_TAG TITLE END_TAG ( PCDATA )? CLOSING_TAG TITLE END_TAG
        __OPENING_TAG18__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_title_163 )
        stream_OPENING_TAG.add( __OPENING_TAG18__ )
        __TITLE19__ = match( TITLE, TOKENS_FOLLOWING_TITLE_IN_title_165 )
        stream_TITLE.add( __TITLE19__ )
        __END_TAG20__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_title_167 )
        stream_END_TAG.add( __END_TAG20__ )
        # at line 112:3: ( PCDATA )?
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0 == PCDATA )
          alt_4 = 1
        end
        case alt_4
        when 1
          # at line 112:3: PCDATA
          __PCDATA21__ = match( PCDATA, TOKENS_FOLLOWING_PCDATA_IN_title_171 )
          stream_PCDATA.add( __PCDATA21__ )

        end
        __CLOSING_TAG22__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_title_176 )
        stream_CLOSING_TAG.add( __CLOSING_TAG22__ )
        __TITLE23__ = match( TITLE, TOKENS_FOLLOWING_TITLE_IN_title_178 )
        stream_TITLE.add( __TITLE23__ )
        __END_TAG24__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_title_180 )
        stream_END_TAG.add( __END_TAG24__ )
        # AST Rewrite
        # elements: TITLE, PCDATA
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 113:29: -> ^( TAG TITLE ( PCDATA )? )
        # at line 113:32: ^( TAG TITLE ( PCDATA )? )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_TITLE.next_node )
        # at line 113:44: ( PCDATA )?
        if stream_PCDATA.has_next?
          @adaptor.add_child( root_1, stream_PCDATA.next_node )

        end

        stream_PCDATA.reset();

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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

    BodyReturnValue = define_return_scope 

    # 
    # parser rule body
    # 
    # (in HtmlParser.g)
    # 116:1: body : OPENING_TAG BODY ( id | style | klass | bgcolor | background )* END_TAG ( body_content )* CLOSING_TAG BODY END_TAG -> ^( TAG BODY ( id )* ( style )* ( klass )* ( bgcolor )* ( background )* ( body_content )* ) ;
    # 
    def body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )
      return_value = BodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG25__ = nil
      __BODY26__ = nil
      __END_TAG32__ = nil
      __CLOSING_TAG34__ = nil
      __BODY35__ = nil
      __END_TAG36__ = nil
      id27 = nil
      style28 = nil
      klass29 = nil
      bgcolor30 = nil
      background31 = nil
      body_content33 = nil

      tree_for_OPENING_TAG25 = nil
      tree_for_BODY26 = nil
      tree_for_END_TAG32 = nil
      tree_for_CLOSING_TAG34 = nil
      tree_for_BODY35 = nil
      tree_for_END_TAG36 = nil
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_BODY = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token BODY" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_id = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule id" )
      stream_style = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule style" )
      stream_klass = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule klass" )
      stream_background = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule background" )
      stream_body_content = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule body_content" )
      stream_bgcolor = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule bgcolor" )
      begin
        # at line 116:8: OPENING_TAG BODY ( id | style | klass | bgcolor | background )* END_TAG ( body_content )* CLOSING_TAG BODY END_TAG
        __OPENING_TAG25__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_body_203 )
        stream_OPENING_TAG.add( __OPENING_TAG25__ )
        __BODY26__ = match( BODY, TOKENS_FOLLOWING_BODY_IN_body_205 )
        stream_BODY.add( __BODY26__ )
        # at line 116:25: ( id | style | klass | bgcolor | background )*
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
            # at line 116:26: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_body_208 )
            id27 = id
            @state.following.pop
            stream_id.add( id27.tree )

          when 2
            # at line 116:29: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_body_210 )
            style28 = style
            @state.following.pop
            stream_style.add( style28.tree )

          when 3
            # at line 116:35: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_body_212 )
            klass29 = klass
            @state.following.pop
            stream_klass.add( klass29.tree )

          when 4
            # at line 116:41: bgcolor
            @state.following.push( TOKENS_FOLLOWING_bgcolor_IN_body_214 )
            bgcolor30 = bgcolor
            @state.following.pop
            stream_bgcolor.add( bgcolor30.tree )

          when 5
            # at line 116:49: background
            @state.following.push( TOKENS_FOLLOWING_background_IN_body_216 )
            background31 = background
            @state.following.pop
            stream_background.add( background31.tree )

          else
            break # out of loop for decision 5
          end
        end # loop for decision 5
        __END_TAG32__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_body_220 )
        stream_END_TAG.add( __END_TAG32__ )
        # at line 118:4: ( body_content )*
        while true # decision 6
          alt_6 = 2
          look_6_0 = @input.peek( 1 )

          if ( look_6_0 == OPENING_TAG || look_6_0 == PCDATA )
            alt_6 = 1

          end
          case alt_6
          when 1
            # at line 118:5: body_content
            @state.following.push( TOKENS_FOLLOWING_body_content_IN_body_230 )
            body_content33 = body_content
            @state.following.pop
            stream_body_content.add( body_content33.tree )

          else
            break # out of loop for decision 6
          end
        end # loop for decision 6
        __CLOSING_TAG34__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_body_238 )
        stream_CLOSING_TAG.add( __CLOSING_TAG34__ )
        __BODY35__ = match( BODY, TOKENS_FOLLOWING_BODY_IN_body_240 )
        stream_BODY.add( __BODY35__ )
        __END_TAG36__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_body_242 )
        stream_END_TAG.add( __END_TAG36__ )
        # AST Rewrite
        # elements: klass, id, BODY, bgcolor, style, background, body_content
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 119:29: -> ^( TAG BODY ( id )* ( style )* ( klass )* ( bgcolor )* ( background )* ( body_content )* )
        # at line 119:32: ^( TAG BODY ( id )* ( style )* ( klass )* ( bgcolor )* ( background )* ( body_content )* )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_BODY.next_node )
        # at line 119:43: ( id )*
        while stream_id.has_next?
          @adaptor.add_child( root_1, stream_id.next_tree )

        end

        stream_id.reset();
        # at line 119:47: ( style )*
        while stream_style.has_next?
          @adaptor.add_child( root_1, stream_style.next_tree )

        end

        stream_style.reset();
        # at line 119:54: ( klass )*
        while stream_klass.has_next?
          @adaptor.add_child( root_1, stream_klass.next_tree )

        end

        stream_klass.reset();
        # at line 119:61: ( bgcolor )*
        while stream_bgcolor.has_next?
          @adaptor.add_child( root_1, stream_bgcolor.next_tree )

        end

        stream_bgcolor.reset();
        # at line 119:70: ( background )*
        while stream_background.has_next?
          @adaptor.add_child( root_1, stream_background.next_tree )

        end

        stream_background.reset();
        # at line 119:82: ( body_content )*
        while stream_body_content.has_next?
          @adaptor.add_child( root_1, stream_body_content.next_tree )

        end

        stream_body_content.reset();

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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
        # trace_out( __method__, 6 )

      end
      
      return return_value
    end

    BodyTagReturnValue = define_return_scope 

    # 
    # parser rule body_tag
    # 
    # (in HtmlParser.g)
    # 126:1: body_tag : ( heading | block );
    # 
    def body_tag
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )
      return_value = BodyTagReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      heading37 = nil
      block38 = nil


      begin
        # at line 127:2: ( heading | block )
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


          # at line 127:4: heading
          @state.following.push( TOKENS_FOLLOWING_heading_IN_body_tag_285 )
          heading37 = heading
          @state.following.pop
          @adaptor.add_child( root_0, heading37.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 128:4: block
          @state.following.push( TOKENS_FOLLOWING_block_IN_body_tag_291 )
          block38 = block
          @state.following.pop
          @adaptor.add_child( root_0, block38.tree )

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

    BodyContentReturnValue = define_return_scope 

    # 
    # parser rule body_content
    # 
    # (in HtmlParser.g)
    # 131:1: body_content : ( body_tag | text );
    # 
    def body_content
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )
      return_value = BodyContentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      body_tag39 = nil
      text40 = nil


      begin
        # at line 132:2: ( body_tag | text )
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


          # at line 132:4: body_tag
          @state.following.push( TOKENS_FOLLOWING_body_tag_IN_body_content_302 )
          body_tag39 = body_tag
          @state.following.pop
          @adaptor.add_child( root_0, body_tag39.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 133:4: text
          @state.following.push( TOKENS_FOLLOWING_text_IN_body_content_308 )
          text40 = text
          @state.following.pop
          @adaptor.add_child( root_0, text40.tree )

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

    HeadingReturnValue = define_return_scope 

    # 
    # parser rule heading
    # 
    # (in HtmlParser.g)
    # 136:1: heading : ( h1 | h2 | h3 | h4 | h5 | h6 );
    # 
    def heading
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )
      return_value = HeadingReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      h141 = nil
      h242 = nil
      h343 = nil
      h444 = nil
      h545 = nil
      h646 = nil


      begin
        # at line 137:2: ( h1 | h2 | h3 | h4 | h5 | h6 )
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


          # at line 137:4: h1
          @state.following.push( TOKENS_FOLLOWING_h1_IN_heading_321 )
          h141 = h1
          @state.following.pop
          @adaptor.add_child( root_0, h141.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 137:9: h2
          @state.following.push( TOKENS_FOLLOWING_h2_IN_heading_325 )
          h242 = h2
          @state.following.pop
          @adaptor.add_child( root_0, h242.tree )

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 137:14: h3
          @state.following.push( TOKENS_FOLLOWING_h3_IN_heading_329 )
          h343 = h3
          @state.following.pop
          @adaptor.add_child( root_0, h343.tree )

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 137:19: h4
          @state.following.push( TOKENS_FOLLOWING_h4_IN_heading_333 )
          h444 = h4
          @state.following.pop
          @adaptor.add_child( root_0, h444.tree )

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 137:24: h5
          @state.following.push( TOKENS_FOLLOWING_h5_IN_heading_337 )
          h545 = h5
          @state.following.pop
          @adaptor.add_child( root_0, h545.tree )

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 137:29: h6
          @state.following.push( TOKENS_FOLLOWING_h6_IN_heading_341 )
          h646 = h6
          @state.following.pop
          @adaptor.add_child( root_0, h646.tree )

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

    BlockReturnValue = define_return_scope 

    # 
    # parser rule block
    # 
    # (in HtmlParser.g)
    # 140:1: block : ( paragraph | div | table );
    # 
    def block
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )
      return_value = BlockReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      paragraph47 = nil
      div48 = nil
      table49 = nil


      begin
        # at line 141:2: ( paragraph | div | table )
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


          # at line 141:4: paragraph
          @state.following.push( TOKENS_FOLLOWING_paragraph_IN_block_353 )
          paragraph47 = paragraph
          @state.following.pop
          @adaptor.add_child( root_0, paragraph47.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 142:4: div
          @state.following.push( TOKENS_FOLLOWING_div_IN_block_358 )
          div48 = div
          @state.following.pop
          @adaptor.add_child( root_0, div48.tree )

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 143:4: table
          @state.following.push( TOKENS_FOLLOWING_table_IN_block_363 )
          table49 = table
          @state.following.pop
          @adaptor.add_child( root_0, table49.tree )

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

    FontReturnValue = define_return_scope 

    # 
    # parser rule font
    # 
    # (in HtmlParser.g)
    # 146:1: font : ( italic | bold | underline );
    # 
    def font
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )
      return_value = FontReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      italic50 = nil
      bold51 = nil
      underline52 = nil


      begin
        # at line 147:2: ( italic | bold | underline )
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


          # at line 147:4: italic
          @state.following.push( TOKENS_FOLLOWING_italic_IN_font_375 )
          italic50 = italic
          @state.following.pop
          @adaptor.add_child( root_0, italic50.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 148:4: bold
          @state.following.push( TOKENS_FOLLOWING_bold_IN_font_380 )
          bold51 = bold
          @state.following.pop
          @adaptor.add_child( root_0, bold51.tree )

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 149:4: underline
          @state.following.push( TOKENS_FOLLOWING_underline_IN_font_385 )
          underline52 = underline
          @state.following.pop
          @adaptor.add_child( root_0, underline52.tree )

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

    SpecialReturnValue = define_return_scope 

    # 
    # parser rule special
    # 
    # (in HtmlParser.g)
    # 152:1: special : ( anchor | img | br );
    # 
    def special
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
      return_value = SpecialReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      anchor53 = nil
      img54 = nil
      br55 = nil


      begin
        # at line 153:2: ( anchor | img | br )
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


          # at line 153:4: anchor
          @state.following.push( TOKENS_FOLLOWING_anchor_IN_special_397 )
          anchor53 = anchor
          @state.following.pop
          @adaptor.add_child( root_0, anchor53.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 154:4: img
          @state.following.push( TOKENS_FOLLOWING_img_IN_special_403 )
          img54 = img
          @state.following.pop
          @adaptor.add_child( root_0, img54.tree )

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 155:4: br
          @state.following.push( TOKENS_FOLLOWING_br_IN_special_408 )
          br55 = br
          @state.following.pop
          @adaptor.add_child( root_0, br55.tree )

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

    TextTagReturnValue = define_return_scope 

    # 
    # parser rule text_tag
    # 
    # (in HtmlParser.g)
    # 158:1: text_tag : ( font | special );
    # 
    def text_tag
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )
      return_value = TextTagReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      font56 = nil
      special57 = nil


      begin
        # at line 159:2: ( font | special )
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


          # at line 159:4: font
          @state.following.push( TOKENS_FOLLOWING_font_IN_text_tag_420 )
          font56 = font
          @state.following.pop
          @adaptor.add_child( root_0, font56.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 160:4: special
          @state.following.push( TOKENS_FOLLOWING_special_IN_text_tag_426 )
          special57 = special
          @state.following.pop
          @adaptor.add_child( root_0, special57.tree )

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

    TextReturnValue = define_return_scope 

    # 
    # parser rule text
    # 
    # (in HtmlParser.g)
    # 163:1: text : ( PCDATA -> ^( DATA PCDATA ) | text_tag );
    # 
    def text
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
      return_value = TextReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PCDATA58__ = nil
      text_tag59 = nil

      tree_for_PCDATA58 = nil
      stream_PCDATA = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token PCDATA" )

      begin
        # at line 164:3: ( PCDATA -> ^( DATA PCDATA ) | text_tag )
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
          # at line 164:5: PCDATA
          __PCDATA58__ = match( PCDATA, TOKENS_FOLLOWING_PCDATA_IN_text_439 )
          stream_PCDATA.add( __PCDATA58__ )
          # AST Rewrite
          # elements: PCDATA
          # token labels: 
          # rule labels: return_value
          # token list labels: 
          # rule list labels: 
          # wildcard labels: 

          return_value.tree = root_0
          stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

          root_0 = @adaptor.create_flat_list
          # 164:12: -> ^( DATA PCDATA )
          # at line 164:15: ^( DATA PCDATA )
          root_1 = @adaptor.create_flat_list
          root_1 = @adaptor.become_root( @adaptor.create_from_type( DATA, "DATA" ), root_1 )

          @adaptor.add_child( root_1, stream_PCDATA.next_node )

          @adaptor.add_child( root_0, root_1 )



          return_value.tree = root_0

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 165:4: text_tag
          @state.following.push( TOKENS_FOLLOWING_text_tag_IN_text_452 )
          text_tag59 = text_tag
          @state.following.pop
          @adaptor.add_child( root_0, text_tag59.tree )

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
        # trace_out( __method__, 14 )

      end
      
      return return_value
    end

    H1ReturnValue = define_return_scope 

    # 
    # parser rule h1
    # 
    # (in HtmlParser.g)
    # 171:1: h1 : OPENING_TAG H1 ( id | style | klass | align )* END_TAG ( heading_data )* CLOSING_TAG H1 END_TAG -> ^( TAG H1 ( id )* ( style )* ( klass )* ( align )* ( heading_data )* ) ;
    # 
    def h1
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )
      return_value = H1ReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG60__ = nil
      __H161__ = nil
      __END_TAG66__ = nil
      __CLOSING_TAG68__ = nil
      __H169__ = nil
      __END_TAG70__ = nil
      id62 = nil
      style63 = nil
      klass64 = nil
      align65 = nil
      heading_data67 = nil

      tree_for_OPENING_TAG60 = nil
      tree_for_H161 = nil
      tree_for_END_TAG66 = nil
      tree_for_CLOSING_TAG68 = nil
      tree_for_H169 = nil
      tree_for_END_TAG70 = nil
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_H1 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token H1" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_id = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule id" )
      stream_style = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule style" )
      stream_klass = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule klass" )
      stream_align = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule align" )
      stream_heading_data = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule heading_data" )
      begin
        # at line 171:6: OPENING_TAG H1 ( id | style | klass | align )* END_TAG ( heading_data )* CLOSING_TAG H1 END_TAG
        __OPENING_TAG60__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_h1_469 )
        stream_OPENING_TAG.add( __OPENING_TAG60__ )
        __H161__ = match( H1, TOKENS_FOLLOWING_H1_IN_h1_471 )
        stream_H1.add( __H161__ )
        # at line 171:21: ( id | style | klass | align )*
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
            # at line 171:22: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_h1_474 )
            id62 = id
            @state.following.pop
            stream_id.add( id62.tree )

          when 2
            # at line 171:25: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_h1_476 )
            style63 = style
            @state.following.pop
            stream_style.add( style63.tree )

          when 3
            # at line 171:31: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_h1_478 )
            klass64 = klass
            @state.following.pop
            stream_klass.add( klass64.tree )

          when 4
            # at line 171:37: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_h1_480 )
            align65 = align
            @state.following.pop
            stream_align.add( align65.tree )

          else
            break # out of loop for decision 15
          end
        end # loop for decision 15
        __END_TAG66__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h1_484 )
        stream_END_TAG.add( __END_TAG66__ )
        # at line 172:3: ( heading_data )*
        while true # decision 16
          alt_16 = 2
          look_16_0 = @input.peek( 1 )

          if ( look_16_0 == OPENING_TAG || look_16_0 == PCDATA )
            alt_16 = 1

          end
          case alt_16
          when 1
            # at line 172:3: heading_data
            @state.following.push( TOKENS_FOLLOWING_heading_data_IN_h1_488 )
            heading_data67 = heading_data
            @state.following.pop
            stream_heading_data.add( heading_data67.tree )

          else
            break # out of loop for decision 16
          end
        end # loop for decision 16
        __CLOSING_TAG68__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_h1_493 )
        stream_CLOSING_TAG.add( __CLOSING_TAG68__ )
        __H169__ = match( H1, TOKENS_FOLLOWING_H1_IN_h1_495 )
        stream_H1.add( __H169__ )
        __END_TAG70__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h1_497 )
        stream_END_TAG.add( __END_TAG70__ )
        # AST Rewrite
        # elements: H1, heading_data, align, style, klass, id
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 173:27: -> ^( TAG H1 ( id )* ( style )* ( klass )* ( align )* ( heading_data )* )
        # at line 173:30: ^( TAG H1 ( id )* ( style )* ( klass )* ( align )* ( heading_data )* )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_H1.next_node )
        # at line 173:39: ( id )*
        while stream_id.has_next?
          @adaptor.add_child( root_1, stream_id.next_tree )

        end

        stream_id.reset();
        # at line 173:43: ( style )*
        while stream_style.has_next?
          @adaptor.add_child( root_1, stream_style.next_tree )

        end

        stream_style.reset();
        # at line 173:50: ( klass )*
        while stream_klass.has_next?
          @adaptor.add_child( root_1, stream_klass.next_tree )

        end

        stream_klass.reset();
        # at line 173:57: ( align )*
        while stream_align.has_next?
          @adaptor.add_child( root_1, stream_align.next_tree )

        end

        stream_align.reset();
        # at line 173:64: ( heading_data )*
        while stream_heading_data.has_next?
          @adaptor.add_child( root_1, stream_heading_data.next_tree )

        end

        stream_heading_data.reset();

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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

    H2ReturnValue = define_return_scope 

    # 
    # parser rule h2
    # 
    # (in HtmlParser.g)
    # 176:1: h2 : OPENING_TAG H2 ( id | style | klass | align )* END_TAG ( heading_data )* CLOSING_TAG H2 END_TAG ;
    # 
    def h2
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
      return_value = H2ReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG71__ = nil
      __H272__ = nil
      __END_TAG77__ = nil
      __CLOSING_TAG79__ = nil
      __H280__ = nil
      __END_TAG81__ = nil
      id73 = nil
      style74 = nil
      klass75 = nil
      align76 = nil
      heading_data78 = nil

      tree_for_OPENING_TAG71 = nil
      tree_for_H272 = nil
      tree_for_END_TAG77 = nil
      tree_for_CLOSING_TAG79 = nil
      tree_for_H280 = nil
      tree_for_END_TAG81 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 176:6: OPENING_TAG H2 ( id | style | klass | align )* END_TAG ( heading_data )* CLOSING_TAG H2 END_TAG
        __OPENING_TAG71__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_h2_532 )

        tree_for_OPENING_TAG71 = @adaptor.create_with_payload( __OPENING_TAG71__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG71 )

        __H272__ = match( H2, TOKENS_FOLLOWING_H2_IN_h2_534 )

        tree_for_H272 = @adaptor.create_with_payload( __H272__ )
        @adaptor.add_child( root_0, tree_for_H272 )

        # at line 176:21: ( id | style | klass | align )*
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
            # at line 176:22: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_h2_537 )
            id73 = id
            @state.following.pop
            @adaptor.add_child( root_0, id73.tree )

          when 2
            # at line 176:25: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_h2_539 )
            style74 = style
            @state.following.pop
            @adaptor.add_child( root_0, style74.tree )

          when 3
            # at line 176:31: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_h2_541 )
            klass75 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass75.tree )

          when 4
            # at line 176:37: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_h2_543 )
            align76 = align
            @state.following.pop
            @adaptor.add_child( root_0, align76.tree )

          else
            break # out of loop for decision 17
          end
        end # loop for decision 17
        __END_TAG77__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h2_547 )

        tree_for_END_TAG77 = @adaptor.create_with_payload( __END_TAG77__ )
        @adaptor.add_child( root_0, tree_for_END_TAG77 )

        # at line 177:3: ( heading_data )*
        while true # decision 18
          alt_18 = 2
          look_18_0 = @input.peek( 1 )

          if ( look_18_0 == OPENING_TAG || look_18_0 == PCDATA )
            alt_18 = 1

          end
          case alt_18
          when 1
            # at line 177:3: heading_data
            @state.following.push( TOKENS_FOLLOWING_heading_data_IN_h2_551 )
            heading_data78 = heading_data
            @state.following.pop
            @adaptor.add_child( root_0, heading_data78.tree )

          else
            break # out of loop for decision 18
          end
        end # loop for decision 18
        __CLOSING_TAG79__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_h2_556 )

        tree_for_CLOSING_TAG79 = @adaptor.create_with_payload( __CLOSING_TAG79__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG79 )

        __H280__ = match( H2, TOKENS_FOLLOWING_H2_IN_h2_558 )

        tree_for_H280 = @adaptor.create_with_payload( __H280__ )
        @adaptor.add_child( root_0, tree_for_H280 )

        __END_TAG81__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h2_560 )

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
        # trace_out( __method__, 16 )

      end
      
      return return_value
    end

    H3ReturnValue = define_return_scope 

    # 
    # parser rule h3
    # 
    # (in HtmlParser.g)
    # 181:1: h3 : OPENING_TAG H3 ( id | style | klass | align )* END_TAG ( heading_data )* CLOSING_TAG H3 END_TAG ;
    # 
    def h3
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = H3ReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG82__ = nil
      __H383__ = nil
      __END_TAG88__ = nil
      __CLOSING_TAG90__ = nil
      __H391__ = nil
      __END_TAG92__ = nil
      id84 = nil
      style85 = nil
      klass86 = nil
      align87 = nil
      heading_data89 = nil

      tree_for_OPENING_TAG82 = nil
      tree_for_H383 = nil
      tree_for_END_TAG88 = nil
      tree_for_CLOSING_TAG90 = nil
      tree_for_H391 = nil
      tree_for_END_TAG92 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 181:6: OPENING_TAG H3 ( id | style | klass | align )* END_TAG ( heading_data )* CLOSING_TAG H3 END_TAG
        __OPENING_TAG82__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_h3_571 )

        tree_for_OPENING_TAG82 = @adaptor.create_with_payload( __OPENING_TAG82__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG82 )

        __H383__ = match( H3, TOKENS_FOLLOWING_H3_IN_h3_573 )

        tree_for_H383 = @adaptor.create_with_payload( __H383__ )
        @adaptor.add_child( root_0, tree_for_H383 )

        # at line 181:21: ( id | style | klass | align )*
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
            # at line 181:22: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_h3_576 )
            id84 = id
            @state.following.pop
            @adaptor.add_child( root_0, id84.tree )

          when 2
            # at line 181:25: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_h3_578 )
            style85 = style
            @state.following.pop
            @adaptor.add_child( root_0, style85.tree )

          when 3
            # at line 181:31: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_h3_580 )
            klass86 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass86.tree )

          when 4
            # at line 181:37: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_h3_582 )
            align87 = align
            @state.following.pop
            @adaptor.add_child( root_0, align87.tree )

          else
            break # out of loop for decision 19
          end
        end # loop for decision 19
        __END_TAG88__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h3_586 )

        tree_for_END_TAG88 = @adaptor.create_with_payload( __END_TAG88__ )
        @adaptor.add_child( root_0, tree_for_END_TAG88 )

        # at line 182:3: ( heading_data )*
        while true # decision 20
          alt_20 = 2
          look_20_0 = @input.peek( 1 )

          if ( look_20_0 == OPENING_TAG || look_20_0 == PCDATA )
            alt_20 = 1

          end
          case alt_20
          when 1
            # at line 182:3: heading_data
            @state.following.push( TOKENS_FOLLOWING_heading_data_IN_h3_590 )
            heading_data89 = heading_data
            @state.following.pop
            @adaptor.add_child( root_0, heading_data89.tree )

          else
            break # out of loop for decision 20
          end
        end # loop for decision 20
        __CLOSING_TAG90__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_h3_595 )

        tree_for_CLOSING_TAG90 = @adaptor.create_with_payload( __CLOSING_TAG90__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG90 )

        __H391__ = match( H3, TOKENS_FOLLOWING_H3_IN_h3_597 )

        tree_for_H391 = @adaptor.create_with_payload( __H391__ )
        @adaptor.add_child( root_0, tree_for_H391 )

        __END_TAG92__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h3_599 )

        tree_for_END_TAG92 = @adaptor.create_with_payload( __END_TAG92__ )
        @adaptor.add_child( root_0, tree_for_END_TAG92 )

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

    H4ReturnValue = define_return_scope 

    # 
    # parser rule h4
    # 
    # (in HtmlParser.g)
    # 186:1: h4 : OPENING_TAG H4 ( id | style | klass | align )* END_TAG ( heading_data )* CLOSING_TAG H4 END_TAG ;
    # 
    def h4
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = H4ReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG93__ = nil
      __H494__ = nil
      __END_TAG99__ = nil
      __CLOSING_TAG101__ = nil
      __H4102__ = nil
      __END_TAG103__ = nil
      id95 = nil
      style96 = nil
      klass97 = nil
      align98 = nil
      heading_data100 = nil

      tree_for_OPENING_TAG93 = nil
      tree_for_H494 = nil
      tree_for_END_TAG99 = nil
      tree_for_CLOSING_TAG101 = nil
      tree_for_H4102 = nil
      tree_for_END_TAG103 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 186:6: OPENING_TAG H4 ( id | style | klass | align )* END_TAG ( heading_data )* CLOSING_TAG H4 END_TAG
        __OPENING_TAG93__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_h4_610 )

        tree_for_OPENING_TAG93 = @adaptor.create_with_payload( __OPENING_TAG93__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG93 )

        __H494__ = match( H4, TOKENS_FOLLOWING_H4_IN_h4_612 )

        tree_for_H494 = @adaptor.create_with_payload( __H494__ )
        @adaptor.add_child( root_0, tree_for_H494 )

        # at line 186:21: ( id | style | klass | align )*
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
            # at line 186:22: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_h4_615 )
            id95 = id
            @state.following.pop
            @adaptor.add_child( root_0, id95.tree )

          when 2
            # at line 186:25: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_h4_617 )
            style96 = style
            @state.following.pop
            @adaptor.add_child( root_0, style96.tree )

          when 3
            # at line 186:31: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_h4_619 )
            klass97 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass97.tree )

          when 4
            # at line 186:37: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_h4_621 )
            align98 = align
            @state.following.pop
            @adaptor.add_child( root_0, align98.tree )

          else
            break # out of loop for decision 21
          end
        end # loop for decision 21
        __END_TAG99__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h4_625 )

        tree_for_END_TAG99 = @adaptor.create_with_payload( __END_TAG99__ )
        @adaptor.add_child( root_0, tree_for_END_TAG99 )

        # at line 187:3: ( heading_data )*
        while true # decision 22
          alt_22 = 2
          look_22_0 = @input.peek( 1 )

          if ( look_22_0 == OPENING_TAG || look_22_0 == PCDATA )
            alt_22 = 1

          end
          case alt_22
          when 1
            # at line 187:3: heading_data
            @state.following.push( TOKENS_FOLLOWING_heading_data_IN_h4_629 )
            heading_data100 = heading_data
            @state.following.pop
            @adaptor.add_child( root_0, heading_data100.tree )

          else
            break # out of loop for decision 22
          end
        end # loop for decision 22
        __CLOSING_TAG101__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_h4_634 )

        tree_for_CLOSING_TAG101 = @adaptor.create_with_payload( __CLOSING_TAG101__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG101 )

        __H4102__ = match( H4, TOKENS_FOLLOWING_H4_IN_h4_636 )

        tree_for_H4102 = @adaptor.create_with_payload( __H4102__ )
        @adaptor.add_child( root_0, tree_for_H4102 )

        __END_TAG103__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h4_638 )

        tree_for_END_TAG103 = @adaptor.create_with_payload( __END_TAG103__ )
        @adaptor.add_child( root_0, tree_for_END_TAG103 )

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

    H5ReturnValue = define_return_scope 

    # 
    # parser rule h5
    # 
    # (in HtmlParser.g)
    # 191:1: h5 : OPENING_TAG H5 ( id | style | klass | align )* END_TAG ( heading_data )* CLOSING_TAG H5 END_TAG ;
    # 
    def h5
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = H5ReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG104__ = nil
      __H5105__ = nil
      __END_TAG110__ = nil
      __CLOSING_TAG112__ = nil
      __H5113__ = nil
      __END_TAG114__ = nil
      id106 = nil
      style107 = nil
      klass108 = nil
      align109 = nil
      heading_data111 = nil

      tree_for_OPENING_TAG104 = nil
      tree_for_H5105 = nil
      tree_for_END_TAG110 = nil
      tree_for_CLOSING_TAG112 = nil
      tree_for_H5113 = nil
      tree_for_END_TAG114 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 191:6: OPENING_TAG H5 ( id | style | klass | align )* END_TAG ( heading_data )* CLOSING_TAG H5 END_TAG
        __OPENING_TAG104__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_h5_649 )

        tree_for_OPENING_TAG104 = @adaptor.create_with_payload( __OPENING_TAG104__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG104 )

        __H5105__ = match( H5, TOKENS_FOLLOWING_H5_IN_h5_651 )

        tree_for_H5105 = @adaptor.create_with_payload( __H5105__ )
        @adaptor.add_child( root_0, tree_for_H5105 )

        # at line 191:21: ( id | style | klass | align )*
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
            # at line 191:22: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_h5_654 )
            id106 = id
            @state.following.pop
            @adaptor.add_child( root_0, id106.tree )

          when 2
            # at line 191:25: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_h5_656 )
            style107 = style
            @state.following.pop
            @adaptor.add_child( root_0, style107.tree )

          when 3
            # at line 191:31: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_h5_658 )
            klass108 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass108.tree )

          when 4
            # at line 191:37: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_h5_660 )
            align109 = align
            @state.following.pop
            @adaptor.add_child( root_0, align109.tree )

          else
            break # out of loop for decision 23
          end
        end # loop for decision 23
        __END_TAG110__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h5_664 )

        tree_for_END_TAG110 = @adaptor.create_with_payload( __END_TAG110__ )
        @adaptor.add_child( root_0, tree_for_END_TAG110 )

        # at line 192:3: ( heading_data )*
        while true # decision 24
          alt_24 = 2
          look_24_0 = @input.peek( 1 )

          if ( look_24_0 == OPENING_TAG || look_24_0 == PCDATA )
            alt_24 = 1

          end
          case alt_24
          when 1
            # at line 192:3: heading_data
            @state.following.push( TOKENS_FOLLOWING_heading_data_IN_h5_668 )
            heading_data111 = heading_data
            @state.following.pop
            @adaptor.add_child( root_0, heading_data111.tree )

          else
            break # out of loop for decision 24
          end
        end # loop for decision 24
        __CLOSING_TAG112__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_h5_673 )

        tree_for_CLOSING_TAG112 = @adaptor.create_with_payload( __CLOSING_TAG112__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG112 )

        __H5113__ = match( H5, TOKENS_FOLLOWING_H5_IN_h5_675 )

        tree_for_H5113 = @adaptor.create_with_payload( __H5113__ )
        @adaptor.add_child( root_0, tree_for_H5113 )

        __END_TAG114__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h5_677 )

        tree_for_END_TAG114 = @adaptor.create_with_payload( __END_TAG114__ )
        @adaptor.add_child( root_0, tree_for_END_TAG114 )

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

    H6ReturnValue = define_return_scope 

    # 
    # parser rule h6
    # 
    # (in HtmlParser.g)
    # 196:1: h6 : OPENING_TAG H6 ( id | style | klass | align )* END_TAG ( heading_data )* CLOSING_TAG H6 END_TAG ;
    # 
    def h6
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = H6ReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG115__ = nil
      __H6116__ = nil
      __END_TAG121__ = nil
      __CLOSING_TAG123__ = nil
      __H6124__ = nil
      __END_TAG125__ = nil
      id117 = nil
      style118 = nil
      klass119 = nil
      align120 = nil
      heading_data122 = nil

      tree_for_OPENING_TAG115 = nil
      tree_for_H6116 = nil
      tree_for_END_TAG121 = nil
      tree_for_CLOSING_TAG123 = nil
      tree_for_H6124 = nil
      tree_for_END_TAG125 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 196:6: OPENING_TAG H6 ( id | style | klass | align )* END_TAG ( heading_data )* CLOSING_TAG H6 END_TAG
        __OPENING_TAG115__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_h6_688 )

        tree_for_OPENING_TAG115 = @adaptor.create_with_payload( __OPENING_TAG115__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG115 )

        __H6116__ = match( H6, TOKENS_FOLLOWING_H6_IN_h6_690 )

        tree_for_H6116 = @adaptor.create_with_payload( __H6116__ )
        @adaptor.add_child( root_0, tree_for_H6116 )

        # at line 196:21: ( id | style | klass | align )*
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
            # at line 196:22: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_h6_693 )
            id117 = id
            @state.following.pop
            @adaptor.add_child( root_0, id117.tree )

          when 2
            # at line 196:25: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_h6_695 )
            style118 = style
            @state.following.pop
            @adaptor.add_child( root_0, style118.tree )

          when 3
            # at line 196:31: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_h6_697 )
            klass119 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass119.tree )

          when 4
            # at line 196:37: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_h6_699 )
            align120 = align
            @state.following.pop
            @adaptor.add_child( root_0, align120.tree )

          else
            break # out of loop for decision 25
          end
        end # loop for decision 25
        __END_TAG121__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h6_703 )

        tree_for_END_TAG121 = @adaptor.create_with_payload( __END_TAG121__ )
        @adaptor.add_child( root_0, tree_for_END_TAG121 )

        # at line 197:3: ( heading_data )*
        while true # decision 26
          alt_26 = 2
          look_26_0 = @input.peek( 1 )

          if ( look_26_0 == OPENING_TAG || look_26_0 == PCDATA )
            alt_26 = 1

          end
          case alt_26
          when 1
            # at line 197:3: heading_data
            @state.following.push( TOKENS_FOLLOWING_heading_data_IN_h6_707 )
            heading_data122 = heading_data
            @state.following.pop
            @adaptor.add_child( root_0, heading_data122.tree )

          else
            break # out of loop for decision 26
          end
        end # loop for decision 26
        __CLOSING_TAG123__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_h6_712 )

        tree_for_CLOSING_TAG123 = @adaptor.create_with_payload( __CLOSING_TAG123__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG123 )

        __H6124__ = match( H6, TOKENS_FOLLOWING_H6_IN_h6_714 )

        tree_for_H6124 = @adaptor.create_with_payload( __H6124__ )
        @adaptor.add_child( root_0, tree_for_H6124 )

        __END_TAG125__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h6_716 )

        tree_for_END_TAG125 = @adaptor.create_with_payload( __END_TAG125__ )
        @adaptor.add_child( root_0, tree_for_END_TAG125 )

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

    HeadingDataReturnValue = define_return_scope 

    # 
    # parser rule heading_data
    # 
    # (in HtmlParser.g)
    # 201:1: heading_data : ( block | text );
    # 
    def heading_data
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = HeadingDataReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      block126 = nil
      text127 = nil


      begin
        # at line 201:14: ( block | text )
        alt_27 = 2
        look_27_0 = @input.peek( 1 )

        if ( look_27_0 == OPENING_TAG )
          look_27_1 = @input.peek( 2 )

          if ( look_27_1.between?( P, DIV ) || look_27_1 == TABLE )
            alt_27 = 1
          elsif ( look_27_1.between?( I, U ) || look_27_1.between?( A, IMG ) || look_27_1 == BR )
            alt_27 = 2
          else
            raise NoViableAlternative( "", 27, 1 )
          end
        elsif ( look_27_0 == PCDATA )
          alt_27 = 2
        else
          raise NoViableAlternative( "", 27, 0 )
        end
        case alt_27
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 201:15: block
          @state.following.push( TOKENS_FOLLOWING_block_IN_heading_data_726 )
          block126 = block
          @state.following.pop
          @adaptor.add_child( root_0, block126.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 202:15: text
          @state.following.push( TOKENS_FOLLOWING_text_IN_heading_data_742 )
          text127 = text
          @state.following.pop
          @adaptor.add_child( root_0, text127.tree )

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
        # trace_out( __method__, 21 )

      end
      
      return return_value
    end

    ParagraphReturnValue = define_return_scope 

    # 
    # parser rule paragraph
    # 
    # (in HtmlParser.g)
    # 205:1: paragraph : OPENING_TAG P ( id | style | klass | align )* END_TAG ( text )* CLOSING_TAG P END_TAG -> ^( TAG P ( id )* ( style )* ( klass )* ( align )* ( text )* ) ;
    # 
    def paragraph
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = ParagraphReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG128__ = nil
      __P129__ = nil
      __END_TAG134__ = nil
      __CLOSING_TAG136__ = nil
      __P137__ = nil
      __END_TAG138__ = nil
      id130 = nil
      style131 = nil
      klass132 = nil
      align133 = nil
      text135 = nil

      tree_for_OPENING_TAG128 = nil
      tree_for_P129 = nil
      tree_for_END_TAG134 = nil
      tree_for_CLOSING_TAG136 = nil
      tree_for_P137 = nil
      tree_for_END_TAG138 = nil
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_P = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token P" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_id = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule id" )
      stream_text = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule text" )
      stream_style = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule style" )
      stream_klass = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule klass" )
      stream_align = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule align" )
      begin
        # at line 206:4: OPENING_TAG P ( id | style | klass | align )* END_TAG ( text )* CLOSING_TAG P END_TAG
        __OPENING_TAG128__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_paragraph_766 )
        stream_OPENING_TAG.add( __OPENING_TAG128__ )
        __P129__ = match( P, TOKENS_FOLLOWING_P_IN_paragraph_768 )
        stream_P.add( __P129__ )
        # at line 206:18: ( id | style | klass | align )*
        while true # decision 28
          alt_28 = 5
          look_28_0 = @input.peek( 1 )

          if ( look_28_0 == WS )
            case look_28 = @input.peek( 2 )
            when ID then alt_28 = 1
            when STYLE then alt_28 = 2
            when CLASS then alt_28 = 3
            when ALIGN then alt_28 = 4
            end

          end
          case alt_28
          when 1
            # at line 206:19: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_paragraph_771 )
            id130 = id
            @state.following.pop
            stream_id.add( id130.tree )

          when 2
            # at line 206:22: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_paragraph_773 )
            style131 = style
            @state.following.pop
            stream_style.add( style131.tree )

          when 3
            # at line 206:28: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_paragraph_775 )
            klass132 = klass
            @state.following.pop
            stream_klass.add( klass132.tree )

          when 4
            # at line 206:34: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_paragraph_777 )
            align133 = align
            @state.following.pop
            stream_align.add( align133.tree )

          else
            break # out of loop for decision 28
          end
        end # loop for decision 28
        __END_TAG134__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_paragraph_781 )
        stream_END_TAG.add( __END_TAG134__ )
        # at line 207:3: ( text )*
        while true # decision 29
          alt_29 = 2
          look_29_0 = @input.peek( 1 )

          if ( look_29_0 == OPENING_TAG || look_29_0 == PCDATA )
            alt_29 = 1

          end
          case alt_29
          when 1
            # at line 207:4: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_paragraph_786 )
            text135 = text
            @state.following.pop
            stream_text.add( text135.tree )

          else
            break # out of loop for decision 29
          end
        end # loop for decision 29
        __CLOSING_TAG136__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_paragraph_792 )
        stream_CLOSING_TAG.add( __CLOSING_TAG136__ )
        __P137__ = match( P, TOKENS_FOLLOWING_P_IN_paragraph_794 )
        stream_P.add( __P137__ )
        __END_TAG138__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_paragraph_796 )
        stream_END_TAG.add( __END_TAG138__ )
        # AST Rewrite
        # elements: align, text, id, klass, P, style
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 208:25: -> ^( TAG P ( id )* ( style )* ( klass )* ( align )* ( text )* )
        # at line 208:28: ^( TAG P ( id )* ( style )* ( klass )* ( align )* ( text )* )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_P.next_node )
        # at line 208:36: ( id )*
        while stream_id.has_next?
          @adaptor.add_child( root_1, stream_id.next_tree )

        end

        stream_id.reset();
        # at line 208:40: ( style )*
        while stream_style.has_next?
          @adaptor.add_child( root_1, stream_style.next_tree )

        end

        stream_style.reset();
        # at line 208:47: ( klass )*
        while stream_klass.has_next?
          @adaptor.add_child( root_1, stream_klass.next_tree )

        end

        stream_klass.reset();
        # at line 208:54: ( align )*
        while stream_align.has_next?
          @adaptor.add_child( root_1, stream_align.next_tree )

        end

        stream_align.reset();
        # at line 208:61: ( text )*
        while stream_text.has_next?
          @adaptor.add_child( root_1, stream_text.next_tree )

        end

        stream_text.reset();

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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

    DivReturnValue = define_return_scope 

    # 
    # parser rule div
    # 
    # (in HtmlParser.g)
    # 211:1: div : OPENING_TAG DIV ( id | style | klass | align )* END_TAG ( body_content )* CLOSING_TAG DIV END_TAG -> ^( TAG DIV ( id )* ( style )* ( klass )* ( align )* ( body_content )* ) ;
    # 
    def div
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = DivReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG139__ = nil
      __DIV140__ = nil
      __END_TAG145__ = nil
      __CLOSING_TAG147__ = nil
      __DIV148__ = nil
      __END_TAG149__ = nil
      id141 = nil
      style142 = nil
      klass143 = nil
      align144 = nil
      body_content146 = nil

      tree_for_OPENING_TAG139 = nil
      tree_for_DIV140 = nil
      tree_for_END_TAG145 = nil
      tree_for_CLOSING_TAG147 = nil
      tree_for_DIV148 = nil
      tree_for_END_TAG149 = nil
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_DIV = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token DIV" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_id = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule id" )
      stream_style = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule style" )
      stream_klass = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule klass" )
      stream_align = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule align" )
      stream_body_content = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule body_content" )
      begin
        # at line 211:7: OPENING_TAG DIV ( id | style | klass | align )* END_TAG ( body_content )* CLOSING_TAG DIV END_TAG
        __OPENING_TAG139__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_div_831 )
        stream_OPENING_TAG.add( __OPENING_TAG139__ )
        __DIV140__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_div_833 )
        stream_DIV.add( __DIV140__ )
        # at line 211:23: ( id | style | klass | align )*
        while true # decision 30
          alt_30 = 5
          look_30_0 = @input.peek( 1 )

          if ( look_30_0 == WS )
            case look_30 = @input.peek( 2 )
            when ID then alt_30 = 1
            when STYLE then alt_30 = 2
            when CLASS then alt_30 = 3
            when ALIGN then alt_30 = 4
            end

          end
          case alt_30
          when 1
            # at line 211:24: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_div_836 )
            id141 = id
            @state.following.pop
            stream_id.add( id141.tree )

          when 2
            # at line 211:27: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_div_838 )
            style142 = style
            @state.following.pop
            stream_style.add( style142.tree )

          when 3
            # at line 211:33: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_div_840 )
            klass143 = klass
            @state.following.pop
            stream_klass.add( klass143.tree )

          when 4
            # at line 211:39: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_div_842 )
            align144 = align
            @state.following.pop
            stream_align.add( align144.tree )

          else
            break # out of loop for decision 30
          end
        end # loop for decision 30
        __END_TAG145__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_div_846 )
        stream_END_TAG.add( __END_TAG145__ )
        # at line 212:3: ( body_content )*
        while true # decision 31
          alt_31 = 2
          look_31_0 = @input.peek( 1 )

          if ( look_31_0 == OPENING_TAG || look_31_0 == PCDATA )
            alt_31 = 1

          end
          case alt_31
          when 1
            # at line 212:4: body_content
            @state.following.push( TOKENS_FOLLOWING_body_content_IN_div_851 )
            body_content146 = body_content
            @state.following.pop
            stream_body_content.add( body_content146.tree )

          else
            break # out of loop for decision 31
          end
        end # loop for decision 31
        __CLOSING_TAG147__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_div_857 )
        stream_CLOSING_TAG.add( __CLOSING_TAG147__ )
        __DIV148__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_div_859 )
        stream_DIV.add( __DIV148__ )
        __END_TAG149__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_div_861 )
        stream_END_TAG.add( __END_TAG149__ )
        # AST Rewrite
        # elements: klass, align, body_content, style, DIV, id
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 213:27: -> ^( TAG DIV ( id )* ( style )* ( klass )* ( align )* ( body_content )* )
        # at line 213:30: ^( TAG DIV ( id )* ( style )* ( klass )* ( align )* ( body_content )* )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_DIV.next_node )
        # at line 213:40: ( id )*
        while stream_id.has_next?
          @adaptor.add_child( root_1, stream_id.next_tree )

        end

        stream_id.reset();
        # at line 213:44: ( style )*
        while stream_style.has_next?
          @adaptor.add_child( root_1, stream_style.next_tree )

        end

        stream_style.reset();
        # at line 213:51: ( klass )*
        while stream_klass.has_next?
          @adaptor.add_child( root_1, stream_klass.next_tree )

        end

        stream_klass.reset();
        # at line 213:58: ( align )*
        while stream_align.has_next?
          @adaptor.add_child( root_1, stream_align.next_tree )

        end

        stream_align.reset();
        # at line 213:65: ( body_content )*
        while stream_body_content.has_next?
          @adaptor.add_child( root_1, stream_body_content.next_tree )

        end

        stream_body_content.reset();

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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

    ItalicReturnValue = define_return_scope 

    # 
    # parser rule italic
    # 
    # (in HtmlParser.g)
    # 217:1: italic : OPENING_TAG I END_TAG ( text )+ CLOSING_TAG I END_TAG -> ^( TAG I ( text )+ ) ;
    # 
    def italic
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = ItalicReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG150__ = nil
      __I151__ = nil
      __END_TAG152__ = nil
      __CLOSING_TAG154__ = nil
      __I155__ = nil
      __END_TAG156__ = nil
      text153 = nil

      tree_for_OPENING_TAG150 = nil
      tree_for_I151 = nil
      tree_for_END_TAG152 = nil
      tree_for_CLOSING_TAG154 = nil
      tree_for_I155 = nil
      tree_for_END_TAG156 = nil
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_I = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token I" )
      stream_text = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule text" )
      begin
        # at line 217:9: OPENING_TAG I END_TAG ( text )+ CLOSING_TAG I END_TAG
        __OPENING_TAG150__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_italic_898 )
        stream_OPENING_TAG.add( __OPENING_TAG150__ )
        __I151__ = match( I, TOKENS_FOLLOWING_I_IN_italic_900 )
        stream_I.add( __I151__ )
        __END_TAG152__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_italic_902 )
        stream_END_TAG.add( __END_TAG152__ )
        # at file 218:3: ( text )+
        match_count_32 = 0
        while true
          alt_32 = 2
          look_32_0 = @input.peek( 1 )

          if ( look_32_0 == OPENING_TAG || look_32_0 == PCDATA )
            alt_32 = 1

          end
          case alt_32
          when 1
            # at line 218:4: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_italic_907 )
            text153 = text
            @state.following.pop
            stream_text.add( text153.tree )

          else
            match_count_32 > 0 and break
            eee = EarlyExit(32)


            raise eee
          end
          match_count_32 += 1
        end

        __CLOSING_TAG154__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_italic_913 )
        stream_CLOSING_TAG.add( __CLOSING_TAG154__ )
        __I155__ = match( I, TOKENS_FOLLOWING_I_IN_italic_915 )
        stream_I.add( __I155__ )
        __END_TAG156__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_italic_917 )
        stream_END_TAG.add( __END_TAG156__ )
        # AST Rewrite
        # elements: text, I
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 219:25: -> ^( TAG I ( text )+ )
        # at line 219:28: ^( TAG I ( text )+ )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_I.next_node )
        # at line 219:36: ( text )+
        stream_text.has_next? or raise ANTLR3::RewriteEarlyExit

        while stream_text.has_next?
          @adaptor.add_child( root_1, stream_text.next_tree )

        end
        stream_text.reset

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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

    BoldReturnValue = define_return_scope 

    # 
    # parser rule bold
    # 
    # (in HtmlParser.g)
    # 222:1: bold : OPENING_TAG B END_TAG ( text )+ CLOSING_TAG B END_TAG -> ^( TAG B ( text )+ ) ;
    # 
    def bold
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = BoldReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG157__ = nil
      __B158__ = nil
      __END_TAG159__ = nil
      __CLOSING_TAG161__ = nil
      __B162__ = nil
      __END_TAG163__ = nil
      text160 = nil

      tree_for_OPENING_TAG157 = nil
      tree_for_B158 = nil
      tree_for_END_TAG159 = nil
      tree_for_CLOSING_TAG161 = nil
      tree_for_B162 = nil
      tree_for_END_TAG163 = nil
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_B = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token B" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_text = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule text" )
      begin
        # at line 222:9: OPENING_TAG B END_TAG ( text )+ CLOSING_TAG B END_TAG
        __OPENING_TAG157__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_bold_946 )
        stream_OPENING_TAG.add( __OPENING_TAG157__ )
        __B158__ = match( B, TOKENS_FOLLOWING_B_IN_bold_948 )
        stream_B.add( __B158__ )
        __END_TAG159__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_bold_950 )
        stream_END_TAG.add( __END_TAG159__ )
        # at file 223:3: ( text )+
        match_count_33 = 0
        while true
          alt_33 = 2
          look_33_0 = @input.peek( 1 )

          if ( look_33_0 == OPENING_TAG || look_33_0 == PCDATA )
            alt_33 = 1

          end
          case alt_33
          when 1
            # at line 223:4: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_bold_955 )
            text160 = text
            @state.following.pop
            stream_text.add( text160.tree )

          else
            match_count_33 > 0 and break
            eee = EarlyExit(33)


            raise eee
          end
          match_count_33 += 1
        end

        __CLOSING_TAG161__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_bold_961 )
        stream_CLOSING_TAG.add( __CLOSING_TAG161__ )
        __B162__ = match( B, TOKENS_FOLLOWING_B_IN_bold_963 )
        stream_B.add( __B162__ )
        __END_TAG163__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_bold_965 )
        stream_END_TAG.add( __END_TAG163__ )
        # AST Rewrite
        # elements: B, text
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 224:25: -> ^( TAG B ( text )+ )
        # at line 224:28: ^( TAG B ( text )+ )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_B.next_node )
        # at line 224:36: ( text )+
        stream_text.has_next? or raise ANTLR3::RewriteEarlyExit

        while stream_text.has_next?
          @adaptor.add_child( root_1, stream_text.next_tree )

        end
        stream_text.reset

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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

    UnderlineReturnValue = define_return_scope 

    # 
    # parser rule underline
    # 
    # (in HtmlParser.g)
    # 227:1: underline : OPENING_TAG U END_TAG ( text )+ CLOSING_TAG U END_TAG -> ^( TAG U ( text )+ ) ;
    # 
    def underline
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = UnderlineReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG164__ = nil
      __U165__ = nil
      __END_TAG166__ = nil
      __CLOSING_TAG168__ = nil
      __U169__ = nil
      __END_TAG170__ = nil
      text167 = nil

      tree_for_OPENING_TAG164 = nil
      tree_for_U165 = nil
      tree_for_END_TAG166 = nil
      tree_for_CLOSING_TAG168 = nil
      tree_for_U169 = nil
      tree_for_END_TAG170 = nil
      stream_U = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token U" )
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_text = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule text" )
      begin
        # at line 227:12: OPENING_TAG U END_TAG ( text )+ CLOSING_TAG U END_TAG
        __OPENING_TAG164__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_underline_992 )
        stream_OPENING_TAG.add( __OPENING_TAG164__ )
        __U165__ = match( U, TOKENS_FOLLOWING_U_IN_underline_994 )
        stream_U.add( __U165__ )
        __END_TAG166__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_underline_996 )
        stream_END_TAG.add( __END_TAG166__ )
        # at file 228:6: ( text )+
        match_count_34 = 0
        while true
          alt_34 = 2
          look_34_0 = @input.peek( 1 )

          if ( look_34_0 == OPENING_TAG || look_34_0 == PCDATA )
            alt_34 = 1

          end
          case alt_34
          when 1
            # at line 228:7: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_underline_1004 )
            text167 = text
            @state.following.pop
            stream_text.add( text167.tree )

          else
            match_count_34 > 0 and break
            eee = EarlyExit(34)


            raise eee
          end
          match_count_34 += 1
        end

        __CLOSING_TAG168__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_underline_1013 )
        stream_CLOSING_TAG.add( __CLOSING_TAG168__ )
        __U169__ = match( U, TOKENS_FOLLOWING_U_IN_underline_1015 )
        stream_U.add( __U169__ )
        __END_TAG170__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_underline_1017 )
        stream_END_TAG.add( __END_TAG170__ )
        # AST Rewrite
        # elements: U, text
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 229:28: -> ^( TAG U ( text )+ )
        # at line 229:31: ^( TAG U ( text )+ )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_U.next_node )
        # at line 229:39: ( text )+
        stream_text.has_next? or raise ANTLR3::RewriteEarlyExit

        while stream_text.has_next?
          @adaptor.add_child( root_1, stream_text.next_tree )

        end
        stream_text.reset

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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

    TableReturnValue = define_return_scope 

    # 
    # parser rule table
    # 
    # (in HtmlParser.g)
    # 233:1: table : OPENING_TAG TABLE ( id | style | klass | align | width | height | background | bgcolor | border )* END_TAG ( tr )+ CLOSING_TAG TABLE END_TAG ;
    # 
    def table
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = TableReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG171__ = nil
      __TABLE172__ = nil
      __END_TAG182__ = nil
      __CLOSING_TAG184__ = nil
      __TABLE185__ = nil
      __END_TAG186__ = nil
      id173 = nil
      style174 = nil
      klass175 = nil
      align176 = nil
      width177 = nil
      height178 = nil
      background179 = nil
      bgcolor180 = nil
      border181 = nil
      tr183 = nil

      tree_for_OPENING_TAG171 = nil
      tree_for_TABLE172 = nil
      tree_for_END_TAG182 = nil
      tree_for_CLOSING_TAG184 = nil
      tree_for_TABLE185 = nil
      tree_for_END_TAG186 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 234:4: OPENING_TAG TABLE ( id | style | klass | align | width | height | background | bgcolor | border )* END_TAG ( tr )+ CLOSING_TAG TABLE END_TAG
        __OPENING_TAG171__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_table_1054 )

        tree_for_OPENING_TAG171 = @adaptor.create_with_payload( __OPENING_TAG171__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG171 )

        __TABLE172__ = match( TABLE, TOKENS_FOLLOWING_TABLE_IN_table_1056 )

        tree_for_TABLE172 = @adaptor.create_with_payload( __TABLE172__ )
        @adaptor.add_child( root_0, tree_for_TABLE172 )

        # at line 234:22: ( id | style | klass | align | width | height | background | bgcolor | border )*
        while true # decision 35
          alt_35 = 10
          alt_35 = @dfa35.predict( @input )
          case alt_35
          when 1
            # at line 234:23: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_table_1059 )
            id173 = id
            @state.following.pop
            @adaptor.add_child( root_0, id173.tree )

          when 2
            # at line 234:26: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_table_1061 )
            style174 = style
            @state.following.pop
            @adaptor.add_child( root_0, style174.tree )

          when 3
            # at line 234:32: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_table_1063 )
            klass175 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass175.tree )

          when 4
            # at line 234:38: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_table_1065 )
            align176 = align
            @state.following.pop
            @adaptor.add_child( root_0, align176.tree )

          when 5
            # at line 234:44: width
            @state.following.push( TOKENS_FOLLOWING_width_IN_table_1067 )
            width177 = width
            @state.following.pop
            @adaptor.add_child( root_0, width177.tree )

          when 6
            # at line 234:50: height
            @state.following.push( TOKENS_FOLLOWING_height_IN_table_1069 )
            height178 = height
            @state.following.pop
            @adaptor.add_child( root_0, height178.tree )

          when 7
            # at line 234:57: background
            @state.following.push( TOKENS_FOLLOWING_background_IN_table_1071 )
            background179 = background
            @state.following.pop
            @adaptor.add_child( root_0, background179.tree )

          when 8
            # at line 234:68: bgcolor
            @state.following.push( TOKENS_FOLLOWING_bgcolor_IN_table_1073 )
            bgcolor180 = bgcolor
            @state.following.pop
            @adaptor.add_child( root_0, bgcolor180.tree )

          when 9
            # at line 234:76: border
            @state.following.push( TOKENS_FOLLOWING_border_IN_table_1075 )
            border181 = border
            @state.following.pop
            @adaptor.add_child( root_0, border181.tree )

          else
            break # out of loop for decision 35
          end
        end # loop for decision 35
        __END_TAG182__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_table_1079 )

        tree_for_END_TAG182 = @adaptor.create_with_payload( __END_TAG182__ )
        @adaptor.add_child( root_0, tree_for_END_TAG182 )

        # at file 236:4: ( tr )+
        match_count_36 = 0
        while true
          alt_36 = 2
          look_36_0 = @input.peek( 1 )

          if ( look_36_0 == OPENING_TAG )
            alt_36 = 1

          end
          case alt_36
          when 1
            # at line 236:5: tr
            @state.following.push( TOKENS_FOLLOWING_tr_IN_table_1089 )
            tr183 = tr
            @state.following.pop
            @adaptor.add_child( root_0, tr183.tree )

          else
            match_count_36 > 0 and break
            eee = EarlyExit(36)


            raise eee
          end
          match_count_36 += 1
        end

        __CLOSING_TAG184__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_table_1096 )

        tree_for_CLOSING_TAG184 = @adaptor.create_with_payload( __CLOSING_TAG184__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG184 )

        __TABLE185__ = match( TABLE, TOKENS_FOLLOWING_TABLE_IN_table_1098 )

        tree_for_TABLE185 = @adaptor.create_with_payload( __TABLE185__ )
        @adaptor.add_child( root_0, tree_for_TABLE185 )

        __END_TAG186__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_table_1100 )

        tree_for_END_TAG186 = @adaptor.create_with_payload( __END_TAG186__ )
        @adaptor.add_child( root_0, tree_for_END_TAG186 )

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

    TrReturnValue = define_return_scope 

    # 
    # parser rule tr
    # 
    # (in HtmlParser.g)
    # 240:1: tr : OPENING_TAG TR END_TAG ( th | td )* CLOSING_TAG TR END_TAG ;
    # 
    def tr
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = TrReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG187__ = nil
      __TR188__ = nil
      __END_TAG189__ = nil
      __CLOSING_TAG192__ = nil
      __TR193__ = nil
      __END_TAG194__ = nil
      th190 = nil
      td191 = nil

      tree_for_OPENING_TAG187 = nil
      tree_for_TR188 = nil
      tree_for_END_TAG189 = nil
      tree_for_CLOSING_TAG192 = nil
      tree_for_TR193 = nil
      tree_for_END_TAG194 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 240:6: OPENING_TAG TR END_TAG ( th | td )* CLOSING_TAG TR END_TAG
        __OPENING_TAG187__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_tr_1110 )

        tree_for_OPENING_TAG187 = @adaptor.create_with_payload( __OPENING_TAG187__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG187 )

        __TR188__ = match( TR, TOKENS_FOLLOWING_TR_IN_tr_1112 )

        tree_for_TR188 = @adaptor.create_with_payload( __TR188__ )
        @adaptor.add_child( root_0, tree_for_TR188 )

        __END_TAG189__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_tr_1114 )

        tree_for_END_TAG189 = @adaptor.create_with_payload( __END_TAG189__ )
        @adaptor.add_child( root_0, tree_for_END_TAG189 )

        # at line 242:4: ( th | td )*
        while true # decision 37
          alt_37 = 3
          look_37_0 = @input.peek( 1 )

          if ( look_37_0 == OPENING_TAG )
            look_37_2 = @input.peek( 2 )

            if ( look_37_2 == TH )
              alt_37 = 1
            elsif ( look_37_2 == TD )
              alt_37 = 2

            end

          end
          case alt_37
          when 1
            # at line 242:5: th
            @state.following.push( TOKENS_FOLLOWING_th_IN_tr_1124 )
            th190 = th
            @state.following.pop
            @adaptor.add_child( root_0, th190.tree )

          when 2
            # at line 242:10: td
            @state.following.push( TOKENS_FOLLOWING_td_IN_tr_1128 )
            td191 = td
            @state.following.pop
            @adaptor.add_child( root_0, td191.tree )

          else
            break # out of loop for decision 37
          end
        end # loop for decision 37
        __CLOSING_TAG192__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_tr_1135 )

        tree_for_CLOSING_TAG192 = @adaptor.create_with_payload( __CLOSING_TAG192__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG192 )

        __TR193__ = match( TR, TOKENS_FOLLOWING_TR_IN_tr_1137 )

        tree_for_TR193 = @adaptor.create_with_payload( __TR193__ )
        @adaptor.add_child( root_0, tree_for_TR193 )

        __END_TAG194__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_tr_1139 )

        tree_for_END_TAG194 = @adaptor.create_with_payload( __END_TAG194__ )
        @adaptor.add_child( root_0, tree_for_END_TAG194 )

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

    ThReturnValue = define_return_scope 

    # 
    # parser rule th
    # 
    # (in HtmlParser.g)
    # 246:1: th : OPENING_TAG TH ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )* END_TAG ( body_content )* CLOSING_TAG TH END_TAG ;
    # 
    def th
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = ThReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG195__ = nil
      __TH196__ = nil
      __END_TAG207__ = nil
      __CLOSING_TAG209__ = nil
      __TH210__ = nil
      __END_TAG211__ = nil
      id197 = nil
      style198 = nil
      klass199 = nil
      align200 = nil
      valign201 = nil
      width202 = nil
      height203 = nil
      background204 = nil
      bgcolor205 = nil
      bordercolor206 = nil
      body_content208 = nil

      tree_for_OPENING_TAG195 = nil
      tree_for_TH196 = nil
      tree_for_END_TAG207 = nil
      tree_for_CLOSING_TAG209 = nil
      tree_for_TH210 = nil
      tree_for_END_TAG211 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 246:7: OPENING_TAG TH ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )* END_TAG ( body_content )* CLOSING_TAG TH END_TAG
        __OPENING_TAG195__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_th_1150 )

        tree_for_OPENING_TAG195 = @adaptor.create_with_payload( __OPENING_TAG195__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG195 )

        __TH196__ = match( TH, TOKENS_FOLLOWING_TH_IN_th_1152 )

        tree_for_TH196 = @adaptor.create_with_payload( __TH196__ )
        @adaptor.add_child( root_0, tree_for_TH196 )

        # at line 246:22: ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )*
        while true # decision 38
          alt_38 = 11
          alt_38 = @dfa38.predict( @input )
          case alt_38
          when 1
            # at line 246:23: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_th_1155 )
            id197 = id
            @state.following.pop
            @adaptor.add_child( root_0, id197.tree )

          when 2
            # at line 246:26: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_th_1157 )
            style198 = style
            @state.following.pop
            @adaptor.add_child( root_0, style198.tree )

          when 3
            # at line 246:32: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_th_1159 )
            klass199 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass199.tree )

          when 4
            # at line 246:38: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_th_1161 )
            align200 = align
            @state.following.pop
            @adaptor.add_child( root_0, align200.tree )

          when 5
            # at line 246:44: valign
            @state.following.push( TOKENS_FOLLOWING_valign_IN_th_1163 )
            valign201 = valign
            @state.following.pop
            @adaptor.add_child( root_0, valign201.tree )

          when 6
            # at line 246:51: width
            @state.following.push( TOKENS_FOLLOWING_width_IN_th_1165 )
            width202 = width
            @state.following.pop
            @adaptor.add_child( root_0, width202.tree )

          when 7
            # at line 246:57: height
            @state.following.push( TOKENS_FOLLOWING_height_IN_th_1167 )
            height203 = height
            @state.following.pop
            @adaptor.add_child( root_0, height203.tree )

          when 8
            # at line 246:64: background
            @state.following.push( TOKENS_FOLLOWING_background_IN_th_1169 )
            background204 = background
            @state.following.pop
            @adaptor.add_child( root_0, background204.tree )

          when 9
            # at line 246:75: bgcolor
            @state.following.push( TOKENS_FOLLOWING_bgcolor_IN_th_1171 )
            bgcolor205 = bgcolor
            @state.following.pop
            @adaptor.add_child( root_0, bgcolor205.tree )

          when 10
            # at line 246:83: bordercolor
            @state.following.push( TOKENS_FOLLOWING_bordercolor_IN_th_1173 )
            bordercolor206 = bordercolor
            @state.following.pop
            @adaptor.add_child( root_0, bordercolor206.tree )

          else
            break # out of loop for decision 38
          end
        end # loop for decision 38
        __END_TAG207__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_th_1177 )

        tree_for_END_TAG207 = @adaptor.create_with_payload( __END_TAG207__ )
        @adaptor.add_child( root_0, tree_for_END_TAG207 )

        # at line 247:3: ( body_content )*
        while true # decision 39
          alt_39 = 2
          look_39_0 = @input.peek( 1 )

          if ( look_39_0 == OPENING_TAG || look_39_0 == PCDATA )
            alt_39 = 1

          end
          case alt_39
          when 1
            # at line 247:4: body_content
            @state.following.push( TOKENS_FOLLOWING_body_content_IN_th_1182 )
            body_content208 = body_content
            @state.following.pop
            @adaptor.add_child( root_0, body_content208.tree )

          else
            break # out of loop for decision 39
          end
        end # loop for decision 39
        __CLOSING_TAG209__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_th_1188 )

        tree_for_CLOSING_TAG209 = @adaptor.create_with_payload( __CLOSING_TAG209__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG209 )

        __TH210__ = match( TH, TOKENS_FOLLOWING_TH_IN_th_1190 )

        tree_for_TH210 = @adaptor.create_with_payload( __TH210__ )
        @adaptor.add_child( root_0, tree_for_TH210 )

        __END_TAG211__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_th_1192 )

        tree_for_END_TAG211 = @adaptor.create_with_payload( __END_TAG211__ )
        @adaptor.add_child( root_0, tree_for_END_TAG211 )

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

    TdReturnValue = define_return_scope 

    # 
    # parser rule td
    # 
    # (in HtmlParser.g)
    # 251:1: td : OPENING_TAG TD ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )* END_TAG ( body_content )* CLOSING_TAG TD END_TAG ;
    # 
    def td
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = TdReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG212__ = nil
      __TD213__ = nil
      __END_TAG224__ = nil
      __CLOSING_TAG226__ = nil
      __TD227__ = nil
      __END_TAG228__ = nil
      id214 = nil
      style215 = nil
      klass216 = nil
      align217 = nil
      valign218 = nil
      width219 = nil
      height220 = nil
      background221 = nil
      bgcolor222 = nil
      bordercolor223 = nil
      body_content225 = nil

      tree_for_OPENING_TAG212 = nil
      tree_for_TD213 = nil
      tree_for_END_TAG224 = nil
      tree_for_CLOSING_TAG226 = nil
      tree_for_TD227 = nil
      tree_for_END_TAG228 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 251:7: OPENING_TAG TD ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )* END_TAG ( body_content )* CLOSING_TAG TD END_TAG
        __OPENING_TAG212__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_td_1203 )

        tree_for_OPENING_TAG212 = @adaptor.create_with_payload( __OPENING_TAG212__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG212 )

        __TD213__ = match( TD, TOKENS_FOLLOWING_TD_IN_td_1205 )

        tree_for_TD213 = @adaptor.create_with_payload( __TD213__ )
        @adaptor.add_child( root_0, tree_for_TD213 )

        # at line 251:22: ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )*
        while true # decision 40
          alt_40 = 11
          alt_40 = @dfa40.predict( @input )
          case alt_40
          when 1
            # at line 251:23: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_td_1208 )
            id214 = id
            @state.following.pop
            @adaptor.add_child( root_0, id214.tree )

          when 2
            # at line 251:26: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_td_1210 )
            style215 = style
            @state.following.pop
            @adaptor.add_child( root_0, style215.tree )

          when 3
            # at line 251:32: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_td_1212 )
            klass216 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass216.tree )

          when 4
            # at line 251:38: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_td_1214 )
            align217 = align
            @state.following.pop
            @adaptor.add_child( root_0, align217.tree )

          when 5
            # at line 251:44: valign
            @state.following.push( TOKENS_FOLLOWING_valign_IN_td_1216 )
            valign218 = valign
            @state.following.pop
            @adaptor.add_child( root_0, valign218.tree )

          when 6
            # at line 251:51: width
            @state.following.push( TOKENS_FOLLOWING_width_IN_td_1218 )
            width219 = width
            @state.following.pop
            @adaptor.add_child( root_0, width219.tree )

          when 7
            # at line 251:57: height
            @state.following.push( TOKENS_FOLLOWING_height_IN_td_1220 )
            height220 = height
            @state.following.pop
            @adaptor.add_child( root_0, height220.tree )

          when 8
            # at line 251:64: background
            @state.following.push( TOKENS_FOLLOWING_background_IN_td_1222 )
            background221 = background
            @state.following.pop
            @adaptor.add_child( root_0, background221.tree )

          when 9
            # at line 251:75: bgcolor
            @state.following.push( TOKENS_FOLLOWING_bgcolor_IN_td_1224 )
            bgcolor222 = bgcolor
            @state.following.pop
            @adaptor.add_child( root_0, bgcolor222.tree )

          when 10
            # at line 251:83: bordercolor
            @state.following.push( TOKENS_FOLLOWING_bordercolor_IN_td_1226 )
            bordercolor223 = bordercolor
            @state.following.pop
            @adaptor.add_child( root_0, bordercolor223.tree )

          else
            break # out of loop for decision 40
          end
        end # loop for decision 40
        __END_TAG224__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_td_1230 )

        tree_for_END_TAG224 = @adaptor.create_with_payload( __END_TAG224__ )
        @adaptor.add_child( root_0, tree_for_END_TAG224 )

        # at line 252:3: ( body_content )*
        while true # decision 41
          alt_41 = 2
          look_41_0 = @input.peek( 1 )

          if ( look_41_0 == OPENING_TAG || look_41_0 == PCDATA )
            alt_41 = 1

          end
          case alt_41
          when 1
            # at line 252:4: body_content
            @state.following.push( TOKENS_FOLLOWING_body_content_IN_td_1235 )
            body_content225 = body_content
            @state.following.pop
            @adaptor.add_child( root_0, body_content225.tree )

          else
            break # out of loop for decision 41
          end
        end # loop for decision 41
        __CLOSING_TAG226__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_td_1241 )

        tree_for_CLOSING_TAG226 = @adaptor.create_with_payload( __CLOSING_TAG226__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG226 )

        __TD227__ = match( TD, TOKENS_FOLLOWING_TD_IN_td_1243 )

        tree_for_TD227 = @adaptor.create_with_payload( __TD227__ )
        @adaptor.add_child( root_0, tree_for_TD227 )

        __END_TAG228__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_td_1245 )

        tree_for_END_TAG228 = @adaptor.create_with_payload( __END_TAG228__ )
        @adaptor.add_child( root_0, tree_for_END_TAG228 )

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

    AnchorReturnValue = define_return_scope 

    # 
    # parser rule anchor
    # 
    # (in HtmlParser.g)
    # 257:1: anchor : OPENING_TAG A ( id | style | klass | align | href | name | target ) END_TAG ( text )* CLOSING_TAG A END_TAG ;
    # 
    def anchor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = AnchorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG229__ = nil
      __A230__ = nil
      __END_TAG238__ = nil
      __CLOSING_TAG240__ = nil
      __A241__ = nil
      __END_TAG242__ = nil
      id231 = nil
      style232 = nil
      klass233 = nil
      align234 = nil
      href235 = nil
      name236 = nil
      target237 = nil
      text239 = nil

      tree_for_OPENING_TAG229 = nil
      tree_for_A230 = nil
      tree_for_END_TAG238 = nil
      tree_for_CLOSING_TAG240 = nil
      tree_for_A241 = nil
      tree_for_END_TAG242 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 257:9: OPENING_TAG A ( id | style | klass | align | href | name | target ) END_TAG ( text )* CLOSING_TAG A END_TAG
        __OPENING_TAG229__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_anchor_1257 )

        tree_for_OPENING_TAG229 = @adaptor.create_with_payload( __OPENING_TAG229__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG229 )

        __A230__ = match( A, TOKENS_FOLLOWING_A_IN_anchor_1259 )

        tree_for_A230 = @adaptor.create_with_payload( __A230__ )
        @adaptor.add_child( root_0, tree_for_A230 )

        # at line 257:23: ( id | style | klass | align | href | name | target )
        alt_42 = 7
        look_42_0 = @input.peek( 1 )

        if ( look_42_0 == WS )
          case look_42 = @input.peek( 2 )
          when ID then alt_42 = 1
          when STYLE then alt_42 = 2
          when CLASS then alt_42 = 3
          when ALIGN then alt_42 = 4
          when HREF then alt_42 = 5
          when ANAME then alt_42 = 6
          when TARGET then alt_42 = 7
          else
            raise NoViableAlternative( "", 42, 1 )
          end
        else
          raise NoViableAlternative( "", 42, 0 )
        end
        case alt_42
        when 1
          # at line 257:24: id
          @state.following.push( TOKENS_FOLLOWING_id_IN_anchor_1262 )
          id231 = id
          @state.following.pop
          @adaptor.add_child( root_0, id231.tree )

        when 2
          # at line 257:27: style
          @state.following.push( TOKENS_FOLLOWING_style_IN_anchor_1264 )
          style232 = style
          @state.following.pop
          @adaptor.add_child( root_0, style232.tree )

        when 3
          # at line 257:33: klass
          @state.following.push( TOKENS_FOLLOWING_klass_IN_anchor_1266 )
          klass233 = klass
          @state.following.pop
          @adaptor.add_child( root_0, klass233.tree )

        when 4
          # at line 257:39: align
          @state.following.push( TOKENS_FOLLOWING_align_IN_anchor_1268 )
          align234 = align
          @state.following.pop
          @adaptor.add_child( root_0, align234.tree )

        when 5
          # at line 257:45: href
          @state.following.push( TOKENS_FOLLOWING_href_IN_anchor_1270 )
          href235 = href
          @state.following.pop
          @adaptor.add_child( root_0, href235.tree )

        when 6
          # at line 257:50: name
          @state.following.push( TOKENS_FOLLOWING_name_IN_anchor_1272 )
          name236 = name
          @state.following.pop
          @adaptor.add_child( root_0, name236.tree )

        when 7
          # at line 257:55: target
          @state.following.push( TOKENS_FOLLOWING_target_IN_anchor_1274 )
          target237 = target
          @state.following.pop
          @adaptor.add_child( root_0, target237.tree )

        end
        __END_TAG238__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_anchor_1277 )

        tree_for_END_TAG238 = @adaptor.create_with_payload( __END_TAG238__ )
        @adaptor.add_child( root_0, tree_for_END_TAG238 )

        # at line 258:3: ( text )*
        while true # decision 43
          alt_43 = 2
          look_43_0 = @input.peek( 1 )

          if ( look_43_0 == OPENING_TAG || look_43_0 == PCDATA )
            alt_43 = 1

          end
          case alt_43
          when 1
            # at line 258:4: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_anchor_1282 )
            text239 = text
            @state.following.pop
            @adaptor.add_child( root_0, text239.tree )

          else
            break # out of loop for decision 43
          end
        end # loop for decision 43
        __CLOSING_TAG240__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_anchor_1288 )

        tree_for_CLOSING_TAG240 = @adaptor.create_with_payload( __CLOSING_TAG240__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG240 )

        __A241__ = match( A, TOKENS_FOLLOWING_A_IN_anchor_1290 )

        tree_for_A241 = @adaptor.create_with_payload( __A241__ )
        @adaptor.add_child( root_0, tree_for_A241 )

        __END_TAG242__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_anchor_1292 )

        tree_for_END_TAG242 = @adaptor.create_with_payload( __END_TAG242__ )
        @adaptor.add_child( root_0, tree_for_END_TAG242 )

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

    ImgReturnValue = define_return_scope 

    # 
    # parser rule img
    # 
    # (in HtmlParser.g)
    # 262:1: img : OPENING_TAG IMG ( id | style | klass | align | src | alt | width | height )* END_NOPAIR_TAG -> ^( TAG IMG ( id )* ( style )* ( klass )* ( align )* ( src )* ( alt )* ( width )* ( height )* ) ;
    # 
    def img
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = ImgReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG243__ = nil
      __IMG244__ = nil
      __END_NOPAIR_TAG253__ = nil
      id245 = nil
      style246 = nil
      klass247 = nil
      align248 = nil
      src249 = nil
      alt250 = nil
      width251 = nil
      height252 = nil

      tree_for_OPENING_TAG243 = nil
      tree_for_IMG244 = nil
      tree_for_END_NOPAIR_TAG253 = nil
      stream_END_NOPAIR_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_NOPAIR_TAG" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_IMG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token IMG" )
      stream_id = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule id" )
      stream_height = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule height" )
      stream_style = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule style" )
      stream_klass = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule klass" )
      stream_alt = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule alt" )
      stream_align = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule align" )
      stream_width = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule width" )
      stream_src = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule src" )
      begin
        # at line 262:6: OPENING_TAG IMG ( id | style | klass | align | src | alt | width | height )* END_NOPAIR_TAG
        __OPENING_TAG243__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_img_1303 )
        stream_OPENING_TAG.add( __OPENING_TAG243__ )
        __IMG244__ = match( IMG, TOKENS_FOLLOWING_IMG_IN_img_1305 )
        stream_IMG.add( __IMG244__ )
        # at line 262:22: ( id | style | klass | align | src | alt | width | height )*
        while true # decision 44
          alt_44 = 9
          alt_44 = @dfa44.predict( @input )
          case alt_44
          when 1
            # at line 262:23: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_img_1308 )
            id245 = id
            @state.following.pop
            stream_id.add( id245.tree )

          when 2
            # at line 262:26: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_img_1310 )
            style246 = style
            @state.following.pop
            stream_style.add( style246.tree )

          when 3
            # at line 262:32: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_img_1312 )
            klass247 = klass
            @state.following.pop
            stream_klass.add( klass247.tree )

          when 4
            # at line 262:38: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_img_1314 )
            align248 = align
            @state.following.pop
            stream_align.add( align248.tree )

          when 5
            # at line 262:44: src
            @state.following.push( TOKENS_FOLLOWING_src_IN_img_1316 )
            src249 = src
            @state.following.pop
            stream_src.add( src249.tree )

          when 6
            # at line 262:48: alt
            @state.following.push( TOKENS_FOLLOWING_alt_IN_img_1318 )
            alt250 = alt
            @state.following.pop
            stream_alt.add( alt250.tree )

          when 7
            # at line 262:52: width
            @state.following.push( TOKENS_FOLLOWING_width_IN_img_1320 )
            width251 = width
            @state.following.pop
            stream_width.add( width251.tree )

          when 8
            # at line 262:58: height
            @state.following.push( TOKENS_FOLLOWING_height_IN_img_1322 )
            height252 = height
            @state.following.pop
            stream_height.add( height252.tree )

          else
            break # out of loop for decision 44
          end
        end # loop for decision 44
        __END_NOPAIR_TAG253__ = match( END_NOPAIR_TAG, TOKENS_FOLLOWING_END_NOPAIR_TAG_IN_img_1328 )
        stream_END_NOPAIR_TAG.add( __END_NOPAIR_TAG253__ )
        # AST Rewrite
        # elements: height, align, src, style, klass, width, alt, IMG, id
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 263:18: -> ^( TAG IMG ( id )* ( style )* ( klass )* ( align )* ( src )* ( alt )* ( width )* ( height )* )
        # at line 263:21: ^( TAG IMG ( id )* ( style )* ( klass )* ( align )* ( src )* ( alt )* ( width )* ( height )* )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_IMG.next_node )
        # at line 263:31: ( id )*
        while stream_id.has_next?
          @adaptor.add_child( root_1, stream_id.next_tree )

        end

        stream_id.reset();
        # at line 263:35: ( style )*
        while stream_style.has_next?
          @adaptor.add_child( root_1, stream_style.next_tree )

        end

        stream_style.reset();
        # at line 263:42: ( klass )*
        while stream_klass.has_next?
          @adaptor.add_child( root_1, stream_klass.next_tree )

        end

        stream_klass.reset();
        # at line 263:49: ( align )*
        while stream_align.has_next?
          @adaptor.add_child( root_1, stream_align.next_tree )

        end

        stream_align.reset();
        # at line 263:56: ( src )*
        while stream_src.has_next?
          @adaptor.add_child( root_1, stream_src.next_tree )

        end

        stream_src.reset();
        # at line 263:61: ( alt )*
        while stream_alt.has_next?
          @adaptor.add_child( root_1, stream_alt.next_tree )

        end

        stream_alt.reset();
        # at line 263:66: ( width )*
        while stream_width.has_next?
          @adaptor.add_child( root_1, stream_width.next_tree )

        end

        stream_width.reset();
        # at line 263:73: ( height )*
        while stream_height.has_next?
          @adaptor.add_child( root_1, stream_height.next_tree )

        end

        stream_height.reset();

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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

    BrReturnValue = define_return_scope 

    # 
    # parser rule br
    # 
    # (in HtmlParser.g)
    # 266:1: br : OPENING_TAG BR END_NOPAIR_TAG -> ^( TAG BR ) ;
    # 
    def br
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = BrReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG254__ = nil
      __BR255__ = nil
      __END_NOPAIR_TAG256__ = nil

      tree_for_OPENING_TAG254 = nil
      tree_for_BR255 = nil
      tree_for_END_NOPAIR_TAG256 = nil
      stream_BR = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token BR" )
      stream_END_NOPAIR_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_NOPAIR_TAG" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )

      begin
        # at line 266:5: OPENING_TAG BR END_NOPAIR_TAG
        __OPENING_TAG254__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_br_1374 )
        stream_OPENING_TAG.add( __OPENING_TAG254__ )
        __BR255__ = match( BR, TOKENS_FOLLOWING_BR_IN_br_1376 )
        stream_BR.add( __BR255__ )
        __END_NOPAIR_TAG256__ = match( END_NOPAIR_TAG, TOKENS_FOLLOWING_END_NOPAIR_TAG_IN_br_1380 )
        stream_END_NOPAIR_TAG.add( __END_NOPAIR_TAG256__ )
        # AST Rewrite
        # elements: BR
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 267:17: -> ^( TAG BR )
        # at line 267:20: ^( TAG BR )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_BR.next_node )

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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

    IdReturnValue = define_return_scope 

    # 
    # parser rule id
    # 
    # (in HtmlParser.g)
    # 272:1: id : WS ID attr_svalue -> ^( ID attr_svalue ) ;
    # 
    def id
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = IdReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS257__ = nil
      __ID258__ = nil
      attr_svalue259 = nil

      tree_for_WS257 = nil
      tree_for_ID258 = nil
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_ID = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token ID" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 272:4: WS ID attr_svalue
        __WS257__ = match( WS, TOKENS_FOLLOWING_WS_IN_id_1402 )
        stream_WS.add( __WS257__ )
        __ID258__ = match( ID, TOKENS_FOLLOWING_ID_IN_id_1404 )
        stream_ID.add( __ID258__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_id_1406 )
        attr_svalue259 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue259.tree )
        # AST Rewrite
        # elements: ID, attr_svalue
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 272:22: -> ^( ID attr_svalue )
        # at line 272:25: ^( ID attr_svalue )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_ID.next_node, root_1 )

        @adaptor.add_child( root_1, stream_attr_svalue.next_tree )

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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

    StyleReturnValue = define_return_scope 

    # 
    # parser rule style
    # 
    # (in HtmlParser.g)
    # 273:1: style : WS STYLE attr_svalue -> ^( STYLE attr_svalue ) ;
    # 
    def style
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = StyleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS260__ = nil
      __STYLE261__ = nil
      attr_svalue262 = nil

      tree_for_WS260 = nil
      tree_for_STYLE261 = nil
      stream_STYLE = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token STYLE" )
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 273:7: WS STYLE attr_svalue
        __WS260__ = match( WS, TOKENS_FOLLOWING_WS_IN_style_1419 )
        stream_WS.add( __WS260__ )
        __STYLE261__ = match( STYLE, TOKENS_FOLLOWING_STYLE_IN_style_1421 )
        stream_STYLE.add( __STYLE261__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_style_1423 )
        attr_svalue262 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue262.tree )
        # AST Rewrite
        # elements: attr_svalue, STYLE
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 273:28: -> ^( STYLE attr_svalue )
        # at line 273:31: ^( STYLE attr_svalue )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_STYLE.next_node, root_1 )

        @adaptor.add_child( root_1, stream_attr_svalue.next_tree )

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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

    KlassReturnValue = define_return_scope 

    # 
    # parser rule klass
    # 
    # (in HtmlParser.g)
    # 274:1: klass : WS CLASS attr_svalue -> ^( CLASS attr_svalue ) ;
    # 
    def klass
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = KlassReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS263__ = nil
      __CLASS264__ = nil
      attr_svalue265 = nil

      tree_for_WS263 = nil
      tree_for_CLASS264 = nil
      stream_CLASS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLASS" )
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 274:7: WS CLASS attr_svalue
        __WS263__ = match( WS, TOKENS_FOLLOWING_WS_IN_klass_1436 )
        stream_WS.add( __WS263__ )
        __CLASS264__ = match( CLASS, TOKENS_FOLLOWING_CLASS_IN_klass_1438 )
        stream_CLASS.add( __CLASS264__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_klass_1440 )
        attr_svalue265 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue265.tree )
        # AST Rewrite
        # elements: attr_svalue, CLASS
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 274:28: -> ^( CLASS attr_svalue )
        # at line 274:31: ^( CLASS attr_svalue )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_CLASS.next_node, root_1 )

        @adaptor.add_child( root_1, stream_attr_svalue.next_tree )

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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

    BgcolorReturnValue = define_return_scope 

    # 
    # parser rule bgcolor
    # 
    # (in HtmlParser.g)
    # 276:1: bgcolor : WS BGCOLOR attr_svalue -> ^( BGCOLOR attr_svalue ) ;
    # 
    def bgcolor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = BgcolorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS266__ = nil
      __BGCOLOR267__ = nil
      attr_svalue268 = nil

      tree_for_WS266 = nil
      tree_for_BGCOLOR267 = nil
      stream_BGCOLOR = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token BGCOLOR" )
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 276:9: WS BGCOLOR attr_svalue
        __WS266__ = match( WS, TOKENS_FOLLOWING_WS_IN_bgcolor_1455 )
        stream_WS.add( __WS266__ )
        __BGCOLOR267__ = match( BGCOLOR, TOKENS_FOLLOWING_BGCOLOR_IN_bgcolor_1457 )
        stream_BGCOLOR.add( __BGCOLOR267__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_bgcolor_1459 )
        attr_svalue268 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue268.tree )
        # AST Rewrite
        # elements: attr_svalue, BGCOLOR
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 276:32: -> ^( BGCOLOR attr_svalue )
        # at line 276:35: ^( BGCOLOR attr_svalue )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_BGCOLOR.next_node, root_1 )

        @adaptor.add_child( root_1, stream_attr_svalue.next_tree )

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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

    BackgroundReturnValue = define_return_scope 

    # 
    # parser rule background
    # 
    # (in HtmlParser.g)
    # 278:1: background : WS BACKGROUND attr_svalue -> ^( BACKGROUND attr_svalue ) ;
    # 
    def background
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
      return_value = BackgroundReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS269__ = nil
      __BACKGROUND270__ = nil
      attr_svalue271 = nil

      tree_for_WS269 = nil
      tree_for_BACKGROUND270 = nil
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_BACKGROUND = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token BACKGROUND" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 278:13: WS BACKGROUND attr_svalue
        __WS269__ = match( WS, TOKENS_FOLLOWING_WS_IN_background_1474 )
        stream_WS.add( __WS269__ )
        __BACKGROUND270__ = match( BACKGROUND, TOKENS_FOLLOWING_BACKGROUND_IN_background_1476 )
        stream_BACKGROUND.add( __BACKGROUND270__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_background_1478 )
        attr_svalue271 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue271.tree )
        # AST Rewrite
        # elements: BACKGROUND, attr_svalue
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 278:39: -> ^( BACKGROUND attr_svalue )
        # at line 278:42: ^( BACKGROUND attr_svalue )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_BACKGROUND.next_node, root_1 )

        @adaptor.add_child( root_1, stream_attr_svalue.next_tree )

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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

    AlignReturnValue = define_return_scope 

    # 
    # parser rule align
    # 
    # (in HtmlParser.g)
    # 280:1: align : WS ALIGN attr_svalue -> ^( ALIGN attr_svalue ) ;
    # 
    def align
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )
      return_value = AlignReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS272__ = nil
      __ALIGN273__ = nil
      attr_svalue274 = nil

      tree_for_WS272 = nil
      tree_for_ALIGN273 = nil
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_ALIGN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token ALIGN" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 280:8: WS ALIGN attr_svalue
        __WS272__ = match( WS, TOKENS_FOLLOWING_WS_IN_align_1493 )
        stream_WS.add( __WS272__ )
        __ALIGN273__ = match( ALIGN, TOKENS_FOLLOWING_ALIGN_IN_align_1495 )
        stream_ALIGN.add( __ALIGN273__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_align_1497 )
        attr_svalue274 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue274.tree )
        # AST Rewrite
        # elements: ALIGN, attr_svalue
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 280:29: -> ^( ALIGN attr_svalue )
        # at line 280:32: ^( ALIGN attr_svalue )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_ALIGN.next_node, root_1 )

        @adaptor.add_child( root_1, stream_attr_svalue.next_tree )

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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

    SrcReturnValue = define_return_scope 

    # 
    # parser rule src
    # 
    # (in HtmlParser.g)
    # 282:1: src : WS SRC attr_svalue -> ^( SRC attr_svalue ) ;
    # 
    def src
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )
      return_value = SrcReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS275__ = nil
      __SRC276__ = nil
      attr_svalue277 = nil

      tree_for_WS275 = nil
      tree_for_SRC276 = nil
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_SRC = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token SRC" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 282:6: WS SRC attr_svalue
        __WS275__ = match( WS, TOKENS_FOLLOWING_WS_IN_src_1512 )
        stream_WS.add( __WS275__ )
        __SRC276__ = match( SRC, TOKENS_FOLLOWING_SRC_IN_src_1514 )
        stream_SRC.add( __SRC276__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_src_1516 )
        attr_svalue277 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue277.tree )
        # AST Rewrite
        # elements: SRC, attr_svalue
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 282:25: -> ^( SRC attr_svalue )
        # at line 282:28: ^( SRC attr_svalue )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_SRC.next_node, root_1 )

        @adaptor.add_child( root_1, stream_attr_svalue.next_tree )

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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

    AltReturnValue = define_return_scope 

    # 
    # parser rule alt
    # 
    # (in HtmlParser.g)
    # 284:1: alt : WS ALT attr_svalue -> ^( ALT attr_svalue ) ;
    # 
    def alt
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )
      return_value = AltReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS278__ = nil
      __ALT279__ = nil
      attr_svalue280 = nil

      tree_for_WS278 = nil
      tree_for_ALT279 = nil
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_ALT = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token ALT" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 284:6: WS ALT attr_svalue
        __WS278__ = match( WS, TOKENS_FOLLOWING_WS_IN_alt_1531 )
        stream_WS.add( __WS278__ )
        __ALT279__ = match( ALT, TOKENS_FOLLOWING_ALT_IN_alt_1533 )
        stream_ALT.add( __ALT279__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_alt_1535 )
        attr_svalue280 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue280.tree )
        # AST Rewrite
        # elements: ALT, attr_svalue
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 284:25: -> ^( ALT attr_svalue )
        # at line 284:28: ^( ALT attr_svalue )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_ALT.next_node, root_1 )

        @adaptor.add_child( root_1, stream_attr_svalue.next_tree )

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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

    WidthReturnValue = define_return_scope 

    # 
    # parser rule width
    # 
    # (in HtmlParser.g)
    # 286:1: width : WS WIDTH attr_svalue -> ^( WIDTH attr_svalue ) ;
    # 
    def width
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )
      return_value = WidthReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS281__ = nil
      __WIDTH282__ = nil
      attr_svalue283 = nil

      tree_for_WS281 = nil
      tree_for_WIDTH282 = nil
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_WIDTH = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WIDTH" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 286:8: WS WIDTH attr_svalue
        __WS281__ = match( WS, TOKENS_FOLLOWING_WS_IN_width_1550 )
        stream_WS.add( __WS281__ )
        __WIDTH282__ = match( WIDTH, TOKENS_FOLLOWING_WIDTH_IN_width_1552 )
        stream_WIDTH.add( __WIDTH282__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_width_1554 )
        attr_svalue283 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue283.tree )
        # AST Rewrite
        # elements: WIDTH, attr_svalue
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 286:29: -> ^( WIDTH attr_svalue )
        # at line 286:32: ^( WIDTH attr_svalue )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_WIDTH.next_node, root_1 )

        @adaptor.add_child( root_1, stream_attr_svalue.next_tree )

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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

    HeightReturnValue = define_return_scope 

    # 
    # parser rule height
    # 
    # (in HtmlParser.g)
    # 288:1: height : WS HEIGHT attr_svalue -> ^( HEIGHT attr_svalue ) ;
    # 
    def height
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )
      return_value = HeightReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS284__ = nil
      __HEIGHT285__ = nil
      attr_svalue286 = nil

      tree_for_WS284 = nil
      tree_for_HEIGHT285 = nil
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_HEIGHT = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token HEIGHT" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 288:9: WS HEIGHT attr_svalue
        __WS284__ = match( WS, TOKENS_FOLLOWING_WS_IN_height_1569 )
        stream_WS.add( __WS284__ )
        __HEIGHT285__ = match( HEIGHT, TOKENS_FOLLOWING_HEIGHT_IN_height_1571 )
        stream_HEIGHT.add( __HEIGHT285__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_height_1573 )
        attr_svalue286 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue286.tree )
        # AST Rewrite
        # elements: attr_svalue, HEIGHT
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 288:31: -> ^( HEIGHT attr_svalue )
        # at line 288:34: ^( HEIGHT attr_svalue )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_HEIGHT.next_node, root_1 )

        @adaptor.add_child( root_1, stream_attr_svalue.next_tree )

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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

    BordercolorReturnValue = define_return_scope 

    # 
    # parser rule bordercolor
    # 
    # (in HtmlParser.g)
    # 290:1: bordercolor : WS BORDERCOLOR attr_svalue -> ^( BORDERCOLOR attr_svalue ) ;
    # 
    def bordercolor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )
      return_value = BordercolorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS287__ = nil
      __BORDERCOLOR288__ = nil
      attr_svalue289 = nil

      tree_for_WS287 = nil
      tree_for_BORDERCOLOR288 = nil
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_BORDERCOLOR = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token BORDERCOLOR" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 290:14: WS BORDERCOLOR attr_svalue
        __WS287__ = match( WS, TOKENS_FOLLOWING_WS_IN_bordercolor_1588 )
        stream_WS.add( __WS287__ )
        __BORDERCOLOR288__ = match( BORDERCOLOR, TOKENS_FOLLOWING_BORDERCOLOR_IN_bordercolor_1590 )
        stream_BORDERCOLOR.add( __BORDERCOLOR288__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_bordercolor_1592 )
        attr_svalue289 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue289.tree )
        # AST Rewrite
        # elements: attr_svalue, BORDERCOLOR
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 290:41: -> ^( BORDERCOLOR attr_svalue )
        # at line 290:44: ^( BORDERCOLOR attr_svalue )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_BORDERCOLOR.next_node, root_1 )

        @adaptor.add_child( root_1, stream_attr_svalue.next_tree )

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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

    ValignReturnValue = define_return_scope 

    # 
    # parser rule valign
    # 
    # (in HtmlParser.g)
    # 292:1: valign : WS VALIGN attr_svalue -> ^( VALIGN attr_svalue ) ;
    # 
    def valign
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )
      return_value = ValignReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS290__ = nil
      __VALIGN291__ = nil
      attr_svalue292 = nil

      tree_for_WS290 = nil
      tree_for_VALIGN291 = nil
      stream_VALIGN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token VALIGN" )
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 292:9: WS VALIGN attr_svalue
        __WS290__ = match( WS, TOKENS_FOLLOWING_WS_IN_valign_1607 )
        stream_WS.add( __WS290__ )
        __VALIGN291__ = match( VALIGN, TOKENS_FOLLOWING_VALIGN_IN_valign_1609 )
        stream_VALIGN.add( __VALIGN291__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_valign_1611 )
        attr_svalue292 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue292.tree )
        # AST Rewrite
        # elements: attr_svalue, VALIGN
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 292:31: -> ^( VALIGN attr_svalue )
        # at line 292:34: ^( VALIGN attr_svalue )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_VALIGN.next_node, root_1 )

        @adaptor.add_child( root_1, stream_attr_svalue.next_tree )

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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

    BorderReturnValue = define_return_scope 

    # 
    # parser rule border
    # 
    # (in HtmlParser.g)
    # 294:1: border : WS BORDER attr_svalue -> ^( BORDER attr_svalue ) ;
    # 
    def border
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )
      return_value = BorderReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS293__ = nil
      __BORDER294__ = nil
      attr_svalue295 = nil

      tree_for_WS293 = nil
      tree_for_BORDER294 = nil
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_BORDER = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token BORDER" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 294:9: WS BORDER attr_svalue
        __WS293__ = match( WS, TOKENS_FOLLOWING_WS_IN_border_1626 )
        stream_WS.add( __WS293__ )
        __BORDER294__ = match( BORDER, TOKENS_FOLLOWING_BORDER_IN_border_1628 )
        stream_BORDER.add( __BORDER294__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_border_1630 )
        attr_svalue295 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue295.tree )
        # AST Rewrite
        # elements: attr_svalue, BORDER
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 294:31: -> ^( BORDER attr_svalue )
        # at line 294:34: ^( BORDER attr_svalue )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_BORDER.next_node, root_1 )

        @adaptor.add_child( root_1, stream_attr_svalue.next_tree )

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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
        # trace_out( __method__, 46 )

      end
      
      return return_value
    end

    HrefReturnValue = define_return_scope 

    # 
    # parser rule href
    # 
    # (in HtmlParser.g)
    # 296:1: href : WS HREF attr_svalue -> ^( HREF attr_svalue ) ;
    # 
    def href
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )
      return_value = HrefReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS296__ = nil
      __HREF297__ = nil
      attr_svalue298 = nil

      tree_for_WS296 = nil
      tree_for_HREF297 = nil
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_HREF = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token HREF" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 296:7: WS HREF attr_svalue
        __WS296__ = match( WS, TOKENS_FOLLOWING_WS_IN_href_1645 )
        stream_WS.add( __WS296__ )
        __HREF297__ = match( HREF, TOKENS_FOLLOWING_HREF_IN_href_1647 )
        stream_HREF.add( __HREF297__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_href_1649 )
        attr_svalue298 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue298.tree )
        # AST Rewrite
        # elements: HREF, attr_svalue
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 296:27: -> ^( HREF attr_svalue )
        # at line 296:30: ^( HREF attr_svalue )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_HREF.next_node, root_1 )

        @adaptor.add_child( root_1, stream_attr_svalue.next_tree )

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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
        # trace_out( __method__, 47 )

      end
      
      return return_value
    end

    NameReturnValue = define_return_scope 

    # 
    # parser rule name
    # 
    # (in HtmlParser.g)
    # 298:1: name : WS ANAME attr_svalue -> ^( ANAME attr_svalue ) ;
    # 
    def name
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 48 )
      return_value = NameReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS299__ = nil
      __ANAME300__ = nil
      attr_svalue301 = nil

      tree_for_WS299 = nil
      tree_for_ANAME300 = nil
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_ANAME = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token ANAME" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 298:7: WS ANAME attr_svalue
        __WS299__ = match( WS, TOKENS_FOLLOWING_WS_IN_name_1664 )
        stream_WS.add( __WS299__ )
        __ANAME300__ = match( ANAME, TOKENS_FOLLOWING_ANAME_IN_name_1666 )
        stream_ANAME.add( __ANAME300__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_name_1668 )
        attr_svalue301 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue301.tree )
        # AST Rewrite
        # elements: ANAME, attr_svalue
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 298:28: -> ^( ANAME attr_svalue )
        # at line 298:31: ^( ANAME attr_svalue )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_ANAME.next_node, root_1 )

        @adaptor.add_child( root_1, stream_attr_svalue.next_tree )

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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
        # trace_out( __method__, 48 )

      end
      
      return return_value
    end

    TargetReturnValue = define_return_scope 

    # 
    # parser rule target
    # 
    # (in HtmlParser.g)
    # 300:1: target : WS TARGET attr_svalue -> ^( TARGET attr_svalue ) ;
    # 
    def target
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 49 )
      return_value = TargetReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS302__ = nil
      __TARGET303__ = nil
      attr_svalue304 = nil

      tree_for_WS302 = nil
      tree_for_TARGET303 = nil
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_TARGET = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token TARGET" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 300:9: WS TARGET attr_svalue
        __WS302__ = match( WS, TOKENS_FOLLOWING_WS_IN_target_1683 )
        stream_WS.add( __WS302__ )
        __TARGET303__ = match( TARGET, TOKENS_FOLLOWING_TARGET_IN_target_1685 )
        stream_TARGET.add( __TARGET303__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_target_1687 )
        attr_svalue304 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue304.tree )
        # AST Rewrite
        # elements: TARGET, attr_svalue
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 300:31: -> ^( TARGET attr_svalue )
        # at line 300:34: ^( TARGET attr_svalue )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_TARGET.next_node, root_1 )

        @adaptor.add_child( root_1, stream_attr_svalue.next_tree )

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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
        # trace_out( __method__, 49 )

      end
      
      return return_value
    end

    AttrSvalueReturnValue = define_return_scope 

    # 
    # parser rule attr_svalue
    # 
    # (in HtmlParser.g)
    # 303:1: attr_svalue : ( WS )? ASSIGN ( WS )? SVALUE -> ^( ASSIGN SVALUE ) ;
    # 
    def attr_svalue
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 50 )
      return_value = AttrSvalueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS305__ = nil
      __ASSIGN306__ = nil
      __WS307__ = nil
      __SVALUE308__ = nil

      tree_for_WS305 = nil
      tree_for_ASSIGN306 = nil
      tree_for_WS307 = nil
      tree_for_SVALUE308 = nil
      stream_SVALUE = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token SVALUE" )
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_ASSIGN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token ASSIGN" )

      begin
        # at line 303:14: ( WS )? ASSIGN ( WS )? SVALUE
        # at line 303:14: ( WS )?
        alt_45 = 2
        look_45_0 = @input.peek( 1 )

        if ( look_45_0 == WS )
          alt_45 = 1
        end
        case alt_45
        when 1
          # at line 303:14: WS
          __WS305__ = match( WS, TOKENS_FOLLOWING_WS_IN_attr_svalue_1705 )
          stream_WS.add( __WS305__ )

        end
        __ASSIGN306__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_attr_svalue_1708 )
        stream_ASSIGN.add( __ASSIGN306__ )
        # at line 303:25: ( WS )?
        alt_46 = 2
        look_46_0 = @input.peek( 1 )

        if ( look_46_0 == WS )
          alt_46 = 1
        end
        case alt_46
        when 1
          # at line 303:25: WS
          __WS307__ = match( WS, TOKENS_FOLLOWING_WS_IN_attr_svalue_1710 )
          stream_WS.add( __WS307__ )

        end
        __SVALUE308__ = match( SVALUE, TOKENS_FOLLOWING_SVALUE_IN_attr_svalue_1713 )
        stream_SVALUE.add( __SVALUE308__ )
        # AST Rewrite
        # elements: ASSIGN, SVALUE
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 303:36: -> ^( ASSIGN SVALUE )
        # at line 303:39: ^( ASSIGN SVALUE )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_ASSIGN.next_node, root_1 )

        @adaptor.add_child( root_1, stream_SVALUE.next_node )

        @adaptor.add_child( root_0, root_1 )



        return_value.tree = root_0
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
        # trace_out( __method__, 50 )

      end
      
      return return_value
    end



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA35 < ANTLR3::DFA
      EOT = unpack( 12, -1 )
      EOF = unpack( 12, -1 )
      MIN = unpack( 1, 9, 1, -1, 1, 35, 9, -1 )
      MAX = unpack( 1, 34, 1, -1, 1, 47, 9, -1 )
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
      
      @decision = 35
      

      def description
        <<-'__dfa_description__'.strip!
          ()* loopback of 234:22: ( id | style | klass | align | width | height | background | bgcolor | border )*
        __dfa_description__
      end
    end
    class DFA38 < ANTLR3::DFA
      EOT = unpack( 13, -1 )
      EOF = unpack( 13, -1 )
      MIN = unpack( 1, 9, 1, -1, 1, 35, 10, -1 )
      MAX = unpack( 1, 34, 1, -1, 1, 46, 10, -1 )
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
      
      @decision = 38
      

      def description
        <<-'__dfa_description__'.strip!
          ()* loopback of 246:22: ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )*
        __dfa_description__
      end
    end
    class DFA40 < ANTLR3::DFA
      EOT = unpack( 13, -1 )
      EOF = unpack( 13, -1 )
      MIN = unpack( 1, 9, 1, -1, 1, 35, 10, -1 )
      MAX = unpack( 1, 34, 1, -1, 1, 46, 10, -1 )
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
      
      @decision = 40
      

      def description
        <<-'__dfa_description__'.strip!
          ()* loopback of 251:22: ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )*
        __dfa_description__
      end
    end
    class DFA44 < ANTLR3::DFA
      EOT = unpack( 11, -1 )
      EOF = unpack( 11, -1 )
      MIN = unpack( 1, 32, 1, -1, 1, 35, 8, -1 )
      MAX = unpack( 1, 34, 1, -1, 1, 44, 8, -1 )
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
          ()* loopback of 262:22: ( id | style | klass | align | src | alt | width | height )*
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa35 = DFA35.new( self, 35 )
      @dfa38 = DFA38.new( self, 38 )
      @dfa40 = DFA40.new( self, 40 )
      @dfa44 = DFA44.new( self, 44 )

    end
    TOKENS_FOLLOWING_html_IN_document_38 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_html_52 = Set[ 8 ]
    TOKENS_FOLLOWING_HTML_IN_html_54 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_html_56 = Set[ 7, 10 ]
    TOKENS_FOLLOWING_head_IN_html_62 = Set[ 7, 10 ]
    TOKENS_FOLLOWING_body_IN_html_69 = Set[ 10 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_html_75 = Set[ 8 ]
    TOKENS_FOLLOWING_HTML_IN_html_77 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_html_79 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_head_107 = Set[ 11 ]
    TOKENS_FOLLOWING_HEAD_IN_head_109 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_head_111 = Set[ 7, 10 ]
    TOKENS_FOLLOWING_head_element_IN_head_116 = Set[ 10 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_head_122 = Set[ 11 ]
    TOKENS_FOLLOWING_HEAD_IN_head_124 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_head_126 = Set[ 1 ]
    TOKENS_FOLLOWING_title_IN_head_element_150 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_title_163 = Set[ 12 ]
    TOKENS_FOLLOWING_TITLE_IN_title_165 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_title_167 = Set[ 10, 13 ]
    TOKENS_FOLLOWING_PCDATA_IN_title_171 = Set[ 10 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_title_176 = Set[ 12 ]
    TOKENS_FOLLOWING_TITLE_IN_title_178 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_title_180 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_body_203 = Set[ 14 ]
    TOKENS_FOLLOWING_BODY_IN_body_205 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_id_IN_body_208 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_style_IN_body_210 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_klass_IN_body_212 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_bgcolor_IN_body_214 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_background_IN_body_216 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_END_TAG_IN_body_220 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_body_content_IN_body_230 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_body_238 = Set[ 14 ]
    TOKENS_FOLLOWING_BODY_IN_body_240 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_body_242 = Set[ 1 ]
    TOKENS_FOLLOWING_heading_IN_body_tag_285 = Set[ 1 ]
    TOKENS_FOLLOWING_block_IN_body_tag_291 = Set[ 1 ]
    TOKENS_FOLLOWING_body_tag_IN_body_content_302 = Set[ 1 ]
    TOKENS_FOLLOWING_text_IN_body_content_308 = Set[ 1 ]
    TOKENS_FOLLOWING_h1_IN_heading_321 = Set[ 1 ]
    TOKENS_FOLLOWING_h2_IN_heading_325 = Set[ 1 ]
    TOKENS_FOLLOWING_h3_IN_heading_329 = Set[ 1 ]
    TOKENS_FOLLOWING_h4_IN_heading_333 = Set[ 1 ]
    TOKENS_FOLLOWING_h5_IN_heading_337 = Set[ 1 ]
    TOKENS_FOLLOWING_h6_IN_heading_341 = Set[ 1 ]
    TOKENS_FOLLOWING_paragraph_IN_block_353 = Set[ 1 ]
    TOKENS_FOLLOWING_div_IN_block_358 = Set[ 1 ]
    TOKENS_FOLLOWING_table_IN_block_363 = Set[ 1 ]
    TOKENS_FOLLOWING_italic_IN_font_375 = Set[ 1 ]
    TOKENS_FOLLOWING_bold_IN_font_380 = Set[ 1 ]
    TOKENS_FOLLOWING_underline_IN_font_385 = Set[ 1 ]
    TOKENS_FOLLOWING_anchor_IN_special_397 = Set[ 1 ]
    TOKENS_FOLLOWING_img_IN_special_403 = Set[ 1 ]
    TOKENS_FOLLOWING_br_IN_special_408 = Set[ 1 ]
    TOKENS_FOLLOWING_font_IN_text_tag_420 = Set[ 1 ]
    TOKENS_FOLLOWING_special_IN_text_tag_426 = Set[ 1 ]
    TOKENS_FOLLOWING_PCDATA_IN_text_439 = Set[ 1 ]
    TOKENS_FOLLOWING_text_tag_IN_text_452 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_h1_469 = Set[ 15 ]
    TOKENS_FOLLOWING_H1_IN_h1_471 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_id_IN_h1_474 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_style_IN_h1_476 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_klass_IN_h1_478 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_align_IN_h1_480 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_END_TAG_IN_h1_484 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_heading_data_IN_h1_488 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_h1_493 = Set[ 15 ]
    TOKENS_FOLLOWING_H1_IN_h1_495 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_h1_497 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_h2_532 = Set[ 16 ]
    TOKENS_FOLLOWING_H2_IN_h2_534 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_id_IN_h2_537 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_style_IN_h2_539 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_klass_IN_h2_541 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_align_IN_h2_543 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_END_TAG_IN_h2_547 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_heading_data_IN_h2_551 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_h2_556 = Set[ 16 ]
    TOKENS_FOLLOWING_H2_IN_h2_558 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_h2_560 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_h3_571 = Set[ 17 ]
    TOKENS_FOLLOWING_H3_IN_h3_573 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_id_IN_h3_576 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_style_IN_h3_578 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_klass_IN_h3_580 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_align_IN_h3_582 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_END_TAG_IN_h3_586 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_heading_data_IN_h3_590 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_h3_595 = Set[ 17 ]
    TOKENS_FOLLOWING_H3_IN_h3_597 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_h3_599 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_h4_610 = Set[ 18 ]
    TOKENS_FOLLOWING_H4_IN_h4_612 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_id_IN_h4_615 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_style_IN_h4_617 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_klass_IN_h4_619 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_align_IN_h4_621 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_END_TAG_IN_h4_625 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_heading_data_IN_h4_629 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_h4_634 = Set[ 18 ]
    TOKENS_FOLLOWING_H4_IN_h4_636 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_h4_638 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_h5_649 = Set[ 19 ]
    TOKENS_FOLLOWING_H5_IN_h5_651 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_id_IN_h5_654 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_style_IN_h5_656 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_klass_IN_h5_658 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_align_IN_h5_660 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_END_TAG_IN_h5_664 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_heading_data_IN_h5_668 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_h5_673 = Set[ 19 ]
    TOKENS_FOLLOWING_H5_IN_h5_675 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_h5_677 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_h6_688 = Set[ 20 ]
    TOKENS_FOLLOWING_H6_IN_h6_690 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_id_IN_h6_693 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_style_IN_h6_695 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_klass_IN_h6_697 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_align_IN_h6_699 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_END_TAG_IN_h6_703 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_heading_data_IN_h6_707 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_h6_712 = Set[ 20 ]
    TOKENS_FOLLOWING_H6_IN_h6_714 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_h6_716 = Set[ 1 ]
    TOKENS_FOLLOWING_block_IN_heading_data_726 = Set[ 1 ]
    TOKENS_FOLLOWING_text_IN_heading_data_742 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_paragraph_766 = Set[ 21 ]
    TOKENS_FOLLOWING_P_IN_paragraph_768 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_id_IN_paragraph_771 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_style_IN_paragraph_773 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_klass_IN_paragraph_775 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_align_IN_paragraph_777 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_END_TAG_IN_paragraph_781 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_text_IN_paragraph_786 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_paragraph_792 = Set[ 21 ]
    TOKENS_FOLLOWING_P_IN_paragraph_794 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_paragraph_796 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_div_831 = Set[ 22 ]
    TOKENS_FOLLOWING_DIV_IN_div_833 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_id_IN_div_836 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_style_IN_div_838 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_klass_IN_div_840 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_align_IN_div_842 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_END_TAG_IN_div_846 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_body_content_IN_div_851 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_div_857 = Set[ 22 ]
    TOKENS_FOLLOWING_DIV_IN_div_859 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_div_861 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_italic_898 = Set[ 23 ]
    TOKENS_FOLLOWING_I_IN_italic_900 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_italic_902 = Set[ 7, 13 ]
    TOKENS_FOLLOWING_text_IN_italic_907 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_italic_913 = Set[ 23 ]
    TOKENS_FOLLOWING_I_IN_italic_915 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_italic_917 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_bold_946 = Set[ 24 ]
    TOKENS_FOLLOWING_B_IN_bold_948 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_bold_950 = Set[ 7, 13 ]
    TOKENS_FOLLOWING_text_IN_bold_955 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_bold_961 = Set[ 24 ]
    TOKENS_FOLLOWING_B_IN_bold_963 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_bold_965 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_underline_992 = Set[ 25 ]
    TOKENS_FOLLOWING_U_IN_underline_994 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_underline_996 = Set[ 7, 13 ]
    TOKENS_FOLLOWING_text_IN_underline_1004 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_underline_1013 = Set[ 25 ]
    TOKENS_FOLLOWING_U_IN_underline_1015 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_underline_1017 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_table_1054 = Set[ 26 ]
    TOKENS_FOLLOWING_TABLE_IN_table_1056 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_id_IN_table_1059 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_style_IN_table_1061 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_klass_IN_table_1063 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_align_IN_table_1065 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_width_IN_table_1067 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_height_IN_table_1069 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_background_IN_table_1071 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_bgcolor_IN_table_1073 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_border_IN_table_1075 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_END_TAG_IN_table_1079 = Set[ 7 ]
    TOKENS_FOLLOWING_tr_IN_table_1089 = Set[ 7, 10 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_table_1096 = Set[ 26 ]
    TOKENS_FOLLOWING_TABLE_IN_table_1098 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_table_1100 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_tr_1110 = Set[ 27 ]
    TOKENS_FOLLOWING_TR_IN_tr_1112 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_tr_1114 = Set[ 7, 10 ]
    TOKENS_FOLLOWING_th_IN_tr_1124 = Set[ 7, 10 ]
    TOKENS_FOLLOWING_td_IN_tr_1128 = Set[ 7, 10 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_tr_1135 = Set[ 27 ]
    TOKENS_FOLLOWING_TR_IN_tr_1137 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_tr_1139 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_th_1150 = Set[ 28 ]
    TOKENS_FOLLOWING_TH_IN_th_1152 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_id_IN_th_1155 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_style_IN_th_1157 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_klass_IN_th_1159 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_align_IN_th_1161 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_valign_IN_th_1163 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_width_IN_th_1165 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_height_IN_th_1167 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_background_IN_th_1169 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_bgcolor_IN_th_1171 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_bordercolor_IN_th_1173 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_END_TAG_IN_th_1177 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_body_content_IN_th_1182 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_th_1188 = Set[ 28 ]
    TOKENS_FOLLOWING_TH_IN_th_1190 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_th_1192 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_td_1203 = Set[ 29 ]
    TOKENS_FOLLOWING_TD_IN_td_1205 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_id_IN_td_1208 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_style_IN_td_1210 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_klass_IN_td_1212 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_align_IN_td_1214 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_valign_IN_td_1216 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_width_IN_td_1218 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_height_IN_td_1220 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_background_IN_td_1222 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_bgcolor_IN_td_1224 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_bordercolor_IN_td_1226 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_END_TAG_IN_td_1230 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_body_content_IN_td_1235 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_td_1241 = Set[ 29 ]
    TOKENS_FOLLOWING_TD_IN_td_1243 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_td_1245 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_anchor_1257 = Set[ 30 ]
    TOKENS_FOLLOWING_A_IN_anchor_1259 = Set[ 34 ]
    TOKENS_FOLLOWING_id_IN_anchor_1262 = Set[ 9 ]
    TOKENS_FOLLOWING_style_IN_anchor_1264 = Set[ 9 ]
    TOKENS_FOLLOWING_klass_IN_anchor_1266 = Set[ 9 ]
    TOKENS_FOLLOWING_align_IN_anchor_1268 = Set[ 9 ]
    TOKENS_FOLLOWING_href_IN_anchor_1270 = Set[ 9 ]
    TOKENS_FOLLOWING_name_IN_anchor_1272 = Set[ 9 ]
    TOKENS_FOLLOWING_target_IN_anchor_1274 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_anchor_1277 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_text_IN_anchor_1282 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_anchor_1288 = Set[ 30 ]
    TOKENS_FOLLOWING_A_IN_anchor_1290 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_anchor_1292 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_img_1303 = Set[ 31 ]
    TOKENS_FOLLOWING_IMG_IN_img_1305 = Set[ 32, 34 ]
    TOKENS_FOLLOWING_id_IN_img_1308 = Set[ 32, 34 ]
    TOKENS_FOLLOWING_style_IN_img_1310 = Set[ 32, 34 ]
    TOKENS_FOLLOWING_klass_IN_img_1312 = Set[ 32, 34 ]
    TOKENS_FOLLOWING_align_IN_img_1314 = Set[ 32, 34 ]
    TOKENS_FOLLOWING_src_IN_img_1316 = Set[ 32, 34 ]
    TOKENS_FOLLOWING_alt_IN_img_1318 = Set[ 32, 34 ]
    TOKENS_FOLLOWING_width_IN_img_1320 = Set[ 32, 34 ]
    TOKENS_FOLLOWING_height_IN_img_1322 = Set[ 32, 34 ]
    TOKENS_FOLLOWING_END_NOPAIR_TAG_IN_img_1328 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_br_1374 = Set[ 33 ]
    TOKENS_FOLLOWING_BR_IN_br_1376 = Set[ 32 ]
    TOKENS_FOLLOWING_END_NOPAIR_TAG_IN_br_1380 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_id_1402 = Set[ 35 ]
    TOKENS_FOLLOWING_ID_IN_id_1404 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_id_1406 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_style_1419 = Set[ 36 ]
    TOKENS_FOLLOWING_STYLE_IN_style_1421 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_style_1423 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_klass_1436 = Set[ 37 ]
    TOKENS_FOLLOWING_CLASS_IN_klass_1438 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_klass_1440 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_bgcolor_1455 = Set[ 38 ]
    TOKENS_FOLLOWING_BGCOLOR_IN_bgcolor_1457 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_bgcolor_1459 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_background_1474 = Set[ 39 ]
    TOKENS_FOLLOWING_BACKGROUND_IN_background_1476 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_background_1478 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_align_1493 = Set[ 40 ]
    TOKENS_FOLLOWING_ALIGN_IN_align_1495 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_align_1497 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_src_1512 = Set[ 41 ]
    TOKENS_FOLLOWING_SRC_IN_src_1514 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_src_1516 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_alt_1531 = Set[ 42 ]
    TOKENS_FOLLOWING_ALT_IN_alt_1533 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_alt_1535 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_width_1550 = Set[ 43 ]
    TOKENS_FOLLOWING_WIDTH_IN_width_1552 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_width_1554 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_height_1569 = Set[ 44 ]
    TOKENS_FOLLOWING_HEIGHT_IN_height_1571 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_height_1573 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_bordercolor_1588 = Set[ 45 ]
    TOKENS_FOLLOWING_BORDERCOLOR_IN_bordercolor_1590 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_bordercolor_1592 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_valign_1607 = Set[ 46 ]
    TOKENS_FOLLOWING_VALIGN_IN_valign_1609 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_valign_1611 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_border_1626 = Set[ 47 ]
    TOKENS_FOLLOWING_BORDER_IN_border_1628 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_border_1630 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_href_1645 = Set[ 48 ]
    TOKENS_FOLLOWING_HREF_IN_href_1647 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_href_1649 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_name_1664 = Set[ 49 ]
    TOKENS_FOLLOWING_ANAME_IN_name_1666 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_name_1668 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_target_1683 = Set[ 50 ]
    TOKENS_FOLLOWING_TARGET_IN_target_1685 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_target_1687 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_attr_svalue_1705 = Set[ 51 ]
    TOKENS_FOLLOWING_ASSIGN_IN_attr_svalue_1708 = Set[ 34, 52 ]
    TOKENS_FOLLOWING_WS_IN_attr_svalue_1710 = Set[ 52 ]
    TOKENS_FOLLOWING_SVALUE_IN_attr_svalue_1713 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

