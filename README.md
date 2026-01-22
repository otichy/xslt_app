# XSLT line and stanza numbering for TEI

This repo contains a TEI sample (`SongInnocenceExperience.xml`) and an XSLT 3.0 stylesheet (`numbering-lines-stanzas.xsl`) that preserves the document structure while automatically numbering stanzas (`lg`) and lines (`l`). The TEI namespace is declared and set as the default for XPath in the stylesheet.

## Files
- `SongInnocenceExperience.xml` — source TEI document.
- `numbering-lines-stanzas.xsl` — adds `n` attributes to `lg`/`l` and ensures `lg/@type` is present (defaults to `stanza` if missing).
- `xsl-out/result1.xml` — example output produced by running the stylesheet on the source.
- `.vscode/tasks.json` — VS Code task for running Saxon and writing output to `xsl-out/result1.xml`.

## Run the transform (CLI)
Using Saxon (adjust the JAR path to your setup):
```powershell
java -jar path\to\saxon-he.jar `
  -s:SongInnocenceExperience.xml `
  -xsl:numbering-lines-stanzas.xsl `
  -o:xsl-out/result1.xml
```

Using `xsltproc`:
```powershell
xsltproc -o xsl-out/result1.xml numbering-lines-stanzas.xsl SongInnocenceExperience.xml
```

## Run from VS Code
The workspace includes an XSLT build task:
1) Open the command palette → "Run Task" → "xslt: Saxon Transform (New)".
2) Pick the XSLT file (`numbering-lines-stanzas.xsl`) and the XML source (`SongInnocenceExperience.xml`) when prompted.
3) Output is written to `xsl-out/result1.xml`.

## Notes
- Stanza numbers (`lg/@n`) restart for each poem (`div2`); line numbers (`l/@n`) restart within each stanza.
- All existing attributes and structure are preserved; only numbering (and any missing `lg/@type`) is added.
