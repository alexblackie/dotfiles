# `.editorconfig` Templates

I try to put [an `.editorconfig` file][0] in every project I work on to
configure some common settings and sane defaults for all editors that open
files in the project. It's a very helpful standard when working within
different languages and ecosystems that might have different formatting
expectations.

Generally this falls into three camps:

1. "Hard Tabs", which uses real tabs as God intended except for weird hipster
   things like YAML or Markdown;
2. "Soft Tabs", which uses 2-space indents for everything; and finally
3. "PEP-8", which uses 4-space tabs for everything except markdown to avoid
   accidental code blocks.

All three of these are represented in this folder.

[0]: https://editorconfig.org
