#!/usr/bin/env ruby
#
# ../lib/htmlparser/HtmlParser.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: ../lib/htmlparser/HtmlParser.g
# Generated at: 2011-12-25 02:20:54
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
    define_tokens( :END_TAG => 8, :CLASS => 36, :BORDERCOLOR => 44, :LETTER => 52, 
                   :HEAD => 10, :HREF => 47, :VALIGN => 45, :TABLE => 26, 
                   :HTML => 7, :ID => 34, :EOF => -1, :BORDER => 46, :PCDATA => 12, 
                   :NAME => 54, :BACKGROUND => 38, :ALT => 41, :BODY => 13, 
                   :DIGIT => 55, :ALIGN => 39, :IMG => 31, :TD => 29, :A => 30, 
                   :BR => 33, :B => 24, :TH => 28, :HEIGHT => 43, :ANAME => 48, 
                   :I => 23, :TR => 27, :SRC => 40, :U => 25, :P => 20, 
                   :TARGET => 49, :END_NOPAIR_TAG => 32, :TAG => 4, :NAMECHAR => 53, 
                   :BGCOLOR => 37, :CLOSING_TAG => 9, :SVALUE => 51, :WS => 22, 
                   :ASSIGN => 50, :WIDTH => 42, :STYLE => 35, :H6 => 19, 
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


  class Parser < ANTLR3::Parser
    @grammar_home = HtmlParser
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :document, :html, :head, :head_element, :title, :body, 
                     :body_tag, :body_content, :heading, :block, :font, 
                     :special, :text_tag, :text, :h1, :h2, :h3, :h4, :h5, 
                     :h6, :heading_data, :paragraph, :div, :italic, :bold, 
                     :underline, :table, :tr, :tr_data, :th, :td, :anchor, 
                     :img, :br, :id, :style, :klass, :bgcolor, :background, 
                     :align, :src, :alt, :width, :height, :bordercolor, 
                     :valign, :border, :href, :name, :target, :attr_svalue ].freeze


    include TokenData

    begin
      generated_using( "../lib/htmlparser/HtmlParser.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end

    def initialize( input, options = {} )
      super( input, options )


    end

      require 'colorize'
      
      @tagMode = false 
      
      #def print()
      #  @input.each do |token|
      #    puts token_name(token.type)
      #  end
      #end

         def recover( re )
        exit
      end

         
       def error_message(e=$!)
         $stderr.puts "Problem in formatting found!".colorize(:red)
         #puts "error message"
       	# $!         The exception information message set by 'raise'.
        #puts e.class
        #puts (e.input.at(e.input.position+2)).text
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
            i=1
            while token_name((e.input.at(e.input.position-i)).type)=="WS"
              i+=1;
            end
            
            #puts token_name((e.input.at(e.input.position+1)).type)
            
            if(!((e.input.at(e.input.position-i)).nil?) && token_name((e.input.at(e.input.position-i)).type)=="CLOSING_TAG")
              "Mismatched input: found </#{e.token}> expecting </#{(token_name(e.expecting)).downcase}>"
            elsif(!((e.input.at(e.input.position-i)).nil?) && token_name((e.input.at(e.input.position-i)).type)=="OPENING_TAG")
              "Mismatched input: found <#{e.token}> expecting <#{(token_name(e.expecting)).downcase}>"
            elsif(!((e.input.at(e.input.position)).nil?) && token_name((e.input.at(e.input.position)).type)=="NAME")
              "Missing quotations around attribute #{(e.input.at(e.input.position)).text}"
            elsif(!(e.input.at(e.input.position+1)).nil? && (e.input.at(e.input.position+1)).type==NAME)
              "Unknown attribute name, or this attribute cannot be used with given tag: "<< (e.input.at(e.input.position+1)).text
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
    # (in ../lib/htmlparser/HtmlParser.g)
    # 100:1: document : html ;
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


        # at line 100:11: html
        @state.following.push( TOKENS_FOLLOWING_html_IN_document_36 )
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
    # (in ../lib/htmlparser/HtmlParser.g)
    # 102:1: html : OPENING_TAG HTML END_TAG ( head )? ( body )? CLOSING_TAG HTML END_TAG -> ^( TAG HTML ( head )? ( body )? ) ;
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
        # at line 104:4: OPENING_TAG HTML END_TAG ( head )? ( body )? CLOSING_TAG HTML END_TAG
        __OPENING_TAG2__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_html_50 )
        stream_OPENING_TAG.add( __OPENING_TAG2__ )
        __HTML3__ = match( HTML, TOKENS_FOLLOWING_HTML_IN_html_52 )
        stream_HTML.add( __HTML3__ )
        __END_TAG4__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_html_54 )
        stream_END_TAG.add( __END_TAG4__ )
        # at line 105:3: ( head )?
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
          # at line 105:4: head
          @state.following.push( TOKENS_FOLLOWING_head_IN_html_60 )
          head5 = head
          @state.following.pop
          stream_head.add( head5.tree )

        end
        # at line 106:3: ( body )?
        alt_2 = 2
        look_2_0 = @input.peek( 1 )

        if ( look_2_0 == OPENING_TAG )
          alt_2 = 1
        end
        case alt_2
        when 1
          # at line 106:4: body
          @state.following.push( TOKENS_FOLLOWING_body_IN_html_67 )
          body6 = body
          @state.following.pop
          stream_body.add( body6.tree )

        end
        __CLOSING_TAG7__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_html_73 )
        stream_CLOSING_TAG.add( __CLOSING_TAG7__ )
        __HTML8__ = match( HTML, TOKENS_FOLLOWING_HTML_IN_html_75 )
        stream_HTML.add( __HTML8__ )
        __END_TAG9__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_html_77 )
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
        # 107:28: -> ^( TAG HTML ( head )? ( body )? )
        # at line 107:31: ^( TAG HTML ( head )? ( body )? )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_HTML.next_node )
        # at line 107:42: ( head )?
        if stream_head.has_next?
          @adaptor.add_child( root_1, stream_head.next_tree )

        end

        stream_head.reset();
        # at line 107:50: ( body )?
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
    # (in ../lib/htmlparser/HtmlParser.g)
    # 110:1: head : OPENING_TAG HEAD END_TAG ( head_element )? CLOSING_TAG HEAD END_TAG -> ^( TAG HEAD ( head_element )? ) ;
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
        # at line 110:8: OPENING_TAG HEAD END_TAG ( head_element )? CLOSING_TAG HEAD END_TAG
        __OPENING_TAG10__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_head_105 )
        stream_OPENING_TAG.add( __OPENING_TAG10__ )
        __HEAD11__ = match( HEAD, TOKENS_FOLLOWING_HEAD_IN_head_107 )
        stream_HEAD.add( __HEAD11__ )
        __END_TAG12__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_head_109 )
        stream_END_TAG.add( __END_TAG12__ )
        # at line 111:3: ( head_element )?
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0 == OPENING_TAG )
          alt_3 = 1
        end
        case alt_3
        when 1
          # at line 111:4: head_element
          @state.following.push( TOKENS_FOLLOWING_head_element_IN_head_114 )
          head_element13 = head_element
          @state.following.pop
          stream_head_element.add( head_element13.tree )

        end
        __CLOSING_TAG14__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_head_120 )
        stream_CLOSING_TAG.add( __CLOSING_TAG14__ )
        __HEAD15__ = match( HEAD, TOKENS_FOLLOWING_HEAD_IN_head_122 )
        stream_HEAD.add( __HEAD15__ )
        __END_TAG16__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_head_124 )
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
        # 112:28: -> ^( TAG HEAD ( head_element )? )
        # at line 112:31: ^( TAG HEAD ( head_element )? )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_HEAD.next_node )
        # at line 112:42: ( head_element )?
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
    # (in ../lib/htmlparser/HtmlParser.g)
    # 115:1: head_element : title ;
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


        # at line 116:4: title
        @state.following.push( TOKENS_FOLLOWING_title_IN_head_element_148 )
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
    # (in ../lib/htmlparser/HtmlParser.g)
    # 119:1: title : OPENING_TAG TITLE END_TAG ( PCDATA )? CLOSING_TAG TITLE END_TAG -> ^( TAG TITLE ( PCDATA )? ) ;
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
        # at line 120:4: OPENING_TAG TITLE END_TAG ( PCDATA )? CLOSING_TAG TITLE END_TAG
        __OPENING_TAG18__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_title_161 )
        stream_OPENING_TAG.add( __OPENING_TAG18__ )
        __TITLE19__ = match( TITLE, TOKENS_FOLLOWING_TITLE_IN_title_163 )
        stream_TITLE.add( __TITLE19__ )
        __END_TAG20__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_title_165 )
        stream_END_TAG.add( __END_TAG20__ )
        # at line 121:3: ( PCDATA )?
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0 == PCDATA )
          alt_4 = 1
        end
        case alt_4
        when 1
          # at line 121:3: PCDATA
          __PCDATA21__ = match( PCDATA, TOKENS_FOLLOWING_PCDATA_IN_title_169 )
          stream_PCDATA.add( __PCDATA21__ )

        end
        __CLOSING_TAG22__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_title_174 )
        stream_CLOSING_TAG.add( __CLOSING_TAG22__ )
        __TITLE23__ = match( TITLE, TOKENS_FOLLOWING_TITLE_IN_title_176 )
        stream_TITLE.add( __TITLE23__ )
        __END_TAG24__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_title_178 )
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
        # 122:29: -> ^( TAG TITLE ( PCDATA )? )
        # at line 122:32: ^( TAG TITLE ( PCDATA )? )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_TITLE.next_node )
        # at line 122:44: ( PCDATA )?
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
    # (in ../lib/htmlparser/HtmlParser.g)
    # 125:1: body : OPENING_TAG BODY ( id | style | klass | bgcolor | background )* END_TAG ( body_content )* CLOSING_TAG BODY END_TAG -> ^( TAG BODY ( id )* ( style )* ( klass )* ( bgcolor )* ( background )* ( body_content )* ) ;
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
        # at line 125:8: OPENING_TAG BODY ( id | style | klass | bgcolor | background )* END_TAG ( body_content )* CLOSING_TAG BODY END_TAG
        __OPENING_TAG25__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_body_201 )
        stream_OPENING_TAG.add( __OPENING_TAG25__ )
        __BODY26__ = match( BODY, TOKENS_FOLLOWING_BODY_IN_body_203 )
        stream_BODY.add( __BODY26__ )
        # at line 125:25: ( id | style | klass | bgcolor | background )*
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
            # at line 125:26: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_body_206 )
            id27 = id
            @state.following.pop
            stream_id.add( id27.tree )

          when 2
            # at line 125:29: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_body_208 )
            style28 = style
            @state.following.pop
            stream_style.add( style28.tree )

          when 3
            # at line 125:35: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_body_210 )
            klass29 = klass
            @state.following.pop
            stream_klass.add( klass29.tree )

          when 4
            # at line 125:41: bgcolor
            @state.following.push( TOKENS_FOLLOWING_bgcolor_IN_body_212 )
            bgcolor30 = bgcolor
            @state.following.pop
            stream_bgcolor.add( bgcolor30.tree )

          when 5
            # at line 125:49: background
            @state.following.push( TOKENS_FOLLOWING_background_IN_body_214 )
            background31 = background
            @state.following.pop
            stream_background.add( background31.tree )

          else
            break # out of loop for decision 5
          end
        end # loop for decision 5
        __END_TAG32__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_body_218 )
        stream_END_TAG.add( __END_TAG32__ )
        # at line 127:4: ( body_content )*
        while true # decision 6
          alt_6 = 2
          look_6_0 = @input.peek( 1 )

          if ( look_6_0 == OPENING_TAG || look_6_0 == PCDATA )
            alt_6 = 1

          end
          case alt_6
          when 1
            # at line 127:5: body_content
            @state.following.push( TOKENS_FOLLOWING_body_content_IN_body_228 )
            body_content33 = body_content
            @state.following.pop
            stream_body_content.add( body_content33.tree )

          else
            break # out of loop for decision 6
          end
        end # loop for decision 6
        __CLOSING_TAG34__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_body_236 )
        stream_CLOSING_TAG.add( __CLOSING_TAG34__ )
        __BODY35__ = match( BODY, TOKENS_FOLLOWING_BODY_IN_body_238 )
        stream_BODY.add( __BODY35__ )
        __END_TAG36__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_body_240 )
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
        # 128:29: -> ^( TAG BODY ( id )* ( style )* ( klass )* ( bgcolor )* ( background )* ( body_content )* )
        # at line 128:32: ^( TAG BODY ( id )* ( style )* ( klass )* ( bgcolor )* ( background )* ( body_content )* )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_BODY.next_node )
        # at line 128:43: ( id )*
        while stream_id.has_next?
          @adaptor.add_child( root_1, stream_id.next_tree )

        end

        stream_id.reset();
        # at line 128:47: ( style )*
        while stream_style.has_next?
          @adaptor.add_child( root_1, stream_style.next_tree )

        end

        stream_style.reset();
        # at line 128:54: ( klass )*
        while stream_klass.has_next?
          @adaptor.add_child( root_1, stream_klass.next_tree )

        end

        stream_klass.reset();
        # at line 128:61: ( bgcolor )*
        while stream_bgcolor.has_next?
          @adaptor.add_child( root_1, stream_bgcolor.next_tree )

        end

        stream_bgcolor.reset();
        # at line 128:70: ( background )*
        while stream_background.has_next?
          @adaptor.add_child( root_1, stream_background.next_tree )

        end

        stream_background.reset();
        # at line 128:82: ( body_content )*
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
    # (in ../lib/htmlparser/HtmlParser.g)
    # 135:1: body_tag : ( heading | block );
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
        # at line 136:2: ( heading | block )
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


          # at line 136:4: heading
          @state.following.push( TOKENS_FOLLOWING_heading_IN_body_tag_283 )
          heading37 = heading
          @state.following.pop
          @adaptor.add_child( root_0, heading37.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 137:4: block
          @state.following.push( TOKENS_FOLLOWING_block_IN_body_tag_289 )
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
    # (in ../lib/htmlparser/HtmlParser.g)
    # 140:1: body_content : ( body_tag | text );
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
        # at line 141:2: ( body_tag | text )
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


          # at line 141:4: body_tag
          @state.following.push( TOKENS_FOLLOWING_body_tag_IN_body_content_300 )
          body_tag39 = body_tag
          @state.following.pop
          @adaptor.add_child( root_0, body_tag39.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 142:4: text
          @state.following.push( TOKENS_FOLLOWING_text_IN_body_content_306 )
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
    # (in ../lib/htmlparser/HtmlParser.g)
    # 145:1: heading : ( h1 | h2 | h3 | h4 | h5 | h6 );
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
        # at line 146:2: ( h1 | h2 | h3 | h4 | h5 | h6 )
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


          # at line 146:4: h1
          @state.following.push( TOKENS_FOLLOWING_h1_IN_heading_319 )
          h141 = h1
          @state.following.pop
          @adaptor.add_child( root_0, h141.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 146:9: h2
          @state.following.push( TOKENS_FOLLOWING_h2_IN_heading_323 )
          h242 = h2
          @state.following.pop
          @adaptor.add_child( root_0, h242.tree )

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 146:14: h3
          @state.following.push( TOKENS_FOLLOWING_h3_IN_heading_327 )
          h343 = h3
          @state.following.pop
          @adaptor.add_child( root_0, h343.tree )

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 146:19: h4
          @state.following.push( TOKENS_FOLLOWING_h4_IN_heading_331 )
          h444 = h4
          @state.following.pop
          @adaptor.add_child( root_0, h444.tree )

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 146:24: h5
          @state.following.push( TOKENS_FOLLOWING_h5_IN_heading_335 )
          h545 = h5
          @state.following.pop
          @adaptor.add_child( root_0, h545.tree )

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 146:29: h6
          @state.following.push( TOKENS_FOLLOWING_h6_IN_heading_339 )
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
    # (in ../lib/htmlparser/HtmlParser.g)
    # 149:1: block : ( paragraph | div | table );
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
        # at line 150:2: ( paragraph | div | table )
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


          # at line 150:4: paragraph
          @state.following.push( TOKENS_FOLLOWING_paragraph_IN_block_351 )
          paragraph47 = paragraph
          @state.following.pop
          @adaptor.add_child( root_0, paragraph47.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 151:4: div
          @state.following.push( TOKENS_FOLLOWING_div_IN_block_356 )
          div48 = div
          @state.following.pop
          @adaptor.add_child( root_0, div48.tree )

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 152:4: table
          @state.following.push( TOKENS_FOLLOWING_table_IN_block_361 )
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
    # (in ../lib/htmlparser/HtmlParser.g)
    # 155:1: font : ( italic | bold | underline );
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
        # at line 156:2: ( italic | bold | underline )
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


          # at line 156:4: italic
          @state.following.push( TOKENS_FOLLOWING_italic_IN_font_373 )
          italic50 = italic
          @state.following.pop
          @adaptor.add_child( root_0, italic50.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 157:4: bold
          @state.following.push( TOKENS_FOLLOWING_bold_IN_font_378 )
          bold51 = bold
          @state.following.pop
          @adaptor.add_child( root_0, bold51.tree )

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 158:4: underline
          @state.following.push( TOKENS_FOLLOWING_underline_IN_font_383 )
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
    # (in ../lib/htmlparser/HtmlParser.g)
    # 161:1: special : ( anchor | img | br );
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
        # at line 162:2: ( anchor | img | br )
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


          # at line 162:4: anchor
          @state.following.push( TOKENS_FOLLOWING_anchor_IN_special_395 )
          anchor53 = anchor
          @state.following.pop
          @adaptor.add_child( root_0, anchor53.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 163:4: img
          @state.following.push( TOKENS_FOLLOWING_img_IN_special_401 )
          img54 = img
          @state.following.pop
          @adaptor.add_child( root_0, img54.tree )

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 164:4: br
          @state.following.push( TOKENS_FOLLOWING_br_IN_special_406 )
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
    # (in ../lib/htmlparser/HtmlParser.g)
    # 167:1: text_tag : ( font | special );
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
        # at line 168:2: ( font | special )
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


          # at line 168:4: font
          @state.following.push( TOKENS_FOLLOWING_font_IN_text_tag_418 )
          font56 = font
          @state.following.pop
          @adaptor.add_child( root_0, font56.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 169:4: special
          @state.following.push( TOKENS_FOLLOWING_special_IN_text_tag_424 )
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
    # (in ../lib/htmlparser/HtmlParser.g)
    # 172:1: text : ( PCDATA -> ^( DATA PCDATA ) | text_tag );
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
        # at line 173:3: ( PCDATA -> ^( DATA PCDATA ) | text_tag )
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
          # at line 173:5: PCDATA
          __PCDATA58__ = match( PCDATA, TOKENS_FOLLOWING_PCDATA_IN_text_437 )
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
          # 173:12: -> ^( DATA PCDATA )
          # at line 173:15: ^( DATA PCDATA )
          root_1 = @adaptor.create_flat_list
          root_1 = @adaptor.become_root( @adaptor.create_from_type( DATA, "DATA" ), root_1 )

          @adaptor.add_child( root_1, stream_PCDATA.next_node )

          @adaptor.add_child( root_0, root_1 )



          return_value.tree = root_0

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 174:4: text_tag
          @state.following.push( TOKENS_FOLLOWING_text_tag_IN_text_450 )
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
    # (in ../lib/htmlparser/HtmlParser.g)
    # 180:1: h1 : OPENING_TAG H1 ( id | style | klass | align )* END_TAG ( heading_data )* CLOSING_TAG H1 END_TAG -> ^( TAG H1 ( id )* ( style )* ( klass )* ( align )* ( heading_data )* ) ;
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
        # at line 180:6: OPENING_TAG H1 ( id | style | klass | align )* END_TAG ( heading_data )* CLOSING_TAG H1 END_TAG
        __OPENING_TAG60__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_h1_467 )
        stream_OPENING_TAG.add( __OPENING_TAG60__ )
        __H161__ = match( H1, TOKENS_FOLLOWING_H1_IN_h1_469 )
        stream_H1.add( __H161__ )
        # at line 180:21: ( id | style | klass | align )*
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
            # at line 180:22: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_h1_472 )
            id62 = id
            @state.following.pop
            stream_id.add( id62.tree )

          when 2
            # at line 180:25: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_h1_474 )
            style63 = style
            @state.following.pop
            stream_style.add( style63.tree )

          when 3
            # at line 180:31: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_h1_476 )
            klass64 = klass
            @state.following.pop
            stream_klass.add( klass64.tree )

          when 4
            # at line 180:37: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_h1_478 )
            align65 = align
            @state.following.pop
            stream_align.add( align65.tree )

          else
            break # out of loop for decision 15
          end
        end # loop for decision 15
        __END_TAG66__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h1_482 )
        stream_END_TAG.add( __END_TAG66__ )
        # at line 181:3: ( heading_data )*
        while true # decision 16
          alt_16 = 2
          look_16_0 = @input.peek( 1 )

          if ( look_16_0 == OPENING_TAG || look_16_0 == PCDATA )
            alt_16 = 1

          end
          case alt_16
          when 1
            # at line 181:3: heading_data
            @state.following.push( TOKENS_FOLLOWING_heading_data_IN_h1_486 )
            heading_data67 = heading_data
            @state.following.pop
            stream_heading_data.add( heading_data67.tree )

          else
            break # out of loop for decision 16
          end
        end # loop for decision 16
        __CLOSING_TAG68__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_h1_491 )
        stream_CLOSING_TAG.add( __CLOSING_TAG68__ )
        __H169__ = match( H1, TOKENS_FOLLOWING_H1_IN_h1_493 )
        stream_H1.add( __H169__ )
        __END_TAG70__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h1_495 )
        stream_END_TAG.add( __END_TAG70__ )
        # AST Rewrite
        # elements: H1, align, heading_data, style, klass, id
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 182:27: -> ^( TAG H1 ( id )* ( style )* ( klass )* ( align )* ( heading_data )* )
        # at line 182:30: ^( TAG H1 ( id )* ( style )* ( klass )* ( align )* ( heading_data )* )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_H1.next_node )
        # at line 182:39: ( id )*
        while stream_id.has_next?
          @adaptor.add_child( root_1, stream_id.next_tree )

        end

        stream_id.reset();
        # at line 182:43: ( style )*
        while stream_style.has_next?
          @adaptor.add_child( root_1, stream_style.next_tree )

        end

        stream_style.reset();
        # at line 182:50: ( klass )*
        while stream_klass.has_next?
          @adaptor.add_child( root_1, stream_klass.next_tree )

        end

        stream_klass.reset();
        # at line 182:57: ( align )*
        while stream_align.has_next?
          @adaptor.add_child( root_1, stream_align.next_tree )

        end

        stream_align.reset();
        # at line 182:64: ( heading_data )*
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
    # (in ../lib/htmlparser/HtmlParser.g)
    # 185:1: h2 : OPENING_TAG H2 ( id | style | klass | align )* END_TAG ( heading_data )* CLOSING_TAG H2 END_TAG -> ^( TAG H2 ( id )* ( style )* ( klass )* ( align )* ( heading_data )* ) ;
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
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_H2 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token H2" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_id = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule id" )
      stream_style = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule style" )
      stream_klass = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule klass" )
      stream_align = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule align" )
      stream_heading_data = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule heading_data" )
      begin
        # at line 185:6: OPENING_TAG H2 ( id | style | klass | align )* END_TAG ( heading_data )* CLOSING_TAG H2 END_TAG
        __OPENING_TAG71__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_h2_530 )
        stream_OPENING_TAG.add( __OPENING_TAG71__ )
        __H272__ = match( H2, TOKENS_FOLLOWING_H2_IN_h2_532 )
        stream_H2.add( __H272__ )
        # at line 185:21: ( id | style | klass | align )*
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
            # at line 185:22: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_h2_535 )
            id73 = id
            @state.following.pop
            stream_id.add( id73.tree )

          when 2
            # at line 185:25: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_h2_537 )
            style74 = style
            @state.following.pop
            stream_style.add( style74.tree )

          when 3
            # at line 185:31: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_h2_539 )
            klass75 = klass
            @state.following.pop
            stream_klass.add( klass75.tree )

          when 4
            # at line 185:37: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_h2_541 )
            align76 = align
            @state.following.pop
            stream_align.add( align76.tree )

          else
            break # out of loop for decision 17
          end
        end # loop for decision 17
        __END_TAG77__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h2_545 )
        stream_END_TAG.add( __END_TAG77__ )
        # at line 186:3: ( heading_data )*
        while true # decision 18
          alt_18 = 2
          look_18_0 = @input.peek( 1 )

          if ( look_18_0 == OPENING_TAG || look_18_0 == PCDATA )
            alt_18 = 1

          end
          case alt_18
          when 1
            # at line 186:3: heading_data
            @state.following.push( TOKENS_FOLLOWING_heading_data_IN_h2_549 )
            heading_data78 = heading_data
            @state.following.pop
            stream_heading_data.add( heading_data78.tree )

          else
            break # out of loop for decision 18
          end
        end # loop for decision 18
        __CLOSING_TAG79__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_h2_554 )
        stream_CLOSING_TAG.add( __CLOSING_TAG79__ )
        __H280__ = match( H2, TOKENS_FOLLOWING_H2_IN_h2_556 )
        stream_H2.add( __H280__ )
        __END_TAG81__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h2_558 )
        stream_END_TAG.add( __END_TAG81__ )
        # AST Rewrite
        # elements: heading_data, klass, id, style, H2, align
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 187:26: -> ^( TAG H2 ( id )* ( style )* ( klass )* ( align )* ( heading_data )* )
        # at line 187:29: ^( TAG H2 ( id )* ( style )* ( klass )* ( align )* ( heading_data )* )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_H2.next_node )
        # at line 187:38: ( id )*
        while stream_id.has_next?
          @adaptor.add_child( root_1, stream_id.next_tree )

        end

        stream_id.reset();
        # at line 187:42: ( style )*
        while stream_style.has_next?
          @adaptor.add_child( root_1, stream_style.next_tree )

        end

        stream_style.reset();
        # at line 187:49: ( klass )*
        while stream_klass.has_next?
          @adaptor.add_child( root_1, stream_klass.next_tree )

        end

        stream_klass.reset();
        # at line 187:56: ( align )*
        while stream_align.has_next?
          @adaptor.add_child( root_1, stream_align.next_tree )

        end

        stream_align.reset();
        # at line 187:63: ( heading_data )*
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
        # trace_out( __method__, 16 )

      end
      
      return return_value
    end

    H3ReturnValue = define_return_scope 

    # 
    # parser rule h3
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 190:1: h3 : OPENING_TAG H3 ( id | style | klass | align )* END_TAG ( heading_data )* CLOSING_TAG H3 END_TAG -> ^( TAG H3 ( id )* ( style )* ( klass )* ( align )* ( heading_data )* ) ;
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
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_H3 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token H3" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_id = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule id" )
      stream_style = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule style" )
      stream_klass = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule klass" )
      stream_align = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule align" )
      stream_heading_data = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule heading_data" )
      begin
        # at line 190:6: OPENING_TAG H3 ( id | style | klass | align )* END_TAG ( heading_data )* CLOSING_TAG H3 END_TAG
        __OPENING_TAG82__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_h3_592 )
        stream_OPENING_TAG.add( __OPENING_TAG82__ )
        __H383__ = match( H3, TOKENS_FOLLOWING_H3_IN_h3_594 )
        stream_H3.add( __H383__ )
        # at line 190:21: ( id | style | klass | align )*
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
            # at line 190:22: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_h3_597 )
            id84 = id
            @state.following.pop
            stream_id.add( id84.tree )

          when 2
            # at line 190:25: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_h3_599 )
            style85 = style
            @state.following.pop
            stream_style.add( style85.tree )

          when 3
            # at line 190:31: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_h3_601 )
            klass86 = klass
            @state.following.pop
            stream_klass.add( klass86.tree )

          when 4
            # at line 190:37: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_h3_603 )
            align87 = align
            @state.following.pop
            stream_align.add( align87.tree )

          else
            break # out of loop for decision 19
          end
        end # loop for decision 19
        __END_TAG88__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h3_607 )
        stream_END_TAG.add( __END_TAG88__ )
        # at line 191:3: ( heading_data )*
        while true # decision 20
          alt_20 = 2
          look_20_0 = @input.peek( 1 )

          if ( look_20_0 == OPENING_TAG || look_20_0 == PCDATA )
            alt_20 = 1

          end
          case alt_20
          when 1
            # at line 191:3: heading_data
            @state.following.push( TOKENS_FOLLOWING_heading_data_IN_h3_611 )
            heading_data89 = heading_data
            @state.following.pop
            stream_heading_data.add( heading_data89.tree )

          else
            break # out of loop for decision 20
          end
        end # loop for decision 20
        __CLOSING_TAG90__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_h3_616 )
        stream_CLOSING_TAG.add( __CLOSING_TAG90__ )
        __H391__ = match( H3, TOKENS_FOLLOWING_H3_IN_h3_618 )
        stream_H3.add( __H391__ )
        __END_TAG92__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h3_620 )
        stream_END_TAG.add( __END_TAG92__ )
        # AST Rewrite
        # elements: heading_data, klass, id, align, style, H3
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 192:26: -> ^( TAG H3 ( id )* ( style )* ( klass )* ( align )* ( heading_data )* )
        # at line 192:29: ^( TAG H3 ( id )* ( style )* ( klass )* ( align )* ( heading_data )* )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_H3.next_node )
        # at line 192:38: ( id )*
        while stream_id.has_next?
          @adaptor.add_child( root_1, stream_id.next_tree )

        end

        stream_id.reset();
        # at line 192:42: ( style )*
        while stream_style.has_next?
          @adaptor.add_child( root_1, stream_style.next_tree )

        end

        stream_style.reset();
        # at line 192:49: ( klass )*
        while stream_klass.has_next?
          @adaptor.add_child( root_1, stream_klass.next_tree )

        end

        stream_klass.reset();
        # at line 192:56: ( align )*
        while stream_align.has_next?
          @adaptor.add_child( root_1, stream_align.next_tree )

        end

        stream_align.reset();
        # at line 192:63: ( heading_data )*
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
        # trace_out( __method__, 17 )

      end
      
      return return_value
    end

    H4ReturnValue = define_return_scope 

    # 
    # parser rule h4
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 195:1: h4 : OPENING_TAG H4 ( id | style | klass | align )* END_TAG ( heading_data )* CLOSING_TAG H4 END_TAG -> ^( TAG H4 ( id )* ( style )* ( klass )* ( align )* ( heading_data )* ) ;
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
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_H4 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token H4" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_id = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule id" )
      stream_style = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule style" )
      stream_klass = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule klass" )
      stream_align = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule align" )
      stream_heading_data = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule heading_data" )
      begin
        # at line 195:6: OPENING_TAG H4 ( id | style | klass | align )* END_TAG ( heading_data )* CLOSING_TAG H4 END_TAG
        __OPENING_TAG93__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_h4_654 )
        stream_OPENING_TAG.add( __OPENING_TAG93__ )
        __H494__ = match( H4, TOKENS_FOLLOWING_H4_IN_h4_656 )
        stream_H4.add( __H494__ )
        # at line 195:21: ( id | style | klass | align )*
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
            # at line 195:22: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_h4_659 )
            id95 = id
            @state.following.pop
            stream_id.add( id95.tree )

          when 2
            # at line 195:25: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_h4_661 )
            style96 = style
            @state.following.pop
            stream_style.add( style96.tree )

          when 3
            # at line 195:31: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_h4_663 )
            klass97 = klass
            @state.following.pop
            stream_klass.add( klass97.tree )

          when 4
            # at line 195:37: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_h4_665 )
            align98 = align
            @state.following.pop
            stream_align.add( align98.tree )

          else
            break # out of loop for decision 21
          end
        end # loop for decision 21
        __END_TAG99__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h4_669 )
        stream_END_TAG.add( __END_TAG99__ )
        # at line 196:3: ( heading_data )*
        while true # decision 22
          alt_22 = 2
          look_22_0 = @input.peek( 1 )

          if ( look_22_0 == OPENING_TAG || look_22_0 == PCDATA )
            alt_22 = 1

          end
          case alt_22
          when 1
            # at line 196:3: heading_data
            @state.following.push( TOKENS_FOLLOWING_heading_data_IN_h4_673 )
            heading_data100 = heading_data
            @state.following.pop
            stream_heading_data.add( heading_data100.tree )

          else
            break # out of loop for decision 22
          end
        end # loop for decision 22
        __CLOSING_TAG101__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_h4_678 )
        stream_CLOSING_TAG.add( __CLOSING_TAG101__ )
        __H4102__ = match( H4, TOKENS_FOLLOWING_H4_IN_h4_680 )
        stream_H4.add( __H4102__ )
        __END_TAG103__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h4_682 )
        stream_END_TAG.add( __END_TAG103__ )
        # AST Rewrite
        # elements: klass, H4, align, style, id, heading_data
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 197:26: -> ^( TAG H4 ( id )* ( style )* ( klass )* ( align )* ( heading_data )* )
        # at line 197:29: ^( TAG H4 ( id )* ( style )* ( klass )* ( align )* ( heading_data )* )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_H4.next_node )
        # at line 197:38: ( id )*
        while stream_id.has_next?
          @adaptor.add_child( root_1, stream_id.next_tree )

        end

        stream_id.reset();
        # at line 197:42: ( style )*
        while stream_style.has_next?
          @adaptor.add_child( root_1, stream_style.next_tree )

        end

        stream_style.reset();
        # at line 197:49: ( klass )*
        while stream_klass.has_next?
          @adaptor.add_child( root_1, stream_klass.next_tree )

        end

        stream_klass.reset();
        # at line 197:56: ( align )*
        while stream_align.has_next?
          @adaptor.add_child( root_1, stream_align.next_tree )

        end

        stream_align.reset();
        # at line 197:63: ( heading_data )*
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
        # trace_out( __method__, 18 )

      end
      
      return return_value
    end

    H5ReturnValue = define_return_scope 

    # 
    # parser rule h5
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 200:1: h5 : OPENING_TAG H5 ( id | style | klass | align )* END_TAG ( heading_data )* CLOSING_TAG H5 END_TAG -> ^( TAG H5 ( id )* ( style )* ( klass )* ( align )* ( heading_data )* ) ;
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
      stream_H5 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token H5" )
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_id = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule id" )
      stream_style = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule style" )
      stream_klass = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule klass" )
      stream_align = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule align" )
      stream_heading_data = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule heading_data" )
      begin
        # at line 200:6: OPENING_TAG H5 ( id | style | klass | align )* END_TAG ( heading_data )* CLOSING_TAG H5 END_TAG
        __OPENING_TAG104__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_h5_716 )
        stream_OPENING_TAG.add( __OPENING_TAG104__ )
        __H5105__ = match( H5, TOKENS_FOLLOWING_H5_IN_h5_718 )
        stream_H5.add( __H5105__ )
        # at line 200:21: ( id | style | klass | align )*
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
            # at line 200:22: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_h5_721 )
            id106 = id
            @state.following.pop
            stream_id.add( id106.tree )

          when 2
            # at line 200:25: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_h5_723 )
            style107 = style
            @state.following.pop
            stream_style.add( style107.tree )

          when 3
            # at line 200:31: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_h5_725 )
            klass108 = klass
            @state.following.pop
            stream_klass.add( klass108.tree )

          when 4
            # at line 200:37: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_h5_727 )
            align109 = align
            @state.following.pop
            stream_align.add( align109.tree )

          else
            break # out of loop for decision 23
          end
        end # loop for decision 23
        __END_TAG110__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h5_731 )
        stream_END_TAG.add( __END_TAG110__ )
        # at line 201:3: ( heading_data )*
        while true # decision 24
          alt_24 = 2
          look_24_0 = @input.peek( 1 )

          if ( look_24_0 == OPENING_TAG || look_24_0 == PCDATA )
            alt_24 = 1

          end
          case alt_24
          when 1
            # at line 201:3: heading_data
            @state.following.push( TOKENS_FOLLOWING_heading_data_IN_h5_735 )
            heading_data111 = heading_data
            @state.following.pop
            stream_heading_data.add( heading_data111.tree )

          else
            break # out of loop for decision 24
          end
        end # loop for decision 24
        __CLOSING_TAG112__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_h5_740 )
        stream_CLOSING_TAG.add( __CLOSING_TAG112__ )
        __H5113__ = match( H5, TOKENS_FOLLOWING_H5_IN_h5_742 )
        stream_H5.add( __H5113__ )
        __END_TAG114__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h5_744 )
        stream_END_TAG.add( __END_TAG114__ )
        # AST Rewrite
        # elements: id, align, heading_data, style, klass, H5
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 202:26: -> ^( TAG H5 ( id )* ( style )* ( klass )* ( align )* ( heading_data )* )
        # at line 202:29: ^( TAG H5 ( id )* ( style )* ( klass )* ( align )* ( heading_data )* )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_H5.next_node )
        # at line 202:38: ( id )*
        while stream_id.has_next?
          @adaptor.add_child( root_1, stream_id.next_tree )

        end

        stream_id.reset();
        # at line 202:42: ( style )*
        while stream_style.has_next?
          @adaptor.add_child( root_1, stream_style.next_tree )

        end

        stream_style.reset();
        # at line 202:49: ( klass )*
        while stream_klass.has_next?
          @adaptor.add_child( root_1, stream_klass.next_tree )

        end

        stream_klass.reset();
        # at line 202:56: ( align )*
        while stream_align.has_next?
          @adaptor.add_child( root_1, stream_align.next_tree )

        end

        stream_align.reset();
        # at line 202:63: ( heading_data )*
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
        # trace_out( __method__, 19 )

      end
      
      return return_value
    end

    H6ReturnValue = define_return_scope 

    # 
    # parser rule h6
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 205:1: h6 : OPENING_TAG H6 ( id | style | klass | align )* END_TAG ( heading_data )* CLOSING_TAG H6 END_TAG -> ^( TAG H6 ( id )* ( style )* ( klass )* ( align )* ( heading_data )* ) ;
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
      stream_H6 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token H6" )
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_id = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule id" )
      stream_style = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule style" )
      stream_klass = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule klass" )
      stream_align = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule align" )
      stream_heading_data = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule heading_data" )
      begin
        # at line 205:6: OPENING_TAG H6 ( id | style | klass | align )* END_TAG ( heading_data )* CLOSING_TAG H6 END_TAG
        __OPENING_TAG115__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_h6_778 )
        stream_OPENING_TAG.add( __OPENING_TAG115__ )
        __H6116__ = match( H6, TOKENS_FOLLOWING_H6_IN_h6_780 )
        stream_H6.add( __H6116__ )
        # at line 205:21: ( id | style | klass | align )*
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
            # at line 205:22: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_h6_783 )
            id117 = id
            @state.following.pop
            stream_id.add( id117.tree )

          when 2
            # at line 205:25: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_h6_785 )
            style118 = style
            @state.following.pop
            stream_style.add( style118.tree )

          when 3
            # at line 205:31: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_h6_787 )
            klass119 = klass
            @state.following.pop
            stream_klass.add( klass119.tree )

          when 4
            # at line 205:37: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_h6_789 )
            align120 = align
            @state.following.pop
            stream_align.add( align120.tree )

          else
            break # out of loop for decision 25
          end
        end # loop for decision 25
        __END_TAG121__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h6_793 )
        stream_END_TAG.add( __END_TAG121__ )
        # at line 206:3: ( heading_data )*
        while true # decision 26
          alt_26 = 2
          look_26_0 = @input.peek( 1 )

          if ( look_26_0 == OPENING_TAG || look_26_0 == PCDATA )
            alt_26 = 1

          end
          case alt_26
          when 1
            # at line 206:3: heading_data
            @state.following.push( TOKENS_FOLLOWING_heading_data_IN_h6_797 )
            heading_data122 = heading_data
            @state.following.pop
            stream_heading_data.add( heading_data122.tree )

          else
            break # out of loop for decision 26
          end
        end # loop for decision 26
        __CLOSING_TAG123__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_h6_802 )
        stream_CLOSING_TAG.add( __CLOSING_TAG123__ )
        __H6124__ = match( H6, TOKENS_FOLLOWING_H6_IN_h6_804 )
        stream_H6.add( __H6124__ )
        __END_TAG125__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_h6_806 )
        stream_END_TAG.add( __END_TAG125__ )
        # AST Rewrite
        # elements: H6, style, klass, heading_data, id, align
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 207:26: -> ^( TAG H6 ( id )* ( style )* ( klass )* ( align )* ( heading_data )* )
        # at line 207:29: ^( TAG H6 ( id )* ( style )* ( klass )* ( align )* ( heading_data )* )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_H6.next_node )
        # at line 207:38: ( id )*
        while stream_id.has_next?
          @adaptor.add_child( root_1, stream_id.next_tree )

        end

        stream_id.reset();
        # at line 207:42: ( style )*
        while stream_style.has_next?
          @adaptor.add_child( root_1, stream_style.next_tree )

        end

        stream_style.reset();
        # at line 207:49: ( klass )*
        while stream_klass.has_next?
          @adaptor.add_child( root_1, stream_klass.next_tree )

        end

        stream_klass.reset();
        # at line 207:56: ( align )*
        while stream_align.has_next?
          @adaptor.add_child( root_1, stream_align.next_tree )

        end

        stream_align.reset();
        # at line 207:63: ( heading_data )*
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
        # trace_out( __method__, 20 )

      end
      
      return return_value
    end

    HeadingDataReturnValue = define_return_scope 

    # 
    # parser rule heading_data
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 210:1: heading_data : ( block | text );
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
        # at line 210:14: ( block | text )
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


          # at line 210:15: block
          @state.following.push( TOKENS_FOLLOWING_block_IN_heading_data_838 )
          block126 = block
          @state.following.pop
          @adaptor.add_child( root_0, block126.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 211:15: text
          @state.following.push( TOKENS_FOLLOWING_text_IN_heading_data_854 )
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
    # (in ../lib/htmlparser/HtmlParser.g)
    # 214:1: paragraph : OPENING_TAG P ( id | style | klass | align )* END_TAG ( text )* CLOSING_TAG P END_TAG -> ^( TAG P ( id )* ( style )* ( klass )* ( align )* ( text )* ) ;
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
        # at line 215:4: OPENING_TAG P ( id | style | klass | align )* END_TAG ( text )* CLOSING_TAG P END_TAG
        __OPENING_TAG128__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_paragraph_878 )
        stream_OPENING_TAG.add( __OPENING_TAG128__ )
        __P129__ = match( P, TOKENS_FOLLOWING_P_IN_paragraph_880 )
        stream_P.add( __P129__ )
        # at line 215:18: ( id | style | klass | align )*
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
            # at line 215:19: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_paragraph_883 )
            id130 = id
            @state.following.pop
            stream_id.add( id130.tree )

          when 2
            # at line 215:22: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_paragraph_885 )
            style131 = style
            @state.following.pop
            stream_style.add( style131.tree )

          when 3
            # at line 215:28: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_paragraph_887 )
            klass132 = klass
            @state.following.pop
            stream_klass.add( klass132.tree )

          when 4
            # at line 215:34: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_paragraph_889 )
            align133 = align
            @state.following.pop
            stream_align.add( align133.tree )

          else
            break # out of loop for decision 28
          end
        end # loop for decision 28
        __END_TAG134__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_paragraph_893 )
        stream_END_TAG.add( __END_TAG134__ )
        # at line 216:3: ( text )*
        while true # decision 29
          alt_29 = 2
          look_29_0 = @input.peek( 1 )

          if ( look_29_0 == OPENING_TAG || look_29_0 == PCDATA )
            alt_29 = 1

          end
          case alt_29
          when 1
            # at line 216:4: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_paragraph_898 )
            text135 = text
            @state.following.pop
            stream_text.add( text135.tree )

          else
            break # out of loop for decision 29
          end
        end # loop for decision 29
        __CLOSING_TAG136__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_paragraph_904 )
        stream_CLOSING_TAG.add( __CLOSING_TAG136__ )
        __P137__ = match( P, TOKENS_FOLLOWING_P_IN_paragraph_906 )
        stream_P.add( __P137__ )
        __END_TAG138__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_paragraph_908 )
        stream_END_TAG.add( __END_TAG138__ )
        # AST Rewrite
        # elements: P, style, klass, align, id, text
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 217:25: -> ^( TAG P ( id )* ( style )* ( klass )* ( align )* ( text )* )
        # at line 217:28: ^( TAG P ( id )* ( style )* ( klass )* ( align )* ( text )* )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_P.next_node )
        # at line 217:36: ( id )*
        while stream_id.has_next?
          @adaptor.add_child( root_1, stream_id.next_tree )

        end

        stream_id.reset();
        # at line 217:40: ( style )*
        while stream_style.has_next?
          @adaptor.add_child( root_1, stream_style.next_tree )

        end

        stream_style.reset();
        # at line 217:47: ( klass )*
        while stream_klass.has_next?
          @adaptor.add_child( root_1, stream_klass.next_tree )

        end

        stream_klass.reset();
        # at line 217:54: ( align )*
        while stream_align.has_next?
          @adaptor.add_child( root_1, stream_align.next_tree )

        end

        stream_align.reset();
        # at line 217:61: ( text )*
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
    # (in ../lib/htmlparser/HtmlParser.g)
    # 220:1: div : OPENING_TAG DIV ( WS )* ( id | style | klass | align )* END_TAG ( body_content )* CLOSING_TAG DIV END_TAG -> ^( TAG DIV ( id )* ( style )* ( klass )* ( align )* ( body_content )* ) ;
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
      __WS141__ = nil
      __END_TAG146__ = nil
      __CLOSING_TAG148__ = nil
      __DIV149__ = nil
      __END_TAG150__ = nil
      id142 = nil
      style143 = nil
      klass144 = nil
      align145 = nil
      body_content147 = nil

      tree_for_OPENING_TAG139 = nil
      tree_for_DIV140 = nil
      tree_for_WS141 = nil
      tree_for_END_TAG146 = nil
      tree_for_CLOSING_TAG148 = nil
      tree_for_DIV149 = nil
      tree_for_END_TAG150 = nil
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_WS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token WS" )
      stream_DIV = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token DIV" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_id = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule id" )
      stream_style = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule style" )
      stream_klass = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule klass" )
      stream_align = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule align" )
      stream_body_content = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule body_content" )
      begin
        # at line 220:7: OPENING_TAG DIV ( WS )* ( id | style | klass | align )* END_TAG ( body_content )* CLOSING_TAG DIV END_TAG
        __OPENING_TAG139__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_div_943 )
        stream_OPENING_TAG.add( __OPENING_TAG139__ )
        __DIV140__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_div_945 )
        stream_DIV.add( __DIV140__ )
        # at line 220:23: ( WS )*
        while true # decision 30
          alt_30 = 2
          look_30_0 = @input.peek( 1 )

          if ( look_30_0 == WS )
            look_30_1 = @input.peek( 2 )

            if ( look_30_1 == END_TAG || look_30_1 == WS )
              alt_30 = 1

            end

          end
          case alt_30
          when 1
            # at line 220:23: WS
            __WS141__ = match( WS, TOKENS_FOLLOWING_WS_IN_div_947 )
            stream_WS.add( __WS141__ )

          else
            break # out of loop for decision 30
          end
        end # loop for decision 30
        # at line 220:27: ( id | style | klass | align )*
        while true # decision 31
          alt_31 = 5
          look_31_0 = @input.peek( 1 )

          if ( look_31_0 == WS )
            case look_31 = @input.peek( 2 )
            when ID then alt_31 = 1
            when STYLE then alt_31 = 2
            when CLASS then alt_31 = 3
            when ALIGN then alt_31 = 4
            end

          end
          case alt_31
          when 1
            # at line 220:28: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_div_951 )
            id142 = id
            @state.following.pop
            stream_id.add( id142.tree )

          when 2
            # at line 220:31: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_div_953 )
            style143 = style
            @state.following.pop
            stream_style.add( style143.tree )

          when 3
            # at line 220:37: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_div_955 )
            klass144 = klass
            @state.following.pop
            stream_klass.add( klass144.tree )

          when 4
            # at line 220:43: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_div_957 )
            align145 = align
            @state.following.pop
            stream_align.add( align145.tree )

          else
            break # out of loop for decision 31
          end
        end # loop for decision 31
        __END_TAG146__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_div_961 )
        stream_END_TAG.add( __END_TAG146__ )
        # at line 221:3: ( body_content )*
        while true # decision 32
          alt_32 = 2
          look_32_0 = @input.peek( 1 )

          if ( look_32_0 == OPENING_TAG || look_32_0 == PCDATA )
            alt_32 = 1

          end
          case alt_32
          when 1
            # at line 221:4: body_content
            @state.following.push( TOKENS_FOLLOWING_body_content_IN_div_966 )
            body_content147 = body_content
            @state.following.pop
            stream_body_content.add( body_content147.tree )

          else
            break # out of loop for decision 32
          end
        end # loop for decision 32
        __CLOSING_TAG148__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_div_972 )
        stream_CLOSING_TAG.add( __CLOSING_TAG148__ )
        __DIV149__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_div_974 )
        stream_DIV.add( __DIV149__ )
        __END_TAG150__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_div_976 )
        stream_END_TAG.add( __END_TAG150__ )
        # AST Rewrite
        # elements: body_content, align, klass, id, DIV, style
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 222:27: -> ^( TAG DIV ( id )* ( style )* ( klass )* ( align )* ( body_content )* )
        # at line 222:30: ^( TAG DIV ( id )* ( style )* ( klass )* ( align )* ( body_content )* )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_DIV.next_node )
        # at line 222:40: ( id )*
        while stream_id.has_next?
          @adaptor.add_child( root_1, stream_id.next_tree )

        end

        stream_id.reset();
        # at line 222:44: ( style )*
        while stream_style.has_next?
          @adaptor.add_child( root_1, stream_style.next_tree )

        end

        stream_style.reset();
        # at line 222:51: ( klass )*
        while stream_klass.has_next?
          @adaptor.add_child( root_1, stream_klass.next_tree )

        end

        stream_klass.reset();
        # at line 222:58: ( align )*
        while stream_align.has_next?
          @adaptor.add_child( root_1, stream_align.next_tree )

        end

        stream_align.reset();
        # at line 222:65: ( body_content )*
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
    # (in ../lib/htmlparser/HtmlParser.g)
    # 226:1: italic : OPENING_TAG I END_TAG ( text )+ CLOSING_TAG I END_TAG -> ^( TAG I ( text )+ ) ;
    # 
    def italic
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = ItalicReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG151__ = nil
      __I152__ = nil
      __END_TAG153__ = nil
      __CLOSING_TAG155__ = nil
      __I156__ = nil
      __END_TAG157__ = nil
      text154 = nil

      tree_for_OPENING_TAG151 = nil
      tree_for_I152 = nil
      tree_for_END_TAG153 = nil
      tree_for_CLOSING_TAG155 = nil
      tree_for_I156 = nil
      tree_for_END_TAG157 = nil
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_I = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token I" )
      stream_text = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule text" )
      begin
        # at line 226:9: OPENING_TAG I END_TAG ( text )+ CLOSING_TAG I END_TAG
        __OPENING_TAG151__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_italic_1013 )
        stream_OPENING_TAG.add( __OPENING_TAG151__ )
        __I152__ = match( I, TOKENS_FOLLOWING_I_IN_italic_1015 )
        stream_I.add( __I152__ )
        __END_TAG153__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_italic_1017 )
        stream_END_TAG.add( __END_TAG153__ )
        # at file 227:3: ( text )+
        match_count_33 = 0
        while true
          alt_33 = 2
          look_33_0 = @input.peek( 1 )

          if ( look_33_0 == OPENING_TAG || look_33_0 == PCDATA )
            alt_33 = 1

          end
          case alt_33
          when 1
            # at line 227:4: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_italic_1022 )
            text154 = text
            @state.following.pop
            stream_text.add( text154.tree )

          else
            match_count_33 > 0 and break
            eee = EarlyExit(33)


            raise eee
          end
          match_count_33 += 1
        end

        __CLOSING_TAG155__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_italic_1028 )
        stream_CLOSING_TAG.add( __CLOSING_TAG155__ )
        __I156__ = match( I, TOKENS_FOLLOWING_I_IN_italic_1030 )
        stream_I.add( __I156__ )
        __END_TAG157__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_italic_1032 )
        stream_END_TAG.add( __END_TAG157__ )
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
        # 228:25: -> ^( TAG I ( text )+ )
        # at line 228:28: ^( TAG I ( text )+ )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_I.next_node )
        # at line 228:36: ( text )+
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
    # (in ../lib/htmlparser/HtmlParser.g)
    # 231:1: bold : OPENING_TAG B END_TAG ( text )+ CLOSING_TAG B END_TAG -> ^( TAG B ( text )+ ) ;
    # 
    def bold
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = BoldReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG158__ = nil
      __B159__ = nil
      __END_TAG160__ = nil
      __CLOSING_TAG162__ = nil
      __B163__ = nil
      __END_TAG164__ = nil
      text161 = nil

      tree_for_OPENING_TAG158 = nil
      tree_for_B159 = nil
      tree_for_END_TAG160 = nil
      tree_for_CLOSING_TAG162 = nil
      tree_for_B163 = nil
      tree_for_END_TAG164 = nil
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_B = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token B" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_text = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule text" )
      begin
        # at line 231:9: OPENING_TAG B END_TAG ( text )+ CLOSING_TAG B END_TAG
        __OPENING_TAG158__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_bold_1061 )
        stream_OPENING_TAG.add( __OPENING_TAG158__ )
        __B159__ = match( B, TOKENS_FOLLOWING_B_IN_bold_1063 )
        stream_B.add( __B159__ )
        __END_TAG160__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_bold_1065 )
        stream_END_TAG.add( __END_TAG160__ )
        # at file 232:3: ( text )+
        match_count_34 = 0
        while true
          alt_34 = 2
          look_34_0 = @input.peek( 1 )

          if ( look_34_0 == OPENING_TAG || look_34_0 == PCDATA )
            alt_34 = 1

          end
          case alt_34
          when 1
            # at line 232:4: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_bold_1070 )
            text161 = text
            @state.following.pop
            stream_text.add( text161.tree )

          else
            match_count_34 > 0 and break
            eee = EarlyExit(34)


            raise eee
          end
          match_count_34 += 1
        end

        __CLOSING_TAG162__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_bold_1076 )
        stream_CLOSING_TAG.add( __CLOSING_TAG162__ )
        __B163__ = match( B, TOKENS_FOLLOWING_B_IN_bold_1078 )
        stream_B.add( __B163__ )
        __END_TAG164__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_bold_1080 )
        stream_END_TAG.add( __END_TAG164__ )
        # AST Rewrite
        # elements: text, B
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 233:25: -> ^( TAG B ( text )+ )
        # at line 233:28: ^( TAG B ( text )+ )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_B.next_node )
        # at line 233:36: ( text )+
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
    # (in ../lib/htmlparser/HtmlParser.g)
    # 236:1: underline : OPENING_TAG U END_TAG ( text )+ CLOSING_TAG U END_TAG -> ^( TAG U ( text )+ ) ;
    # 
    def underline
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = UnderlineReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG165__ = nil
      __U166__ = nil
      __END_TAG167__ = nil
      __CLOSING_TAG169__ = nil
      __U170__ = nil
      __END_TAG171__ = nil
      text168 = nil

      tree_for_OPENING_TAG165 = nil
      tree_for_U166 = nil
      tree_for_END_TAG167 = nil
      tree_for_CLOSING_TAG169 = nil
      tree_for_U170 = nil
      tree_for_END_TAG171 = nil
      stream_U = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token U" )
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_text = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule text" )
      begin
        # at line 236:12: OPENING_TAG U END_TAG ( text )+ CLOSING_TAG U END_TAG
        __OPENING_TAG165__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_underline_1107 )
        stream_OPENING_TAG.add( __OPENING_TAG165__ )
        __U166__ = match( U, TOKENS_FOLLOWING_U_IN_underline_1109 )
        stream_U.add( __U166__ )
        __END_TAG167__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_underline_1111 )
        stream_END_TAG.add( __END_TAG167__ )
        # at file 237:6: ( text )+
        match_count_35 = 0
        while true
          alt_35 = 2
          look_35_0 = @input.peek( 1 )

          if ( look_35_0 == OPENING_TAG || look_35_0 == PCDATA )
            alt_35 = 1

          end
          case alt_35
          when 1
            # at line 237:7: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_underline_1119 )
            text168 = text
            @state.following.pop
            stream_text.add( text168.tree )

          else
            match_count_35 > 0 and break
            eee = EarlyExit(35)


            raise eee
          end
          match_count_35 += 1
        end

        __CLOSING_TAG169__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_underline_1128 )
        stream_CLOSING_TAG.add( __CLOSING_TAG169__ )
        __U170__ = match( U, TOKENS_FOLLOWING_U_IN_underline_1130 )
        stream_U.add( __U170__ )
        __END_TAG171__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_underline_1132 )
        stream_END_TAG.add( __END_TAG171__ )
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
        # 238:28: -> ^( TAG U ( text )+ )
        # at line 238:31: ^( TAG U ( text )+ )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_U.next_node )
        # at line 238:39: ( text )+
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
    # (in ../lib/htmlparser/HtmlParser.g)
    # 242:1: table : OPENING_TAG TABLE ( id | style | klass | align | width | height | background | bgcolor | border )* END_TAG ( tr )+ CLOSING_TAG TABLE END_TAG -> ^( TAG TABLE ( id )* ( style )* ( klass )* ( align )* ( width )* ( height )* ( background )* ( bgcolor )* ( border )* ( tr )+ ) ;
    # 
    def table
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = TableReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG172__ = nil
      __TABLE173__ = nil
      __END_TAG183__ = nil
      __CLOSING_TAG185__ = nil
      __TABLE186__ = nil
      __END_TAG187__ = nil
      id174 = nil
      style175 = nil
      klass176 = nil
      align177 = nil
      width178 = nil
      height179 = nil
      background180 = nil
      bgcolor181 = nil
      border182 = nil
      tr184 = nil

      tree_for_OPENING_TAG172 = nil
      tree_for_TABLE173 = nil
      tree_for_END_TAG183 = nil
      tree_for_CLOSING_TAG185 = nil
      tree_for_TABLE186 = nil
      tree_for_END_TAG187 = nil
      stream_TABLE = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token TABLE" )
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_id = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule id" )
      stream_height = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule height" )
      stream_style = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule style" )
      stream_tr = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule tr" )
      stream_klass = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule klass" )
      stream_align = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule align" )
      stream_width = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule width" )
      stream_background = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule background" )
      stream_border = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule border" )
      stream_bgcolor = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule bgcolor" )
      begin
        # at line 243:4: OPENING_TAG TABLE ( id | style | klass | align | width | height | background | bgcolor | border )* END_TAG ( tr )+ CLOSING_TAG TABLE END_TAG
        __OPENING_TAG172__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_table_1169 )
        stream_OPENING_TAG.add( __OPENING_TAG172__ )
        __TABLE173__ = match( TABLE, TOKENS_FOLLOWING_TABLE_IN_table_1171 )
        stream_TABLE.add( __TABLE173__ )
        # at line 243:22: ( id | style | klass | align | width | height | background | bgcolor | border )*
        while true # decision 36
          alt_36 = 10
          alt_36 = @dfa36.predict( @input )
          case alt_36
          when 1
            # at line 243:23: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_table_1174 )
            id174 = id
            @state.following.pop
            stream_id.add( id174.tree )

          when 2
            # at line 243:26: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_table_1176 )
            style175 = style
            @state.following.pop
            stream_style.add( style175.tree )

          when 3
            # at line 243:32: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_table_1178 )
            klass176 = klass
            @state.following.pop
            stream_klass.add( klass176.tree )

          when 4
            # at line 243:38: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_table_1180 )
            align177 = align
            @state.following.pop
            stream_align.add( align177.tree )

          when 5
            # at line 243:44: width
            @state.following.push( TOKENS_FOLLOWING_width_IN_table_1182 )
            width178 = width
            @state.following.pop
            stream_width.add( width178.tree )

          when 6
            # at line 243:50: height
            @state.following.push( TOKENS_FOLLOWING_height_IN_table_1184 )
            height179 = height
            @state.following.pop
            stream_height.add( height179.tree )

          when 7
            # at line 243:57: background
            @state.following.push( TOKENS_FOLLOWING_background_IN_table_1186 )
            background180 = background
            @state.following.pop
            stream_background.add( background180.tree )

          when 8
            # at line 243:68: bgcolor
            @state.following.push( TOKENS_FOLLOWING_bgcolor_IN_table_1188 )
            bgcolor181 = bgcolor
            @state.following.pop
            stream_bgcolor.add( bgcolor181.tree )

          when 9
            # at line 243:76: border
            @state.following.push( TOKENS_FOLLOWING_border_IN_table_1190 )
            border182 = border
            @state.following.pop
            stream_border.add( border182.tree )

          else
            break # out of loop for decision 36
          end
        end # loop for decision 36
        __END_TAG183__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_table_1194 )
        stream_END_TAG.add( __END_TAG183__ )
        # at file 245:4: ( tr )+
        match_count_37 = 0
        while true
          alt_37 = 2
          look_37_0 = @input.peek( 1 )

          if ( look_37_0 == OPENING_TAG )
            alt_37 = 1

          end
          case alt_37
          when 1
            # at line 245:5: tr
            @state.following.push( TOKENS_FOLLOWING_tr_IN_table_1204 )
            tr184 = tr
            @state.following.pop
            stream_tr.add( tr184.tree )

          else
            match_count_37 > 0 and break
            eee = EarlyExit(37)


            raise eee
          end
          match_count_37 += 1
        end

        __CLOSING_TAG185__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_table_1211 )
        stream_CLOSING_TAG.add( __CLOSING_TAG185__ )
        __TABLE186__ = match( TABLE, TOKENS_FOLLOWING_TABLE_IN_table_1213 )
        stream_TABLE.add( __TABLE186__ )
        __END_TAG187__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_table_1215 )
        stream_END_TAG.add( __END_TAG187__ )
        # AST Rewrite
        # elements: bgcolor, style, id, width, border, klass, tr, background, align, height, TABLE
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 246:30: -> ^( TAG TABLE ( id )* ( style )* ( klass )* ( align )* ( width )* ( height )* ( background )* ( bgcolor )* ( border )* ( tr )+ )
        # at line 246:33: ^( TAG TABLE ( id )* ( style )* ( klass )* ( align )* ( width )* ( height )* ( background )* ( bgcolor )* ( border )* ( tr )+ )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_TABLE.next_node )
        # at line 246:45: ( id )*
        while stream_id.has_next?
          @adaptor.add_child( root_1, stream_id.next_tree )

        end

        stream_id.reset();
        # at line 246:49: ( style )*
        while stream_style.has_next?
          @adaptor.add_child( root_1, stream_style.next_tree )

        end

        stream_style.reset();
        # at line 246:56: ( klass )*
        while stream_klass.has_next?
          @adaptor.add_child( root_1, stream_klass.next_tree )

        end

        stream_klass.reset();
        # at line 246:63: ( align )*
        while stream_align.has_next?
          @adaptor.add_child( root_1, stream_align.next_tree )

        end

        stream_align.reset();
        # at line 246:70: ( width )*
        while stream_width.has_next?
          @adaptor.add_child( root_1, stream_width.next_tree )

        end

        stream_width.reset();
        # at line 246:77: ( height )*
        while stream_height.has_next?
          @adaptor.add_child( root_1, stream_height.next_tree )

        end

        stream_height.reset();
        # at line 246:85: ( background )*
        while stream_background.has_next?
          @adaptor.add_child( root_1, stream_background.next_tree )

        end

        stream_background.reset();
        # at line 246:97: ( bgcolor )*
        while stream_bgcolor.has_next?
          @adaptor.add_child( root_1, stream_bgcolor.next_tree )

        end

        stream_bgcolor.reset();
        # at line 246:106: ( border )*
        while stream_border.has_next?
          @adaptor.add_child( root_1, stream_border.next_tree )

        end

        stream_border.reset();
        # at line 246:114: ( tr )+
        stream_tr.has_next? or raise ANTLR3::RewriteEarlyExit

        while stream_tr.has_next?
          @adaptor.add_child( root_1, stream_tr.next_tree )

        end
        stream_tr.reset

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
        # trace_out( __method__, 27 )

      end
      
      return return_value
    end

    TrReturnValue = define_return_scope 

    # 
    # parser rule tr
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 249:1: tr : OPENING_TAG TR END_TAG ( tr_data )* CLOSING_TAG TR END_TAG -> ^( TAG TR ( tr_data )* ) ;
    # 
    def tr
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = TrReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENING_TAG188__ = nil
      __TR189__ = nil
      __END_TAG190__ = nil
      __CLOSING_TAG192__ = nil
      __TR193__ = nil
      __END_TAG194__ = nil
      tr_data191 = nil

      tree_for_OPENING_TAG188 = nil
      tree_for_TR189 = nil
      tree_for_END_TAG190 = nil
      tree_for_CLOSING_TAG192 = nil
      tree_for_TR193 = nil
      tree_for_END_TAG194 = nil
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_TR = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token TR" )
      stream_tr_data = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule tr_data" )
      begin
        # at line 249:6: OPENING_TAG TR END_TAG ( tr_data )* CLOSING_TAG TR END_TAG
        __OPENING_TAG188__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_tr_1265 )
        stream_OPENING_TAG.add( __OPENING_TAG188__ )
        __TR189__ = match( TR, TOKENS_FOLLOWING_TR_IN_tr_1267 )
        stream_TR.add( __TR189__ )
        __END_TAG190__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_tr_1269 )
        stream_END_TAG.add( __END_TAG190__ )
        # at line 251:4: ( tr_data )*
        while true # decision 38
          alt_38 = 2
          look_38_0 = @input.peek( 1 )

          if ( look_38_0 == OPENING_TAG )
            alt_38 = 1

          end
          case alt_38
          when 1
            # at line 251:5: tr_data
            @state.following.push( TOKENS_FOLLOWING_tr_data_IN_tr_1279 )
            tr_data191 = tr_data
            @state.following.pop
            stream_tr_data.add( tr_data191.tree )

          else
            break # out of loop for decision 38
          end
        end # loop for decision 38
        __CLOSING_TAG192__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_tr_1286 )
        stream_CLOSING_TAG.add( __CLOSING_TAG192__ )
        __TR193__ = match( TR, TOKENS_FOLLOWING_TR_IN_tr_1288 )
        stream_TR.add( __TR193__ )
        __END_TAG194__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_tr_1290 )
        stream_END_TAG.add( __END_TAG194__ )
        # AST Rewrite
        # elements: tr_data, TR
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 252:27: -> ^( TAG TR ( tr_data )* )
        # at line 252:30: ^( TAG TR ( tr_data )* )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_TR.next_node )
        # at line 252:39: ( tr_data )*
        while stream_tr_data.has_next?
          @adaptor.add_child( root_1, stream_tr_data.next_tree )

        end

        stream_tr_data.reset();

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
        # trace_out( __method__, 28 )

      end
      
      return return_value
    end

    TrDataReturnValue = define_return_scope 

    # 
    # parser rule tr_data
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 255:1: tr_data : ( td | th );
    # 
    def tr_data
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = TrDataReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      td195 = nil
      th196 = nil


      begin
        # at line 255:9: ( td | th )
        alt_39 = 2
        look_39_0 = @input.peek( 1 )

        if ( look_39_0 == OPENING_TAG )
          look_39_1 = @input.peek( 2 )

          if ( look_39_1 == TD )
            alt_39 = 1
          elsif ( look_39_1 == TH )
            alt_39 = 2
          else
            raise NoViableAlternative( "", 39, 1 )
          end
        else
          raise NoViableAlternative( "", 39, 0 )
        end
        case alt_39
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 255:11: td
          @state.following.push( TOKENS_FOLLOWING_td_IN_tr_data_1314 )
          td195 = td
          @state.following.pop
          @adaptor.add_child( root_0, td195.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 256:11: th
          @state.following.push( TOKENS_FOLLOWING_th_IN_tr_data_1326 )
          th196 = th
          @state.following.pop
          @adaptor.add_child( root_0, th196.tree )

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
        # trace_out( __method__, 29 )

      end
      
      return return_value
    end

    ThReturnValue = define_return_scope 

    # 
    # parser rule th
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 259:1: th : OPENING_TAG TH ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )* END_TAG ( body_content )* CLOSING_TAG TH END_TAG -> ^( TAG TH ( id )* ( style )* ( klass )* ( align )* ( valign )* ( width )* ( height )* ( background )* ( bgcolor )* ( bordercolor )* ( body_content )* ) ;
    # 
    def th
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
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
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_TH = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token TH" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_id = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule id" )
      stream_bordercolor = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule bordercolor" )
      stream_height = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule height" )
      stream_style = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule style" )
      stream_klass = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule klass" )
      stream_align = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule align" )
      stream_width = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule width" )
      stream_background = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule background" )
      stream_valign = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule valign" )
      stream_body_content = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule body_content" )
      stream_bgcolor = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule bgcolor" )
      begin
        # at line 259:7: OPENING_TAG TH ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )* END_TAG ( body_content )* CLOSING_TAG TH END_TAG
        __OPENING_TAG197__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_th_1344 )
        stream_OPENING_TAG.add( __OPENING_TAG197__ )
        __TH198__ = match( TH, TOKENS_FOLLOWING_TH_IN_th_1346 )
        stream_TH.add( __TH198__ )
        # at line 259:22: ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )*
        while true # decision 40
          alt_40 = 11
          alt_40 = @dfa40.predict( @input )
          case alt_40
          when 1
            # at line 259:23: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_th_1349 )
            id199 = id
            @state.following.pop
            stream_id.add( id199.tree )

          when 2
            # at line 259:26: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_th_1351 )
            style200 = style
            @state.following.pop
            stream_style.add( style200.tree )

          when 3
            # at line 259:32: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_th_1353 )
            klass201 = klass
            @state.following.pop
            stream_klass.add( klass201.tree )

          when 4
            # at line 259:38: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_th_1355 )
            align202 = align
            @state.following.pop
            stream_align.add( align202.tree )

          when 5
            # at line 259:44: valign
            @state.following.push( TOKENS_FOLLOWING_valign_IN_th_1357 )
            valign203 = valign
            @state.following.pop
            stream_valign.add( valign203.tree )

          when 6
            # at line 259:51: width
            @state.following.push( TOKENS_FOLLOWING_width_IN_th_1359 )
            width204 = width
            @state.following.pop
            stream_width.add( width204.tree )

          when 7
            # at line 259:57: height
            @state.following.push( TOKENS_FOLLOWING_height_IN_th_1361 )
            height205 = height
            @state.following.pop
            stream_height.add( height205.tree )

          when 8
            # at line 259:64: background
            @state.following.push( TOKENS_FOLLOWING_background_IN_th_1363 )
            background206 = background
            @state.following.pop
            stream_background.add( background206.tree )

          when 9
            # at line 259:75: bgcolor
            @state.following.push( TOKENS_FOLLOWING_bgcolor_IN_th_1365 )
            bgcolor207 = bgcolor
            @state.following.pop
            stream_bgcolor.add( bgcolor207.tree )

          when 10
            # at line 259:83: bordercolor
            @state.following.push( TOKENS_FOLLOWING_bordercolor_IN_th_1367 )
            bordercolor208 = bordercolor
            @state.following.pop
            stream_bordercolor.add( bordercolor208.tree )

          else
            break # out of loop for decision 40
          end
        end # loop for decision 40
        __END_TAG209__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_th_1371 )
        stream_END_TAG.add( __END_TAG209__ )
        # at line 260:3: ( body_content )*
        while true # decision 41
          alt_41 = 2
          look_41_0 = @input.peek( 1 )

          if ( look_41_0 == OPENING_TAG || look_41_0 == PCDATA )
            alt_41 = 1

          end
          case alt_41
          when 1
            # at line 260:4: body_content
            @state.following.push( TOKENS_FOLLOWING_body_content_IN_th_1376 )
            body_content210 = body_content
            @state.following.pop
            stream_body_content.add( body_content210.tree )

          else
            break # out of loop for decision 41
          end
        end # loop for decision 41
        __CLOSING_TAG211__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_th_1382 )
        stream_CLOSING_TAG.add( __CLOSING_TAG211__ )
        __TH212__ = match( TH, TOKENS_FOLLOWING_TH_IN_th_1384 )
        stream_TH.add( __TH212__ )
        __END_TAG213__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_th_1386 )
        stream_END_TAG.add( __END_TAG213__ )
        # AST Rewrite
        # elements: width, align, TH, height, valign, id, background, bordercolor, bgcolor, body_content, klass, style
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 261:26: -> ^( TAG TH ( id )* ( style )* ( klass )* ( align )* ( valign )* ( width )* ( height )* ( background )* ( bgcolor )* ( bordercolor )* ( body_content )* )
        # at line 261:29: ^( TAG TH ( id )* ( style )* ( klass )* ( align )* ( valign )* ( width )* ( height )* ( background )* ( bgcolor )* ( bordercolor )* ( body_content )* )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_TH.next_node )
        # at line 261:38: ( id )*
        while stream_id.has_next?
          @adaptor.add_child( root_1, stream_id.next_tree )

        end

        stream_id.reset();
        # at line 261:42: ( style )*
        while stream_style.has_next?
          @adaptor.add_child( root_1, stream_style.next_tree )

        end

        stream_style.reset();
        # at line 261:49: ( klass )*
        while stream_klass.has_next?
          @adaptor.add_child( root_1, stream_klass.next_tree )

        end

        stream_klass.reset();
        # at line 261:56: ( align )*
        while stream_align.has_next?
          @adaptor.add_child( root_1, stream_align.next_tree )

        end

        stream_align.reset();
        # at line 261:63: ( valign )*
        while stream_valign.has_next?
          @adaptor.add_child( root_1, stream_valign.next_tree )

        end

        stream_valign.reset();
        # at line 261:71: ( width )*
        while stream_width.has_next?
          @adaptor.add_child( root_1, stream_width.next_tree )

        end

        stream_width.reset();
        # at line 261:78: ( height )*
        while stream_height.has_next?
          @adaptor.add_child( root_1, stream_height.next_tree )

        end

        stream_height.reset();
        # at line 261:86: ( background )*
        while stream_background.has_next?
          @adaptor.add_child( root_1, stream_background.next_tree )

        end

        stream_background.reset();
        # at line 261:98: ( bgcolor )*
        while stream_bgcolor.has_next?
          @adaptor.add_child( root_1, stream_bgcolor.next_tree )

        end

        stream_bgcolor.reset();
        # at line 261:107: ( bordercolor )*
        while stream_bordercolor.has_next?
          @adaptor.add_child( root_1, stream_bordercolor.next_tree )

        end

        stream_bordercolor.reset();
        # at line 261:120: ( body_content )*
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
        # trace_out( __method__, 30 )

      end
      
      return return_value
    end

    TdReturnValue = define_return_scope 

    # 
    # parser rule td
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 264:1: td : OPENING_TAG TD ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )* END_TAG ( body_content )* CLOSING_TAG TD END_TAG -> ^( TAG TD ( id )* ( style )* ( klass )* ( align )* ( valign )* ( width )* ( height )* ( background )* ( bgcolor )* ( bordercolor )* ( body_content )* ) ;
    # 
    def td
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
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
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_TD = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token TD" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_id = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule id" )
      stream_bordercolor = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule bordercolor" )
      stream_height = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule height" )
      stream_style = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule style" )
      stream_klass = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule klass" )
      stream_align = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule align" )
      stream_width = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule width" )
      stream_background = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule background" )
      stream_valign = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule valign" )
      stream_body_content = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule body_content" )
      stream_bgcolor = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule bgcolor" )
      begin
        # at line 264:7: OPENING_TAG TD ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )* END_TAG ( body_content )* CLOSING_TAG TD END_TAG
        __OPENING_TAG214__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_td_1440 )
        stream_OPENING_TAG.add( __OPENING_TAG214__ )
        __TD215__ = match( TD, TOKENS_FOLLOWING_TD_IN_td_1442 )
        stream_TD.add( __TD215__ )
        # at line 264:22: ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )*
        while true # decision 42
          alt_42 = 11
          alt_42 = @dfa42.predict( @input )
          case alt_42
          when 1
            # at line 264:23: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_td_1445 )
            id216 = id
            @state.following.pop
            stream_id.add( id216.tree )

          when 2
            # at line 264:26: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_td_1447 )
            style217 = style
            @state.following.pop
            stream_style.add( style217.tree )

          when 3
            # at line 264:32: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_td_1449 )
            klass218 = klass
            @state.following.pop
            stream_klass.add( klass218.tree )

          when 4
            # at line 264:38: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_td_1451 )
            align219 = align
            @state.following.pop
            stream_align.add( align219.tree )

          when 5
            # at line 264:44: valign
            @state.following.push( TOKENS_FOLLOWING_valign_IN_td_1453 )
            valign220 = valign
            @state.following.pop
            stream_valign.add( valign220.tree )

          when 6
            # at line 264:51: width
            @state.following.push( TOKENS_FOLLOWING_width_IN_td_1455 )
            width221 = width
            @state.following.pop
            stream_width.add( width221.tree )

          when 7
            # at line 264:57: height
            @state.following.push( TOKENS_FOLLOWING_height_IN_td_1457 )
            height222 = height
            @state.following.pop
            stream_height.add( height222.tree )

          when 8
            # at line 264:64: background
            @state.following.push( TOKENS_FOLLOWING_background_IN_td_1459 )
            background223 = background
            @state.following.pop
            stream_background.add( background223.tree )

          when 9
            # at line 264:75: bgcolor
            @state.following.push( TOKENS_FOLLOWING_bgcolor_IN_td_1461 )
            bgcolor224 = bgcolor
            @state.following.pop
            stream_bgcolor.add( bgcolor224.tree )

          when 10
            # at line 264:83: bordercolor
            @state.following.push( TOKENS_FOLLOWING_bordercolor_IN_td_1463 )
            bordercolor225 = bordercolor
            @state.following.pop
            stream_bordercolor.add( bordercolor225.tree )

          else
            break # out of loop for decision 42
          end
        end # loop for decision 42
        __END_TAG226__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_td_1467 )
        stream_END_TAG.add( __END_TAG226__ )
        # at line 265:3: ( body_content )*
        while true # decision 43
          alt_43 = 2
          look_43_0 = @input.peek( 1 )

          if ( look_43_0 == OPENING_TAG || look_43_0 == PCDATA )
            alt_43 = 1

          end
          case alt_43
          when 1
            # at line 265:4: body_content
            @state.following.push( TOKENS_FOLLOWING_body_content_IN_td_1472 )
            body_content227 = body_content
            @state.following.pop
            stream_body_content.add( body_content227.tree )

          else
            break # out of loop for decision 43
          end
        end # loop for decision 43
        __CLOSING_TAG228__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_td_1478 )
        stream_CLOSING_TAG.add( __CLOSING_TAG228__ )
        __TD229__ = match( TD, TOKENS_FOLLOWING_TD_IN_td_1480 )
        stream_TD.add( __TD229__ )
        __END_TAG230__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_td_1482 )
        stream_END_TAG.add( __END_TAG230__ )
        # AST Rewrite
        # elements: background, bgcolor, klass, id, style, valign, body_content, align, bordercolor, height, width, TD
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 266:26: -> ^( TAG TD ( id )* ( style )* ( klass )* ( align )* ( valign )* ( width )* ( height )* ( background )* ( bgcolor )* ( bordercolor )* ( body_content )* )
        # at line 266:29: ^( TAG TD ( id )* ( style )* ( klass )* ( align )* ( valign )* ( width )* ( height )* ( background )* ( bgcolor )* ( bordercolor )* ( body_content )* )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_TD.next_node )
        # at line 266:38: ( id )*
        while stream_id.has_next?
          @adaptor.add_child( root_1, stream_id.next_tree )

        end

        stream_id.reset();
        # at line 266:42: ( style )*
        while stream_style.has_next?
          @adaptor.add_child( root_1, stream_style.next_tree )

        end

        stream_style.reset();
        # at line 266:49: ( klass )*
        while stream_klass.has_next?
          @adaptor.add_child( root_1, stream_klass.next_tree )

        end

        stream_klass.reset();
        # at line 266:56: ( align )*
        while stream_align.has_next?
          @adaptor.add_child( root_1, stream_align.next_tree )

        end

        stream_align.reset();
        # at line 266:63: ( valign )*
        while stream_valign.has_next?
          @adaptor.add_child( root_1, stream_valign.next_tree )

        end

        stream_valign.reset();
        # at line 266:71: ( width )*
        while stream_width.has_next?
          @adaptor.add_child( root_1, stream_width.next_tree )

        end

        stream_width.reset();
        # at line 266:78: ( height )*
        while stream_height.has_next?
          @adaptor.add_child( root_1, stream_height.next_tree )

        end

        stream_height.reset();
        # at line 266:86: ( background )*
        while stream_background.has_next?
          @adaptor.add_child( root_1, stream_background.next_tree )

        end

        stream_background.reset();
        # at line 266:98: ( bgcolor )*
        while stream_bgcolor.has_next?
          @adaptor.add_child( root_1, stream_bgcolor.next_tree )

        end

        stream_bgcolor.reset();
        # at line 266:107: ( bordercolor )*
        while stream_bordercolor.has_next?
          @adaptor.add_child( root_1, stream_bordercolor.next_tree )

        end

        stream_bordercolor.reset();
        # at line 266:120: ( body_content )*
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
        # trace_out( __method__, 31 )

      end
      
      return return_value
    end

    AnchorReturnValue = define_return_scope 

    # 
    # parser rule anchor
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 270:1: anchor : OPENING_TAG A ( id | style | klass | align | href | name | target )* END_TAG ( text )* CLOSING_TAG A END_TAG -> ^( TAG A ( id )* ( style )* ( klass )* ( align )* ( href )* ( name )* ( target )* ( text )* ) ;
    # 
    def anchor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
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
      stream_CLOSING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token CLOSING_TAG" )
      stream_END_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_TAG" )
      stream_A = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token A" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )
      stream_id = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule id" )
      stream_text = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule text" )
      stream_style = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule style" )
      stream_klass = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule klass" )
      stream_align = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule align" )
      stream_name = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule name" )
      stream_target = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule target" )
      stream_href = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule href" )
      begin
        # at line 270:9: OPENING_TAG A ( id | style | klass | align | href | name | target )* END_TAG ( text )* CLOSING_TAG A END_TAG
        __OPENING_TAG231__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_anchor_1537 )
        stream_OPENING_TAG.add( __OPENING_TAG231__ )
        __A232__ = match( A, TOKENS_FOLLOWING_A_IN_anchor_1539 )
        stream_A.add( __A232__ )
        # at line 270:23: ( id | style | klass | align | href | name | target )*
        while true # decision 44
          alt_44 = 8
          alt_44 = @dfa44.predict( @input )
          case alt_44
          when 1
            # at line 270:24: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_anchor_1542 )
            id233 = id
            @state.following.pop
            stream_id.add( id233.tree )

          when 2
            # at line 270:27: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_anchor_1544 )
            style234 = style
            @state.following.pop
            stream_style.add( style234.tree )

          when 3
            # at line 270:33: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_anchor_1546 )
            klass235 = klass
            @state.following.pop
            stream_klass.add( klass235.tree )

          when 4
            # at line 270:39: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_anchor_1548 )
            align236 = align
            @state.following.pop
            stream_align.add( align236.tree )

          when 5
            # at line 270:45: href
            @state.following.push( TOKENS_FOLLOWING_href_IN_anchor_1550 )
            href237 = href
            @state.following.pop
            stream_href.add( href237.tree )

          when 6
            # at line 270:50: name
            @state.following.push( TOKENS_FOLLOWING_name_IN_anchor_1552 )
            name238 = name
            @state.following.pop
            stream_name.add( name238.tree )

          when 7
            # at line 270:55: target
            @state.following.push( TOKENS_FOLLOWING_target_IN_anchor_1554 )
            target239 = target
            @state.following.pop
            stream_target.add( target239.tree )

          else
            break # out of loop for decision 44
          end
        end # loop for decision 44
        __END_TAG240__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_anchor_1558 )
        stream_END_TAG.add( __END_TAG240__ )
        # at line 271:3: ( text )*
        while true # decision 45
          alt_45 = 2
          look_45_0 = @input.peek( 1 )

          if ( look_45_0 == OPENING_TAG || look_45_0 == PCDATA )
            alt_45 = 1

          end
          case alt_45
          when 1
            # at line 271:4: text
            @state.following.push( TOKENS_FOLLOWING_text_IN_anchor_1563 )
            text241 = text
            @state.following.pop
            stream_text.add( text241.tree )

          else
            break # out of loop for decision 45
          end
        end # loop for decision 45
        __CLOSING_TAG242__ = match( CLOSING_TAG, TOKENS_FOLLOWING_CLOSING_TAG_IN_anchor_1569 )
        stream_CLOSING_TAG.add( __CLOSING_TAG242__ )
        __A243__ = match( A, TOKENS_FOLLOWING_A_IN_anchor_1571 )
        stream_A.add( __A243__ )
        __END_TAG244__ = match( END_TAG, TOKENS_FOLLOWING_END_TAG_IN_anchor_1573 )
        stream_END_TAG.add( __END_TAG244__ )
        # AST Rewrite
        # elements: align, text, id, name, klass, target, A, href, style
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 272:25: -> ^( TAG A ( id )* ( style )* ( klass )* ( align )* ( href )* ( name )* ( target )* ( text )* )
        # at line 272:28: ^( TAG A ( id )* ( style )* ( klass )* ( align )* ( href )* ( name )* ( target )* ( text )* )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_A.next_node )
        # at line 272:36: ( id )*
        while stream_id.has_next?
          @adaptor.add_child( root_1, stream_id.next_tree )

        end

        stream_id.reset();
        # at line 272:40: ( style )*
        while stream_style.has_next?
          @adaptor.add_child( root_1, stream_style.next_tree )

        end

        stream_style.reset();
        # at line 272:47: ( klass )*
        while stream_klass.has_next?
          @adaptor.add_child( root_1, stream_klass.next_tree )

        end

        stream_klass.reset();
        # at line 272:54: ( align )*
        while stream_align.has_next?
          @adaptor.add_child( root_1, stream_align.next_tree )

        end

        stream_align.reset();
        # at line 272:61: ( href )*
        while stream_href.has_next?
          @adaptor.add_child( root_1, stream_href.next_tree )

        end

        stream_href.reset();
        # at line 272:67: ( name )*
        while stream_name.has_next?
          @adaptor.add_child( root_1, stream_name.next_tree )

        end

        stream_name.reset();
        # at line 272:73: ( target )*
        while stream_target.has_next?
          @adaptor.add_child( root_1, stream_target.next_tree )

        end

        stream_target.reset();
        # at line 272:81: ( text )*
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
        # trace_out( __method__, 32 )

      end
      
      return return_value
    end

    ImgReturnValue = define_return_scope 

    # 
    # parser rule img
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 275:1: img : OPENING_TAG IMG ( id | style | klass | align | src | alt | width | height )* END_NOPAIR_TAG -> ^( TAG IMG ( id )* ( style )* ( klass )* ( align )* ( src )* ( alt )* ( width )* ( height )* ) ;
    # 
    def img
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
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
        # at line 275:6: OPENING_TAG IMG ( id | style | klass | align | src | alt | width | height )* END_NOPAIR_TAG
        __OPENING_TAG245__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_img_1618 )
        stream_OPENING_TAG.add( __OPENING_TAG245__ )
        __IMG246__ = match( IMG, TOKENS_FOLLOWING_IMG_IN_img_1620 )
        stream_IMG.add( __IMG246__ )
        # at line 275:22: ( id | style | klass | align | src | alt | width | height )*
        while true # decision 46
          alt_46 = 9
          alt_46 = @dfa46.predict( @input )
          case alt_46
          when 1
            # at line 275:23: id
            @state.following.push( TOKENS_FOLLOWING_id_IN_img_1623 )
            id247 = id
            @state.following.pop
            stream_id.add( id247.tree )

          when 2
            # at line 275:26: style
            @state.following.push( TOKENS_FOLLOWING_style_IN_img_1625 )
            style248 = style
            @state.following.pop
            stream_style.add( style248.tree )

          when 3
            # at line 275:32: klass
            @state.following.push( TOKENS_FOLLOWING_klass_IN_img_1627 )
            klass249 = klass
            @state.following.pop
            stream_klass.add( klass249.tree )

          when 4
            # at line 275:38: align
            @state.following.push( TOKENS_FOLLOWING_align_IN_img_1629 )
            align250 = align
            @state.following.pop
            stream_align.add( align250.tree )

          when 5
            # at line 275:44: src
            @state.following.push( TOKENS_FOLLOWING_src_IN_img_1631 )
            src251 = src
            @state.following.pop
            stream_src.add( src251.tree )

          when 6
            # at line 275:48: alt
            @state.following.push( TOKENS_FOLLOWING_alt_IN_img_1633 )
            alt252 = alt
            @state.following.pop
            stream_alt.add( alt252.tree )

          when 7
            # at line 275:52: width
            @state.following.push( TOKENS_FOLLOWING_width_IN_img_1635 )
            width253 = width
            @state.following.pop
            stream_width.add( width253.tree )

          when 8
            # at line 275:58: height
            @state.following.push( TOKENS_FOLLOWING_height_IN_img_1637 )
            height254 = height
            @state.following.pop
            stream_height.add( height254.tree )

          else
            break # out of loop for decision 46
          end
        end # loop for decision 46
        __END_NOPAIR_TAG255__ = match( END_NOPAIR_TAG, TOKENS_FOLLOWING_END_NOPAIR_TAG_IN_img_1643 )
        stream_END_NOPAIR_TAG.add( __END_NOPAIR_TAG255__ )
        # AST Rewrite
        # elements: style, alt, align, IMG, id, src, width, height, klass
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 276:18: -> ^( TAG IMG ( id )* ( style )* ( klass )* ( align )* ( src )* ( alt )* ( width )* ( height )* )
        # at line 276:21: ^( TAG IMG ( id )* ( style )* ( klass )* ( align )* ( src )* ( alt )* ( width )* ( height )* )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( TAG, "TAG" ), root_1 )

        @adaptor.add_child( root_1, stream_IMG.next_node )
        # at line 276:31: ( id )*
        while stream_id.has_next?
          @adaptor.add_child( root_1, stream_id.next_tree )

        end

        stream_id.reset();
        # at line 276:35: ( style )*
        while stream_style.has_next?
          @adaptor.add_child( root_1, stream_style.next_tree )

        end

        stream_style.reset();
        # at line 276:42: ( klass )*
        while stream_klass.has_next?
          @adaptor.add_child( root_1, stream_klass.next_tree )

        end

        stream_klass.reset();
        # at line 276:49: ( align )*
        while stream_align.has_next?
          @adaptor.add_child( root_1, stream_align.next_tree )

        end

        stream_align.reset();
        # at line 276:56: ( src )*
        while stream_src.has_next?
          @adaptor.add_child( root_1, stream_src.next_tree )

        end

        stream_src.reset();
        # at line 276:61: ( alt )*
        while stream_alt.has_next?
          @adaptor.add_child( root_1, stream_alt.next_tree )

        end

        stream_alt.reset();
        # at line 276:66: ( width )*
        while stream_width.has_next?
          @adaptor.add_child( root_1, stream_width.next_tree )

        end

        stream_width.reset();
        # at line 276:73: ( height )*
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
        # trace_out( __method__, 33 )

      end
      
      return return_value
    end

    BrReturnValue = define_return_scope 

    # 
    # parser rule br
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 279:1: br : OPENING_TAG BR END_NOPAIR_TAG -> ^( TAG BR ) ;
    # 
    def br
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
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
      stream_BR = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token BR" )
      stream_END_NOPAIR_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token END_NOPAIR_TAG" )
      stream_OPENING_TAG = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token OPENING_TAG" )

      begin
        # at line 279:5: OPENING_TAG BR END_NOPAIR_TAG
        __OPENING_TAG256__ = match( OPENING_TAG, TOKENS_FOLLOWING_OPENING_TAG_IN_br_1689 )
        stream_OPENING_TAG.add( __OPENING_TAG256__ )
        __BR257__ = match( BR, TOKENS_FOLLOWING_BR_IN_br_1691 )
        stream_BR.add( __BR257__ )
        __END_NOPAIR_TAG258__ = match( END_NOPAIR_TAG, TOKENS_FOLLOWING_END_NOPAIR_TAG_IN_br_1695 )
        stream_END_NOPAIR_TAG.add( __END_NOPAIR_TAG258__ )
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
        # 280:17: -> ^( TAG BR )
        # at line 280:20: ^( TAG BR )
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
        # trace_out( __method__, 34 )

      end
      
      return return_value
    end

    IdReturnValue = define_return_scope 

    # 
    # parser rule id
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 285:1: id : WS ID attr_svalue -> ^( ID attr_svalue ) ;
    # 
    def id
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
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
        # at line 285:4: WS ID attr_svalue
        __WS259__ = match( WS, TOKENS_FOLLOWING_WS_IN_id_1717 )
        stream_WS.add( __WS259__ )
        __ID260__ = match( ID, TOKENS_FOLLOWING_ID_IN_id_1719 )
        stream_ID.add( __ID260__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_id_1721 )
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
        # 285:22: -> ^( ID attr_svalue )
        # at line 285:25: ^( ID attr_svalue )
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
        # trace_out( __method__, 35 )

      end
      
      return return_value
    end

    StyleReturnValue = define_return_scope 

    # 
    # parser rule style
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 286:1: style : WS STYLE attr_svalue -> ^( STYLE attr_svalue ) ;
    # 
    def style
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
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
        # at line 286:7: WS STYLE attr_svalue
        __WS262__ = match( WS, TOKENS_FOLLOWING_WS_IN_style_1734 )
        stream_WS.add( __WS262__ )
        __STYLE263__ = match( STYLE, TOKENS_FOLLOWING_STYLE_IN_style_1736 )
        stream_STYLE.add( __STYLE263__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_style_1738 )
        attr_svalue264 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue264.tree )
        # AST Rewrite
        # elements: STYLE, attr_svalue
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 286:28: -> ^( STYLE attr_svalue )
        # at line 286:31: ^( STYLE attr_svalue )
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
        # trace_out( __method__, 36 )

      end
      
      return return_value
    end

    KlassReturnValue = define_return_scope 

    # 
    # parser rule klass
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 287:1: klass : WS CLASS attr_svalue -> ^( CLASS attr_svalue ) ;
    # 
    def klass
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
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
        # at line 287:7: WS CLASS attr_svalue
        __WS265__ = match( WS, TOKENS_FOLLOWING_WS_IN_klass_1751 )
        stream_WS.add( __WS265__ )
        __CLASS266__ = match( CLASS, TOKENS_FOLLOWING_CLASS_IN_klass_1753 )
        stream_CLASS.add( __CLASS266__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_klass_1755 )
        attr_svalue267 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue267.tree )
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
        # 287:28: -> ^( CLASS attr_svalue )
        # at line 287:31: ^( CLASS attr_svalue )
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
        # trace_out( __method__, 37 )

      end
      
      return return_value
    end

    BgcolorReturnValue = define_return_scope 

    # 
    # parser rule bgcolor
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 289:1: bgcolor : WS BGCOLOR attr_svalue -> ^( BGCOLOR attr_svalue ) ;
    # 
    def bgcolor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
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
        # at line 289:9: WS BGCOLOR attr_svalue
        __WS268__ = match( WS, TOKENS_FOLLOWING_WS_IN_bgcolor_1770 )
        stream_WS.add( __WS268__ )
        __BGCOLOR269__ = match( BGCOLOR, TOKENS_FOLLOWING_BGCOLOR_IN_bgcolor_1772 )
        stream_BGCOLOR.add( __BGCOLOR269__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_bgcolor_1774 )
        attr_svalue270 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue270.tree )
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
        # 289:32: -> ^( BGCOLOR attr_svalue )
        # at line 289:35: ^( BGCOLOR attr_svalue )
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
        # trace_out( __method__, 38 )

      end
      
      return return_value
    end

    BackgroundReturnValue = define_return_scope 

    # 
    # parser rule background
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 291:1: background : WS BACKGROUND attr_svalue -> ^( BACKGROUND attr_svalue ) ;
    # 
    def background
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )
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
        # at line 291:13: WS BACKGROUND attr_svalue
        __WS271__ = match( WS, TOKENS_FOLLOWING_WS_IN_background_1789 )
        stream_WS.add( __WS271__ )
        __BACKGROUND272__ = match( BACKGROUND, TOKENS_FOLLOWING_BACKGROUND_IN_background_1791 )
        stream_BACKGROUND.add( __BACKGROUND272__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_background_1793 )
        attr_svalue273 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue273.tree )
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
        # 291:39: -> ^( BACKGROUND attr_svalue )
        # at line 291:42: ^( BACKGROUND attr_svalue )
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
        # trace_out( __method__, 39 )

      end
      
      return return_value
    end

    AlignReturnValue = define_return_scope 

    # 
    # parser rule align
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 293:1: align : WS ALIGN attr_svalue -> ^( ALIGN attr_svalue ) ;
    # 
    def align
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )
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
        # at line 293:8: WS ALIGN attr_svalue
        __WS274__ = match( WS, TOKENS_FOLLOWING_WS_IN_align_1808 )
        stream_WS.add( __WS274__ )
        __ALIGN275__ = match( ALIGN, TOKENS_FOLLOWING_ALIGN_IN_align_1810 )
        stream_ALIGN.add( __ALIGN275__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_align_1812 )
        attr_svalue276 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue276.tree )
        # AST Rewrite
        # elements: attr_svalue, ALIGN
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 293:29: -> ^( ALIGN attr_svalue )
        # at line 293:32: ^( ALIGN attr_svalue )
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
        # trace_out( __method__, 40 )

      end
      
      return return_value
    end

    SrcReturnValue = define_return_scope 

    # 
    # parser rule src
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 295:1: src : WS SRC attr_svalue -> ^( SRC attr_svalue ) ;
    # 
    def src
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )
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
        # at line 295:6: WS SRC attr_svalue
        __WS277__ = match( WS, TOKENS_FOLLOWING_WS_IN_src_1827 )
        stream_WS.add( __WS277__ )
        __SRC278__ = match( SRC, TOKENS_FOLLOWING_SRC_IN_src_1829 )
        stream_SRC.add( __SRC278__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_src_1831 )
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
        # 295:25: -> ^( SRC attr_svalue )
        # at line 295:28: ^( SRC attr_svalue )
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
        # trace_out( __method__, 41 )

      end
      
      return return_value
    end

    AltReturnValue = define_return_scope 

    # 
    # parser rule alt
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 297:1: alt : WS ALT attr_svalue -> ^( ALT attr_svalue ) ;
    # 
    def alt
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )
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
        # at line 297:6: WS ALT attr_svalue
        __WS280__ = match( WS, TOKENS_FOLLOWING_WS_IN_alt_1846 )
        stream_WS.add( __WS280__ )
        __ALT281__ = match( ALT, TOKENS_FOLLOWING_ALT_IN_alt_1848 )
        stream_ALT.add( __ALT281__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_alt_1850 )
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
        # 297:25: -> ^( ALT attr_svalue )
        # at line 297:28: ^( ALT attr_svalue )
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
        # trace_out( __method__, 42 )

      end
      
      return return_value
    end

    WidthReturnValue = define_return_scope 

    # 
    # parser rule width
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 299:1: width : WS WIDTH attr_svalue -> ^( WIDTH attr_svalue ) ;
    # 
    def width
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )
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
        # at line 299:8: WS WIDTH attr_svalue
        __WS283__ = match( WS, TOKENS_FOLLOWING_WS_IN_width_1865 )
        stream_WS.add( __WS283__ )
        __WIDTH284__ = match( WIDTH, TOKENS_FOLLOWING_WIDTH_IN_width_1867 )
        stream_WIDTH.add( __WIDTH284__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_width_1869 )
        attr_svalue285 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue285.tree )
        # AST Rewrite
        # elements: attr_svalue, WIDTH
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 299:29: -> ^( WIDTH attr_svalue )
        # at line 299:32: ^( WIDTH attr_svalue )
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
        # trace_out( __method__, 43 )

      end
      
      return return_value
    end

    HeightReturnValue = define_return_scope 

    # 
    # parser rule height
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 301:1: height : WS HEIGHT attr_svalue -> ^( HEIGHT attr_svalue ) ;
    # 
    def height
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )
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
        # at line 301:9: WS HEIGHT attr_svalue
        __WS286__ = match( WS, TOKENS_FOLLOWING_WS_IN_height_1884 )
        stream_WS.add( __WS286__ )
        __HEIGHT287__ = match( HEIGHT, TOKENS_FOLLOWING_HEIGHT_IN_height_1886 )
        stream_HEIGHT.add( __HEIGHT287__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_height_1888 )
        attr_svalue288 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue288.tree )
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
        # 301:31: -> ^( HEIGHT attr_svalue )
        # at line 301:34: ^( HEIGHT attr_svalue )
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
        # trace_out( __method__, 44 )

      end
      
      return return_value
    end

    BordercolorReturnValue = define_return_scope 

    # 
    # parser rule bordercolor
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 303:1: bordercolor : WS BORDERCOLOR attr_svalue -> ^( BORDERCOLOR attr_svalue ) ;
    # 
    def bordercolor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )
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
        # at line 303:14: WS BORDERCOLOR attr_svalue
        __WS289__ = match( WS, TOKENS_FOLLOWING_WS_IN_bordercolor_1903 )
        stream_WS.add( __WS289__ )
        __BORDERCOLOR290__ = match( BORDERCOLOR, TOKENS_FOLLOWING_BORDERCOLOR_IN_bordercolor_1905 )
        stream_BORDERCOLOR.add( __BORDERCOLOR290__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_bordercolor_1907 )
        attr_svalue291 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue291.tree )
        # AST Rewrite
        # elements: BORDERCOLOR, attr_svalue
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 303:41: -> ^( BORDERCOLOR attr_svalue )
        # at line 303:44: ^( BORDERCOLOR attr_svalue )
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
        # trace_out( __method__, 45 )

      end
      
      return return_value
    end

    ValignReturnValue = define_return_scope 

    # 
    # parser rule valign
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 305:1: valign : WS VALIGN attr_svalue -> ^( VALIGN attr_svalue ) ;
    # 
    def valign
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )
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
        # at line 305:9: WS VALIGN attr_svalue
        __WS292__ = match( WS, TOKENS_FOLLOWING_WS_IN_valign_1922 )
        stream_WS.add( __WS292__ )
        __VALIGN293__ = match( VALIGN, TOKENS_FOLLOWING_VALIGN_IN_valign_1924 )
        stream_VALIGN.add( __VALIGN293__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_valign_1926 )
        attr_svalue294 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue294.tree )
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
        # 305:31: -> ^( VALIGN attr_svalue )
        # at line 305:34: ^( VALIGN attr_svalue )
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
        # trace_out( __method__, 46 )

      end
      
      return return_value
    end

    BorderReturnValue = define_return_scope 

    # 
    # parser rule border
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 307:1: border : WS BORDER attr_svalue -> ^( BORDER attr_svalue ) ;
    # 
    def border
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )
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
        # at line 307:9: WS BORDER attr_svalue
        __WS295__ = match( WS, TOKENS_FOLLOWING_WS_IN_border_1941 )
        stream_WS.add( __WS295__ )
        __BORDER296__ = match( BORDER, TOKENS_FOLLOWING_BORDER_IN_border_1943 )
        stream_BORDER.add( __BORDER296__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_border_1945 )
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
        # 307:31: -> ^( BORDER attr_svalue )
        # at line 307:34: ^( BORDER attr_svalue )
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
        # trace_out( __method__, 47 )

      end
      
      return return_value
    end

    HrefReturnValue = define_return_scope 

    # 
    # parser rule href
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 309:1: href : WS HREF attr_svalue -> ^( HREF attr_svalue ) ;
    # 
    def href
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 48 )
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
        # at line 309:7: WS HREF attr_svalue
        __WS298__ = match( WS, TOKENS_FOLLOWING_WS_IN_href_1960 )
        stream_WS.add( __WS298__ )
        __HREF299__ = match( HREF, TOKENS_FOLLOWING_HREF_IN_href_1962 )
        stream_HREF.add( __HREF299__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_href_1964 )
        attr_svalue300 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue300.tree )
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
        # 309:27: -> ^( HREF attr_svalue )
        # at line 309:30: ^( HREF attr_svalue )
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
        # trace_out( __method__, 48 )

      end
      
      return return_value
    end

    NameReturnValue = define_return_scope 

    # 
    # parser rule name
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 311:1: name : WS ANAME attr_svalue -> ^( ANAME attr_svalue ) ;
    # 
    def name
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 49 )
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
        # at line 311:7: WS ANAME attr_svalue
        __WS301__ = match( WS, TOKENS_FOLLOWING_WS_IN_name_1979 )
        stream_WS.add( __WS301__ )
        __ANAME302__ = match( ANAME, TOKENS_FOLLOWING_ANAME_IN_name_1981 )
        stream_ANAME.add( __ANAME302__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_name_1983 )
        attr_svalue303 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue303.tree )
        # AST Rewrite
        # elements: attr_svalue, ANAME
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 

        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 311:28: -> ^( ANAME attr_svalue )
        # at line 311:31: ^( ANAME attr_svalue )
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
        # trace_out( __method__, 49 )

      end
      
      return return_value
    end

    TargetReturnValue = define_return_scope 

    # 
    # parser rule target
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 313:1: target : WS TARGET attr_svalue -> ^( TARGET attr_svalue ) ;
    # 
    def target
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 50 )
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
        # at line 313:9: WS TARGET attr_svalue
        __WS304__ = match( WS, TOKENS_FOLLOWING_WS_IN_target_1998 )
        stream_WS.add( __WS304__ )
        __TARGET305__ = match( TARGET, TOKENS_FOLLOWING_TARGET_IN_target_2000 )
        stream_TARGET.add( __TARGET305__ )
        @state.following.push( TOKENS_FOLLOWING_attr_svalue_IN_target_2002 )
        attr_svalue306 = attr_svalue
        @state.following.pop
        stream_attr_svalue.add( attr_svalue306.tree )
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
        # 313:31: -> ^( TARGET attr_svalue )
        # at line 313:34: ^( TARGET attr_svalue )
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
        # trace_out( __method__, 50 )

      end
      
      return return_value
    end

    AttrSvalueReturnValue = define_return_scope 

    # 
    # parser rule attr_svalue
    # 
    # (in ../lib/htmlparser/HtmlParser.g)
    # 316:1: attr_svalue : ( WS )? ASSIGN ( WS )? SVALUE -> ^( ASSIGN SVALUE ) ;
    # 
    def attr_svalue
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 51 )
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
        # at line 316:14: ( WS )? ASSIGN ( WS )? SVALUE
        # at line 316:14: ( WS )?
        alt_47 = 2
        look_47_0 = @input.peek( 1 )

        if ( look_47_0 == WS )
          alt_47 = 1
        end
        case alt_47
        when 1
          # at line 316:14: WS
          __WS307__ = match( WS, TOKENS_FOLLOWING_WS_IN_attr_svalue_2020 )
          stream_WS.add( __WS307__ )

        end
        __ASSIGN308__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_attr_svalue_2023 )
        stream_ASSIGN.add( __ASSIGN308__ )
        # at line 316:25: ( WS )?
        alt_48 = 2
        look_48_0 = @input.peek( 1 )

        if ( look_48_0 == WS )
          alt_48 = 1
        end
        case alt_48
        when 1
          # at line 316:25: WS
          __WS309__ = match( WS, TOKENS_FOLLOWING_WS_IN_attr_svalue_2025 )
          stream_WS.add( __WS309__ )

        end
        __SVALUE310__ = match( SVALUE, TOKENS_FOLLOWING_SVALUE_IN_attr_svalue_2028 )
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
        # 316:36: -> ^( ASSIGN SVALUE )
        # at line 316:39: ^( ASSIGN SVALUE )
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
        # trace_out( __method__, 51 )

      end
      
      return return_value
    end



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA36 < ANTLR3::DFA
      EOT = unpack( 12, -1 )
      EOF = unpack( 12, -1 )
      MIN = unpack( 1, 8, 1, -1, 1, 34, 9, -1 )
      MAX = unpack( 1, 22, 1, -1, 1, 46, 9, -1 )
      ACCEPT = unpack( 1, -1, 1, 10, 1, -1, 1, 1, 1, 2, 1, 3, 1, 4, 1, 5, 
                       1, 6, 1, 7, 1, 8, 1, 9 )
      SPECIAL = unpack( 12, -1 )
      TRANSITION = [
        unpack( 1, 1, 13, -1, 1, 2 ),
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
      
      @decision = 36
      

      def description
        <<-'__dfa_description__'.strip!
          ()* loopback of 243:22: ( id | style | klass | align | width | height | background | bgcolor | border )*
        __dfa_description__
      end
    end
    class DFA40 < ANTLR3::DFA
      EOT = unpack( 13, -1 )
      EOF = unpack( 13, -1 )
      MIN = unpack( 1, 8, 1, -1, 1, 34, 10, -1 )
      MAX = unpack( 1, 22, 1, -1, 1, 45, 10, -1 )
      ACCEPT = unpack( 1, -1, 1, 11, 1, -1, 1, 1, 1, 2, 1, 3, 1, 4, 1, 5, 
                       1, 6, 1, 7, 1, 8, 1, 9, 1, 10 )
      SPECIAL = unpack( 13, -1 )
      TRANSITION = [
        unpack( 1, 1, 13, -1, 1, 2 ),
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
          ()* loopback of 259:22: ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )*
        __dfa_description__
      end
    end
    class DFA42 < ANTLR3::DFA
      EOT = unpack( 13, -1 )
      EOF = unpack( 13, -1 )
      MIN = unpack( 1, 8, 1, -1, 1, 34, 10, -1 )
      MAX = unpack( 1, 22, 1, -1, 1, 45, 10, -1 )
      ACCEPT = unpack( 1, -1, 1, 11, 1, -1, 1, 1, 1, 2, 1, 3, 1, 4, 1, 5, 
                       1, 6, 1, 7, 1, 8, 1, 9, 1, 10 )
      SPECIAL = unpack( 13, -1 )
      TRANSITION = [
        unpack( 1, 1, 13, -1, 1, 2 ),
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
      
      @decision = 42
      

      def description
        <<-'__dfa_description__'.strip!
          ()* loopback of 264:22: ( id | style | klass | align | valign | width | height | background | bgcolor | bordercolor )*
        __dfa_description__
      end
    end
    class DFA44 < ANTLR3::DFA
      EOT = unpack( 10, -1 )
      EOF = unpack( 10, -1 )
      MIN = unpack( 1, 8, 1, -1, 1, 34, 7, -1 )
      MAX = unpack( 1, 22, 1, -1, 1, 49, 7, -1 )
      ACCEPT = unpack( 1, -1, 1, 8, 1, -1, 1, 1, 1, 2, 1, 3, 1, 4, 1, 5, 
                       1, 6, 1, 7 )
      SPECIAL = unpack( 10, -1 )
      TRANSITION = [
        unpack( 1, 1, 13, -1, 1, 2 ),
        unpack(  ),
        unpack( 1, 3, 1, 4, 1, 5, 2, -1, 1, 6, 7, -1, 1, 7, 1, 8, 1, 9 ),
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
          ()* loopback of 270:23: ( id | style | klass | align | href | name | target )*
        __dfa_description__
      end
    end
    class DFA46 < ANTLR3::DFA
      EOT = unpack( 11, -1 )
      EOF = unpack( 11, -1 )
      MIN = unpack( 1, 22, 1, -1, 1, 34, 8, -1 )
      MAX = unpack( 1, 32, 1, -1, 1, 43, 8, -1 )
      ACCEPT = unpack( 1, -1, 1, 9, 1, -1, 1, 1, 1, 2, 1, 3, 1, 4, 1, 5, 
                       1, 6, 1, 7, 1, 8 )
      SPECIAL = unpack( 11, -1 )
      TRANSITION = [
        unpack( 1, 2, 9, -1, 1, 1 ),
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
      
      @decision = 46
      

      def description
        <<-'__dfa_description__'.strip!
          ()* loopback of 275:22: ( id | style | klass | align | src | alt | width | height )*
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa36 = DFA36.new( self, 36 )
      @dfa40 = DFA40.new( self, 40 )
      @dfa42 = DFA42.new( self, 42 )
      @dfa44 = DFA44.new( self, 44 )
      @dfa46 = DFA46.new( self, 46 )

    end
    TOKENS_FOLLOWING_html_IN_document_36 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_html_50 = Set[ 7 ]
    TOKENS_FOLLOWING_HTML_IN_html_52 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_html_54 = Set[ 6, 9 ]
    TOKENS_FOLLOWING_head_IN_html_60 = Set[ 6, 9 ]
    TOKENS_FOLLOWING_body_IN_html_67 = Set[ 9 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_html_73 = Set[ 7 ]
    TOKENS_FOLLOWING_HTML_IN_html_75 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_html_77 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_head_105 = Set[ 10 ]
    TOKENS_FOLLOWING_HEAD_IN_head_107 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_head_109 = Set[ 6, 9 ]
    TOKENS_FOLLOWING_head_element_IN_head_114 = Set[ 9 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_head_120 = Set[ 10 ]
    TOKENS_FOLLOWING_HEAD_IN_head_122 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_head_124 = Set[ 1 ]
    TOKENS_FOLLOWING_title_IN_head_element_148 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_title_161 = Set[ 11 ]
    TOKENS_FOLLOWING_TITLE_IN_title_163 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_title_165 = Set[ 9, 12 ]
    TOKENS_FOLLOWING_PCDATA_IN_title_169 = Set[ 9 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_title_174 = Set[ 11 ]
    TOKENS_FOLLOWING_TITLE_IN_title_176 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_title_178 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_body_201 = Set[ 13 ]
    TOKENS_FOLLOWING_BODY_IN_body_203 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_id_IN_body_206 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_style_IN_body_208 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_klass_IN_body_210 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_bgcolor_IN_body_212 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_background_IN_body_214 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_END_TAG_IN_body_218 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_body_content_IN_body_228 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_body_236 = Set[ 13 ]
    TOKENS_FOLLOWING_BODY_IN_body_238 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_body_240 = Set[ 1 ]
    TOKENS_FOLLOWING_heading_IN_body_tag_283 = Set[ 1 ]
    TOKENS_FOLLOWING_block_IN_body_tag_289 = Set[ 1 ]
    TOKENS_FOLLOWING_body_tag_IN_body_content_300 = Set[ 1 ]
    TOKENS_FOLLOWING_text_IN_body_content_306 = Set[ 1 ]
    TOKENS_FOLLOWING_h1_IN_heading_319 = Set[ 1 ]
    TOKENS_FOLLOWING_h2_IN_heading_323 = Set[ 1 ]
    TOKENS_FOLLOWING_h3_IN_heading_327 = Set[ 1 ]
    TOKENS_FOLLOWING_h4_IN_heading_331 = Set[ 1 ]
    TOKENS_FOLLOWING_h5_IN_heading_335 = Set[ 1 ]
    TOKENS_FOLLOWING_h6_IN_heading_339 = Set[ 1 ]
    TOKENS_FOLLOWING_paragraph_IN_block_351 = Set[ 1 ]
    TOKENS_FOLLOWING_div_IN_block_356 = Set[ 1 ]
    TOKENS_FOLLOWING_table_IN_block_361 = Set[ 1 ]
    TOKENS_FOLLOWING_italic_IN_font_373 = Set[ 1 ]
    TOKENS_FOLLOWING_bold_IN_font_378 = Set[ 1 ]
    TOKENS_FOLLOWING_underline_IN_font_383 = Set[ 1 ]
    TOKENS_FOLLOWING_anchor_IN_special_395 = Set[ 1 ]
    TOKENS_FOLLOWING_img_IN_special_401 = Set[ 1 ]
    TOKENS_FOLLOWING_br_IN_special_406 = Set[ 1 ]
    TOKENS_FOLLOWING_font_IN_text_tag_418 = Set[ 1 ]
    TOKENS_FOLLOWING_special_IN_text_tag_424 = Set[ 1 ]
    TOKENS_FOLLOWING_PCDATA_IN_text_437 = Set[ 1 ]
    TOKENS_FOLLOWING_text_tag_IN_text_450 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_h1_467 = Set[ 14 ]
    TOKENS_FOLLOWING_H1_IN_h1_469 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_id_IN_h1_472 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_style_IN_h1_474 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_klass_IN_h1_476 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_align_IN_h1_478 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_END_TAG_IN_h1_482 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_heading_data_IN_h1_486 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_h1_491 = Set[ 14 ]
    TOKENS_FOLLOWING_H1_IN_h1_493 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_h1_495 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_h2_530 = Set[ 15 ]
    TOKENS_FOLLOWING_H2_IN_h2_532 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_id_IN_h2_535 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_style_IN_h2_537 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_klass_IN_h2_539 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_align_IN_h2_541 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_END_TAG_IN_h2_545 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_heading_data_IN_h2_549 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_h2_554 = Set[ 15 ]
    TOKENS_FOLLOWING_H2_IN_h2_556 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_h2_558 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_h3_592 = Set[ 16 ]
    TOKENS_FOLLOWING_H3_IN_h3_594 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_id_IN_h3_597 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_style_IN_h3_599 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_klass_IN_h3_601 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_align_IN_h3_603 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_END_TAG_IN_h3_607 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_heading_data_IN_h3_611 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_h3_616 = Set[ 16 ]
    TOKENS_FOLLOWING_H3_IN_h3_618 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_h3_620 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_h4_654 = Set[ 17 ]
    TOKENS_FOLLOWING_H4_IN_h4_656 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_id_IN_h4_659 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_style_IN_h4_661 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_klass_IN_h4_663 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_align_IN_h4_665 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_END_TAG_IN_h4_669 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_heading_data_IN_h4_673 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_h4_678 = Set[ 17 ]
    TOKENS_FOLLOWING_H4_IN_h4_680 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_h4_682 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_h5_716 = Set[ 18 ]
    TOKENS_FOLLOWING_H5_IN_h5_718 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_id_IN_h5_721 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_style_IN_h5_723 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_klass_IN_h5_725 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_align_IN_h5_727 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_END_TAG_IN_h5_731 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_heading_data_IN_h5_735 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_h5_740 = Set[ 18 ]
    TOKENS_FOLLOWING_H5_IN_h5_742 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_h5_744 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_h6_778 = Set[ 19 ]
    TOKENS_FOLLOWING_H6_IN_h6_780 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_id_IN_h6_783 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_style_IN_h6_785 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_klass_IN_h6_787 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_align_IN_h6_789 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_END_TAG_IN_h6_793 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_heading_data_IN_h6_797 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_h6_802 = Set[ 19 ]
    TOKENS_FOLLOWING_H6_IN_h6_804 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_h6_806 = Set[ 1 ]
    TOKENS_FOLLOWING_block_IN_heading_data_838 = Set[ 1 ]
    TOKENS_FOLLOWING_text_IN_heading_data_854 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_paragraph_878 = Set[ 20 ]
    TOKENS_FOLLOWING_P_IN_paragraph_880 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_id_IN_paragraph_883 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_style_IN_paragraph_885 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_klass_IN_paragraph_887 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_align_IN_paragraph_889 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_END_TAG_IN_paragraph_893 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_text_IN_paragraph_898 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_paragraph_904 = Set[ 20 ]
    TOKENS_FOLLOWING_P_IN_paragraph_906 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_paragraph_908 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_div_943 = Set[ 21 ]
    TOKENS_FOLLOWING_DIV_IN_div_945 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_WS_IN_div_947 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_id_IN_div_951 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_style_IN_div_953 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_klass_IN_div_955 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_align_IN_div_957 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_END_TAG_IN_div_961 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_body_content_IN_div_966 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_div_972 = Set[ 21 ]
    TOKENS_FOLLOWING_DIV_IN_div_974 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_div_976 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_italic_1013 = Set[ 23 ]
    TOKENS_FOLLOWING_I_IN_italic_1015 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_italic_1017 = Set[ 6, 12 ]
    TOKENS_FOLLOWING_text_IN_italic_1022 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_italic_1028 = Set[ 23 ]
    TOKENS_FOLLOWING_I_IN_italic_1030 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_italic_1032 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_bold_1061 = Set[ 24 ]
    TOKENS_FOLLOWING_B_IN_bold_1063 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_bold_1065 = Set[ 6, 12 ]
    TOKENS_FOLLOWING_text_IN_bold_1070 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_bold_1076 = Set[ 24 ]
    TOKENS_FOLLOWING_B_IN_bold_1078 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_bold_1080 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_underline_1107 = Set[ 25 ]
    TOKENS_FOLLOWING_U_IN_underline_1109 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_underline_1111 = Set[ 6, 12 ]
    TOKENS_FOLLOWING_text_IN_underline_1119 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_underline_1128 = Set[ 25 ]
    TOKENS_FOLLOWING_U_IN_underline_1130 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_underline_1132 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_table_1169 = Set[ 26 ]
    TOKENS_FOLLOWING_TABLE_IN_table_1171 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_id_IN_table_1174 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_style_IN_table_1176 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_klass_IN_table_1178 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_align_IN_table_1180 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_width_IN_table_1182 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_height_IN_table_1184 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_background_IN_table_1186 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_bgcolor_IN_table_1188 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_border_IN_table_1190 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_END_TAG_IN_table_1194 = Set[ 6 ]
    TOKENS_FOLLOWING_tr_IN_table_1204 = Set[ 6, 9 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_table_1211 = Set[ 26 ]
    TOKENS_FOLLOWING_TABLE_IN_table_1213 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_table_1215 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_tr_1265 = Set[ 27 ]
    TOKENS_FOLLOWING_TR_IN_tr_1267 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_tr_1269 = Set[ 6, 9 ]
    TOKENS_FOLLOWING_tr_data_IN_tr_1279 = Set[ 6, 9 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_tr_1286 = Set[ 27 ]
    TOKENS_FOLLOWING_TR_IN_tr_1288 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_tr_1290 = Set[ 1 ]
    TOKENS_FOLLOWING_td_IN_tr_data_1314 = Set[ 1 ]
    TOKENS_FOLLOWING_th_IN_tr_data_1326 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_th_1344 = Set[ 28 ]
    TOKENS_FOLLOWING_TH_IN_th_1346 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_id_IN_th_1349 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_style_IN_th_1351 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_klass_IN_th_1353 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_align_IN_th_1355 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_valign_IN_th_1357 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_width_IN_th_1359 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_height_IN_th_1361 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_background_IN_th_1363 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_bgcolor_IN_th_1365 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_bordercolor_IN_th_1367 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_END_TAG_IN_th_1371 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_body_content_IN_th_1376 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_th_1382 = Set[ 28 ]
    TOKENS_FOLLOWING_TH_IN_th_1384 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_th_1386 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_td_1440 = Set[ 29 ]
    TOKENS_FOLLOWING_TD_IN_td_1442 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_id_IN_td_1445 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_style_IN_td_1447 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_klass_IN_td_1449 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_align_IN_td_1451 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_valign_IN_td_1453 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_width_IN_td_1455 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_height_IN_td_1457 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_background_IN_td_1459 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_bgcolor_IN_td_1461 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_bordercolor_IN_td_1463 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_END_TAG_IN_td_1467 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_body_content_IN_td_1472 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_td_1478 = Set[ 29 ]
    TOKENS_FOLLOWING_TD_IN_td_1480 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_td_1482 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_anchor_1537 = Set[ 30 ]
    TOKENS_FOLLOWING_A_IN_anchor_1539 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_id_IN_anchor_1542 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_style_IN_anchor_1544 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_klass_IN_anchor_1546 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_align_IN_anchor_1548 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_href_IN_anchor_1550 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_name_IN_anchor_1552 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_target_IN_anchor_1554 = Set[ 8, 22 ]
    TOKENS_FOLLOWING_END_TAG_IN_anchor_1558 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_text_IN_anchor_1563 = Set[ 6, 9, 12 ]
    TOKENS_FOLLOWING_CLOSING_TAG_IN_anchor_1569 = Set[ 30 ]
    TOKENS_FOLLOWING_A_IN_anchor_1571 = Set[ 8 ]
    TOKENS_FOLLOWING_END_TAG_IN_anchor_1573 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_img_1618 = Set[ 31 ]
    TOKENS_FOLLOWING_IMG_IN_img_1620 = Set[ 22, 32 ]
    TOKENS_FOLLOWING_id_IN_img_1623 = Set[ 22, 32 ]
    TOKENS_FOLLOWING_style_IN_img_1625 = Set[ 22, 32 ]
    TOKENS_FOLLOWING_klass_IN_img_1627 = Set[ 22, 32 ]
    TOKENS_FOLLOWING_align_IN_img_1629 = Set[ 22, 32 ]
    TOKENS_FOLLOWING_src_IN_img_1631 = Set[ 22, 32 ]
    TOKENS_FOLLOWING_alt_IN_img_1633 = Set[ 22, 32 ]
    TOKENS_FOLLOWING_width_IN_img_1635 = Set[ 22, 32 ]
    TOKENS_FOLLOWING_height_IN_img_1637 = Set[ 22, 32 ]
    TOKENS_FOLLOWING_END_NOPAIR_TAG_IN_img_1643 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENING_TAG_IN_br_1689 = Set[ 33 ]
    TOKENS_FOLLOWING_BR_IN_br_1691 = Set[ 32 ]
    TOKENS_FOLLOWING_END_NOPAIR_TAG_IN_br_1695 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_id_1717 = Set[ 34 ]
    TOKENS_FOLLOWING_ID_IN_id_1719 = Set[ 22, 50 ]
    TOKENS_FOLLOWING_attr_svalue_IN_id_1721 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_style_1734 = Set[ 35 ]
    TOKENS_FOLLOWING_STYLE_IN_style_1736 = Set[ 22, 50 ]
    TOKENS_FOLLOWING_attr_svalue_IN_style_1738 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_klass_1751 = Set[ 36 ]
    TOKENS_FOLLOWING_CLASS_IN_klass_1753 = Set[ 22, 50 ]
    TOKENS_FOLLOWING_attr_svalue_IN_klass_1755 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_bgcolor_1770 = Set[ 37 ]
    TOKENS_FOLLOWING_BGCOLOR_IN_bgcolor_1772 = Set[ 22, 50 ]
    TOKENS_FOLLOWING_attr_svalue_IN_bgcolor_1774 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_background_1789 = Set[ 38 ]
    TOKENS_FOLLOWING_BACKGROUND_IN_background_1791 = Set[ 22, 50 ]
    TOKENS_FOLLOWING_attr_svalue_IN_background_1793 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_align_1808 = Set[ 39 ]
    TOKENS_FOLLOWING_ALIGN_IN_align_1810 = Set[ 22, 50 ]
    TOKENS_FOLLOWING_attr_svalue_IN_align_1812 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_src_1827 = Set[ 40 ]
    TOKENS_FOLLOWING_SRC_IN_src_1829 = Set[ 22, 50 ]
    TOKENS_FOLLOWING_attr_svalue_IN_src_1831 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_alt_1846 = Set[ 41 ]
    TOKENS_FOLLOWING_ALT_IN_alt_1848 = Set[ 22, 50 ]
    TOKENS_FOLLOWING_attr_svalue_IN_alt_1850 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_width_1865 = Set[ 42 ]
    TOKENS_FOLLOWING_WIDTH_IN_width_1867 = Set[ 22, 50 ]
    TOKENS_FOLLOWING_attr_svalue_IN_width_1869 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_height_1884 = Set[ 43 ]
    TOKENS_FOLLOWING_HEIGHT_IN_height_1886 = Set[ 22, 50 ]
    TOKENS_FOLLOWING_attr_svalue_IN_height_1888 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_bordercolor_1903 = Set[ 44 ]
    TOKENS_FOLLOWING_BORDERCOLOR_IN_bordercolor_1905 = Set[ 22, 50 ]
    TOKENS_FOLLOWING_attr_svalue_IN_bordercolor_1907 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_valign_1922 = Set[ 45 ]
    TOKENS_FOLLOWING_VALIGN_IN_valign_1924 = Set[ 22, 50 ]
    TOKENS_FOLLOWING_attr_svalue_IN_valign_1926 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_border_1941 = Set[ 46 ]
    TOKENS_FOLLOWING_BORDER_IN_border_1943 = Set[ 22, 50 ]
    TOKENS_FOLLOWING_attr_svalue_IN_border_1945 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_href_1960 = Set[ 47 ]
    TOKENS_FOLLOWING_HREF_IN_href_1962 = Set[ 22, 50 ]
    TOKENS_FOLLOWING_attr_svalue_IN_href_1964 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_name_1979 = Set[ 48 ]
    TOKENS_FOLLOWING_ANAME_IN_name_1981 = Set[ 22, 50 ]
    TOKENS_FOLLOWING_attr_svalue_IN_name_1983 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_target_1998 = Set[ 49 ]
    TOKENS_FOLLOWING_TARGET_IN_target_2000 = Set[ 22, 50 ]
    TOKENS_FOLLOWING_attr_svalue_IN_target_2002 = Set[ 1 ]
    TOKENS_FOLLOWING_WS_IN_attr_svalue_2020 = Set[ 50 ]
    TOKENS_FOLLOWING_ASSIGN_IN_attr_svalue_2023 = Set[ 22, 51 ]
    TOKENS_FOLLOWING_WS_IN_attr_svalue_2025 = Set[ 51 ]
    TOKENS_FOLLOWING_SVALUE_IN_attr_svalue_2028 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

