<h4 align="right"><a href="README.md">English</a> | <a href="README_CN.md">中文</a> | <strong>繁體</strong> | <a href="README_DE.md">Deutsch</a> | <a href="README_FR.md">Français</a> | <a href="README_KR.md">한국어</a></h4>

<div align="center">
  <h1>Mole</h1>
  <p><em>🐹 Mac 深度清理、應用程式解除安裝、系統最佳化、磁碟分析與狀態監控，輕巧開源命令列工具，另有原生 Mac App</em></p>
</div>

<p align="center">
  <a href="https://github.com/tw93/mole/stargazers"><img src="https://img.shields.io/github/stars/tw93/mole?style=flat-square" alt="Stars"></a>
  <a href="https://github.com/tw93/mole/releases"><img src="https://img.shields.io/github/v/tag/tw93/mole?label=version&style=flat-square" alt="Version"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-GPL_v3-blue.svg?style=flat-square" alt="License"></a>
  <a href="https://github.com/tw93/mole/commits"><img src="https://img.shields.io/github/commit-activity/m/tw93/mole?style=flat-square" alt="Commits"></a>
  <a href="https://twitter.com/HiTw93"><img src="https://img.shields.io/badge/follow-Tw93-red?style=flat-square&logo=Twitter"></a>
  <a href="https://t.me/+9f9gf4ZrFSQ2OWVl"><img src="https://img.shields.io/badge/chat-Telegram-blueviolet?style=flat-square&logo=Telegram"></a>
</p>

<p align="center">
  <img src="./docs/img/big-mole.png" alt="Mole 清理成果" width="1000" />
</p>

> 💡 喜歡圖形介面？可嘗試原生應用 [Mole for Mac](https://mole.fit/)：支援清理前逐項確認、系統資料深入清理、AI 工具維護與清理、實測 800 多款軟體卸載殘留、多項系統一鍵最佳化、多維下鑽分析磁碟空間，並提供系統狀態監控、風扇控制與螢幕常亮等功能。

## 功能特性

- **多合一終端機工具**：涵蓋類似 CleanMyMac、AppCleaner、DaisyDisk 與 iStat Menus 的日常場景，輕巧專注
- **深度清理**：安全清除系統快取、應用程式日誌與解除安裝殘留，釋放磁碟空間
- **應用程式解除安裝**：完整移除應用程式，同步清理偏好設定與自啟動項目
- **磁碟分析**：終端機互動式視覺化，清楚瀏覽目錄層級，定位佔用空間的大檔案
- **系統最佳化**：重新整理系統服務、重建快取並最佳化核心資料庫
- **即時監控**：在終端機儀表板中即時查看 CPU、記憶體、磁碟讀寫、網路流量與電池狀態

## 快速開始

Mole 支援 macOS 12 及更高版本，同時相容 Intel 與 Apple Silicon 晶片。

**透過 Homebrew 安裝**

```bash
brew install mole
```

如果你的 macOS 版本較舊導致 Homebrew 無法支援，可以使用下方的指令碼安裝。

**透過指令碼安裝**

```bash
curl -fsSL https://raw.githubusercontent.com/tw93/mole/main/install.sh | bash
```

Mole 主要面向 macOS。實驗性的 Windows 版本可在 [windows 分支](https://github.com/tw93/Mole/tree/windows) 查看。

**常用指令**

```bash
mo                           # 開啟互動式選單
mo clean                     # 深度清理：清理系統快取、日誌與解除安裝殘留
mo uninstall                 # 應用程式解除安裝：完整解除安裝軟體並清理殘留檔案
mo optimize                  # 系統最佳化：重新整理系統服務與快取
mo analyze                   # 磁碟分析：互動式查看磁碟空間佔用與大檔案
mo status                    # 狀態監控：即時監控 CPU、記憶體、網路與硬體健康
mo purge                     # 專案清理：清理開發建置產物（如 node_modules、target）
mo installer                 # 安裝檔清理：尋找並清理 DMG 與 PKG 安裝檔

mo touchid                   # 設定終端機 Touch ID 指紋認證
mo completion                # 設定命令列 Tab 鍵自動補全
mo update                    # 檢查並更新 Mole
mo update --nightly          # 更新到最新未釋出的開發版（僅限指令碼安裝）
mo remove                    # 從系統中完全移除 Mole
mo --help                    # 查看說明資訊
mo --version                 # 查看已安裝版本
```

**安全演練**

```bash
mo clean --dry-run
mo uninstall --dry-run
mo optimize --dry-run
mo purge --dry-run
mo installer --dry-run
mo history
mo history --json

mo clean --dry-run --debug   # 安全預覽 + 詳細診斷日誌
mo optimize --whitelist      # 管理受保護的最佳化規則
mo clean --whitelist         # 管理受保護的快取白名單
mo purge --paths             # 設定程式碼專案掃描目錄
mo analyze /Volumes          # 僅分析外接行動硬碟或磁碟卷宗
mo analyze /private/tmp      # 僅檢視暫存目錄（不自動清理）
```

使用 `mo clean --whitelist` 儲存的白名單保存在 `~/.config/mole/whitelist` 中，也可直接編輯（每行一個路徑）。自訂白名單是對預設規則的補充，內建系統保護始終生效。

<details>
<summary><strong>其他安裝選項</strong></summary>

如需安裝特定版本，可傳入 [Releases 頁面](https://github.com/tw93/mole/releases) 中的任意 Tag（帶或不帶前導 `V` 均可）。如需追蹤開發分支，可傳入 `main`：

```bash
curl -fsSL https://raw.githubusercontent.com/tw93/mole/main/install.sh | bash -s -- 1.51.0
curl -fsSL https://raw.githubusercontent.com/tw93/mole/main/install.sh | bash -s -- main
```

`main` 分支包含未釋出的最新開發程式碼。`latest` 是 `main` 的歷史別名；請注意它不會安裝最新的穩定正式版。

安裝指令碼預設安裝至 `/usr/local/bin`，可能需要輸入管理員密碼。如果你希望未來的 `mo update` 無需密碼，可以安裝至使用者目錄：

```bash
mkdir -p "$HOME/.local/bin"
curl -fsSL https://raw.githubusercontent.com/tw93/mole/main/install.sh | bash -s -- --prefix "$HOME/.local/bin"
export PATH="$HOME/.local/bin:$PATH"
```

記得將 `export PATH` 加入 `~/.zshrc` 或對應的 shell 設定檔中。

**Nix**

在 macOS 上，Nix 使用者可從 `main` 分支安裝 flake：

```bash
nix profile install github:tw93/mole/main#mole
nix profile upgrade mole
nix profile remove mole
```

宣告式配置可將 `github:tw93/mole/main` 新增為 flake input，使用其 `packages.${system}.mole` 套件。Nix 管理的安裝請透過 Nix 進行升級與移除。

</details>

觀看 PAPAYA 電腦教室 製作的 [Mole 教學影片](https://www.youtube.com/watch?v=UEe9-w4CcQ0)。

## 安全保障

Mole 始終以資料安全為先：嚴格檢查路徑有效性，預設保護系統關鍵目錄與使用者敏感資料，操作前主動確認；對無法證實安全的檔案一律自動略過。

- `clean`、`uninstall`、`purge`、`installer` 與 `remove` 會執行檔案清理，建議先用 `--dry-run` 預覽，需要時加上 `--debug`
- 日常執行 **無需 `sudo`**，僅在觸及系統級清理時按需請求管理員權限
- `mo analyze` 中的刪除操作在確認後預設移入 macOS 垃圾桶，可隨時放回
- 清理操作均記錄在 `~/Library/Logs/mole/operations.log` 中，可透過 `mo history` 查看，或設定 `MO_NO_OPLOG=1` 停用
- 可透過 `mo clean --whitelist` 保護指定快取，或使用 `mo optimize --whitelist` 排除維護項目

更多安全邊界與機制說明請參閱 [SECURITY.md](SECURITY.md) 與 [SECURITY_AUDIT.md](SECURITY_AUDIT.md)。

## 功能詳解

以下展示為縮減範例，具體顯示項目、大小與略過原因取決於你的 Mac 實際環境。

### 深度清理（Clean）

`mo clean` 掃描並清理安全的快取、日誌、暫存檔案、開發者工具快取以及已移除應用程式的殘留檔案。使用 `mo clean --dry-run` 預覽可清理路徑，使用 `mo clean --whitelist` 保護特定目錄。

```text
$ mo clean

Clean Your Mac

⚙ Apple Silicon | Free space: 219.0GB

➤ User essentials
  ✓ User app cache · 18 items, 2.4GB
  ✓ User app logs · 7 items, 12.8MB
  ✓ Trash · emptied, 9 items

➤ App caches
  ✓ App Store cache · 8 items, 248.5MB

➤ Browsers
  ✓ Safari cache · 24 items, 642.1MB
  ✓ Chrome cache · 31 items, 1.2GB

➤ Developer tools
  ✓ npm cache · cleaned
  ◎ pnpm cache · skipped (pnpm busy)

======================================================================
Cleanup complete
Tracked cleanup: 4.5GB | Items cleaned: 97 | Categories: 4
Free space: 223.5GB (+4.5GB)
======================================================================
```

### 應用程式解除安裝（Uninstall）

`mo uninstall` 完整移除已安裝的應用程式，並同步清理關聯的偏好設定、快取與自啟動項目。如果有其他同款軟體共用資料，Mole 會保留共用部分。可使用 `mo uninstall --dry-run` 預覽解除安裝計畫。如果應用程式此前已被手動刪除，可直接執行 `mo clean` 掃描遺留殘留。

```text
$ mo uninstall

Select Apps to Remove  1/3 selected

➤ ● Photoshop 2024                4.20GB | 2mo ago
  ○ IntelliJ IDEA                 2.80GB | 3d ago
  ○ Premiere Pro                  3.40GB | 2w ago

Files to be removed:

✓ Photoshop 2024, 12.80GB
  ✓ /Applications/Adobe Photoshop 2024/Adobe Photoshop 2024.app
  ✓ ~/Library/Application Support/Adobe/Adobe Photoshop 2024
  ✓ ~/Library/Preferences/com.adobe.Photoshop.plist

======================================================================
Uninstall complete
Removed 1 app, freed 12.80GB: Photoshop 2024
======================================================================
```

### 系統最佳化（Optimize）

`mo optimize` 對 Finder、網路、系統資料庫與 macOS 服務執行安全的維護操作。非必要、目前正在使用或無法使用的任務會自動略過並附帶原因。可使用 `mo optimize --dry-run` 預覽，使用 `mo optimize --whitelist` 排除指定任務或路徑。

```text
$ mo optimize

Optimize

⚙ System  18/32 GB RAM | 616/926 GB Disk | Uptime 6d

PERFORMANCE DIAGNOSIS
  ✓ No sustained high-CPU bottleneck detected

➤ DNS & Spotlight Check
  → DNS cache flushed
  → Spotlight index verified

➤ Finder Cache Refresh
  → QuickLook thumbnails refreshed
  → Icon services cache rebuilt

➤ Database Optimization
  ◎ Close these apps before database optimization: Safari

➤ Disk Health
  → Disk verify skipped (set MOLE_ENABLE_DISK_VERIFY=1 to enable)

======================================================================
Optimization Complete
Applied 3 optimizations
14 unchanged | 3 skipped | 1 unavailable
======================================================================
```

支援透過路徑規則排除掛載項目，例如常駐掛載的 `/Volumes/mail`，避免其被識別為可卸載目標。

### 空間分析（Analyze）

`mo analyze` 開啟終端機互動式磁碟分析器。支援方向鍵與 Vim 快捷鍵瀏覽、快速過濾、多選標記、Finder 預覽以及移入垃圾桶。外接磁碟預設不在概覽中顯示，可執行 `mo analyze /Volumes` 或指定掛載路徑進行檢視。使用 `mo analyze /private/tmp` 僅檢查暫存目錄而不執行自動清理。

以 `+` 結尾的容量表示部分掃描；`unknown` 表示暫時無法測量。因臨時逾時中斷的項目不會覆蓋已有完整快取，後續重新整理可自動補全。終端機介面預設列出前 30 個最大項目，JSON 格式輸出則包含所有掃描項目。

`mo analyze --json /path` 輸出中包含各項的 `scan_status`（`complete`、`partial` 或 `unavailable`）。未完成的掃描仍會返回結束碼 0，腳本自動化可據此判斷狀態。

```text
$ mo analyze

Analyze Disk  (302.1GB free)
Select a location to explore:

 ▶  1. ████████████████████████  47.9%  |  Home                       75.4GB
     2. ███████████               22.0%  |  User Library               34.6GB
     3. ███████                   14.2%  |  Applications               22.4GB
     4. █████                     10.7%  |  System Library             16.9GB
     5. ███                        5.2%  |  Old Downloads (90d+)       8.2GB  >3mo
```

### 狀態監控（Status）

`mo status` 提供唯讀系統硬體儀表板，涵蓋 CPU、系統負載、磁碟讀寫、網路流量、電源與異常行程。

當預設 IPv4 路由使用 VPN 或通道介面時，流量圖表會追蹤該通道，避免與實體網卡重複統計。

```text
$ mo status

Mole Status  Health ● 92  MacBook Pro · M4 Pro · 32GB · macOS 26

⚙ CPU                                    ▦ Memory
Total   ████████████░░░░░░░  45.2%       Used    ███████████░░░░░░░  58.4%
Load    0.82 / 1.05 / 1.23 (8 cores)     Total   18.7 / 32.0 GB
Core 1  ███████████████░░░░  78.3%       Free    ████████░░░░░░░░░░  41.6%
Core 2  ████████████░░░░░░░  62.1%       Avail   13.3 GB

▤ Disk                                   ⚡ Power
Used    █████████████░░░░░░  67.2%       Level   ██████████████████  100%
Free    156.3 GB                         Status  Charged
Read    ▮▯▯▯▯  2.1 MB/s                  Health  Normal · 423 cycles
Write   ▮▮▮▯▯  18.3 MB/s                 Temp    58°C · 1200 RPM

⇅ Network                                ▶ Processes
Down    ▁▁█▂▁▁▁▁▁▁▁▁▇▆▅▂  0.54 MB/s      Zombies 3 · Chrome (4242) ×3
Up      ▄▄▄▃▃▃▄▆▆▇█▁▁▁▁▁  0.02 MB/s      Code       ▮▮▮▮▯  42.1%
Proxy   HTTP · 192.168.1.100             Chrome     ▮▮▮▯▯  28.3%
```

健康評分綜合了 CPU、記憶體、磁碟餘量、SMART 狀態、I/O 讀寫、溫度、電池狀況與開機時間。按 `k` 可切換儀表板小貓，按 `c` 可調整顯示的 CPU 核心數，按 `q` 結束。偏好設定會自動儲存。

<details>
<summary><strong>JSON、NDJSON 與行程警示</strong></summary>

- `mo analyze --json ~/Documents`：單次輸出指定路徑的磁碟分析 JSON。
- `mo status --json`：單次輸出系統狀態快照 JSON。
- `mo status | jq '.health_score'`：當輸出被管線重定向時自動切換為 JSON 模式。
- `mo status --watch --interval 2s`：持續串流輸出 NDJSON（換行分隔的 JSON）。
- `mo history --json`：以 JSON 格式輸出歷史清理日誌。

```text
$ mo status --json
{
  "host": "MacBook-Pro",
  "health_score": 92,
  "cpu": { "usage": 45.2, "logical_cpu": 8 },
  "memory": { "total": 34359738368, "used": 20078972109, "used_percent": 58.4 },
  "disks": [],
  "process_collected_at": "2026-08-29T12:30:00Z",
  "process_stale": false,
  "zombie_count": 3,
  "zombie_parents": [
    { "pid": 4242, "name": "Google Chrome for Testing", "count": 3 }
  ],
  "zombie_parents_complete": true,
  "uptime": "3d 12h 45m"
}
```

殭屍行程診斷僅供觀察，不會主動終止行程或影響系統健康分。如果某個收集器發生錯誤，`mo status --json` 仍會輸出其他可用指標，將錯誤記錄在 stderr 中並正常結束（結束碼 0）。

還支援對高 CPU 佔用的行程進行唯讀警示，可透過 `--proc-cpu-threshold`、`--proc-cpu-window` 或 `--proc-cpu-alerts=false` 進行調整或關閉。

</details>

### 專案清理（Purge）

`mo purge` 自動尋找可隨時重新建置的專案生成目錄，例如 `node_modules`、`target`、`.build`、`build` 與 `dist`。按專案歸類呈現，僅在你勾選確認後才會執行刪除。最近 7 天內活躍的檔案預設不勾選。優先使用 `fd`，降級使用 `find`。包含部署金鑰、巢狀 Git 倉庫或 Git 追蹤檔案的目錄會自動受到保護。非互動式執行需使用 `mo purge --yes`；建議先執行 `mo purge --dry-run` 預覽候選目錄。

使用 Page Up/Down 或 `h`/`l` 翻頁，`[`/`]` 在專案間跳轉，`X` 略過目前專案。按 `/` 搜尋專案路徑與產物名稱，`n` 尋找下一個。按 Enter 確認清理。

<details>
<summary><strong>Purge 範例輸出</strong></summary>

```text
$ mo purge

Purge Project Artifacts

Select Artifacts to Purge
6.00GB, 2 selected

➤ ● ┌ ~/Projects/website        3.80GB | node_modules | 28d
  ○ └ ~/Projects/website         186MB | dist         | <1d
  ● ┌ ~/Projects/rust-app       2.20GB | target       | 2mo
  ○ └ ~/Projects/rust-app         22MB | dist         | <7d

======================================================================
Purge complete
Estimated space freed: 6.00GB | Items: 2 | Free: 223.5GB
======================================================================
```

</details>

<details>
<summary><strong>自訂掃描路徑</strong></summary>

執行 `mo purge --paths` 設定掃描目錄，或直接編輯 `~/.config/mole/purge_paths`：

```shell
~/Documents/MyProjects
~/Work/ClientA
~/Work/ClientB
```

設定自訂路徑後，Mole 僅掃描這些指定目錄。未設定時使用預設目錄（如 `~/Projects`、`~/GitHub`、`~/dev` 等）。產物掃描深度為設定根目錄下 6 層。Purge 僅清理工作區內的建置快取，絕不刪除原始碼本身。

</details>

### 安裝檔清理（Installer）

`mo installer` 自動尋找下載目錄、桌面、Homebrew 快取、iCloud、Mail、Telegram 及其他常見目錄中的 DMG、PKG、MPKG、ISO、XIP 與安裝檔 ZIP。清理前會列出各檔案大小與來源。使用 `mo installer --dry-run` 預覽清理計畫。掃描具有全域逾時保護，如發生錯誤或逾時會直接放棄，避免在不完整的資料上操作。在最終刪除前會對目標檔案進行再次驗證，確保檔案未發生變動。

<details>
<summary><strong>Installer 範例輸出</strong></summary>

```text
$ mo installer

Select Installers to Remove, 3.83GB, 5 selected

➤ ● Photoshop_2024.dmg          1.20GB | Downloads
  ● IntelliJ_IDEA.dmg          850.6MB | Downloads
  ● Illustrator_Setup.pkg      920.4MB | Downloads
  ● PyCharm_Pro.dmg            640.5MB | Homebrew
  ● Acrobat_Reader.dmg         220.4MB | Downloads
  ○ AppCode_Legacy.zip         410.6MB | Downloads

======================================================================
Installers cleaned
Removed 5 installers, freed 3.83GB
======================================================================
```

</details>

## 快捷啟動器

<details>
<summary><strong>Raycast 與 Alfred 設定</strong></summary>

一鍵安裝五大快捷啟動器（Clean、Uninstall、Optimize、Analyze、Status）：

```bash
curl -fsSL https://raw.githubusercontent.com/tw93/Mole/main/scripts/setup-quick-launchers.sh | bash
```

該腳本會自動新增 Raycast 指令；若偵測到 Alfred 設定，還會同步新增帶有 `clean`、`uninstall`、`optimize`、`analyze` 與 `status` 關鍵字的 Alfred Workflow。

Raycast 安裝後需一次性手動設定：

1. 開啟 **Raycast 設定 > Extensions > Script Commands**。
2. 新增 `~/Library/Application Support/Raycast/script-commands` 目錄。
3. 在 Raycast 中點選 **Reload Script Directories**。

啟動器會自動適配常見終端機（Terminal、iTerm2、Alacritty、kitty、WezTerm、Ghostty、Hyper、WindTerm、Warp）。可透過 `MO_LAUNCHER_APP=<名稱>` 指定終端機，亦可直接在 [Kaku](https://github.com/tw93/Kaku) 中執行。

</details>

## 社群聲音

感謝所有參與構建 Mole 的貢獻者 ❤️

<a href="https://github.com/tw93/Mole/graphs/contributors">
  <img src="./CONTRIBUTORS.svg?v=2" alt="Mole 貢獻者" width="1000" />
</a>

<br/><br/>
來自 X (Twitter) 使用者的真實回饋：

<img src="./docs/img/mole-love.png" alt="社群回饋" width="1000" />

## 贊助支援

- 購買 [Mole for Mac](https://mole.fit) 是支持 Mole 持續開發最直接的方式
- 如果 Mole 幫到了你，歡迎給予 Star、[分享給朋友](https://twitter.com/intent/tweet?url=https://github.com/tw93/Mole&text=Mole%20-%20Deep%20clean%20and%20optimize%20your%20Mac.)，或在 GitHub 提交 Issue 和 PR
- 我養了兩隻貓：湯圓和可樂。如果 Mole 讓你感覺好用，歡迎請牠們吃一頓 <a href="https://cats.tw93.fun?name=Mole" target="_blank">罐頭 🥩</a>

<details>
<summary>已經請客的好心人 🐱</summary>
<br/>
<a href="https://cats.tw93.fun?name=Mole"><img src="https://cdn.jsdelivr.net/gh/tw93/sponsors@main/assets/sponsors.svg" alt="贊助者" width="1000" loading="lazy" /></a>
</details>

## 開源授權條款

Mole 基於 GPL-3.0 條款開源；詳見 [LICENSE](LICENSE)。任何修改並發布的版本須保持相同的開源授權條款。如果你將 Mole 分叉為其他獨立產品，請使用不同名稱並註明出處。

[Mole for Mac](https://mole.fit) 是單獨的原生應用程式。
