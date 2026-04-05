# gemma.cpp nix

[`gemma.cpp`](https://github.com/google/gemma.cpp) packaged with [nix](https://zero-to-nix.com/concepts/nix/).

## Usage

You can either use `nix run`

```shell
$ nix run github:omarjatoi/gemma-cpp-nix -- --tokenizer tokenizer.spm --weights gemma2-2b-it-sfp.sbs
```

or add the package to your profile

```shell
$ nix profile add github:omarjatoi/gemma-cpp-nix
$ gemma --tokenizer tokenizer.spm --weights gemma2-2b-it-sfp.sbs
```

See https://github.com/google/gemma.cpp for full usage instructions.

##  License

Licensed under either of

- Apache License, Version 2.0, ([LICENSE-APACHE](./LICENSE-APACHE) or https://www.apache.org/licenses/LICENSE-2.0)
- MIT license ([LICENSE-MIT](./LICENSE-MIT) or https://opensource.org/licenses/MIT)

at your option.

### Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted for inclusion in the work by you, as defined in the Apache-2.0 license, shall be dual licensed as above, without any additional terms or conditions.
