Introduction
============
wow-Bejeweled is an exhilarating puzzle game addon for World of Warcraft
authored by PopCap Games. Unfortunately, the maintainers abandoned it in 2008,
and even more unfortunate, is the fact that the original addon's source was
intentionally obfuscated so third-party maintenance is difficult. This project
seeks to maintain wow-bejeweled via a two-phase process.

Phase 1: Deobfuscate
====================
A pipeline of scripts will be authored to deobfuscate the original source.
Currently, the pipeline consists of two passes. Pass 1 inserts line breaks in
appropriate places. Pass 2 handles indentation and other whitespace. All
bugfixes during this phase will be applied directly to the obfuscated source.
When the pipeline generates correct and optimally lint code, the original source
and the scripts for manipulating it will be deprecated in favor of the
deobfuscated code and phase 2 will begin.

Phase 2: Semantic enrichment
============================
Variables and functions that have obfuscated names will be named more
appropriately as needed during bugfixes. A compressed version of the source will
actually be used in-game to decrease the memory footprint but the deobfuscated
source and all tools for compressing it will remain available as a developer
resource.
