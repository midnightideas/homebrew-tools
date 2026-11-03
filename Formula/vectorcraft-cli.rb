class VectorcraftCli < Formula
    desc "Illustrator-style vector editor (CLI)."
    homepage "https://github.com/storytold/vectorcraft"
    version "0.21.0"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.21.0/vectorcraft-cli-0.21.0-macos-universal.zip"
        sha256 "1c645c749759654223136f9a4c0c6ea73867e79a3969b17844e3cdabaec07429"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.21.0/vectorcraft-0.21.0-linux-aarch64.tar.gz"
            sha256 "64c9127683a7e97c7fa48f2ecc61e1bd40e3ec7db177926d34c9facd7e350c02"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.21.0/vectorcraft-0.21.0-linux-x86_64.tar.gz"
            sha256 "2ffd00fb349318e7e92e97af377cffd818f1726451b7f2189e92f2267eb34c21"
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
