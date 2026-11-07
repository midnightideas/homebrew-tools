class WordcraftCli < Formula
    desc "Word-style word processor CLI for .docx files"
    homepage "https://github.com/storytold/wordcraft"
    version "0.16.0"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.16.0/wordcraft-cli-0.16.0-macos-universal.zip"
        sha256 "090bfde5e81971e77dbf75221b1e3fe33bd52e71b8eb07e5a2285278698be99d"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.16.0/wordcraft-0.16.0-linux-aarch64.tar.gz"
            sha256 "065cb440c096d099d84cbbf86f0bde26ef2a29c4580105625d0b3b28e9409510"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.16.0/wordcraft-0.16.0-linux-x86_64.tar.gz"
            sha256 "325b97f15bbf532628a3176a9c17148a7175f3e4f19b9313de323ab513609752"
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
