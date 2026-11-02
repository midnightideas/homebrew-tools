class DesigncraftCli < Formula
    desc "InDesign-style page layout application (CLI)."
    homepage "https://github.com/storytold/designcraft"
    version "0.16.0"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.16.0/designcraft-cli-0.16.0-macos-universal.zip"
        sha256 "9985ca3ceda27bd4c59b28121fcd99e33fef088380059f69f3e7e7409ff24f1a"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.16.0/designcraft-0.16.0-linux-aarch64.tar.gz"
            sha256 "d0db47151cf261230b3187828a9ef807cc6eddc276f85ad17c81d5dbb7809800"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.16.0/designcraft-0.16.0-linux-x86_64.tar.gz"
            sha256 "a486fc43cdc8f245edaf737cbb1c9a32860ee18a8dca1bafe08111014e2f1576"
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
