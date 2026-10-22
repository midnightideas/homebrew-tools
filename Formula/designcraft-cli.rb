class DesigncraftCli < Formula
    desc "InDesign-style page layout application (CLI)."
    homepage "https://github.com/storytold/designcraft"
    version "0.11.0"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.11.0/designcraft-cli-0.11.0-macos-universal.zip"
        sha256 "f70cde1d39cfa8307db7aa036d5fce66a509e47d4059d984b93b0a4ce26b974d"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.11.0/designcraft-0.11.0-linux-aarch64.tar.gz"
            sha256 "0f529995352cf50b5756906c2ef2691d80d01192d0bab9cf1fd0f1f58ef8f12a"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.11.0/designcraft-0.11.0-linux-x86_64.tar.gz"
            sha256 "12076f89ce445af5cf96c0048701a7d48373dccbd524de19fe2308601b554d58"
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
