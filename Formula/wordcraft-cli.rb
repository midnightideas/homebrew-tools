class WordcraftCli < Formula
    desc "Word-style word processor CLI for .docx files"
    homepage "https://github.com/storytold/wordcraft"
    version "0.13.2"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.13.2/wordcraft-cli-0.13.2-macos-universal.zip"
        sha256 "b71b8e417003214a321804c676cb6a1d55c58f5d2d646c257b3fc56e8e053878"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.13.2/wordcraft-0.13.2-linux-aarch64.tar.gz"
            sha256 "da662713548ba9e1d901e889bfccd854803220135ad35907373eb856d5b6f734"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.13.2/wordcraft-0.13.2-linux-x86_64.tar.gz"
            sha256 "6cf4fcc030a2d4fbaf334f9d6c60d73c2a1fdee2a6951c067e5fa115fe10738f"
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
