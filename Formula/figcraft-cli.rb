class FigcraftCli < Formula
    desc "Figma-style collaborative design and prototyping tool (CLI)."
    homepage "https://github.com/storytold/figcraft"
    version "0.11.2"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.11.2/figcraft-cli-0.11.2-macos-universal.zip"
        sha256 "13bad5a9464b9560036598715c7ae34d5ad0b0adcb2c67ba25798af86f774029"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.11.2/figcraft-0.11.2-linux-aarch64.tar.gz"
            sha256 "b19df731c1746f3dd1631209b68c8819f60e9cda927958f5b9a5c872f98b133a"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.11.2/figcraft-0.11.2-linux-x86_64.tar.gz"
            sha256 "69d21d0d3717738f9da79d04bc86c152e9b8f919e6395ae97b1cb56b36cde2b9"
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
