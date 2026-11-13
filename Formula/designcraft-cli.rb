class DesigncraftCli < Formula
    desc "InDesign-style page layout application (CLI)."
    homepage "https://github.com/storytold/designcraft"
    version "0.20.1"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.20.1/designcraft-cli-0.20.1-macos-universal.zip"
        sha256 "a178783b31e1af48f7af2b516568ec85537a484dfbcc5057b0f03cadee90c0ab"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.20.1/designcraft-0.20.1-linux-aarch64.tar.gz"
            sha256 "208c3cf73565fa765c47eeb601f94fec425e817d15cc2131dfa1c1ebe2d06620"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.20.1/designcraft-0.20.1-linux-x86_64.tar.gz"
            sha256 "e91630d4cdf578ccb1e2f39f88e24e8520f1482d51ae4714657ee471e2237f44"
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
