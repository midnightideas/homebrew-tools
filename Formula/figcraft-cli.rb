class FigcraftCli < Formula
    desc "Figma-style collaborative design and prototyping tool (CLI)."
    homepage "https://github.com/storytold/figcraft"
    version "0.12.1"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.12.1/figcraft-cli-0.12.1-macos-universal.zip"
        sha256 "14b24c7e1e8ca257fb4df04b4b261cda7fce75bbce00d4580046836626d9e3c9"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.12.1/figcraft-0.12.1-linux-aarch64.tar.gz"
            sha256 "72269287aafcfd681100a30e0ec80619a383c75f8e1b845ff73973754d5d1e59"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.12.1/figcraft-0.12.1-linux-x86_64.tar.gz"
            sha256 "00a29f4cc382807d840f5d3e9b59f4c8829356789afbb956a0964918295e49dd"
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
