class DesigncraftCli < Formula
    desc "InDesign-style page layout application (CLI)."
    homepage "https://github.com/storytold/designcraft"
    version "0.18.0"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.18.0/designcraft-cli-0.18.0-macos-universal.zip"
        sha256 "21680591f9c263001f41d86d21d76ddf2e644141e67bd9b5c4f0444187be36e2"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.18.0/designcraft-0.18.0-linux-aarch64.tar.gz"
            sha256 "f1c0e6e2f7ecb9ba6468e1d3acc32fd3197e5a44b5e5018e3118df29d521018a"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.18.0/designcraft-0.18.0-linux-x86_64.tar.gz"
            sha256 "53987cb66be7de93854ed57000427fbe1c072a0427bc8cbaf501ff3672d5432c"
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
