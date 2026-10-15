class CadcraftCli < Formula
    desc "AutoCAD-style 2D/3D CAD application (CLI)."
    homepage "https://github.com/storytold/cadcraft"
    name "CADCraft CLI"
    version "0.6.2"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.6.2/cadcraft-cli-0.6.2-macos-universal.zip"
        sha256 "2ffe9b0a0169810e3177e4f1119807e04fb4ea96efe5e3e1599cea52b25c87a1"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.6.2/cadcraft-0.6.2-linux-aarch64.tar.gz"
            sha256 "0700b0f032517177d9dee6891d892ee0137a8ffe12b0051d5da0bddb6a9fe332"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.6.2/cadcraft-0.6.2-linux-x86_64.tar.gz"
            sha256 "4a3ec7c5350e7212bdb4f735af6c6cf319ee177c11529ec547c77c92642ad49d"
        end
    end

    def install
        if OS.mac?
            # macOS zip extracts to cadcraft-cli-0.6.2-macos-universal/; install just the binary.
            bin.install "cadcraft-cli-0.6.2-macos-universal/#{name}"
        elsif Hardware::CPU.arm?
            bin.install "cadcraft-0.6.2-linux-aarch64/bin/#{name}"
        else
            bin.install "cadcraft-0.6.2-linux-x86_64/bin/#{name}"
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
