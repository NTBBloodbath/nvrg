


# `nvrg`

The Neovim Rockspecs Generator (`nvrg`) is a CLI tool made in [Zig](https://ziglang.org) to help
generate rockspec files for Neovim plugins.

**NOTE**: This project is pretty much vaporwave right now.


## Building

To build `nvrg` from source you should run the following commands:
```bash
git clone --recurse-submodules https://github.com/NTBBloodbath/nvrg.git
cd nvrg
zig build -Drelease-safe
```

> The built binary will be avaiable in the `zig-out/bin` directory.


## License

As always, this project is licensed under the [GPLv3](./LICENSE) license.


# Development Notice

This project is currently waiting on
[zig-tree-sitter](https://github.com/vhyrro/zig-tree-sitter) to be finished.
The project isn't dead! :p