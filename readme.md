# nvrg

nvrg (Neovim Rockspecs Generator) is a CLI tool made in [Zig](https://ziglang.org) to help
generate rockspec files for Neovim plugins.

This project is pretty much vaporwave right now.


## Building

To build nvrg from source you will need to run the following commands:
```bash
git clone --recurse-submodules https://github.com/NTBBloodbath/nvrg.git
cd nvrg
zig build -Drelease-safe
```

> Produced binary will be at `zig-out/bin` directory.


## License

As always, this project is licensed under [GPLv3](./LICENSE) license.
