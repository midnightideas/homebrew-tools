class CadcraftCli < Formula
    desc "AutoCAD-style 2D/3D CAD application (CLI)."
    homepage "https://github.com/storytold/cadcraft"
    version "0.19.0"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.19.0/cadcraft-cli-0.19.0-macos-universal.zip"
        sha256 "6db9565a5fec6bacdfccbf62628a89e4430c9dbb5cc1eb85dbbef71e36e49da9"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.19.0/cadcraft-0.19.0-linux-aarch64.tar.gz"
            sha256 "67eacfb243e91a69dfc7b3f74ea60f1e67e5fbcb4894159143776498e524bfb3"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.19.0/cadcraft-0.19.0-linux-x86_64.tar.gz"
            sha256 "a654df8c3e447c62c490c0a8aad8c42a9fafab010ca4d25bc3504ed45b3c8f51"
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
