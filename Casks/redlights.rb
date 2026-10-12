cask "redlights" do
  version "0.3.0"
  sha256 "4ed2629e3b042618edfef52665f4bb2285b50ab2ae859af87874a2fd47a49444"

  url "https://github.com/Vasallo94/redlights/releases/download/v#{version}/RedLights-#{version}.zip"
  name "RedLights"
  desc "Menu bar app that turns every display pure red for astronomy"
  homepage "https://github.com/Vasallo94/redlights"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "RedLights.app"

  # La app va firmada ad-hoc, sin notarizar: sin esto Gatekeeper la bloquea al abrirla.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/RedLights.app"]
  end

  uninstall quit: "es.quique.redlights"

  zap trash: "~/Library/Preferences/es.quique.redlights.plist"
end
