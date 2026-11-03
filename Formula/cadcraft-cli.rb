class CadcraftCli < Formula
    desc "AutoCAD-style 2D/3D CAD application (CLI)."
    homepage "https://github.com/storytold/cadcraft"
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.17.0/cadcraft-cli-0.17.0-macos-universal.zip"
        sha256 "53ee95e7134c9032d79dfcfabc77f8886553514792310947e8b81fead7516584"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.17.0/cadcraft-0.17.0-linux-aarch64.tar.gz"
            sha256 "a417ed6d9ab946c2849725b20d8fdad0bfb098e7a73d6118f35e19567387cb9e"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.17.0/cadcraft-0.17.0-linux-x86_64.tar.gz"
            sha256 "89996b1764ff15696857e0894d60b84569051051818f6480e9b7f823c76a46e4"
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
