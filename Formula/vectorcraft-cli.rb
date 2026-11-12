class VectorcraftCli < Formula
    desc "Illustrator-style vector editor (CLI)."
    homepage "https://github.com/storytold/vectorcraft"
    version "0.24.1"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.24.1/vectorcraft-cli-0.24.1-macos-universal.zip"
        sha256 "7f0c8261e5c831d9681e48272f9ba73bf8702dbf6ceb84f98177c7c007faddf2"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.24.1/vectorcraft-0.24.1-linux-aarch64.tar.gz"
            sha256 "4b9735489789d336c1ca4344689eb4a1d4a3f0b6e8db7f8c0659c24d10653455"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.24.1/vectorcraft-0.24.1-linux-x86_64.tar.gz"
            sha256 "a090514252fde145495ac6fc65d6ff1311d698998e57ba434d5d0896c3d1fbfa"
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
