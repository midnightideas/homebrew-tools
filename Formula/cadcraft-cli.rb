class CadcraftCli < Formula
    desc "AutoCAD-style 2D/3D CAD application (CLI)."
    homepage "https://github.com/storytold/cadcraft"
    version "0.15.1"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.15.1/cadcraft-cli-0.15.1-macos-universal.zip"
        sha256 "289f8bde2651cb29bf21951c189e4f60d92da53d03ee65c41fbbaf5da30f554e"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.15.1/cadcraft-0.15.1-linux-aarch64.tar.gz"
            sha256 "8fb84e925323c4fdf217fd0a46228ea14244cc6dbe49a9385b030c8aab3b17e2"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.15.1/cadcraft-0.15.1-linux-x86_64.tar.gz"
            sha256 "d044f0f8a755c6b69bdc6b45361dabcc342c14e3b1919c39f54069ffcd1c4f80"
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
