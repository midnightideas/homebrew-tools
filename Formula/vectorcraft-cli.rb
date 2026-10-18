class VectorcraftCli < Formula
    desc "Illustrator-style vector editor (CLI)."
    homepage "https://github.com/storytold/vectorcraft"
    version "0.13.1"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.13.1/vectorcraft-cli-0.13.1-macos-universal.zip"
        sha256 "fc2c1f0163a7de37904556ee1c56d726d9ee738accd3c9dfc2f913d6ae2459fc"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.13.1/vectorcraft-0.13.1-linux-aarch64.tar.gz"
            sha256 "8ae76af63ba8fa0c56a824bcd56fc757148a84758b2d42799dbca721fbc0fd68"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.13.1/vectorcraft-0.13.1-linux-x86_64.tar.gz"
            sha256 "35c0fcf6d3f9ebff6f33d257ff70eef414296f37f0d81f284e6f970e20fdb2c8"
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
