class WordcraftCli < Formula
    desc "Word-style word processor CLI for .docx files"
    homepage "https://github.com/storytold/wordcraft"
    version "0.15.2"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.15.2/wordcraft-cli-0.15.2-macos-universal.zip"
        sha256 "b988f1628adc5ce64c872f130b5502cf36ed91fe39a3952ea3b60319f6921062"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.15.2/wordcraft-0.15.2-linux-aarch64.tar.gz"
            sha256 "645e8daa4785c3e68bfede740f55075ea60d45c9f428b26c9741e819082c0b1b"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.15.2/wordcraft-0.15.2-linux-x86_64.tar.gz"
            sha256 "366e54e235b4631779c0c78c0777a880de511163de9130ab78ce59583f7a0b9a"
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
