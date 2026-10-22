class WordcraftCli < Formula
    desc "Word-style word processor CLI for .docx files"
    homepage "https://github.com/storytold/wordcraft"
    version "0.9.0"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.9.0/wordcraft-cli-0.9.0-macos-universal.zip"
        sha256 "b5828fa376ee94a8a942a28f430c5a8a206035d835da4119caac56b5dbaa15d5"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.9.0/wordcraft-0.9.0-linux-aarch64.tar.gz"
            sha256 "580abb0ff237d331e287523dda85f5dc5532e2f9b89676c8d64aaead0294061b"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.9.0/wordcraft-0.9.0-linux-x86_64.tar.gz"
            sha256 "8f507802e971b16afa1b6dc565317eb30885ffb2aec2e976d3a1ddaa47c529d4"
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
