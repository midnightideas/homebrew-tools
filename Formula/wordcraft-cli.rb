class WordcraftCli < Formula
    desc "Word-style word processor CLI for .docx files"
    homepage "https://github.com/storytold/wordcraft"
    version "0.7.0"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.7.0/wordcraft-cli-0.7.0-macos-universal.zip"
        sha256 "56bda3406af0aa1c96cece8ad145ab2602d2f7f8919d758d4292c5c75f2dfb50"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.7.0/wordcraft-0.7.0-linux-aarch64.tar.gz"
            sha256 "b5fce7f31bbbf38828c1714d7d43244ae85f034bbe761dfa401e044f976ba45e"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.7.0/wordcraft-0.7.0-linux-x86_64.tar.gz"
            sha256 "63009f88e3dbaea70ac1378fabc8555ae14775d32829175c5da2551abe03932f"
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
