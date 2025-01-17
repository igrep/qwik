install-rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

install-rust-deps:
	rustup update
	cargo install cargo-insta
	cargo install wasm-pack
	rustup component add clippy

install-all: install-rust install-rust-deps

install-cli:
	cd src/optimizer/cli && cargo install --path .

fix:
	cargo fmt

check:
	cargo fmt -- --check && cargo check

lint:
	cargo clippy

test:
	cargo test

publish-core:
	cd src/optimizer/core && cargo publish --all-features

publish-cli:
	cd src/optimizer/cli && cargo publish

publish: publish-core publish-cli

validate: check lint test
