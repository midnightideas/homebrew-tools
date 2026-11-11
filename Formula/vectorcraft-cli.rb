class VectorcraftCli < Formula
    desc "Illustrator-style vector editor (CLI)."
    homepage "https://github.com/storytold/vectorcraft"
    version "0.23.0"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.23.0/vectorcraft-cli-0.23.0-macos-universal.zip"
        sha256 "beab784c2971caa7fd5ab48058e2af69c3c8bf76ef8abfb78e36bdf5b76dee20"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.23.0/vectorcraft-0.23.0-linux-aarch64.tar.gz"
            sha256 "6cd54b76ac0ac05fc8842b6fb13a2b3992faec499dc497b090279da0afea25e6"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.23.0/vectorcraft-0.23.0-linux-x86_64.tar.gz"
            sha256 "07c24a6094fb457c665b95848d55bfbd05460354bc0eac9b4ec9f9467a8b1e31"
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
