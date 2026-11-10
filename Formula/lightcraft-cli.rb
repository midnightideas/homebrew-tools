class LightcraftCli < Formula
    desc "Lightroom-style photo library and raw development (CLI)."
    homepage "https://github.com/storytold/lightcraft"
    version "0.20.0"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.20.0/lightcraft-cli-0.20.0-macos-universal.zip"
        sha256 "b73900c6a3bb71d5b1720e9e779bd50ec551abfb02c952d29ed3756a564be605"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.20.0/lightcraft-0.20.0-linux-aarch64.tar.gz"
            sha256 "92d39ff4eb207e41dafe4bb1edc5708a048672b2a92500a840bee7869d504f85"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.20.0/lightcraft-0.20.0-linux-x86_64.tar.gz"
            sha256 "8cb5eed825b2dd9e0fa42680129d3e5aa718f07196d67cc5d05741f0e6a9cc25"
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
