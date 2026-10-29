class VectorcraftCli < Formula
    desc "Illustrator-style vector editor (CLI)."
    homepage "https://github.com/storytold/vectorcraft"
    version "0.18.0"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.18.0/vectorcraft-cli-0.18.0-macos-universal.zip"
        sha256 "694d216cc0ac8ff32dc1c32ffa318da9e5229d58bc821e378eef6f3739286744"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.18.0/vectorcraft-0.18.0-linux-aarch64.tar.gz"
            sha256 "191358b946897249f4a51dd8171060eb2867eda07f7d2eaf1b63c5c099c0e87e"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.18.0/vectorcraft-0.18.0-linux-x86_64.tar.gz"
            sha256 "76948b50ef78dd482a6ece06f10b7047937bbc0c05f5cf6bc43d88b07f74d826"
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
