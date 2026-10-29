class DesigncraftCli < Formula
    desc "InDesign-style page layout application (CLI)."
    homepage "https://github.com/storytold/designcraft"
    version "0.14.0"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.14.0/designcraft-cli-0.14.0-macos-universal.zip"
        sha256 "6e35a9e2661349b32f1e3f76bc0f98deb22d2fe71d82ae15105451e4f50bc78b"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.14.0/designcraft-0.14.0-linux-aarch64.tar.gz"
            sha256 "81bfc265d5e353ca5fe6be3dc18db0383526c3cdbc7328f4c85a44f2c3d0d046"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.14.0/designcraft-0.14.0-linux-x86_64.tar.gz"
            sha256 "25c87be759d35a81ca44e1f625ed4304b16e5aab6a03a1051bca498a81bfc547"
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
