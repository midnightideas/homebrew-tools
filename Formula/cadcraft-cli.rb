class CadcraftCli < Formula
    desc "AutoCAD-style 2D/3D CAD application (CLI)."
    homepage "https://github.com/storytold/cadcraft"
    version "0.20.1"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.20.1/cadcraft-cli-0.20.1-macos-universal.zip"
        sha256 "2754055a4f318d028fb9cc7aac0a98987d21c2b5c20f079ca2feb1469f28fb3b"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.20.1/cadcraft-0.20.1-linux-aarch64.tar.gz"
            sha256 "b149db4bdf61d135fcb40ce7361828c75b18d6f3f710e165ca17f30819d23212"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.20.1/cadcraft-0.20.1-linux-x86_64.tar.gz"
            sha256 "57b6f1b41b4f3c542a82f103202ed1a779440e5ff8d25c08ef66abda1a8cb1b9"
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
