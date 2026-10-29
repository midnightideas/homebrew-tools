class WordcraftCli < Formula
    desc "Word-style word processor CLI for .docx files"
    homepage "https://github.com/storytold/wordcraft"
    version "0.12.0"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.12.0/wordcraft-cli-0.12.0-macos-universal.zip"
        sha256 "dc030590fdd9cb5971c38bc79cadecf30f68f6d46b67a456a8f53a46990b6de4"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.12.0/wordcraft-0.12.0-linux-aarch64.tar.gz"
            sha256 "8fcc2644acef7b43c3e46626e47e92e5542a43288e8e0bebf4b9f79c22a66d0b"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.12.0/wordcraft-0.12.0-linux-x86_64.tar.gz"
            sha256 "cd9abd0ee7a11b985af1c1571653332c96077e5dcc48b5e187b55c82f475a33e"
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
