class VectorcraftCli < Formula
    desc "Illustrator-style vector editor (CLI)."
    homepage "https://github.com/storytold/vectorcraft"
    version "0.19.0"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.19.0/vectorcraft-cli-0.19.0-macos-universal.zip"
        sha256 "939bc7ccf225852a941375f45951ca3ad7645cfb3d6d3d75007e68b4c7dd7169"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.19.0/vectorcraft-0.19.0-linux-aarch64.tar.gz"
            sha256 "27d31a90f93a7bfa8db297fc93408f1095f15ea309977907d0a42c483814d19c"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.19.0/vectorcraft-0.19.0-linux-x86_64.tar.gz"
            sha256 "ae537888f496919aa8b3193ea26f05fd2584be00eff86d80a07e2644f1061e92"
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
