Markup Languages & Typesetting Languages
#########################################

Intro 
******

**What is a markup language**

A :term:`markup language` 

* is a text-encoding system which specifies the structure 
  and formatting of a document and potentially the relationships among its parts (Wikipedia).

  * Example of markup languages: hypertext markup language (.html), markdown (.md), extensible markup 
    language (.xml), restructured text (.rst), AsciiDoc

* focus on structuring and formatting documents, rather than the final visual output. 

The keyword point is that a markup language uses **plain text** and contains no binary 
information.

There may be variations of a markup language. 

* For example **Markdown** was originally conceptualized 
  as a lightweight representation of html. 
  Markdown syntax is not extensible. Eventually many different organizations 
  have created various projects to  extend markdown syntax. 
  This lead to the ecosystem being fragmented. 

  * Today we have

    * Github-Flavored markdown, 
    * CommonMark
    * `MyST Markdown <https://myst-parser.readthedocs.io/en/latest/>`_ ,
      is a superset of CommonMark, whose syntax is used for .md files 
      in this project.
    * MultiMarkdown
    * Markdown for the component era (.mdx)
    * ... much more

For each markup language, there exist a parser a compiler that understands 
that language's syntax and a builder engine that render the document to the 
appropriate format.
    
* ex: for HTML -> browser engine is the parser.
* ex: .rst or .md within a Sphinx project -> Sphinx use one of its registered 
  parser. (MyST-Parser is used for .md)

  .. seealso:: `Sphinx Parser API <https://www.sphinx-doc.org/en/master/extdev/parserapi.html>`_
     `docutils node <https://www.sphinx-doc.org/en/master/development/tutorials/extending_syntax.html#what-are-docutils-nodes>`_

**What is a typesetting language**

:term:`Typesetting` is the process of preparing text and images for publication
ensuring it is readable and visually appealing.

**Typesetting languages** 

* are systems of instructions used to format and arrange 
  text for publication, display, or distribution, often involving specifying fonts, 
  spacing, and other visual elements. 
  
  * Examples include **TeX**, **LaTeX**, and **Typst**. 


* :doc:`000_List`

Explore Some Markup Languages
******************************

.. toctree::
   :glob:
   :maxdepth: 1
   :numbered:

   RST/content
   Markdown/content
   000_List

