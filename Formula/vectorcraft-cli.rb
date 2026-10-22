class VectorcraftCli < Formula
    desc "Illustrator-style vector editor (CLI)."
    homepage "https://github.com/storytold/vectorcraft"
    version "0.14.0"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.14.0/vectorcraft-cli-0.14.0-macos-universal.zip"
        sha256 "d28e64b1276e844a77a3a37a5f4102d348cd12234929fbef0eedcf72fd94da58"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.14.0/vectorcraft-0.14.0-linux-aarch64.tar.gz"
            sha256 "c6a3269bea4a0b47e04d4e20b904f10af414aa9b9ef47f367a1a7bb5197d01a1"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.14.0/vectorcraft-0.14.0-linux-x86_64.tar.gz"
            sha256 "5b34a05f123ca4cc611e8ce69a83106daed8ea288baf63e1abb99a42cb3b486d"
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
