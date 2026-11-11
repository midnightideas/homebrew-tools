class FigcraftCli < Formula
    desc "Figma-style collaborative design and prototyping tool (CLI)."
    homepage "https://github.com/storytold/figcraft"
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.17.0/figcraft-cli-0.17.0-macos-universal.zip"
        sha256 "42ca7e870c7e9c2dd574de176f1e0640e016123f83d3244b501e60f905f3a50a"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.17.0/figcraft-0.17.0-linux-aarch64.tar.gz"
            sha256 "e7255368c8f89f8e32da6383500161a0bd3ebd79fc528b64dd59fd415a945a75"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.17.0/figcraft-0.17.0-linux-x86_64.tar.gz"
            sha256 "ebc8bfa4da026860cff821d2024d6f51704ac69478969f5b29611dbb96a6e464"
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
