class FigcraftCli < Formula
    desc "Figma-style collaborative design and prototyping tool (CLI)."
    homepage "https://github.com/storytold/figcraft"
    version "0.8.0"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.8.0/figcraft-cli-0.8.0-macos-universal.zip"
        sha256 "c89850dc87804b6254d5d186937bd838c9f1a5e244b435df49772309a4b355bd"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.8.0/figcraft-0.8.0-linux-aarch64.tar.gz"
            sha256 "3b86472ab5132cf2dd4e8ca16e5cdb92946e33d28771bfc7c62a6eec638e2bbf"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.8.0/figcraft-0.8.0-linux-x86_64.tar.gz"
            sha256 "c350dc5ae7e30c85a06357a94cfdf604f2b26f3a4eb637b44f0f78bff7c34985"
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
