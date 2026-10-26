class VectorcraftCli < Formula
    desc "Illustrator-style vector editor (CLI)."
    homepage "https://github.com/storytold/vectorcraft"
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.17.0/vectorcraft-cli-0.17.0-macos-universal.zip"
        sha256 "dee6d447c42615662ea81a612fedd0c221b14ac51dbe72e45f3d435fdc511641"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.17.0/vectorcraft-0.17.0-linux-aarch64.tar.gz"
            sha256 "28cbc71ced0b4349b2d4208f0f2f922c13ec099627a323b0eb3d5e1b1372dca3"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.17.0/vectorcraft-0.17.0-linux-x86_64.tar.gz"
            sha256 "66c289d0bd354b71e4cd787193ea0481e3a1cd239f2a18068110ea36852fc026"
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
