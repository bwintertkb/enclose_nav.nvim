# enclose_nav
This is a small plugin which currently let's you jump past the the next closure, i.e. if you have the following
```rust
let a = vec![(1, 2, 3), (4, 5, 6)];
```
and you cursor is on the `l` of `let` then by pressing `ctrl` and `e` in insert mode the cursor would jump to the after the closing bracket of `3`, then `6` and the after `]`.
### Installation
Using `packer`
```lua
use 'bwintertkb/enclose_nav.nvim'
```
### Setup
```lua
require("enclose_nav").setup()
```
### License
The plugin is ditributed under the [Apache License, Version 2.0](https://opensource.org/licenses/Apache-2.0)
