class CadcraftCli < Formula
    desc "AutoCAD-style 2D/3D CAD application (CLI)."
    homepage "https://github.com/storytold/cadcraft"
    version "0.8.0"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.8.0/cadcraft-cli-0.8.0-macos-universal.zip"
        sha256 "0647286d06e2bf5da9fd1303f481966962ad224b57b4fa7adf2087a1e387e30b"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.8.0/cadcraft-0.8.0-linux-aarch64.tar.gz"
            sha256 "e7e7a805d683433733a77951326163506f203bd5dee515f465a5c575669d3f85"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.8.0/cadcraft-0.8.0-linux-x86_64.tar.gz"
            sha256 "df3c2e668439f0410564b1fa9d21827bb663eb3d01703902c41f02b9c5276193"
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
