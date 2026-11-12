class WordcraftCli < Formula
    desc "Word-style word processor CLI for .docx files"
    homepage "https://github.com/storytold/wordcraft"
    version "0.18.1"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.18.1/wordcraft-cli-0.18.1-macos-universal.zip"
        sha256 "34397cf6fcf73ee8ae8d53cab08fbdfc213262dbb6753c2965ebb7cde37b8616"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.18.1/wordcraft-0.18.1-linux-aarch64.tar.gz"
            sha256 "3f4afc0598357378ad8af9b2e37a2c171f6dd474c9206c9cf0cf56ea686259ed"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.18.1/wordcraft-0.18.1-linux-x86_64.tar.gz"
            sha256 "312a057d46dd80597c12dccfd1097ce25edea40baaaeb50bcb6f01ac1aebadb5"
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
