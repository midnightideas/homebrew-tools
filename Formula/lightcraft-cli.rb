class LightcraftCli < Formula
    desc "Lightroom-style photo library and raw development (CLI)."
    homepage "https://github.com/storytold/lightcraft"
    version "0.18.0"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.18.0/lightcraft-cli-0.18.0-macos-universal.zip"
        sha256 "b38631b85a9b4b822db462339a6ba88344dc7768ea1614cb195cbdc9d8a95e75"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.18.0/lightcraft-0.18.0-linux-aarch64.tar.gz"
            sha256 "5fd6e2ff2b3e76a021b2d14e5e19aa1754a163b4c59d14866a501e72f6c32005"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.18.0/lightcraft-0.18.0-linux-x86_64.tar.gz"
            sha256 "f2dcaa287d510f9125273d9d16089e713943aef005bd03d9848d95ac55d8750f"
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
