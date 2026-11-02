class WordcraftCli < Formula
    desc "Word-style word processor CLI for .docx files"
    homepage "https://github.com/storytold/wordcraft"
    version "0.14.0"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.14.0/wordcraft-cli-0.14.0-macos-universal.zip"
        sha256 "39f04ade33e3af120d651852ebd94f66415f87cc680d851245aac3ce06d8479d"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.14.0/wordcraft-0.14.0-linux-aarch64.tar.gz"
            sha256 "a02e3ef3eab365aca36c5a6a0b8b00a9252562c90ab7da884b83ef701dfae8f0"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.14.0/wordcraft-0.14.0-linux-x86_64.tar.gz"
            sha256 "3010da3d352d95256ec9a17a03966280a1d41ba09d0ebe569af23092d8b64987"
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
