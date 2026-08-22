:orphan:

Nootropy Third-Party Batching Performance Fixture
####################################################

This document exists purely for repeatable before/after wall-clock
profiling of the third-party batch-rendering fix (see
``ARCHITECTURE.md``'s note on batched shadow Sphinx builds, and the
``sphinx_plugins.warm_third_party_cache``/``render_batch`` machinery it
documents). It is **not** part of any toctree (see the ``:orphan:``
field above) so a normal project build never treats it as missing
navigation -- it is meant to be pointed at directly:

.. code-block:: console

   python scripts/profile_nootropy_engine.py file sphinx_sample/source/nootropy_perf_fixture.rst
   python scripts/profile_sphinx_build.py file sphinx_sample/source/nootropy_perf_fixture.rst

It reproduces the shape of the real-world document that originally
surfaced the ~10x Nootropy-vs-native-sphinx-build gap: many separate
``.. card::`` occurrences (``sphinx_design``), several of them nesting
a cheap ``.. uml::`` diagram (``sphinxcontrib.plantuml``) -- the two
third-party directives this project already depends on (see
``conf.py``'s own ``extensions`` list), so no new dependency is needed
to build this fixture for real.

Card occurrences
====================

.. card:: Occurrence 1

   Plain card body, no nested diagram -- most occurrences in the real
   file that motivated this fix looked like this.

.. card:: Occurrence 2

   .. uml::

      @startuml
      Alice -> Bob: request 2
      Bob --> Alice: reply 2
      @enduml

.. card:: Occurrence 3

   Plain card body, no nested diagram.

.. card:: Occurrence 4

   Plain card body, no nested diagram.

.. card:: Occurrence 5

   .. uml::

      @startuml
      Alice -> Bob: request 5
      Bob --> Alice: reply 5
      @enduml

.. card:: Occurrence 6

   Plain card body, no nested diagram.

.. card:: Occurrence 7

   Plain card body, no nested diagram.

.. card:: Occurrence 8

   .. uml::

      @startuml
      Alice -> Bob: request 8
      Bob --> Alice: reply 8
      @enduml

.. card:: Occurrence 9

   Plain card body, no nested diagram.

.. card:: Occurrence 10

   Plain card body, no nested diagram.

.. card:: Occurrence 11

   .. uml::

      @startuml
      Alice -> Bob: request 11
      Bob --> Alice: reply 11
      @enduml

.. card:: Occurrence 12

   Plain card body, no nested diagram.

.. card:: Occurrence 13

   Plain card body, no nested diagram.

.. card:: Occurrence 14

   .. uml::

      @startuml
      Alice -> Bob: request 14
      Bob --> Alice: reply 14
      @enduml

.. card:: Occurrence 15

   Plain card body, no nested diagram.

.. card:: Occurrence 16

   Plain card body, no nested diagram.

.. card:: Occurrence 17

   Plain card body, no nested diagram.

.. card:: Occurrence 18

   .. uml::

      @startuml
      Alice -> Bob: request 18
      Bob --> Alice: reply 18
      @enduml
