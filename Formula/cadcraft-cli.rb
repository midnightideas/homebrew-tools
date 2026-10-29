class CadcraftCli < Formula
    desc "AutoCAD-style 2D/3D CAD application (CLI)."
    homepage "https://github.com/storytold/cadcraft"
    version "0.14.0"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.14.0/cadcraft-cli-0.14.0-macos-universal.zip"
        sha256 "d6f8687f8966fc28e17fedb85ca672bb96ecba0c5497781dd2e7b5319762c4a4"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.14.0/cadcraft-0.14.0-linux-aarch64.tar.gz"
            sha256 "7b0d181105da6f14f13ef1098fabb7b9317c1e97a2e8c0a9075c4c743c42d63a"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.14.0/cadcraft-0.14.0-linux-x86_64.tar.gz"
            sha256 "95067c849f82305648249299bb86e645b730275aa8c5f19965d81990f83aea9b"
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
