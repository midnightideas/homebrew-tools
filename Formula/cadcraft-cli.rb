class CadcraftCli < Formula
    desc "AutoCAD-style 2D/3D CAD application (CLI)."
    homepage "https://github.com/storytold/cadcraft"
    version "0.7.0"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.7.0/cadcraft-cli-0.7.0-macos-universal.zip"
        sha256 "dc203df9e9225d1abc0981c82fcf30a9322878bd88009ad0457a122b71bb61c6"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.7.0/cadcraft-0.7.0-linux-aarch64.tar.gz"
            sha256 "15c3cb08735d91090c6507aaa2338094aa2aa4a38788872689c153b2e8f2f6ce"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.7.0/cadcraft-0.7.0-linux-x86_64.tar.gz"
            sha256 "cf8d4aa86d046f34eb770ae6cd2df3eee17d1f3b129257f1558543046c955cc0"
        end
    end

    def install
        if OS.mac?
            # macOS zip extracts to cadcraft-cli-0.7.0-macos-universal/; install just the binary.
            bin.install "cadcraft-cli-0.7.0-macos-universal/#{name}"
        elsif Hardware::CPU.arm?
            bin.install "cadcraft-0.7.0-linux-aarch64/bin/#{name}"
        else
            bin.install "cadcraft-0.7.0-linux-x86_64/bin/#{name}"
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
