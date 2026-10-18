class WordcraftCli < Formula
    desc "Word-style word processor CLI for .docx files"
    homepage "https://github.com/storytold/wordcraft"
    version "0.8.0"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.8.0/wordcraft-cli-0.8.0-macos-universal.zip"
        sha256 "931f2277a357e7d77266ddceea565450b102ca7bf9e0634821162f7bab616dbe"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.8.0/wordcraft-0.8.0-linux-aarch64.tar.gz"
            sha256 "a862de2256e43c987dc8ea009ba52ac25db34091fd649b666133931ac68e02cc"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.8.0/wordcraft-0.8.0-linux-x86_64.tar.gz"
            sha256 "0ece07cf3d91b923dfd80f90310e04983bde66f0279c6b60ddce89596dde0ddf"
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
