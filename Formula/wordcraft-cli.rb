class WordcraftCli < Formula
    desc "Word-style word processor CLI for .docx files"
    homepage "https://github.com/storytold/wordcraft"
    version "0.11.0"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.11.0/wordcraft-cli-0.11.0-macos-universal.zip"
        sha256 "dc6815a57a06fc5a5e4aa777f074a4d8d8010ec4ff813d00b6e2c13559aa7bcf"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.11.0/wordcraft-0.11.0-linux-aarch64.tar.gz"
            sha256 "a373495928e81be5184a8a94e55db1ed14a3ad1e61b4a13f473d20255f391fc6"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.11.0/wordcraft-0.11.0-linux-x86_64.tar.gz"
            sha256 "034c247bf6dab172a2edfb0767de9065125b857826c6915f7ef39b9f43951d5a"
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
