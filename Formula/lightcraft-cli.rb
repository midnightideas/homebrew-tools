class LightcraftCli < Formula
    desc "Lightroom-style photo library and raw development (CLI)."
    homepage "https://github.com/storytold/lightcraft"
    version "0.9.1"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.9.1/lightcraft-cli-0.9.1-macos-universal.zip"
        sha256 "d2b6e60050f0266193162779676a4194f5ffc4ec5fd9f9e818f8ec66b2e70c8c"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.9.1/lightcraft-0.9.1-linux-aarch64.tar.gz"
            sha256 "323dc7cb021bc5ca8dddd9ac66420073a7ddaa15cab705168b353c160b10a916"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.9.1/lightcraft-0.9.1-linux-x86_64.tar.gz"
            sha256 "7f6297d3a159aa391b13aac049397730305cc04a8dbf12ab0ff61f86f551f7a9"
        end
    end

    def install
        if OS.mac?
            bin.install "#{name}"
        elsif Hardware::CPU.arm?
            bin.install "bin/#{name}"
        else
            bin.install "bin/#{name}"
        end
    end

    test do
        assert_predicate bin/"#{name}", :exist?
    end

    livecheck do
        url :url
        strategy :github_latest
    end
end
