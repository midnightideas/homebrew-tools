class FigcraftCli < Formula
    desc "Figma-style collaborative design and prototyping tool (CLI)."
    homepage "https://github.com/storytold/figcraft"
    version "0.18.1"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.18.1/figcraft-cli-0.18.1-macos-universal.zip"
        sha256 "87efbca334e0925fce328ede159faef2df781b2a167d573888044127bfd4b0de"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.18.1/figcraft-0.18.1-linux-aarch64.tar.gz"
            sha256 "b27dee10be5db50def03dee3be470bc2f9ce508be1690e75b4765354d2b89c88"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.18.1/figcraft-0.18.1-linux-x86_64.tar.gz"
            sha256 "8276d2ac55c6f77f7af3a411a9b00415d3feb0b59607a54523311340e653fc19"
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
