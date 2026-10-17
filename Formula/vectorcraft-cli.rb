class VectorcraftCli < Formula
    desc "Illustrator-style vector editor (CLI)."
    homepage "https://github.com/storytold/vectorcraft"
    version "0.12.0"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.12.0/vectorcraft-cli-0.12.0-macos-universal.zip"
        sha256 "29d97dd6cbef0457824bc54202620d9589adb65bfe5e13459866531747dec5df"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.12.0/vectorcraft-0.12.0-linux-aarch64.tar.gz"
            sha256 "f1e7a5c00ebc83d842bc57dcb35d7915fedb0996585ca2f27a9e1eb2a6956be8"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.12.0/vectorcraft-0.12.0-linux-x86_64.tar.gz"
            sha256 "6750db109d3a253c51c82975af650f42384ba27a768f72529431edfb58508269"
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
