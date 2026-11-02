class DeckcraftCli < Formula
    desc "PowerPoint-style presentation builder (CLI)."
    homepage "https://github.com/storytold/deckcraft"
    version "0.14.1"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.14.1/deckcraft-cli-0.14.1-macos-universal.zip"
        sha256 "e007433fbb7ee9d50efc6701b3f54a296b3e979a04aeac7ba0c586357f9bb0d3"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.14.1/deckcraft-0.14.1-linux-aarch64.tar.gz"
            sha256 "ea5659174fe800736fd6a9e697b106c4de962fe00946707bbf884c23e26ec81c"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.14.1/deckcraft-0.14.1-linux-x86_64.tar.gz"
            sha256 "e86c7fa0ecb55f1a553ee425b93dcfdc806b7b3798f272b41f1d1ff74ac5c12a"
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
