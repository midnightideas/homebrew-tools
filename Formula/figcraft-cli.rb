class FigcraftCli < Formula
    desc "Figma-style collaborative design and prototyping tool (CLI)."
    homepage "https://github.com/storytold/figcraft"
    version "0.10.0"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.10.0/figcraft-cli-0.10.0-macos-universal.zip"
        sha256 "e8bb277fef0bfbaa223e82fea25a6e455661ca5e288a69ac622cf6d64c2eabb9"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.10.0/figcraft-0.10.0-linux-aarch64.tar.gz"
            sha256 "fd5d55f7999d95bf8dd5677559dde8eafead8021a397eed9eacdeb9a5abe1df9"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.10.0/figcraft-0.10.0-linux-x86_64.tar.gz"
            sha256 "b3e2ffdab54d203a3f6ed1a0018b8325300bd22dbed6a02f0af6757f3eb669da"
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
