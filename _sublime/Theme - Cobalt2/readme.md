# cobalt2 mod

My small mod of [Wes Bos's](https://github.com/wesbos) fantastic [cobalt2](https://github.com/wesbos/cobalt2) theme.

Both files are symlinked to my sublime folder with the standard symlink code:

```
ln -s <filepath> <linkpath>
```

### Changes made to line number 132 in file: cobalt2.tmTheme
```
<dict>
  <key>name</key>
  <string>Comment</string>
  <key>scope</key>
  <string>comment</string>
  <key>settings</key>
  <dict>
    <key>fontStyle</key>
    <string>italic</string>
    <key>foreground</key>
    <string>#418abe</string>
  </dict>
</dict>
```

### Changes made to line number 465 and 466 in file: Cobalt2.sublime-theme
```
// Sidebar tree
{
    "class": "sidebar_tree",
    "row_padding": [8, 3],
    "indent": 12,
    "indent_offset": 10,
    "indent_top_level": false,
    "dark_content": true
},
```