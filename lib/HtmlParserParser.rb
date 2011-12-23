#!/usr/bin/env ruby
#
# HtmlParser.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: HtmlParser.g
# Generated at: 2011-12-23 01:49:13
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
                   :DIGIT => 56, :ALIGN => 40, :ATTR => 6, :IMG => 31, :TD => 29, 
                   :A => 30, :BR => 33, :B => 24, :TH => 28, :HEIGHT => 44, 
                   :ANAME => 49, :I => 23, :TR => 27, :SRC => 41, :U => 25, 
                   :ATTRS => 5, :P => 21, :TARGET => 50, :END_NOPAIR_TAG => 32, 
                   :TAG => 4, :NAMECHAR => 54, :BGCOLOR => 38, :CLOSING_TAG => 10, 
                   :SVALUE => 52, :WS => 34, :ASSIGN => 51, :WIDTH => 43, 
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


  class Parser < ANTLR3::Parser
    @grammar_home = HtmlParser
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :document, :html, :head, :head_element, :title, :body, 
                     :body_tag, :body_content, :heading, :block, :font, 
                     :special, :text_tag, :text, :h1, :h2, :h3, :h4, :h5, 
                     :h6, :paragraph, :div, :italic, :bold, :underline, 
                     :table, :tr, :th, :td, :anchor, :img, :br, :id, :style, 
                     :klass, :bgcolor, :background, :align, :src, :alt, 
                     :width, :height, :bordercolor, :valign, :border, :href, 
                     :name, :target, :attr_svalue ].freeze


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
      # - - - - @init action - - - -
      puts "title"

      begin
        # at line 112:4: OPENING_TAG TITLE END_TAG ( PCDATA )? CLOSING_TAG TITLE END_TAG
        __OPENING_TAG18__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_title_169 )
        stream_OPENING_TAG.add( __OPENING_TAG18__ )
        __TITLE19__ = match( TITLE, TOKENS_FOLLOWING_TITLE_IN_title_171 )
        stream_TITLE.add( __TITLE19__ )
        __END_TAG20__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_title_173 )
        stream_END_TAG.add( __END_TAG20__ )
        # at line 113:3: ( PCDATA )?
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0 == PCDATA )
          alt_4 = 1
        end
        case alt_4
        when 1
          # at line 113:3: PCDATA
          __PCDATA21__ = match( PCDATA, TOKENS_FOLLOWING_PCDATA_IN_title_177 )
          stream_PCDATA.add( __PCDATA21__ )

        end
        __CLOSING_TAG22__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_title_182 )
        stream_CLOSING_TAG.add( __CLOSING_TAG22__ )
        __TITLE23__ = match( TITLE, TOKENS_FOLLOWING_TITLE_IN_title_184 )
        stream_TITLE.add( __TITLE23__ )
        __END_TAG24__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_title_186 )
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
        # 114:29: -> ^( TAG TITLE ( PCDATA )? )
        # at line 114:32: ^( TAG TITLE ( PCDATA )? )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_TITLE.next_node )
        # at line 114:44: ( PCDATA )?
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
    # 117:1: body : OPENING_TAG BODY ( id | style | klass | bgcolor | background )* END_TAG ( body_content )* CLOSING_TAG BODY END_TAG -> ^( TAG BODY ( klass )* ) ;
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
        # at line 117:8: OPENING_TAG BODY ( id | style | klass | bgcolor | background )* END_TAG ( body_content )* CLOSING_TAG BODY END_TAG
        __OPENING_TAG25__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_body_209 )
        stream_OPENING_TAG.add( __OPENING_TAG25__ )
        __BODY26__ = match( BODY, TOKENS_FOLLOWING_BODY_IN_body_211 )
        stream_BODY.add( __BODY26__ )
        # at line 117:25: ( id | style | klass | bgcolor | background )*
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
            # at line 117:26: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_body_214 )
            id27 = id
            @state.following.pop
            stream_id.add( id27.tree )

          when 2
            # at line 117:29: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_body_216 )
            style28 = style
            @state.following.pop
            stream_style.add( style28.tree )

          when 3
            # at line 117:35: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_body_218 )
            klass29 = klass
            @state.following.pop
            stream_klass.add( klass29.tree )

          when 4
            # at line 117:41: bgcolor
            @state.following.push( TOKENS_FOLLOWING_bgcolor_IN_body_220 )
            bgcolor30 = bgcolor
            @state.following.pop
            stream_bgcolor.add( bgcolor30.tree )

          when 5
            # at line 117:49: background
            @state.following.push( TOKENS_FOLLOWING_background_IN_body_222 )
            background31 = background
            @state.following.pop
            stream_background.add( background31.tree )

          else
            break # out of loop for decision 5
          end
        end # loop for decision 5
        __END_TAG32__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_body_226 )
        stream_END_TAG.add( __END_TAG32__ )
        # at line 119:4: ( body_content )*
        while true # decision 6
          alt_6 = 2
          look_6_0 = @input.peek( 1 )

          if ( look_6_0 == OPENING_TAG || look_6_0 == PCDATA )
            alt_6 = 1

          end
          case alt_6
          when 1
            # at line 119:5: body_content
            @state.following.push( TOKENS_FOLLOWING_body_content_IN_body_236 )
            body_content33 = body_content
            @state.following.pop
            stream_body_content.add( body_content33.tree )

          else
            break # out of loop for decision 6
          end
        end # loop for decision 6
        __CLOSING_TAG34__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_body_244 )
        stream_CLOSING_TAG.add( __CLOSING_TAG34__ )
        __BODY35__ = match( BODY, TOKENS_FOLLOWING_BODY_IN_body_246 )
        stream_BODY.add( __BODY35__ )
        __END_TAG36__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_body_248 )
        stream_END_TAG.add( __END_TAG36__ )
        # AST Rewrite
        # elements: klass, BODY
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 120:29: -> ^( TAG BODY ( klass )* )
        # at line 120:32: ^( TAG BODY ( klass )* )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_BODY.next_node )
        # at line 120:43: ( klass )*
        while stream_klass.has_next?
          @adaptor.add_child( root_1, stream_klass.next_tree )

        end

        stream_klass.reset();

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
    # 127:1: body_tag : ( heading | block );
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
        # at line 128:2: ( heading | block )
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


          # at line 128:4: heading
          @state.following.push( TOKENS_FOLLOWING_heading_IN_body_tag_274 )
          heading37 = heading
          @state.following.pop
          @adaptor.add_child( root_0, heading37.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 129:4: block
          @state.following.push( TOKENS_FOLLOWING_block_IN_body_tag_280 )
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
    # 132:1: body_content : ( body_tag | text );
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
        # at line 133:2: ( body_tag | text )
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


          # at line 133:4: body_tag
          @state.following.push( TOKENS_FOLLOWING_body_tag_IN_body_content_291 )
          body_tag39 = body_tag
          @state.following.pop
          @adaptor.add_child( root_0, body_tag39.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 134:4: text
          @state.following.push( TOKENS_FOLLOWING_text_IN_body_content_297 )
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
    # 137:1: heading : ( h1 | h2 | h3 | h4 | h5 | h6 );
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
        # at line 138:2: ( h1 | h2 | h3 | h4 | h5 | h6 )
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


          # at line 138:4: h1
          @state.following.push( TOKENS_FOLLOWING_h1_IN_heading_310 )
          h141 = h1
          @state.following.pop
          @adaptor.add_child( root_0, h141.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 138:9: h2
          @state.following.push( TOKENS_FOLLOWING_h2_IN_heading_314 )
          h242 = h2
          @state.following.pop
          @adaptor.add_child( root_0, h242.tree )

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 138:14: h3
          @state.following.push( TOKENS_FOLLOWING_h3_IN_heading_318 )
          h343 = h3
          @state.following.pop
          @adaptor.add_child( root_0, h343.tree )

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 138:19: h4
          @state.following.push( TOKENS_FOLLOWING_h4_IN_heading_322 )
          h444 = h4
          @state.following.pop
          @adaptor.add_child( root_0, h444.tree )

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 138:24: h5
          @state.following.push( TOKENS_FOLLOWING_h5_IN_heading_326 )
          h545 = h5
          @state.following.pop
          @adaptor.add_child( root_0, h545.tree )

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 138:29: h6
          @state.following.push( TOKENS_FOLLOWING_h6_IN_heading_330 )
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
    # 141:1: block : ( paragraph | div | table );
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
        # at line 142:2: ( paragraph | div | table )
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


          # at line 142:4: paragraph
          @state.following.push( TOKENS_FOLLOWING_paragraph_IN_block_342 )
          paragraph47 = paragraph
          @state.following.pop
          @adaptor.add_child( root_0, paragraph47.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 143:4: div
          @state.following.push( TOKENS_FOLLOWING_div_IN_block_347 )
          div48 = div
          @state.following.pop
          @adaptor.add_child( root_0, div48.tree )

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 144:4: table
          @state.following.push( TOKENS_FOLLOWING_table_IN_block_352 )
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
    # 147:1: font : ( italic | bold | underline );
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
        # at line 148:2: ( italic | bold | underline )
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


          # at line 148:4: italic
          @state.following.push( TOKENS_FOLLOWING_italic_IN_font_364 )
          italic50 = italic
          @state.following.pop
          @adaptor.add_child( root_0, italic50.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 149:4: bold
          @state.following.push( TOKENS_FOLLOWING_bold_IN_font_369 )
          bold51 = bold
          @state.following.pop
          @adaptor.add_child( root_0, bold51.tree )

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 150:4: underline
          @state.following.push( TOKENS_FOLLOWING_underline_IN_font_374 )
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
    # 153:1: special : ( anchor | img | br );
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
        # at line 154:2: ( anchor | img | br )
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


          # at line 154:4: anchor
          @state.following.push( TOKENS_FOLLOWING_anchor_IN_special_386 )
          anchor53 = anchor
          @state.following.pop
          @adaptor.add_child( root_0, anchor53.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 155:4: img
          @state.following.push( TOKENS_FOLLOWING_img_IN_special_392 )
          img54 = img
          @state.following.pop
          @adaptor.add_child( root_0, img54.tree )

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 156:4: br
          @state.following.push( TOKENS_FOLLOWING_br_IN_special_397 )
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
    # 159:1: text_tag : ( font | special );
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
        # at line 160:2: ( font | special )
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


          # at line 160:4: font
          @state.following.push( TOKENS_FOLLOWING_font_IN_text_tag_409 )
          font56 = font
          @state.following.pop
          @adaptor.add_child( root_0, font56.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 161:4: special
          @state.following.push( TOKENS_FOLLOWING_special_IN_text_tag_415 )
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
    # 164:1: text : ( PCDATA | text_tag );
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

      begin
        # at line 165:3: ( PCDATA | text_tag )
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


          # at line 165:5: PCDATA
          __PCDATA58__ = match( PCDATA, TOKENS_FOLLOWING_PCDATA_IN_text_428 )

          tree_for_PCDATA58 = @adaptor.create_with_payload( __PCDATA58__ )
          @adaptor.add_child( root_0, tree_for_PCDATA58 )


        when 2
          root_0 = @adaptor.create_flat_list


          # at line 166:4: text_tag
          @state.following.push( TOKENS_FOLLOWING_text_tag_IN_text_434 )
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
    # 172:1: h1 : OPENING_TAG H1 ( id | style | klass | align )* END_TAG ( block | text )* CLOSING_TAG H1 END_TAG ;
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
      __CLOSING_TAG69__ = nil
      __H170__ = nil
      __END_TAG71__ = nil
      id62 = nil
      style63 = nil
      klass64 = nil
      align65 = nil
      block67 = nil
      text68 = nil

      tree_for_OPENING_TAG60 = nil
      tree_for_H161 = nil
      tree_for_END_TAG66 = nil
      tree_for_CLOSING_TAG69 = nil
      tree_for_H170 = nil
      tree_for_END_TAG71 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 172:6: OPENING_TAG H1 ( id | style | klass | align )* END_TAG ( block | text )* CLOSING_TAG H1 END_TAG
        __OPENING_TAG60__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_h1_451 )

        tree_for_OPENING_TAG60 = @adaptor.create_with_payload( __OPENING_TAG60__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG60 )

        __H161__ = match( H1, TOKENS_FOLLOWING_H1_IN_h1_453 )

        tree_for_H161 = @adaptor.create_with_payload( __H161__ )
        @adaptor.add_child( root_0, tree_for_H161 )

        # at line 172:21: ( id | style | klass | align )*
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
            # at line 172:22: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_h1_456 )
            id62 = id
            @state.following.pop
            @adaptor.add_child( root_0, id62.tree )

          when 2
            # at line 172:25: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_h1_458 )
            style63 = style
            @state.following.pop
            @adaptor.add_child( root_0, style63.tree )

          when 3
            # at line 172:31: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_h1_460 )
            klass64 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass64.tree )

          when 4
            # at line 172:37: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_h1_462 )
            align65 = align
            @state.following.pop
            @adaptor.add_child( root_0, align65.tree )

          else
            break # out of loop for decision 15
          end
        end # loop for decision 15
        __END_TAG66__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h1_466 )

        tree_for_END_TAG66 = @adaptor.create_with_payload( __END_TAG66__ )
        @adaptor.add_child( root_0, tree_for_END_TAG66 )

        # at line 173:3: ( block | text )*
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
            # at line 173:4: block
            @state.following.push( TOKENS_FOLLOWING_block_IN_h1_471 )
            block67 = block
            @state.following.pop
            @adaptor.add_child( root_0, block67.tree )

          when 2
            # at line 173:12: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_h1_475 )
            text68 = text
            @state.following.pop
            @adaptor.add_child( root_0, text68.tree )

          else
            break # out of loop for decision 16
          end
        end # loop for decision 16
        __CLOSING_TAG69__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_h1_481 )

        tree_for_CLOSING_TAG69 = @adaptor.create_with_payload( __CLOSING_TAG69__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG69 )

        __H170__ = match( H1, TOKENS_FOLLOWING_H1_IN_h1_483 )

        tree_for_H170 = @adaptor.create_with_payload( __H170__ )
        @adaptor.add_child( root_0, tree_for_H170 )

        __END_TAG71__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h1_485 )

        tree_for_END_TAG71 = @adaptor.create_with_payload( __END_TAG71__ )
        @adaptor.add_child( root_0, tree_for_END_TAG71 )

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
    # 177:1: h2 : OPENING_TAG H2 ( id | style | klass | align )* END_TAG ( block | text )* CLOSING_TAG H2 END_TAG ;
    # 
    def h2
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
      return_value = H2ReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG72__ = nil
      __H273__ = nil
      __END_TAG78__ = nil
      __CLOSING_TAG81__ = nil
      __H282__ = nil
      __END_TAG83__ = nil
      id74 = nil
      style75 = nil
      klass76 = nil
      align77 = nil
      block79 = nil
      text80 = nil

      tree_for_OPENING_TAG72 = nil
      tree_for_H273 = nil
      tree_for_END_TAG78 = nil
      tree_for_CLOSING_TAG81 = nil
      tree_for_H282 = nil
      tree_for_END_TAG83 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 177:6: OPENING_TAG H2 ( id | style | klass | align )* END_TAG ( block | text )* CLOSING_TAG H2 END_TAG
        __OPENING_TAG72__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_h2_496 )

        tree_for_OPENING_TAG72 = @adaptor.create_with_payload( __OPENING_TAG72__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG72 )

        __H273__ = match( H2, TOKENS_FOLLOWING_H2_IN_h2_498 )

        tree_for_H273 = @adaptor.create_with_payload( __H273__ )
        @adaptor.add_child( root_0, tree_for_H273 )

        # at line 177:21: ( id | style | klass | align )*
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
            # at line 177:22: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_h2_501 )
            id74 = id
            @state.following.pop
            @adaptor.add_child( root_0, id74.tree )

          when 2
            # at line 177:25: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_h2_503 )
            style75 = style
            @state.following.pop
            @adaptor.add_child( root_0, style75.tree )

          when 3
            # at line 177:31: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_h2_505 )
            klass76 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass76.tree )

          when 4
            # at line 177:37: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_h2_507 )
            align77 = align
            @state.following.pop
            @adaptor.add_child( root_0, align77.tree )

          else
            break # out of loop for decision 17
          end
        end # loop for decision 17
        __END_TAG78__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h2_511 )

        tree_for_END_TAG78 = @adaptor.create_with_payload( __END_TAG78__ )
        @adaptor.add_child( root_0, tree_for_END_TAG78 )

        # at line 178:3: ( block | text )*
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
            # at line 178:4: block
            @state.following.push( TOKENS_FOLLOWING_block_IN_h2_516 )
            block79 = block
            @state.following.pop
            @adaptor.add_child( root_0, block79.tree )

          when 2
            # at line 178:12: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_h2_520 )
            text80 = text
            @state.following.pop
            @adaptor.add_child( root_0, text80.tree )

          else
            break # out of loop for decision 18
          end
        end # loop for decision 18
        __CLOSING_TAG81__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_h2_526 )

        tree_for_CLOSING_TAG81 = @adaptor.create_with_payload( __CLOSING_TAG81__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG81 )

        __H282__ = match( H2, TOKENS_FOLLOWING_H2_IN_h2_528 )

        tree_for_H282 = @adaptor.create_with_payload( __H282__ )
        @adaptor.add_child( root_0, tree_for_H282 )

        __END_TAG83__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h2_530 )

        tree_for_END_TAG83 = @adaptor.create_with_payload( __END_TAG83__ )
        @adaptor.add_child( root_0, tree_for_END_TAG83 )

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
    # 182:1: h3 : OPENING_TAG H3 ( id | style | klass | align )* END_TAG ( block | text )* CLOSING_TAG H3 END_TAG ;
    # 
    def h3
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = H3ReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG84__ = nil
      __H385__ = nil
      __END_TAG90__ = nil
      __CLOSING_TAG93__ = nil
      __H394__ = nil
      __END_TAG95__ = nil
      id86 = nil
      style87 = nil
      klass88 = nil
      align89 = nil
      block91 = nil
      text92 = nil

      tree_for_OPENING_TAG84 = nil
      tree_for_H385 = nil
      tree_for_END_TAG90 = nil
      tree_for_CLOSING_TAG93 = nil
      tree_for_H394 = nil
      tree_for_END_TAG95 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 182:6: OPENING_TAG H3 ( id | style | klass | align )* END_TAG ( block | text )* CLOSING_TAG H3 END_TAG
        __OPENING_TAG84__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_h3_541 )

        tree_for_OPENING_TAG84 = @adaptor.create_with_payload( __OPENING_TAG84__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG84 )

        __H385__ = match( H3, TOKENS_FOLLOWING_H3_IN_h3_543 )

        tree_for_H385 = @adaptor.create_with_payload( __H385__ )
        @adaptor.add_child( root_0, tree_for_H385 )

        # at line 182:21: ( id | style | klass | align )*
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
            # at line 182:22: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_h3_546 )
            id86 = id
            @state.following.pop
            @adaptor.add_child( root_0, id86.tree )

          when 2
            # at line 182:25: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_h3_548 )
            style87 = style
            @state.following.pop
            @adaptor.add_child( root_0, style87.tree )

          when 3
            # at line 182:31: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_h3_550 )
            klass88 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass88.tree )

          when 4
            # at line 182:37: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_h3_552 )
            align89 = align
            @state.following.pop
            @adaptor.add_child( root_0, align89.tree )

          else
            break # out of loop for decision 19
          end
        end # loop for decision 19
        __END_TAG90__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h3_556 )

        tree_for_END_TAG90 = @adaptor.create_with_payload( __END_TAG90__ )
        @adaptor.add_child( root_0, tree_for_END_TAG90 )

        # at line 183:3: ( block | text )*
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
            # at line 183:4: block
            @state.following.push( TOKENS_FOLLOWING_block_IN_h3_561 )
            block91 = block
            @state.following.pop
            @adaptor.add_child( root_0, block91.tree )

          when 2
            # at line 183:12: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_h3_565 )
            text92 = text
            @state.following.pop
            @adaptor.add_child( root_0, text92.tree )

          else
            break # out of loop for decision 20
          end
        end # loop for decision 20
        __CLOSING_TAG93__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_h3_571 )

        tree_for_CLOSING_TAG93 = @adaptor.create_with_payload( __CLOSING_TAG93__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG93 )

        __H394__ = match( H3, TOKENS_FOLLOWING_H3_IN_h3_573 )

        tree_for_H394 = @adaptor.create_with_payload( __H394__ )
        @adaptor.add_child( root_0, tree_for_H394 )

        __END_TAG95__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h3_575 )

        tree_for_END_TAG95 = @adaptor.create_with_payload( __END_TAG95__ )
        @adaptor.add_child( root_0, tree_for_END_TAG95 )

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
    # 187:1: h4 : OPENING_TAG H4 ( id | style | klass | align )* END_TAG ( block | text )* CLOSING_TAG H4 END_TAG ;
    # 
    def h4
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = H4ReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG96__ = nil
      __H497__ = nil
      __END_TAG102__ = nil
      __CLOSING_TAG105__ = nil
      __H4106__ = nil
      __END_TAG107__ = nil
      id98 = nil
      style99 = nil
      klass100 = nil
      align101 = nil
      block103 = nil
      text104 = nil

      tree_for_OPENING_TAG96 = nil
      tree_for_H497 = nil
      tree_for_END_TAG102 = nil
      tree_for_CLOSING_TAG105 = nil
      tree_for_H4106 = nil
      tree_for_END_TAG107 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 187:6: OPENING_TAG H4 ( id | style | klass | align )* END_TAG ( block | text )* CLOSING_TAG H4 END_TAG
        __OPENING_TAG96__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_h4_586 )

        tree_for_OPENING_TAG96 = @adaptor.create_with_payload( __OPENING_TAG96__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG96 )

        __H497__ = match( H4, TOKENS_FOLLOWING_H4_IN_h4_588 )

        tree_for_H497 = @adaptor.create_with_payload( __H497__ )
        @adaptor.add_child( root_0, tree_for_H497 )

        # at line 187:21: ( id | style | klass | align )*
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
            # at line 187:22: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_h4_591 )
            id98 = id
            @state.following.pop
            @adaptor.add_child( root_0, id98.tree )

          when 2
            # at line 187:25: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_h4_593 )
            style99 = style
            @state.following.pop
            @adaptor.add_child( root_0, style99.tree )

          when 3
            # at line 187:31: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_h4_595 )
            klass100 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass100.tree )

          when 4
            # at line 187:37: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_h4_597 )
            align101 = align
            @state.following.pop
            @adaptor.add_child( root_0, align101.tree )

          else
            break # out of loop for decision 21
          end
        end # loop for decision 21
        __END_TAG102__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h4_601 )

        tree_for_END_TAG102 = @adaptor.create_with_payload( __END_TAG102__ )
        @adaptor.add_child( root_0, tree_for_END_TAG102 )

        # at line 188:3: ( block | text )*
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
            # at line 188:4: block
            @state.following.push( TOKENS_FOLLOWING_block_IN_h4_606 )
            block103 = block
            @state.following.pop
            @adaptor.add_child( root_0, block103.tree )

          when 2
            # at line 188:12: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_h4_610 )
            text104 = text
            @state.following.pop
            @adaptor.add_child( root_0, text104.tree )

          else
            break # out of loop for decision 22
          end
        end # loop for decision 22
        __CLOSING_TAG105__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_h4_616 )

        tree_for_CLOSING_TAG105 = @adaptor.create_with_payload( __CLOSING_TAG105__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG105 )

        __H4106__ = match( H4, TOKENS_FOLLOWING_H4_IN_h4_618 )

        tree_for_H4106 = @adaptor.create_with_payload( __H4106__ )
        @adaptor.add_child( root_0, tree_for_H4106 )

        __END_TAG107__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h4_620 )

        tree_for_END_TAG107 = @adaptor.create_with_payload( __END_TAG107__ )
        @adaptor.add_child( root_0, tree_for_END_TAG107 )

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
    # 192:1: h5 : OPENING_TAG H5 ( id | style | klass | align )* END_TAG ( block | text )* CLOSING_TAG H5 END_TAG ;
    # 
    def h5
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = H5ReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG108__ = nil
      __H5109__ = nil
      __END_TAG114__ = nil
      __CLOSING_TAG117__ = nil
      __H5118__ = nil
      __END_TAG119__ = nil
      id110 = nil
      style111 = nil
      klass112 = nil
      align113 = nil
      block115 = nil
      text116 = nil

      tree_for_OPENING_TAG108 = nil
      tree_for_H5109 = nil
      tree_for_END_TAG114 = nil
      tree_for_CLOSING_TAG117 = nil
      tree_for_H5118 = nil
      tree_for_END_TAG119 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 192:6: OPENING_TAG H5 ( id | style | klass | align )* END_TAG ( block | text )* CLOSING_TAG H5 END_TAG
        __OPENING_TAG108__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_h5_631 )

        tree_for_OPENING_TAG108 = @adaptor.create_with_payload( __OPENING_TAG108__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG108 )

        __H5109__ = match( H5, TOKENS_FOLLOWING_H5_IN_h5_633 )

        tree_for_H5109 = @adaptor.create_with_payload( __H5109__ )
        @adaptor.add_child( root_0, tree_for_H5109 )

        # at line 192:21: ( id | style | klass | align )*
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
            # at line 192:22: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_h5_636 )
            id110 = id
            @state.following.pop
            @adaptor.add_child( root_0, id110.tree )

          when 2
            # at line 192:25: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_h5_638 )
            style111 = style
            @state.following.pop
            @adaptor.add_child( root_0, style111.tree )

          when 3
            # at line 192:31: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_h5_640 )
            klass112 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass112.tree )

          when 4
            # at line 192:37: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_h5_642 )
            align113 = align
            @state.following.pop
            @adaptor.add_child( root_0, align113.tree )

          else
            break # out of loop for decision 23
          end
        end # loop for decision 23
        __END_TAG114__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h5_646 )

        tree_for_END_TAG114 = @adaptor.create_with_payload( __END_TAG114__ )
        @adaptor.add_child( root_0, tree_for_END_TAG114 )

        # at line 193:3: ( block | text )*
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
            # at line 193:4: block
            @state.following.push( TOKENS_FOLLOWING_block_IN_h5_651 )
            block115 = block
            @state.following.pop
            @adaptor.add_child( root_0, block115.tree )

          when 2
            # at line 193:12: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_h5_655 )
            text116 = text
            @state.following.pop
            @adaptor.add_child( root_0, text116.tree )

          else
            break # out of loop for decision 24
          end
        end # loop for decision 24
        __CLOSING_TAG117__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_h5_661 )

        tree_for_CLOSING_TAG117 = @adaptor.create_with_payload( __CLOSING_TAG117__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG117 )

        __H5118__ = match( H5, TOKENS_FOLLOWING_H5_IN_h5_663 )

        tree_for_H5118 = @adaptor.create_with_payload( __H5118__ )
        @adaptor.add_child( root_0, tree_for_H5118 )

        __END_TAG119__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h5_665 )

        tree_for_END_TAG119 = @adaptor.create_with_payload( __END_TAG119__ )
        @adaptor.add_child( root_0, tree_for_END_TAG119 )

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
    # 197:1: h6 : OPENING_TAG H6 ( id | style | klass | align )* END_TAG ( block | text )* CLOSING_TAG H6 END_TAG ;
    # 
    def h6
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = H6ReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG120__ = nil
      __H6121__ = nil
      __END_TAG126__ = nil
      __CLOSING_TAG129__ = nil
      __H6130__ = nil
      __END_TAG131__ = nil
      id122 = nil
      style123 = nil
      klass124 = nil
      align125 = nil
      block127 = nil
      text128 = nil

      tree_for_OPENING_TAG120 = nil
      tree_for_H6121 = nil
      tree_for_END_TAG126 = nil
      tree_for_CLOSING_TAG129 = nil
      tree_for_H6130 = nil
      tree_for_END_TAG131 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 197:6: OPENING_TAG H6 ( id | style | klass | align )* END_TAG ( block | text )* CLOSING_TAG H6 END_TAG
        __OPENING_TAG120__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_h6_676 )

        tree_for_OPENING_TAG120 = @adaptor.create_with_payload( __OPENING_TAG120__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG120 )

        __H6121__ = match( H6, TOKENS_FOLLOWING_H6_IN_h6_678 )

        tree_for_H6121 = @adaptor.create_with_payload( __H6121__ )
        @adaptor.add_child( root_0, tree_for_H6121 )

        # at line 197:21: ( id | style | klass | align )*
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
            # at line 197:22: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_h6_681 )
            id122 = id
            @state.following.pop
            @adaptor.add_child( root_0, id122.tree )

          when 2
            # at line 197:25: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_h6_683 )
            style123 = style
            @state.following.pop
            @adaptor.add_child( root_0, style123.tree )

          when 3
            # at line 197:31: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_h6_685 )
            klass124 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass124.tree )

          when 4
            # at line 197:37: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_h6_687 )
            align125 = align
            @state.following.pop
            @adaptor.add_child( root_0, align125.tree )

          else
            break # out of loop for decision 25
          end
        end # loop for decision 25
        __END_TAG126__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h6_691 )

        tree_for_END_TAG126 = @adaptor.create_with_payload( __END_TAG126__ )
        @adaptor.add_child( root_0, tree_for_END_TAG126 )

        # at line 198:3: ( block | text )*
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
            # at line 198:4: block
            @state.following.push( TOKENS_FOLLOWING_block_IN_h6_696 )
            block127 = block
            @state.following.pop
            @adaptor.add_child( root_0, block127.tree )

          when 2
            # at line 198:12: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_h6_700 )
            text128 = text
            @state.following.pop
            @adaptor.add_child( root_0, text128.tree )

          else
            break # out of loop for decision 26
          end
        end # loop for decision 26
        __CLOSING_TAG129__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_h6_706 )

        tree_for_CLOSING_TAG129 = @adaptor.create_with_payload( __CLOSING_TAG129__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG129 )

        __H6130__ = match( H6, TOKENS_FOLLOWING_H6_IN_h6_708 )

        tree_for_H6130 = @adaptor.create_with_payload( __H6130__ )
        @adaptor.add_child( root_0, tree_for_H6130 )

        __END_TAG131__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h6_710 )

        tree_for_END_TAG131 = @adaptor.create_with_payload( __END_TAG131__ )
        @adaptor.add_child( root_0, tree_for_END_TAG131 )

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

    ParagraphReturnValue = define_return_scope 

    # 
    # parser rule paragraph
    # 
    # (in HtmlParser.g)
    # 203:1: paragraph : OPENING_TAG oparagraph= P ( id | style | klass | align )* END_TAG ( text )* CLOSING_TAG P END_TAG ;
    # 
    def paragraph
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = ParagraphReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      oparagraph = nil
      __OPENING_TAG132__ = nil
      __END_TAG137__ = nil
      __CLOSING_TAG139__ = nil
      __P140__ = nil
      __END_TAG141__ = nil
      id133 = nil
      style134 = nil
      klass135 = nil
      align136 = nil
      text138 = nil

      tree_for_oparagraph = nil
      tree_for_OPENING_TAG132 = nil
      tree_for_END_TAG137 = nil
      tree_for_CLOSING_TAG139 = nil
      tree_for_P140 = nil
      tree_for_END_TAG141 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 204:4: OPENING_TAG oparagraph= P ( id | style | klass | align )* END_TAG ( text )* CLOSING_TAG P END_TAG
        __OPENING_TAG132__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_paragraph_723 )

        tree_for_OPENING_TAG132 = @adaptor.create_with_payload( __OPENING_TAG132__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG132 )

        oparagraph = match( P, TOKENS_FOLLOWING_P_IN_paragraph_727 )

        tree_for_oparagraph = @adaptor.create_with_payload( oparagraph )
        @adaptor.add_child( root_0, tree_for_oparagraph )

        # at line 204:29: ( id | style | klass | align )*
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
            # at line 204:30: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_paragraph_730 )
            id133 = id
            @state.following.pop
            @adaptor.add_child( root_0, id133.tree )

          when 2
            # at line 204:33: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_paragraph_732 )
            style134 = style
            @state.following.pop
            @adaptor.add_child( root_0, style134.tree )

          when 3
            # at line 204:39: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_paragraph_734 )
            klass135 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass135.tree )

          when 4
            # at line 204:45: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_paragraph_736 )
            align136 = align
            @state.following.pop
            @adaptor.add_child( root_0, align136.tree )

          else
            break # out of loop for decision 27
          end
        end # loop for decision 27
        __END_TAG137__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_paragraph_740 )

        tree_for_END_TAG137 = @adaptor.create_with_payload( __END_TAG137__ )
        @adaptor.add_child( root_0, tree_for_END_TAG137 )

        # at line 205:3: ( text )*
        while true # decision 28
          alt_28 = 2
          look_28_0 = @input.peek( 1 )

          if ( look_28_0 == OPENING_TAG || look_28_0 == PCDATA )
            alt_28 = 1

          end
          case alt_28
          when 1
            # at line 205:4: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_paragraph_745 )
            text138 = text
            @state.following.pop
            @adaptor.add_child( root_0, text138.tree )

          else
            break # out of loop for decision 28
          end
        end # loop for decision 28
        __CLOSING_TAG139__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_paragraph_751 )

        tree_for_CLOSING_TAG139 = @adaptor.create_with_payload( __CLOSING_TAG139__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG139 )

        __P140__ = match( P, TOKENS_FOLLOWING_P_IN_paragraph_753 )

        tree_for_P140 = @adaptor.create_with_payload( __P140__ )
        @adaptor.add_child( root_0, tree_for_P140 )

        __END_TAG141__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_paragraph_755 )

        tree_for_END_TAG141 = @adaptor.create_with_payload( __END_TAG141__ )
        @adaptor.add_child( root_0, tree_for_END_TAG141 )

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

    DivReturnValue = define_return_scope 

    # 
    # parser rule div
    # 
    # (in HtmlParser.g)
    # 209:1: div : OPENING_TAG odiv= DIV ( id | style | klass | align )* END_TAG ( body_content )* CLOSING_TAG DIV END_TAG ;
    # 
    def div
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = DivReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      odiv = nil
      __OPENING_TAG142__ = nil
      __END_TAG147__ = nil
      __CLOSING_TAG149__ = nil
      __DIV150__ = nil
      __END_TAG151__ = nil
      id143 = nil
      style144 = nil
      klass145 = nil
      align146 = nil
      body_content148 = nil

      tree_for_odiv = nil
      tree_for_OPENING_TAG142 = nil
      tree_for_END_TAG147 = nil
      tree_for_CLOSING_TAG149 = nil
      tree_for_DIV150 = nil
      tree_for_END_TAG151 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 209:7: OPENING_TAG odiv= DIV ( id | style | klass | align )* END_TAG ( body_content )* CLOSING_TAG DIV END_TAG
        __OPENING_TAG142__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_div_765 )

        tree_for_OPENING_TAG142 = @adaptor.create_with_payload( __OPENING_TAG142__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG142 )

        odiv = match( DIV, TOKENS_FOLLOWING_DIV_IN_div_769 )

        tree_for_odiv = @adaptor.create_with_payload( odiv )
        @adaptor.add_child( root_0, tree_for_odiv )

        # at line 209:28: ( id | style | klass | align )*
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
            # at line 209:29: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_div_772 )
            id143 = id
            @state.following.pop
            @adaptor.add_child( root_0, id143.tree )

          when 2
            # at line 209:32: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_div_774 )
            style144 = style
            @state.following.pop
            @adaptor.add_child( root_0, style144.tree )

          when 3
            # at line 209:38: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_div_776 )
            klass145 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass145.tree )

          when 4
            # at line 209:44: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_div_778 )
            align146 = align
            @state.following.pop
            @adaptor.add_child( root_0, align146.tree )

          else
            break # out of loop for decision 29
          end
        end # loop for decision 29
        __END_TAG147__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_div_782 )

        tree_for_END_TAG147 = @adaptor.create_with_payload( __END_TAG147__ )
        @adaptor.add_child( root_0, tree_for_END_TAG147 )

        # at line 210:3: ( body_content )*
        while true # decision 30
          alt_30 = 2
          look_30_0 = @input.peek( 1 )

          if ( look_30_0 == OPENING_TAG || look_30_0 == PCDATA )
            alt_30 = 1

          end
          case alt_30
          when 1
            # at line 210:4: body_content
            @state.following.push( TOKENS_FOLLOWING_body_content_IN_div_787 )
            body_content148 = body_content
            @state.following.pop
            @adaptor.add_child( root_0, body_content148.tree )

          else
            break # out of loop for decision 30
          end
        end # loop for decision 30
        __CLOSING_TAG149__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_div_793 )

        tree_for_CLOSING_TAG149 = @adaptor.create_with_payload( __CLOSING_TAG149__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG149 )

        __DIV150__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_div_795 )

        tree_for_DIV150 = @adaptor.create_with_payload( __DIV150__ )
        @adaptor.add_child( root_0, tree_for_DIV150 )

        __END_TAG151__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_div_797 )

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
        # trace_out( __method__, 22 )

      end
      
      return return_value
    end

    ItalicReturnValue = define_return_scope 

    # 
    # parser rule italic
    # 
    # (in HtmlParser.g)
    # 215:1: italic : OPENING_TAG I END_TAG ( text )+ CLOSING_TAG I END_TAG -> ^( TAG I ( text )+ ) ;
    # 
    def italic
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
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
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_I = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token I" )
      stream_text = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule text" )
      begin
        # at line 215:9: OPENING_TAG I END_TAG ( text )+ CLOSING_TAG I END_TAG
        __OPENING_TAG152__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_italic_809 )
        stream_OPENING_TAG.add( __OPENING_TAG152__ )
        __I153__ = match( I, TOKENS_FOLLOWING_I_IN_italic_811 )
        stream_I.add( __I153__ )
        __END_TAG154__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_italic_813 )
        stream_END_TAG.add( __END_TAG154__ )
        # at file 216:3: ( text )+
        match_count_31 = 0
        while true
          alt_31 = 2
          look_31_0 = @input.peek( 1 )

          if ( look_31_0 == OPENING_TAG || look_31_0 == PCDATA )
            alt_31 = 1

          end
          case alt_31
          when 1
            # at line 216:4: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_italic_818 )
            text155 = text
            @state.following.pop
            stream_text.add( text155.tree )

          else
            match_count_31 > 0 and break
            eee = EarlyExit(31)


            raise eee
          end
          match_count_31 += 1
        end

        __CLOSING_TAG156__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_italic_824 )
        stream_CLOSING_TAG.add( __CLOSING_TAG156__ )
        __I157__ = match( I, TOKENS_FOLLOWING_I_IN_italic_826 )
        stream_I.add( __I157__ )
        __END_TAG158__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_italic_828 )
        stream_END_TAG.add( __END_TAG158__ )
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
        # 217:25: -> ^( TAG I ( text )+ )
        # at line 217:28: ^( TAG I ( text )+ )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_I.next_node )
        # at line 217:36: ( text )+
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
        # trace_out( __method__, 23 )

      end
      
      return return_value
    end

    BoldReturnValue = define_return_scope 

    # 
    # parser rule bold
    # 
    # (in HtmlParser.g)
    # 220:1: bold : OPENING_TAG B END_TAG ( text )+ CLOSING_TAG B END_TAG -> ^( TAG B ( text )+ ) ;
    # 
    def bold
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
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
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_B = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token B" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_text = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule text" )
      begin
        # at line 220:9: OPENING_TAG B END_TAG ( text )+ CLOSING_TAG B END_TAG
        __OPENING_TAG159__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_bold_857 )
        stream_OPENING_TAG.add( __OPENING_TAG159__ )
        __B160__ = match( B, TOKENS_FOLLOWING_B_IN_bold_859 )
        stream_B.add( __B160__ )
        __END_TAG161__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_bold_861 )
        stream_END_TAG.add( __END_TAG161__ )
        # at file 221:3: ( text )+
        match_count_32 = 0
        while true
          alt_32 = 2
          look_32_0 = @input.peek( 1 )

          if ( look_32_0 == OPENING_TAG || look_32_0 == PCDATA )
            alt_32 = 1

          end
          case alt_32
          when 1
            # at line 221:4: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_bold_866 )
            text162 = text
            @state.following.pop
            stream_text.add( text162.tree )

          else
            match_count_32 > 0 and break
            eee = EarlyExit(32)


            raise eee
          end
          match_count_32 += 1
        end

        __CLOSING_TAG163__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_bold_872 )
        stream_CLOSING_TAG.add( __CLOSING_TAG163__ )
        __B164__ = match( B, TOKENS_FOLLOWING_B_IN_bold_874 )
        stream_B.add( __B164__ )
        __END_TAG165__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_bold_876 )
        stream_END_TAG.add( __END_TAG165__ )
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
        # 222:25: -> ^( TAG B ( text )+ )
        # at line 222:28: ^( TAG B ( text )+ )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_B.next_node )
        # at line 222:36: ( text )+
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

    UnderlineReturnValue = define_return_scope 

    # 
    # parser rule underline
    # 
    # (in HtmlParser.g)
    # 225:1: underline : OPENING_TAG U END_TAG ( text )+ CLOSING_TAG U END_TAG -> ^( TAG U ( text )+ ) ;
    # 
    def underline
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
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
      stream_U = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token U" )
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_text = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule text" )
      begin
        # at line 225:12: OPENING_TAG U END_TAG ( text )+ CLOSING_TAG U END_TAG
        __OPENING_TAG166__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_underline_903 )
        stream_OPENING_TAG.add( __OPENING_TAG166__ )
        __U167__ = match( U, TOKENS_FOLLOWING_U_IN_underline_905 )
        stream_U.add( __U167__ )
        __END_TAG168__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_underline_907 )
        stream_END_TAG.add( __END_TAG168__ )
        # at file 226:6: ( text )+
        match_count_33 = 0
        while true
          alt_33 = 2
          look_33_0 = @input.peek( 1 )

          if ( look_33_0 == OPENING_TAG || look_33_0 == PCDATA )
            alt_33 = 1

          end
          case alt_33
          when 1
            # at line 226:7: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_underline_915 )
            text169 = text
            @state.following.pop
            stream_text.add( text169.tree )

          else
            match_count_33 > 0 and break
            eee = EarlyExit(33)


            raise eee
          end
          match_count_33 += 1
        end

        __CLOSING_TAG170__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_underline_924 )
        stream_CLOSING_TAG.add( __CLOSING_TAG170__ )
        __U171__ = match( U, TOKENS_FOLLOWING_U_IN_underline_926 )
        stream_U.add( __U171__ )
        __END_TAG172__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_underline_928 )
        stream_END_TAG.add( __END_TAG172__ )
        # AST Rewrite
        # elements: text, U
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 227:28: -> ^( TAG U ( text )+ )
        # at line 227:31: ^( TAG U ( text )+ )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_U.next_node )
        # at line 227:39: ( text )+
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

    TableReturnValue = define_return_scope 

    # 
    # parser rule table
    # 
    # (in HtmlParser.g)
    # 231:1: table : OPENING_TAG TABLE ( id | style | klass | align | width | height | background | bgcolor | border )* END_TAG ( tr )+ CLOSING_TAG TABLE END_TAG ;
    # 
    def table
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = TableReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG173__ = nil
      __TABLE174__ = nil
      __END_TAG184__ = nil
      __CLOSING_TAG186__ = nil
      __TABLE187__ = nil
      __END_TAG188__ = nil
      id175 = nil
      style176 = nil
      klass177 = nil
      align178 = nil
      width179 = nil
      height180 = nil
      background181 = nil
      bgcolor182 = nil
      border183 = nil
      tr185 = nil

      tree_for_OPENING_TAG173 = nil
      tree_for_TABLE174 = nil
      tree_for_END_TAG184 = nil
      tree_for_CLOSING_TAG186 = nil
      tree_for_TABLE187 = nil
      tree_for_END_TAG188 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 232:4: OPENING_TAG TABLE ( id | style | klass | align | width | height | background | bgcolor | border )* END_TAG ( tr )+ CLOSING_TAG TABLE END_TAG
        __OPENING_TAG173__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_table_965 )

        tree_for_OPENING_TAG173 = @adaptor.create_with_payload( __OPENING_TAG173__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG173 )

        __TABLE174__ = match( TABLE, TOKENS_FOLLOWING_TABLE_IN_table_967 )

        tree_for_TABLE174 = @adaptor.create_with_payload( __TABLE174__ )
        @adaptor.add_child( root_0, tree_for_TABLE174 )

        # at line 232:22: ( id | style | klass | align | width | height | background | bgcolor | border )*
        while true # decision 34
          alt_34 = 10
          alt_34 = @dfa34.predict( @input )
          case alt_34
          when 1
            # at line 232:23: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_table_970 )
            id175 = id
            @state.following.pop
            @adaptor.add_child( root_0, id175.tree )

          when 2
            # at line 232:26: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_table_972 )
            style176 = style
            @state.following.pop
            @adaptor.add_child( root_0, style176.tree )

          when 3
            # at line 232:32: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_table_974 )
            klass177 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass177.tree )

          when 4
            # at line 232:38: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_table_976 )
            align178 = align
            @state.following.pop
            @adaptor.add_child( root_0, align178.tree )

          when 5
            # at line 232:44: width
            @state.following.push( TOKENS_FOLLOWING_width_IN_table_978 )
            width179 = width
            @state.following.pop
            @adaptor.add_child( root_0, width179.tree )

          when 6
            # at line 232:50: height
            @state.following.push( TOKENS_FOLLOWING_height_IN_table_980 )
            height180 = height
            @state.following.pop
            @adaptor.add_child( root_0, height180.tree )

          when 7
            # at line 232:57: background
            @state.following.push( TOKENS_FOLLOWING_background_IN_table_982 )
            background181 = background
            @state.following.pop
            @adaptor.add_child( root_0, background181.tree )

          when 8
            # at line 232:68: bgcolor
            @state.following.push( TOKENS_FOLLOWING_bgcolor_IN_table_984 )
            bgcolor182 = bgcolor
            @state.following.pop
            @adaptor.add_child( root_0, bgcolor182.tree )

          when 9
            # at line 232:76: border
            @state.following.push( TOKENS_FOLLOWING_border_IN_table_986 )
            border183 = border
            @state.following.pop
            @adaptor.add_child( root_0, border183.tree )

          else
            break # out of loop for decision 34
          end
        end # loop for decision 34
        __END_TAG184__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_table_990 )

        tree_for_END_TAG184 = @adaptor.create_with_payload( __END_TAG184__ )
        @adaptor.add_child( root_0, tree_for_END_TAG184 )

        # at file 234:4: ( tr )+
        match_count_35 = 0
        while true
          alt_35 = 2
          look_35_0 = @input.peek( 1 )

          if ( look_35_0 == OPENING_TAG )
            alt_35 = 1

          end
          case alt_35
          when 1
            # at line 234:5: tr
            @state.following.push( TOKENS_FOLLOWING_tr_IN_table_1000 )
            tr185 = tr
            @state.following.pop
            @adaptor.add_child( root_0, tr185.tree )

          else
            match_count_35 > 0 and break
            eee = EarlyExit(35)


            raise eee
          end
          match_count_35 += 1
        end

        __CLOSING_TAG186__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_table_1007 )

        tree_for_CLOSING_TAG186 = @adaptor.create_with_payload( __CLOSING_TAG186__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG186 )

        __TABLE187__ = match( TABLE, TOKENS_FOLLOWING_TABLE_IN_table_1009 )

        tree_for_TABLE187 = @adaptor.create_with_payload( __TABLE187__ )
        @adaptor.add_child( root_0, tree_for_TABLE187 )

        __END_TAG188__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_table_1011 )

        tree_for_END_TAG188 = @adaptor.create_with_payload( __END_TAG188__ )
        @adaptor.add_child( root_0, tree_for_END_TAG188 )

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

    TrReturnValue = define_return_scope 

    # 
    # parser rule tr
    # 
    # (in HtmlParser.g)
    # 238:1: tr : OPENING_TAG TR END_TAG ( th | td )* CLOSING_TAG TR END_TAG ;
    # 
    def tr
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = TrReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG189__ = nil
      __TR190__ = nil
      __END_TAG191__ = nil
      __CLOSING_TAG194__ = nil
      __TR195__ = nil
      __END_TAG196__ = nil
      th192 = nil
      td193 = nil

      tree_for_OPENING_TAG189 = nil
      tree_for_TR190 = nil
      tree_for_END_TAG191 = nil
      tree_for_CLOSING_TAG194 = nil
      tree_for_TR195 = nil
      tree_for_END_TAG196 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 238:6: OPENING_TAG TR END_TAG ( th | td )* CLOSING_TAG TR END_TAG
        __OPENING_TAG189__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_tr_1021 )

        tree_for_OPENING_TAG189 = @adaptor.create_with_payload( __OPENING_TAG189__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG189 )

        __TR190__ = match( TR, TOKENS_FOLLOWING_TR_IN_tr_1023 )

        tree_for_TR190 = @adaptor.create_with_payload( __TR190__ )
        @adaptor.add_child( root_0, tree_for_TR190 )

        __END_TAG191__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_tr_1025 )

        tree_for_END_TAG191 = @adaptor.create_with_payload( __END_TAG191__ )
        @adaptor.add_child( root_0, tree_for_END_TAG191 )

        # at line 240:4: ( th | td )*
        while true # decision 36
          alt_36 = 3
          look_36_0 = @input.peek( 1 )

          if ( look_36_0 == OPENING_TAG )
            look_36_2 = @input.peek( 2 )

            if ( look_36_2 == TH )
              alt_36 = 1
            elsif ( look_36_2 == TD )
              alt_36 = 2

            end

          end
          case alt_36
          when 1
            # at line 240:5: th
            @state.following.push( TOKENS_FOLLOWING_th_IN_tr_1035 )
            th192 = th
            @state.following.pop
            @adaptor.add_child( root_0, th192.tree )

          when 2
            # at line 240:10: td
            @state.following.push( TOKENS_FOLLOWING_td_IN_tr_1039 )
            td193 = td
            @state.following.pop
            @adaptor.add_child( root_0, td193.tree )

          else
            break # out of loop for decision 36
          end
        end # loop for decision 36
        __CLOSING_TAG194__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_tr_1046 )

        tree_for_CLOSING_TAG194 = @adaptor.create_with_payload( __CLOSING_TAG194__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG194 )

        __TR195__ = match( TR, TOKENS_FOLLOWING_TR_IN_tr_1048 )

        tree_for_TR195 = @adaptor.create_with_payload( __TR195__ )
        @adaptor.add_child( root_0, tree_for_TR195 )

        __END_TAG196__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_tr_1050 )

        tree_for_END_TAG196 = @adaptor.create_with_payload( __END_TAG196__ )
        @adaptor.add_child( root_0, tree_for_END_TAG196 )

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

    ThReturnValue = define_return_scope 

    # 
    # parser rule th
    # 
    # (in HtmlParser.g)
    # 244:1: th : OPENING_TAG TH ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )* END_TAG ( body_content )* CLOSING_TAG TH END_TAG ;
    # 
    def th
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = ThReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG197__ = nil
      __TH198__ = nil
      __END_TAG209__ = nil
      __CLOSING_TAG211__ = nil
      __TH212__ = nil
      __END_TAG213__ = nil
      id199 = nil
      style200 = nil
      klass201 = nil
      align202 = nil
      valign203 = nil
      width204 = nil
      height205 = nil
      background206 = nil
      bgcolor207 = nil
      bordercolor208 = nil
      body_content210 = nil

      tree_for_OPENING_TAG197 = nil
      tree_for_TH198 = nil
      tree_for_END_TAG209 = nil
      tree_for_CLOSING_TAG211 = nil
      tree_for_TH212 = nil
      tree_for_END_TAG213 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 244:7: OPENING_TAG TH ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )* END_TAG ( body_content )* CLOSING_TAG TH END_TAG
        __OPENING_TAG197__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_th_1061 )

        tree_for_OPENING_TAG197 = @adaptor.create_with_payload( __OPENING_TAG197__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG197 )

        __TH198__ = match( TH, TOKENS_FOLLOWING_TH_IN_th_1063 )

        tree_for_TH198 = @adaptor.create_with_payload( __TH198__ )
        @adaptor.add_child( root_0, tree_for_TH198 )

        # at line 244:22: ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )*
        while true # decision 37
          alt_37 = 11
          alt_37 = @dfa37.predict( @input )
          case alt_37
          when 1
            # at line 244:23: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_th_1066 )
            id199 = id
            @state.following.pop
            @adaptor.add_child( root_0, id199.tree )

          when 2
            # at line 244:26: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_th_1068 )
            style200 = style
            @state.following.pop
            @adaptor.add_child( root_0, style200.tree )

          when 3
            # at line 244:32: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_th_1070 )
            klass201 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass201.tree )

          when 4
            # at line 244:38: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_th_1072 )
            align202 = align
            @state.following.pop
            @adaptor.add_child( root_0, align202.tree )

          when 5
            # at line 244:44: valign
            @state.following.push( TOKENS_FOLLOWING_valign_IN_th_1074 )
            valign203 = valign
            @state.following.pop
            @adaptor.add_child( root_0, valign203.tree )

          when 6
            # at line 244:51: width
            @state.following.push( TOKENS_FOLLOWING_width_IN_th_1076 )
            width204 = width
            @state.following.pop
            @adaptor.add_child( root_0, width204.tree )

          when 7
            # at line 244:57: height
            @state.following.push( TOKENS_FOLLOWING_height_IN_th_1078 )
            height205 = height
            @state.following.pop
            @adaptor.add_child( root_0, height205.tree )

          when 8
            # at line 244:64: background
            @state.following.push( TOKENS_FOLLOWING_background_IN_th_1080 )
            background206 = background
            @state.following.pop
            @adaptor.add_child( root_0, background206.tree )

          when 9
            # at line 244:75: bgcolor
            @state.following.push( TOKENS_FOLLOWING_bgcolor_IN_th_1082 )
            bgcolor207 = bgcolor
            @state.following.pop
            @adaptor.add_child( root_0, bgcolor207.tree )

          when 10
            # at line 244:83: bordercolor
            @state.following.push( TOKENS_FOLLOWING_bordercolor_IN_th_1084 )
            bordercolor208 = bordercolor
            @state.following.pop
            @adaptor.add_child( root_0, bordercolor208.tree )

          else
            break # out of loop for decision 37
          end
        end # loop for decision 37
        __END_TAG209__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_th_1088 )

        tree_for_END_TAG209 = @adaptor.create_with_payload( __END_TAG209__ )
        @adaptor.add_child( root_0, tree_for_END_TAG209 )

        # at line 245:3: ( body_content )*
        while true # decision 38
          alt_38 = 2
          look_38_0 = @input.peek( 1 )

          if ( look_38_0 == OPENING_TAG || look_38_0 == PCDATA )
            alt_38 = 1

          end
          case alt_38
          when 1
            # at line 245:4: body_content
            @state.following.push( TOKENS_FOLLOWING_body_content_IN_th_1093 )
            body_content210 = body_content
            @state.following.pop
            @adaptor.add_child( root_0, body_content210.tree )

          else
            break # out of loop for decision 38
          end
        end # loop for decision 38
        __CLOSING_TAG211__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_th_1099 )

        tree_for_CLOSING_TAG211 = @adaptor.create_with_payload( __CLOSING_TAG211__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG211 )

        __TH212__ = match( TH, TOKENS_FOLLOWING_TH_IN_th_1101 )

        tree_for_TH212 = @adaptor.create_with_payload( __TH212__ )
        @adaptor.add_child( root_0, tree_for_TH212 )

        __END_TAG213__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_th_1103 )

        tree_for_END_TAG213 = @adaptor.create_with_payload( __END_TAG213__ )
        @adaptor.add_child( root_0, tree_for_END_TAG213 )

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

    TdReturnValue = define_return_scope 

    # 
    # parser rule td
    # 
    # (in HtmlParser.g)
    # 249:1: td : OPENING_TAG TD ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )* END_TAG ( body_content )* CLOSING_TAG TD END_TAG ;
    # 
    def td
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = TdReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG214__ = nil
      __TD215__ = nil
      __END_TAG226__ = nil
      __CLOSING_TAG228__ = nil
      __TD229__ = nil
      __END_TAG230__ = nil
      id216 = nil
      style217 = nil
      klass218 = nil
      align219 = nil
      valign220 = nil
      width221 = nil
      height222 = nil
      background223 = nil
      bgcolor224 = nil
      bordercolor225 = nil
      body_content227 = nil

      tree_for_OPENING_TAG214 = nil
      tree_for_TD215 = nil
      tree_for_END_TAG226 = nil
      tree_for_CLOSING_TAG228 = nil
      tree_for_TD229 = nil
      tree_for_END_TAG230 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 249:7: OPENING_TAG TD ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )* END_TAG ( body_content )* CLOSING_TAG TD END_TAG
        __OPENING_TAG214__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_td_1114 )

        tree_for_OPENING_TAG214 = @adaptor.create_with_payload( __OPENING_TAG214__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG214 )

        __TD215__ = match( TD, TOKENS_FOLLOWING_TD_IN_td_1116 )

        tree_for_TD215 = @adaptor.create_with_payload( __TD215__ )
        @adaptor.add_child( root_0, tree_for_TD215 )

        # at line 249:22: ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )*
        while true # decision 39
          alt_39 = 11
          alt_39 = @dfa39.predict( @input )
          case alt_39
          when 1
            # at line 249:23: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_td_1119 )
            id216 = id
            @state.following.pop
            @adaptor.add_child( root_0, id216.tree )

          when 2
            # at line 249:26: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_td_1121 )
            style217 = style
            @state.following.pop
            @adaptor.add_child( root_0, style217.tree )

          when 3
            # at line 249:32: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_td_1123 )
            klass218 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass218.tree )

          when 4
            # at line 249:38: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_td_1125 )
            align219 = align
            @state.following.pop
            @adaptor.add_child( root_0, align219.tree )

          when 5
            # at line 249:44: valign
            @state.following.push( TOKENS_FOLLOWING_valign_IN_td_1127 )
            valign220 = valign
            @state.following.pop
            @adaptor.add_child( root_0, valign220.tree )

          when 6
            # at line 249:51: width
            @state.following.push( TOKENS_FOLLOWING_width_IN_td_1129 )
            width221 = width
            @state.following.pop
            @adaptor.add_child( root_0, width221.tree )

          when 7
            # at line 249:57: height
            @state.following.push( TOKENS_FOLLOWING_height_IN_td_1131 )
            height222 = height
            @state.following.pop
            @adaptor.add_child( root_0, height222.tree )

          when 8
            # at line 249:64: background
            @state.following.push( TOKENS_FOLLOWING_background_IN_td_1133 )
            background223 = background
            @state.following.pop
            @adaptor.add_child( root_0, background223.tree )

          when 9
            # at line 249:75: bgcolor
            @state.following.push( TOKENS_FOLLOWING_bgcolor_IN_td_1135 )
            bgcolor224 = bgcolor
            @state.following.pop
            @adaptor.add_child( root_0, bgcolor224.tree )

          when 10
            # at line 249:83: bordercolor
            @state.following.push( TOKENS_FOLLOWING_bordercolor_IN_td_1137 )
            bordercolor225 = bordercolor
            @state.following.pop
            @adaptor.add_child( root_0, bordercolor225.tree )

          else
            break # out of loop for decision 39
          end
        end # loop for decision 39
        __END_TAG226__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_td_1141 )

        tree_for_END_TAG226 = @adaptor.create_with_payload( __END_TAG226__ )
        @adaptor.add_child( root_0, tree_for_END_TAG226 )

        # at line 250:3: ( body_content )*
        while true # decision 40
          alt_40 = 2
          look_40_0 = @input.peek( 1 )

          if ( look_40_0 == OPENING_TAG || look_40_0 == PCDATA )
            alt_40 = 1

          end
          case alt_40
          when 1
            # at line 250:4: body_content
            @state.following.push( TOKENS_FOLLOWING_body_content_IN_td_1146 )
            body_content227 = body_content
            @state.following.pop
            @adaptor.add_child( root_0, body_content227.tree )

          else
            break # out of loop for decision 40
          end
        end # loop for decision 40
        __CLOSING_TAG228__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_td_1152 )

        tree_for_CLOSING_TAG228 = @adaptor.create_with_payload( __CLOSING_TAG228__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG228 )

        __TD229__ = match( TD, TOKENS_FOLLOWING_TD_IN_td_1154 )

        tree_for_TD229 = @adaptor.create_with_payload( __TD229__ )
        @adaptor.add_child( root_0, tree_for_TD229 )

        __END_TAG230__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_td_1156 )

        tree_for_END_TAG230 = @adaptor.create_with_payload( __END_TAG230__ )
        @adaptor.add_child( root_0, tree_for_END_TAG230 )

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

    AnchorReturnValue = define_return_scope 

    # 
    # parser rule anchor
    # 
    # (in HtmlParser.g)
    # 255:1: anchor : OPENING_TAG A ( id | style | klass | align | href | name | target ) END_TAG ( text )* CLOSING_TAG A END_TAG ;
    # 
    def anchor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = AnchorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG231__ = nil
      __A232__ = nil
      __END_TAG240__ = nil
      __CLOSING_TAG242__ = nil
      __A243__ = nil
      __END_TAG244__ = nil
      id233 = nil
      style234 = nil
      klass235 = nil
      align236 = nil
      href237 = nil
      name238 = nil
      target239 = nil
      text241 = nil

      tree_for_OPENING_TAG231 = nil
      tree_for_A232 = nil
      tree_for_END_TAG240 = nil
      tree_for_CLOSING_TAG242 = nil
      tree_for_A243 = nil
      tree_for_END_TAG244 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 255:9: OPENING_TAG A ( id | style | klass | align | href | name | target ) END_TAG ( text )* CLOSING_TAG A END_TAG
        __OPENING_TAG231__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_anchor_1168 )

        tree_for_OPENING_TAG231 = @adaptor.create_with_payload( __OPENING_TAG231__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG231 )

        __A232__ = match( A, TOKENS_FOLLOWING_A_IN_anchor_1170 )

        tree_for_A232 = @adaptor.create_with_payload( __A232__ )
        @adaptor.add_child( root_0, tree_for_A232 )

        # at line 255:23: ( id | style | klass | align | href | name | target )
        alt_41 = 7
        look_41_0 = @input.peek( 1 )

        if ( look_41_0 == WS )
          case look_41 = @input.peek( 2 )
          when ID then alt_41 = 1
          when STYLE then alt_41 = 2
          when CLASS then alt_41 = 3
          when ALIGN then alt_41 = 4
          when HREF then alt_41 = 5
          when ANAME then alt_41 = 6
          when TARGET then alt_41 = 7
          else
            raise NoViableAlternative( "", 41, 1 )
          end
        else
          raise NoViableAlternative( "", 41, 0 )
        end
        case alt_41
        when 1
          # at line 255:24: id
          @state.following.push( TOKENS_FOLLOWING_id_IN_anchor_1173 )
          id233 = id
          @state.following.pop
          @adaptor.add_child( root_0, id233.tree )

        when 2
          # at line 255:27: style
          @state.following.push( TOKENS_FOLLOWING_style_IN_anchor_1175 )
          style234 = style
          @state.following.pop
          @adaptor.add_child( root_0, style234.tree )

        when 3
          # at line 255:33: klass
          @state.following.push( TOKENS_FOLLOWING_klass_IN_anchor_1177 )
          klass235 = klass
          @state.following.pop
          @adaptor.add_child( root_0, klass235.tree )

        when 4
          # at line 255:39: align
          @state.following.push( TOKENS_FOLLOWING_align_IN_anchor_1179 )
          align236 = align
          @state.following.pop
          @adaptor.add_child( root_0, align236.tree )

        when 5
          # at line 255:45: href
          @state.following.push( TOKENS_FOLLOWING_href_IN_anchor_1181 )
          href237 = href
          @state.following.pop
          @adaptor.add_child( root_0, href237.tree )

        when 6
          # at line 255:50: name
          @state.following.push( TOKENS_FOLLOWING_name_IN_anchor_1183 )
          name238 = name
          @state.following.pop
          @adaptor.add_child( root_0, name238.tree )

        when 7
          # at line 255:55: target
          @state.following.push( TOKENS_FOLLOWING_target_IN_anchor_1185 )
          target239 = target
          @state.following.pop
          @adaptor.add_child( root_0, target239.tree )

        end
        __END_TAG240__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_anchor_1188 )

        tree_for_END_TAG240 = @adaptor.create_with_payload( __END_TAG240__ )
        @adaptor.add_child( root_0, tree_for_END_TAG240 )

        # at line 256:3: ( text )*
        while true # decision 42
          alt_42 = 2
          look_42_0 = @input.peek( 1 )

          if ( look_42_0 == OPENING_TAG || look_42_0 == PCDATA )
            alt_42 = 1

          end
          case alt_42
          when 1
            # at line 256:4: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_anchor_1193 )
            text241 = text
            @state.following.pop
            @adaptor.add_child( root_0, text241.tree )

          else
            break # out of loop for decision 42
          end
        end # loop for decision 42
        __CLOSING_TAG242__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_anchor_1199 )

        tree_for_CLOSING_TAG242 = @adaptor.create_with_payload( __CLOSING_TAG242__ )
        @adaptor.add_child( root_0, tree_for_CLOSING_TAG242 )

        __A243__ = match( A, TOKENS_FOLLOWING_A_IN_anchor_1201 )

        tree_for_A243 = @adaptor.create_with_payload( __A243__ )
        @adaptor.add_child( root_0, tree_for_A243 )

        __END_TAG244__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_anchor_1203 )

        tree_for_END_TAG244 = @adaptor.create_with_payload( __END_TAG244__ )
        @adaptor.add_child( root_0, tree_for_END_TAG244 )

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

    ImgReturnValue = define_return_scope 

    # 
    # parser rule img
    # 
    # (in HtmlParser.g)
    # 260:1: img : OPENING_TAG IMG ( id | style | klass | align | src | alt | width | height )* END_NOPAIR_TAG ;
    # 
    def img
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = ImgReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG245__ = nil
      __IMG246__ = nil
      __END_NOPAIR_TAG255__ = nil
      id247 = nil
      style248 = nil
      klass249 = nil
      align250 = nil
      src251 = nil
      alt252 = nil
      width253 = nil
      height254 = nil

      tree_for_OPENING_TAG245 = nil
      tree_for_IMG246 = nil
      tree_for_END_NOPAIR_TAG255 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 260:6: OPENING_TAG IMG ( id | style | klass | align | src | alt | width | height )* END_NOPAIR_TAG
        __OPENING_TAG245__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_img_1214 )

        tree_for_OPENING_TAG245 = @adaptor.create_with_payload( __OPENING_TAG245__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG245 )

        __IMG246__ = match( IMG, TOKENS_FOLLOWING_IMG_IN_img_1216 )

        tree_for_IMG246 = @adaptor.create_with_payload( __IMG246__ )
        @adaptor.add_child( root_0, tree_for_IMG246 )

        # at line 260:22: ( id | style | klass | align | src | alt | width | height )*
        while true # decision 43
          alt_43 = 9
          alt_43 = @dfa43.predict( @input )
          case alt_43
          when 1
            # at line 260:23: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_img_1219 )
            id247 = id
            @state.following.pop
            @adaptor.add_child( root_0, id247.tree )

          when 2
            # at line 260:26: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_img_1221 )
            style248 = style
            @state.following.pop
            @adaptor.add_child( root_0, style248.tree )

          when 3
            # at line 260:32: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_img_1223 )
            klass249 = klass
            @state.following.pop
            @adaptor.add_child( root_0, klass249.tree )

          when 4
            # at line 260:38: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_img_1225 )
            align250 = align
            @state.following.pop
            @adaptor.add_child( root_0, align250.tree )

          when 5
            # at line 260:44: src
            @state.following.push( TOKENS_FOLLOWING_src_IN_img_1227 )
            src251 = src
            @state.following.pop
            @adaptor.add_child( root_0, src251.tree )

          when 6
            # at line 260:48: alt
            @state.following.push( TOKENS_FOLLOWING_alt_IN_img_1229 )
            alt252 = alt
            @state.following.pop
            @adaptor.add_child( root_0, alt252.tree )

          when 7
            # at line 260:52: width
            @state.following.push( TOKENS_FOLLOWING_width_IN_img_1231 )
            width253 = width
            @state.following.pop
            @adaptor.add_child( root_0, width253.tree )

          when 8
            # at line 260:58: height
            @state.following.push( TOKENS_FOLLOWING_height_IN_img_1233 )
            height254 = height
            @state.following.pop
            @adaptor.add_child( root_0, height254.tree )

          else
            break # out of loop for decision 43
          end
        end # loop for decision 43
        __END_NOPAIR_TAG255__ = match( END_NOPAIR_TAG, TOKENS_FOLLOWING_END_NOPAIR_TAG_IN_img_1239 )

        tree_for_END_NOPAIR_TAG255 = @adaptor.create_with_payload( __END_NOPAIR_TAG255__ )
        @adaptor.add_child( root_0, tree_for_END_NOPAIR_TAG255 )

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

    BrReturnValue = define_return_scope 

    # 
    # parser rule br
    # 
    # (in HtmlParser.g)
    # 264:1: br : OPENING_TAG BR END_NOPAIR_TAG ;
    # 
    def br
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = BrReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG256__ = nil
      __BR257__ = nil
      __END_NOPAIR_TAG258__ = nil

      tree_for_OPENING_TAG256 = nil
      tree_for_BR257 = nil
      tree_for_END_NOPAIR_TAG258 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 264:5: OPENING_TAG BR END_NOPAIR_TAG
        __OPENING_TAG256__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_br_1253 )

        tree_for_OPENING_TAG256 = @adaptor.create_with_payload( __OPENING_TAG256__ )
        @adaptor.add_child( root_0, tree_for_OPENING_TAG256 )

        __BR257__ = match( BR, TOKENS_FOLLOWING_BR_IN_br_1255 )

        tree_for_BR257 = @adaptor.create_with_payload( __BR257__ )
        @adaptor.add_child( root_0, tree_for_BR257 )

        __END_NOPAIR_TAG258__ = match( END_NOPAIR_TAG, TOKENS_FOLLOWING_END_NOPAIR_TAG_IN_br_1259 )

        tree_for_END_NOPAIR_TAG258 = @adaptor.create_with_payload( __END_NOPAIR_TAG258__ )
        @adaptor.add_child( root_0, tree_for_END_NOPAIR_TAG258 )

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

    IdReturnValue = define_return_scope 

    # 
    # parser rule id
    # 
    # (in HtmlParser.g)
    # 270:1: id : WS ID attr_svalue -> ^( ID attr_svalue ) ;
    # 
    def id
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = IdReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS259__ = nil
      __ID260__ = nil
      attr_svalue261 = nil

      tree_for_WS259 = nil
      tree_for_ID260 = nil
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_ID = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token ID" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 270:4: WS ID attr_svalue
        __WS259__ = match( WS, TOKENS_FOLLOWING_WS_IN_id_1273 )
        stream_WS.add( __WS259__ )
        __ID260__ = match( ID, TOKENS_FOLLOWING_ID_IN_id_1275 )
        stream_ID.add( __ID260__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_id_1277 )
        attr_svalue261 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue261.tree )
        # AST Rewrite
        # elements: attr_svalue, ID
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 270:22: -> ^( ID attr_svalue )
        # at line 270:25: ^( ID attr_svalue )
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
        # trace_out( __method__, 33 )

      end
      
      return return_value
    end

    StyleReturnValue = define_return_scope 

    # 
    # parser rule style
    # 
    # (in HtmlParser.g)
    # 271:1: style : WS STYLE attr_svalue -> ^( STYLE attr_svalue ) ;
    # 
    def style
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = StyleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS262__ = nil
      __STYLE263__ = nil
      attr_svalue264 = nil

      tree_for_WS262 = nil
      tree_for_STYLE263 = nil
      stream_STYLE = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token STYLE" )
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 271:7: WS STYLE attr_svalue
        __WS262__ = match( WS, TOKENS_FOLLOWING_WS_IN_style_1290 )
        stream_WS.add( __WS262__ )
        __STYLE263__ = match( STYLE, TOKENS_FOLLOWING_STYLE_IN_style_1292 )
        stream_STYLE.add( __STYLE263__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_style_1294 )
        attr_svalue264 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue264.tree )
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
        # 271:28: -> ^( STYLE attr_svalue )
        # at line 271:31: ^( STYLE attr_svalue )
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
        # trace_out( __method__, 34 )

      end
      
      return return_value
    end

    KlassReturnValue = define_return_scope 

    # 
    # parser rule klass
    # 
    # (in HtmlParser.g)
    # 272:1: klass : WS CLASS attr_svalue -> ^( CLASS attr_svalue ) ;
    # 
    def klass
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = KlassReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS265__ = nil
      __CLASS266__ = nil
      attr_svalue267 = nil

      tree_for_WS265 = nil
      tree_for_CLASS266 = nil
      stream_CLASS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLASS" )
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 272:7: WS CLASS attr_svalue
        __WS265__ = match( WS, TOKENS_FOLLOWING_WS_IN_klass_1307 )
        stream_WS.add( __WS265__ )
        __CLASS266__ = match( CLASS, TOKENS_FOLLOWING_CLASS_IN_klass_1309 )
        stream_CLASS.add( __CLASS266__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_klass_1311 )
        attr_svalue267 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue267.tree )
        # AST Rewrite
        # elements: CLASS, attr_svalue
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 272:28: -> ^( CLASS attr_svalue )
        # at line 272:31: ^( CLASS attr_svalue )
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
        # trace_out( __method__, 35 )

      end
      
      return return_value
    end

    BgcolorReturnValue = define_return_scope 

    # 
    # parser rule bgcolor
    # 
    # (in HtmlParser.g)
    # 274:1: bgcolor : WS BGCOLOR attr_svalue -> ^( BGCOLOR attr_svalue ) ;
    # 
    def bgcolor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = BgcolorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS268__ = nil
      __BGCOLOR269__ = nil
      attr_svalue270 = nil

      tree_for_WS268 = nil
      tree_for_BGCOLOR269 = nil
      stream_BGCOLOR = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token BGCOLOR" )
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 274:9: WS BGCOLOR attr_svalue
        __WS268__ = match( WS, TOKENS_FOLLOWING_WS_IN_bgcolor_1326 )
        stream_WS.add( __WS268__ )
        __BGCOLOR269__ = match( BGCOLOR, TOKENS_FOLLOWING_BGCOLOR_IN_bgcolor_1328 )
        stream_BGCOLOR.add( __BGCOLOR269__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_bgcolor_1330 )
        attr_svalue270 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue270.tree )
        # AST Rewrite
        # elements: BGCOLOR, attr_svalue
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 274:32: -> ^( BGCOLOR attr_svalue )
        # at line 274:35: ^( BGCOLOR attr_svalue )
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
        # trace_out( __method__, 36 )

      end
      
      return return_value
    end

    BackgroundReturnValue = define_return_scope 

    # 
    # parser rule background
    # 
    # (in HtmlParser.g)
    # 276:1: background : WS BACKGROUND attr_svalue -> ^( BACKGROUND attr_svalue ) ;
    # 
    def background
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = BackgroundReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS271__ = nil
      __BACKGROUND272__ = nil
      attr_svalue273 = nil

      tree_for_WS271 = nil
      tree_for_BACKGROUND272 = nil
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_BACKGROUND = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token BACKGROUND" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 276:13: WS BACKGROUND attr_svalue
        __WS271__ = match( WS, TOKENS_FOLLOWING_WS_IN_background_1345 )
        stream_WS.add( __WS271__ )
        __BACKGROUND272__ = match( BACKGROUND, TOKENS_FOLLOWING_BACKGROUND_IN_background_1347 )
        stream_BACKGROUND.add( __BACKGROUND272__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_background_1349 )
        attr_svalue273 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue273.tree )
        # AST Rewrite
        # elements: attr_svalue, BACKGROUND
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 276:39: -> ^( BACKGROUND attr_svalue )
        # at line 276:42: ^( BACKGROUND attr_svalue )
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
        # trace_out( __method__, 37 )

      end
      
      return return_value
    end

    AlignReturnValue = define_return_scope 

    # 
    # parser rule align
    # 
    # (in HtmlParser.g)
    # 278:1: align : WS ALIGN attr_svalue -> ^( ALIGN attr_svalue ) ;
    # 
    def align
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
      return_value = AlignReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS274__ = nil
      __ALIGN275__ = nil
      attr_svalue276 = nil

      tree_for_WS274 = nil
      tree_for_ALIGN275 = nil
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_ALIGN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token ALIGN" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 278:8: WS ALIGN attr_svalue
        __WS274__ = match( WS, TOKENS_FOLLOWING_WS_IN_align_1364 )
        stream_WS.add( __WS274__ )
        __ALIGN275__ = match( ALIGN, TOKENS_FOLLOWING_ALIGN_IN_align_1366 )
        stream_ALIGN.add( __ALIGN275__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_align_1368 )
        attr_svalue276 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue276.tree )
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
        # 278:29: -> ^( ALIGN attr_svalue )
        # at line 278:32: ^( ALIGN attr_svalue )
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
        # trace_out( __method__, 38 )

      end
      
      return return_value
    end

    SrcReturnValue = define_return_scope 

    # 
    # parser rule src
    # 
    # (in HtmlParser.g)
    # 280:1: src : WS SRC attr_svalue -> ^( SRC attr_svalue ) ;
    # 
    def src
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )
      return_value = SrcReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS277__ = nil
      __SRC278__ = nil
      attr_svalue279 = nil

      tree_for_WS277 = nil
      tree_for_SRC278 = nil
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_SRC = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token SRC" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 280:6: WS SRC attr_svalue
        __WS277__ = match( WS, TOKENS_FOLLOWING_WS_IN_src_1383 )
        stream_WS.add( __WS277__ )
        __SRC278__ = match( SRC, TOKENS_FOLLOWING_SRC_IN_src_1385 )
        stream_SRC.add( __SRC278__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_src_1387 )
        attr_svalue279 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue279.tree )
        # AST Rewrite
        # elements: attr_svalue, SRC
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 280:25: -> ^( SRC attr_svalue )
        # at line 280:28: ^( SRC attr_svalue )
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
        # trace_out( __method__, 39 )

      end
      
      return return_value
    end

    AltReturnValue = define_return_scope 

    # 
    # parser rule alt
    # 
    # (in HtmlParser.g)
    # 282:1: alt : WS ALT attr_svalue -> ^( ALT attr_svalue ) ;
    # 
    def alt
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )
      return_value = AltReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS280__ = nil
      __ALT281__ = nil
      attr_svalue282 = nil

      tree_for_WS280 = nil
      tree_for_ALT281 = nil
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_ALT = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token ALT" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 282:6: WS ALT attr_svalue
        __WS280__ = match( WS, TOKENS_FOLLOWING_WS_IN_alt_1402 )
        stream_WS.add( __WS280__ )
        __ALT281__ = match( ALT, TOKENS_FOLLOWING_ALT_IN_alt_1404 )
        stream_ALT.add( __ALT281__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_alt_1406 )
        attr_svalue282 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue282.tree )
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
        # 282:25: -> ^( ALT attr_svalue )
        # at line 282:28: ^( ALT attr_svalue )
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
        # trace_out( __method__, 40 )

      end
      
      return return_value
    end

    WidthReturnValue = define_return_scope 

    # 
    # parser rule width
    # 
    # (in HtmlParser.g)
    # 284:1: width : WS WIDTH attr_svalue -> ^( WIDTH attr_svalue ) ;
    # 
    def width
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )
      return_value = WidthReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS283__ = nil
      __WIDTH284__ = nil
      attr_svalue285 = nil

      tree_for_WS283 = nil
      tree_for_WIDTH284 = nil
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_WIDTH = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WIDTH" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 284:8: WS WIDTH attr_svalue
        __WS283__ = match( WS, TOKENS_FOLLOWING_WS_IN_width_1421 )
        stream_WS.add( __WS283__ )
        __WIDTH284__ = match( WIDTH, TOKENS_FOLLOWING_WIDTH_IN_width_1423 )
        stream_WIDTH.add( __WIDTH284__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_width_1425 )
        attr_svalue285 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue285.tree )
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
        # 284:29: -> ^( WIDTH attr_svalue )
        # at line 284:32: ^( WIDTH attr_svalue )
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
        # trace_out( __method__, 41 )

      end
      
      return return_value
    end

    HeightReturnValue = define_return_scope 

    # 
    # parser rule height
    # 
    # (in HtmlParser.g)
    # 286:1: height : WS HEIGHT attr_svalue -> ^( HEIGHT attr_svalue ) ;
    # 
    def height
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )
      return_value = HeightReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS286__ = nil
      __HEIGHT287__ = nil
      attr_svalue288 = nil

      tree_for_WS286 = nil
      tree_for_HEIGHT287 = nil
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_HEIGHT = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token HEIGHT" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 286:9: WS HEIGHT attr_svalue
        __WS286__ = match( WS, TOKENS_FOLLOWING_WS_IN_height_1440 )
        stream_WS.add( __WS286__ )
        __HEIGHT287__ = match( HEIGHT, TOKENS_FOLLOWING_HEIGHT_IN_height_1442 )
        stream_HEIGHT.add( __HEIGHT287__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_height_1444 )
        attr_svalue288 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue288.tree )
        # AST Rewrite
        # elements: HEIGHT, attr_svalue
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 286:31: -> ^( HEIGHT attr_svalue )
        # at line 286:34: ^( HEIGHT attr_svalue )
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
        # trace_out( __method__, 42 )

      end
      
      return return_value
    end

    BordercolorReturnValue = define_return_scope 

    # 
    # parser rule bordercolor
    # 
    # (in HtmlParser.g)
    # 288:1: bordercolor : WS BORDERCOLOR attr_svalue -> ^( BORDERCOLOR attr_svalue ) ;
    # 
    def bordercolor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )
      return_value = BordercolorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS289__ = nil
      __BORDERCOLOR290__ = nil
      attr_svalue291 = nil

      tree_for_WS289 = nil
      tree_for_BORDERCOLOR290 = nil
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_BORDERCOLOR = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token BORDERCOLOR" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 288:14: WS BORDERCOLOR attr_svalue
        __WS289__ = match( WS, TOKENS_FOLLOWING_WS_IN_bordercolor_1459 )
        stream_WS.add( __WS289__ )
        __BORDERCOLOR290__ = match( BORDERCOLOR, TOKENS_FOLLOWING_BORDERCOLOR_IN_bordercolor_1461 )
        stream_BORDERCOLOR.add( __BORDERCOLOR290__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_bordercolor_1463 )
        attr_svalue291 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue291.tree )
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
        # 288:41: -> ^( BORDERCOLOR attr_svalue )
        # at line 288:44: ^( BORDERCOLOR attr_svalue )
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
        # trace_out( __method__, 43 )

      end
      
      return return_value
    end

    ValignReturnValue = define_return_scope 

    # 
    # parser rule valign
    # 
    # (in HtmlParser.g)
    # 290:1: valign : WS VALIGN attr_svalue -> ^( VALIGN attr_svalue ) ;
    # 
    def valign
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )
      return_value = ValignReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS292__ = nil
      __VALIGN293__ = nil
      attr_svalue294 = nil

      tree_for_WS292 = nil
      tree_for_VALIGN293 = nil
      stream_VALIGN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token VALIGN" )
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 290:9: WS VALIGN attr_svalue
        __WS292__ = match( WS, TOKENS_FOLLOWING_WS_IN_valign_1478 )
        stream_WS.add( __WS292__ )
        __VALIGN293__ = match( VALIGN, TOKENS_FOLLOWING_VALIGN_IN_valign_1480 )
        stream_VALIGN.add( __VALIGN293__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_valign_1482 )
        attr_svalue294 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue294.tree )
        # AST Rewrite
        # elements: VALIGN, attr_svalue
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 290:31: -> ^( VALIGN attr_svalue )
        # at line 290:34: ^( VALIGN attr_svalue )
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
        # trace_out( __method__, 44 )

      end
      
      return return_value
    end

    BorderReturnValue = define_return_scope 

    # 
    # parser rule border
    # 
    # (in HtmlParser.g)
    # 292:1: border : WS BORDER attr_svalue -> ^( BORDER attr_svalue ) ;
    # 
    def border
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )
      return_value = BorderReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS295__ = nil
      __BORDER296__ = nil
      attr_svalue297 = nil

      tree_for_WS295 = nil
      tree_for_BORDER296 = nil
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_BORDER = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token BORDER" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 292:9: WS BORDER attr_svalue
        __WS295__ = match( WS, TOKENS_FOLLOWING_WS_IN_border_1497 )
        stream_WS.add( __WS295__ )
        __BORDER296__ = match( BORDER, TOKENS_FOLLOWING_BORDER_IN_border_1499 )
        stream_BORDER.add( __BORDER296__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_border_1501 )
        attr_svalue297 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue297.tree )
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
        # 292:31: -> ^( BORDER attr_svalue )
        # at line 292:34: ^( BORDER attr_svalue )
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
        # trace_out( __method__, 45 )

      end
      
      return return_value
    end

    HrefReturnValue = define_return_scope 

    # 
    # parser rule href
    # 
    # (in HtmlParser.g)
    # 294:1: href : WS HREF attr_svalue -> ^( HREF attr_svalue ) ;
    # 
    def href
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )
      return_value = HrefReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS298__ = nil
      __HREF299__ = nil
      attr_svalue300 = nil

      tree_for_WS298 = nil
      tree_for_HREF299 = nil
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_HREF = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token HREF" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 294:7: WS HREF attr_svalue
        __WS298__ = match( WS, TOKENS_FOLLOWING_WS_IN_href_1516 )
        stream_WS.add( __WS298__ )
        __HREF299__ = match( HREF, TOKENS_FOLLOWING_HREF_IN_href_1518 )
        stream_HREF.add( __HREF299__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_href_1520 )
        attr_svalue300 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue300.tree )
        # AST Rewrite
        # elements: attr_svalue, HREF
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 294:27: -> ^( HREF attr_svalue )
        # at line 294:30: ^( HREF attr_svalue )
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
        # trace_out( __method__, 46 )

      end
      
      return return_value
    end

    NameReturnValue = define_return_scope 

    # 
    # parser rule name
    # 
    # (in HtmlParser.g)
    # 296:1: name : WS ANAME attr_svalue -> ^( ANAME attr_svalue ) ;
    # 
    def name
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )
      return_value = NameReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS301__ = nil
      __ANAME302__ = nil
      attr_svalue303 = nil

      tree_for_WS301 = nil
      tree_for_ANAME302 = nil
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_ANAME = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token ANAME" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 296:7: WS ANAME attr_svalue
        __WS301__ = match( WS, TOKENS_FOLLOWING_WS_IN_name_1535 )
        stream_WS.add( __WS301__ )
        __ANAME302__ = match( ANAME, TOKENS_FOLLOWING_ANAME_IN_name_1537 )
        stream_ANAME.add( __ANAME302__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_name_1539 )
        attr_svalue303 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue303.tree )
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
        # 296:28: -> ^( ANAME attr_svalue )
        # at line 296:31: ^( ANAME attr_svalue )
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
        # trace_out( __method__, 47 )

      end
      
      return return_value
    end

    TargetReturnValue = define_return_scope 

    # 
    # parser rule target
    # 
    # (in HtmlParser.g)
    # 298:1: target : WS TARGET attr_svalue -> ^( TARGET attr_svalue ) ;
    # 
    def target
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 48 )
      return_value = TargetReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS304__ = nil
      __TARGET305__ = nil
      attr_svalue306 = nil

      tree_for_WS304 = nil
      tree_for_TARGET305 = nil
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_TARGET = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token TARGET" )
      stream_attr_svalue = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule attr_svalue" )
      begin
        # at line 298:9: WS TARGET attr_svalue
        __WS304__ = match( WS, TOKENS_FOLLOWING_WS_IN_target_1554 )
        stream_WS.add( __WS304__ )
        __TARGET305__ = match( TARGET, TOKENS_FOLLOWING_TARGET_IN_target_1556 )
        stream_TARGET.add( __TARGET305__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_target_1558 )
        attr_svalue306 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue306.tree )
        # AST Rewrite
        # elements: attr_svalue, TARGET
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 298:31: -> ^( TARGET attr_svalue )
        # at line 298:34: ^( TARGET attr_svalue )
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
        # trace_out( __method__, 48 )

      end
      
      return return_value
    end

    AttrSvalueReturnValue = define_return_scope 

    # 
    # parser rule attr_svalue
    # 
    # (in HtmlParser.g)
    # 301:1: attr_svalue : ( WS )? ASSIGN ( WS )? SVALUE -> ^( ASSIGN SVALUE ) ;
    # 
    def attr_svalue
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 49 )
      return_value = AttrSvalueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WS307__ = nil
      __ASSIGN308__ = nil
      __WS309__ = nil
      __SVALUE310__ = nil

      tree_for_WS307 = nil
      tree_for_ASSIGN308 = nil
      tree_for_WS309 = nil
      tree_for_SVALUE310 = nil
      stream_SVALUE = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token SVALUE" )
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_ASSIGN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token ASSIGN" )

      begin
        # at line 301:14: ( WS )? ASSIGN ( WS )? SVALUE
        # at line 301:14: ( WS )?
        alt_44 = 2
        look_44_0 = @input.peek( 1 )

        if ( look_44_0 == WS )
          alt_44 = 1
        end
        case alt_44
        when 1
          # at line 301:14: WS
          __WS307__ = match( WS, TOKENS_FOLLOWING_WS_IN_attr_svalue_1576 )
          stream_WS.add( __WS307__ )

        end
        __ASSIGN308__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_attr_svalue_1579 )
        stream_ASSIGN.add( __ASSIGN308__ )
        # at line 301:25: ( WS )?
        alt_45 = 2
        look_45_0 = @input.peek( 1 )

        if ( look_45_0 == WS )
          alt_45 = 1
        end
        case alt_45
        when 1
          # at line 301:25: WS
          __WS309__ = match( WS, TOKENS_FOLLOWING_WS_IN_attr_svalue_1581 )
          stream_WS.add( __WS309__ )

        end
        __SVALUE310__ = match( SVALUE, TOKENS_FOLLOWING_SVALUE_IN_attr_svalue_1584 )
        stream_SVALUE.add( __SVALUE310__ )
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
        # 301:36: -> ^( ASSIGN SVALUE )
        # at line 301:39: ^( ASSIGN SVALUE )
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
        # trace_out( __method__, 49 )

      end
      
      return return_value
    end



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA34 < ANTLR3::DFA
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
      
      @decision = 34
      

      def description
        <<-'__dfa_description__'.strip!
          ()* loopback of 232:22: ( id | style | klass | align | width | height | background | bgcolor | border )*
        __dfa_description__
      end
    end
    class DFA37 < ANTLR3::DFA
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
      
      @decision = 37
      

      def description
        <<-'__dfa_description__'.strip!
          ()* loopback of 244:22: ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )*
        __dfa_description__
      end
    end
    class DFA39 < ANTLR3::DFA
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
      
      @decision = 39
      

      def description
        <<-'__dfa_description__'.strip!
          ()* loopback of 249:22: ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )*
        __dfa_description__
      end
    end
    class DFA43 < ANTLR3::DFA
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
      
      @decision = 43
      

      def description
        <<-'__dfa_description__'.strip!
          ()* loopback of 260:22: ( id | style | klass | align | src | alt | width | height )*
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa34 = DFA34.new( self, 34 )
      @dfa37 = DFA37.new( self, 37 )
      @dfa39 = DFA39.new( self, 39 )
      @dfa43 = DFA43.new( self, 43 )

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
    TOKENS_FOLLOWING_OPENING_TAG_IN_title_169 = Set[ 12 ]
    TOKENS_FOLLOWING_TITLE_IN_title_171 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_title_173 = Set[ 10, 13 ]
    TOKENS_FOLLOWING_PCDATA_IN_title_177 = Set[ 10 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_title_182 = Set[ 12 ]
    TOKENS_FOLLOWING_TITLE_IN_title_184 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_title_186 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_body_209 = Set[ 14 ]
    TOKENS_FOLLOWING_BODY_IN_body_211 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_id_IN_body_214 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_style_IN_body_216 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_klass_IN_body_218 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_bgcolor_IN_body_220 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_background_IN_body_222 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_END_TAG_IN_body_226 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_body_content_IN_body_236 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_body_244 = Set[ 14 ]
    TOKENS_FOLLOWING_BODY_IN_body_246 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_body_248 = Set[ 1 ]
    TOKENS_FOLLOWING_heading_IN_body_tag_274 = Set[ 1 ]
    TOKENS_FOLLOWING_block_IN_body_tag_280 = Set[ 1 ]
    TOKENS_FOLLOWING_body_tag_IN_body_content_291 = Set[ 1 ]
    TOKENS_FOLLOWING_text_IN_body_content_297 = Set[ 1 ]
    TOKENS_FOLLOWING_h1_IN_heading_310 = Set[ 1 ]
    TOKENS_FOLLOWING_h2_IN_heading_314 = Set[ 1 ]
    TOKENS_FOLLOWING_h3_IN_heading_318 = Set[ 1 ]
    TOKENS_FOLLOWING_h4_IN_heading_322 = Set[ 1 ]
    TOKENS_FOLLOWING_h5_IN_heading_326 = Set[ 1 ]
    TOKENS_FOLLOWING_h6_IN_heading_330 = Set[ 1 ]
    TOKENS_FOLLOWING_paragraph_IN_block_342 = Set[ 1 ]
    TOKENS_FOLLOWING_div_IN_block_347 = Set[ 1 ]
    TOKENS_FOLLOWING_table_IN_block_352 = Set[ 1 ]
    TOKENS_FOLLOWING_italic_IN_font_364 = Set[ 1 ]
    TOKENS_FOLLOWING_bold_IN_font_369 = Set[ 1 ]
    TOKENS_FOLLOWING_underline_IN_font_374 = Set[ 1 ]
    TOKENS_FOLLOWING_anchor_IN_special_386 = Set[ 1 ]
    TOKENS_FOLLOWING_img_IN_special_392 = Set[ 1 ]
    TOKENS_FOLLOWING_br_IN_special_397 = Set[ 1 ]
    TOKENS_FOLLOWING_font_IN_text_tag_409 = Set[ 1 ]
    TOKENS_FOLLOWING_special_IN_text_tag_415 = Set[ 1 ]
    TOKENS_FOLLOWING_PCDATA_IN_text_428 = Set[ 1 ]
    TOKENS_FOLLOWING_text_tag_IN_text_434 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_h1_451 = Set[ 15 ]
    TOKENS_FOLLOWING_H1_IN_h1_453 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_id_IN_h1_456 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_style_IN_h1_458 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_klass_IN_h1_460 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_align_IN_h1_462 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_END_TAG_IN_h1_466 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_block_IN_h1_471 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_text_IN_h1_475 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_h1_481 = Set[ 15 ]
    TOKENS_FOLLOWING_H1_IN_h1_483 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_h1_485 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_h2_496 = Set[ 16 ]
    TOKENS_FOLLOWING_H2_IN_h2_498 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_id_IN_h2_501 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_style_IN_h2_503 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_klass_IN_h2_505 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_align_IN_h2_507 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_END_TAG_IN_h2_511 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_block_IN_h2_516 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_text_IN_h2_520 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_h2_526 = Set[ 16 ]
    TOKENS_FOLLOWING_H2_IN_h2_528 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_h2_530 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_h3_541 = Set[ 17 ]
    TOKENS_FOLLOWING_H3_IN_h3_543 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_id_IN_h3_546 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_style_IN_h3_548 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_klass_IN_h3_550 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_align_IN_h3_552 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_END_TAG_IN_h3_556 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_block_IN_h3_561 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_text_IN_h3_565 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_h3_571 = Set[ 17 ]
    TOKENS_FOLLOWING_H3_IN_h3_573 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_h3_575 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_h4_586 = Set[ 18 ]
    TOKENS_FOLLOWING_H4_IN_h4_588 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_id_IN_h4_591 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_style_IN_h4_593 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_klass_IN_h4_595 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_align_IN_h4_597 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_END_TAG_IN_h4_601 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_block_IN_h4_606 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_text_IN_h4_610 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_h4_616 = Set[ 18 ]
    TOKENS_FOLLOWING_H4_IN_h4_618 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_h4_620 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_h5_631 = Set[ 19 ]
    TOKENS_FOLLOWING_H5_IN_h5_633 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_id_IN_h5_636 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_style_IN_h5_638 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_klass_IN_h5_640 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_align_IN_h5_642 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_END_TAG_IN_h5_646 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_block_IN_h5_651 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_text_IN_h5_655 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_h5_661 = Set[ 19 ]
    TOKENS_FOLLOWING_H5_IN_h5_663 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_h5_665 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_h6_676 = Set[ 20 ]
    TOKENS_FOLLOWING_H6_IN_h6_678 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_id_IN_h6_681 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_style_IN_h6_683 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_klass_IN_h6_685 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_align_IN_h6_687 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_END_TAG_IN_h6_691 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_block_IN_h6_696 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_text_IN_h6_700 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_h6_706 = Set[ 20 ]
    TOKENS_FOLLOWING_H6_IN_h6_708 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_h6_710 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_paragraph_723 = Set[ 21 ]
    TOKENS_FOLLOWING_P_IN_paragraph_727 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_id_IN_paragraph_730 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_style_IN_paragraph_732 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_klass_IN_paragraph_734 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_align_IN_paragraph_736 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_END_TAG_IN_paragraph_740 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_text_IN_paragraph_745 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_paragraph_751 = Set[ 21 ]
    TOKENS_FOLLOWING_P_IN_paragraph_753 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_paragraph_755 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_div_765 = Set[ 22 ]
    TOKENS_FOLLOWING_DIV_IN_div_769 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_id_IN_div_772 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_style_IN_div_774 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_klass_IN_div_776 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_align_IN_div_778 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_END_TAG_IN_div_782 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_body_content_IN_div_787 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_div_793 = Set[ 22 ]
    TOKENS_FOLLOWING_DIV_IN_div_795 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_div_797 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_italic_809 = Set[ 23 ]
    TOKENS_FOLLOWING_I_IN_italic_811 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_italic_813 = Set[ 7, 13 ]
    TOKENS_FOLLOWING_text_IN_italic_818 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_italic_824 = Set[ 23 ]
    TOKENS_FOLLOWING_I_IN_italic_826 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_italic_828 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_bold_857 = Set[ 24 ]
    TOKENS_FOLLOWING_B_IN_bold_859 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_bold_861 = Set[ 7, 13 ]
    TOKENS_FOLLOWING_text_IN_bold_866 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_bold_872 = Set[ 24 ]
    TOKENS_FOLLOWING_B_IN_bold_874 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_bold_876 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_underline_903 = Set[ 25 ]
    TOKENS_FOLLOWING_U_IN_underline_905 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_underline_907 = Set[ 7, 13 ]
    TOKENS_FOLLOWING_text_IN_underline_915 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_underline_924 = Set[ 25 ]
    TOKENS_FOLLOWING_U_IN_underline_926 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_underline_928 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_table_965 = Set[ 26 ]
    TOKENS_FOLLOWING_TABLE_IN_table_967 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_id_IN_table_970 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_style_IN_table_972 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_klass_IN_table_974 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_align_IN_table_976 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_width_IN_table_978 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_height_IN_table_980 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_background_IN_table_982 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_bgcolor_IN_table_984 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_border_IN_table_986 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_END_TAG_IN_table_990 = Set[ 7 ]
    TOKENS_FOLLOWING_tr_IN_table_1000 = Set[ 7, 10 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_table_1007 = Set[ 26 ]
    TOKENS_FOLLOWING_TABLE_IN_table_1009 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_table_1011 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_tr_1021 = Set[ 27 ]
    TOKENS_FOLLOWING_TR_IN_tr_1023 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_tr_1025 = Set[ 7, 10 ]
    TOKENS_FOLLOWING_th_IN_tr_1035 = Set[ 7, 10 ]
    TOKENS_FOLLOWING_td_IN_tr_1039 = Set[ 7, 10 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_tr_1046 = Set[ 27 ]
    TOKENS_FOLLOWING_TR_IN_tr_1048 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_tr_1050 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_th_1061 = Set[ 28 ]
    TOKENS_FOLLOWING_TH_IN_th_1063 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_id_IN_th_1066 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_style_IN_th_1068 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_klass_IN_th_1070 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_align_IN_th_1072 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_valign_IN_th_1074 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_width_IN_th_1076 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_height_IN_th_1078 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_background_IN_th_1080 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_bgcolor_IN_th_1082 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_bordercolor_IN_th_1084 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_END_TAG_IN_th_1088 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_body_content_IN_th_1093 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_th_1099 = Set[ 28 ]
    TOKENS_FOLLOWING_TH_IN_th_1101 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_th_1103 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_td_1114 = Set[ 29 ]
    TOKENS_FOLLOWING_TD_IN_td_1116 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_id_IN_td_1119 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_style_IN_td_1121 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_klass_IN_td_1123 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_align_IN_td_1125 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_valign_IN_td_1127 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_width_IN_td_1129 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_height_IN_td_1131 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_background_IN_td_1133 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_bgcolor_IN_td_1135 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_bordercolor_IN_td_1137 = Set[ 9, 34 ]
    TOKENS_FOLLOWING_END_TAG_IN_td_1141 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_body_content_IN_td_1146 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_td_1152 = Set[ 29 ]
    TOKENS_FOLLOWING_TD_IN_td_1154 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_td_1156 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_anchor_1168 = Set[ 30 ]
    TOKENS_FOLLOWING_A_IN_anchor_1170 = Set[ 34 ]
    TOKENS_FOLLOWING_id_IN_anchor_1173 = Set[ 9 ]
    TOKENS_FOLLOWING_style_IN_anchor_1175 = Set[ 9 ]
    TOKENS_FOLLOWING_klass_IN_anchor_1177 = Set[ 9 ]
    TOKENS_FOLLOWING_align_IN_anchor_1179 = Set[ 9 ]
    TOKENS_FOLLOWING_href_IN_anchor_1181 = Set[ 9 ]
    TOKENS_FOLLOWING_name_IN_anchor_1183 = Set[ 9 ]
    TOKENS_FOLLOWING_target_IN_anchor_1185 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_anchor_1188 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_text_IN_anchor_1193 = Set[ 7, 10, 13 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_anchor_1199 = Set[ 30 ]
    TOKENS_FOLLOWING_A_IN_anchor_1201 = Set[ 9 ]
    TOKENS_FOLLOWING_END_TAG_IN_anchor_1203 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_img_1214 = Set[ 31 ]
    TOKENS_FOLLOWING_IMG_IN_img_1216 = Set[ 32, 34 ]
    TOKENS_FOLLOWING_id_IN_img_1219 = Set[ 32, 34 ]
    TOKENS_FOLLOWING_style_IN_img_1221 = Set[ 32, 34 ]
    TOKENS_FOLLOWING_klass_IN_img_1223 = Set[ 32, 34 ]
    TOKENS_FOLLOWING_align_IN_img_1225 = Set[ 32, 34 ]
    TOKENS_FOLLOWING_src_IN_img_1227 = Set[ 32, 34 ]
    TOKENS_FOLLOWING_alt_IN_img_1229 = Set[ 32, 34 ]
    TOKENS_FOLLOWING_width_IN_img_1231 = Set[ 32, 34 ]
    TOKENS_FOLLOWING_height_IN_img_1233 = Set[ 32, 34 ]
    TOKENS_FOLLOWING_END_NOPAIR_TAG_IN_img_1239 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_br_1253 = Set[ 33 ]
    TOKENS_FOLLOWING_BR_IN_br_1255 = Set[ 32 ]
    TOKENS_FOLLOWING_END_NOPAIR_TAG_IN_br_1259 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_id_1273 = Set[ 35 ]
    TOKENS_FOLLOWING_ID_IN_id_1275 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_id_1277 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_style_1290 = Set[ 36 ]
    TOKENS_FOLLOWING_STYLE_IN_style_1292 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_style_1294 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_klass_1307 = Set[ 37 ]
    TOKENS_FOLLOWING_CLASS_IN_klass_1309 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_klass_1311 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_bgcolor_1326 = Set[ 38 ]
    TOKENS_FOLLOWING_BGCOLOR_IN_bgcolor_1328 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_bgcolor_1330 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_background_1345 = Set[ 39 ]
    TOKENS_FOLLOWING_BACKGROUND_IN_background_1347 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_background_1349 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_align_1364 = Set[ 40 ]
    TOKENS_FOLLOWING_ALIGN_IN_align_1366 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_align_1368 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_src_1383 = Set[ 41 ]
    TOKENS_FOLLOWING_SRC_IN_src_1385 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_src_1387 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_alt_1402 = Set[ 42 ]
    TOKENS_FOLLOWING_ALT_IN_alt_1404 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_alt_1406 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_width_1421 = Set[ 43 ]
    TOKENS_FOLLOWING_WIDTH_IN_width_1423 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_width_1425 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_height_1440 = Set[ 44 ]
    TOKENS_FOLLOWING_HEIGHT_IN_height_1442 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_height_1444 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_bordercolor_1459 = Set[ 45 ]
    TOKENS_FOLLOWING_BORDERCOLOR_IN_bordercolor_1461 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_bordercolor_1463 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_valign_1478 = Set[ 46 ]
    TOKENS_FOLLOWING_VALIGN_IN_valign_1480 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_valign_1482 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_border_1497 = Set[ 47 ]
    TOKENS_FOLLOWING_BORDER_IN_border_1499 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_border_1501 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_href_1516 = Set[ 48 ]
    TOKENS_FOLLOWING_HREF_IN_href_1518 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_href_1520 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_name_1535 = Set[ 49 ]
    TOKENS_FOLLOWING_ANAME_IN_name_1537 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_name_1539 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_target_1554 = Set[ 50 ]
    TOKENS_FOLLOWING_TARGET_IN_target_1556 = Set[ 34, 51 ]
    TOKENS_FOLLOWING_attr_svalue_IN_target_1558 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_attr_svalue_1576 = Set[ 51 ]
    TOKENS_FOLLOWING_ASSIGN_IN_attr_svalue_1579 = Set[ 34, 52 ]
    TOKENS_FOLLOWING_WS_IN_attr_svalue_1581 = Set[ 52 ]
    TOKENS_FOLLOWING_SVALUE_IN_attr_svalue_1584 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

