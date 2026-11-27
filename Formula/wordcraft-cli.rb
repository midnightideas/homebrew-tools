class WordcraftCli < Formula
    desc "Word-style word processor CLI for .docx files"
    homepage "https://github.com/storytold/wordcraft"
    version "0.19.1"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.19.1/wordcraft-cli-0.19.1-macos-universal.zip"
        sha256 "f008db7e1dd3f81a4f9ba65d34358ed4da8e30ebf9191258bef3f7be2cc32c53"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.19.1/wordcraft-0.19.1-linux-aarch64.tar.gz"
            sha256 "63d8b2e020d241000b565b386cd05bba22d0b97c484b5f11c09cc631e51749ca"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.19.1/wordcraft-0.19.1-linux-x86_64.tar.gz"
            sha256 "ec8d8cc2b9204ac03d1380cec910defdf2e8850d93e9b87d6184eafef61968b4"
        end
    end

    def install
        if OS.mac?
            bin.install "#{name}"
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
