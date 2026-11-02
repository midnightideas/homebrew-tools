class VectorcraftCli < Formula
    desc "Illustrator-style vector editor (CLI)."
    homepage "https://github.com/storytold/vectorcraft"
    version "0.20.0"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.20.0/vectorcraft-cli-0.20.0-macos-universal.zip"
        sha256 "c840d5b6b278b50f938bfced99e121aaa76e2065c84fdb377182126e5df3f33f"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.20.0/vectorcraft-0.20.0-linux-aarch64.tar.gz"
            sha256 "6c555729fceaaa7fee3e1bd9adc3715d405a6d43d1f6f036cce0d20f10aad3ff"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.20.0/vectorcraft-0.20.0-linux-x86_64.tar.gz"
            sha256 "d38d83d9e59fdcf7a100414e22b3094094fe4fe2dd43a105f042978012610e86"
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
